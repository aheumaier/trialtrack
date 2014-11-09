#!/bin/bash

rails g scaffold Address id:integer 
rails g scaffold Answer id:integer question:references user:references due_date:date answered_at:date value:integer value_text:string{255} 
rails g scaffold Organization id:integer address:references 
rails g scaffold QuestionType id:integer name:string{255} 
rails g scaffold Question id:integer question_type:references question:string{255} interval:integer scale:references 
rails g scaffold Role id:integer name:string{30} 
rails g scaffold Scale id:integer scale_start:integer scale_end:integer value_no_answer:integer 
rails g scaffold ScalesScalevalue id:integer scalevalues:references scale:references 
rails g scaffold Scalevalue id:integer value:integer description:string{50} 
rails g scaffold Trial id:integer name:string{255} description:text summary:string{255} 
rails g scaffold TrialsQuestion id:integer question:references trial:references 
rails g scaffold TrialsUser id:integer user:references trial:references start_date:date end_date:date 
rails g scaffold User id:integer first_name:string{255} last_name:string{255} role:references address:references organization:references 
