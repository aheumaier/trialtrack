#!/usr/bin/env ruby

require 'rubygems'
require 'mysql2'
require 'active_support/inflector'


m = Mysql2::Client.new(:host => '127.0.0.1', :username => 'root', :password => '19katowice76', :database => 'medicore')


tables = {}

m.query('SHOW TABLES').each do |table|
	table.each do |k,v|
		tables[v.to_sym] = {:table_name => v, :model_name => v.singularize.camelize, :attributes => {}, :referenced_by => []}
	end
end

rails_types = {"tinyint" => "boolean", "date" => "date", "datetime" => "datetime", "decimal" => "decimal", "float" => "float", "double" => "double", "bigint" => "integer", "int" => "integer", "varchar" => "string", "char" => "string", "mediumtext" => "text", "time" => "time", "timestamp" => "timestamp", "text" => "text", "smallint" => "integer"};

tables.each do |key, table|
	m.query("SHOW FIELDS FROM #{table[:table_name]}").each do |field|
		field_name = field[:name] = field["Field"].to_sym
		type = field["Type"]
		rails_type = nil
		maximum_length = nil
		if match = type.match(/^([^\(]+)(\((\d+)\))?$/)
			rails_type = rails_types[match[1].to_s]
			if (rails_type == "text" || rails_type == "string") && match[3]
				maximum_length = match[3].to_i	
			end
		end

		if field["Key"] == "PRI"
			next	
		end
		
	  default_value = field["Default"]

		if match = field["Field"].match(/^(.+)_id$/)
			referenced_name = match[1].pluralize.to_sym
			if !tables[referenced_name]
				print "Table #{referenced_name.to_s} referenced by #{table[:table_name]} not found. Real name: "
				referenced_name = gets.chomp
			end
			tables[referenced_name.to_sym][:referenced_by] << table[:table_name]
			field_name = match[1]
			rails_type = "references"
		end
	
		table[:attributes][field_name] = {:name => field_name, :type => rails_type, :maximum_length => maximum_length, :default_value => default_value}
	end
end

tables.each do |k, table|
	command = "rails g resource #{table[:model_name]} "
	table[:attributes].each do |k,v|
		command += v[:name].to_s + ":" + v[:type].to_s
		unless v[:maximum_length].nil?
			command += "{#{v[:maximum_length]}}"
		end
		command += " " 
	end
	puts command
end
