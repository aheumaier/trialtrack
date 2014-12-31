class Address < ActiveRecord::Base
 
  COUNTRY_CODES= [ 'ABW',  'AFG',  'AGO',  'AIA',  'ALB',  'AND',  'ANT',  'ARE',  'ARG',  'ARM',  'ASM',  'ATA',  'ATF',  'ATG',  'AUS',  'AUT',  'AZE',  'BDI',  'BEL',  'BEN',  'BFA',
                  'BGD',  'BGR',  'BHR',  'BHS',  'BIH',  'BLR',  'BLZ',  'BMU',  'BOL',  'BRA',  'BRB',  'BRN',  'BTN',  'BVT',  'BWA',  'CAF',  'CAN',  'CCK',  'CHE',  'CHL',  'CHN',
                  'CIV',  'CMR',  'COG',  'COK',  'COL',  'COM',  'CPV',  'CRI',  'CUB',  'CXR',  'CYM',  'CYP',  'CZE',  'DEU',  'DJI',  'DMA',  'DNK',  'DOM',  'DZA',  'ECU',  'EGY',
                  'ERI',  'ESH',  'ESP',  'EST',  'ETH',  'FIN',  'FJI',  'FLK',  'FRA',  'FRO',  'FSM',  'FXX',  'GAB',  'GBR',  'GEO',  'GHA',  'GIB',  'GIN',  'GLP',  'GMB',  'GNB',
                  'GNQ',  'GRC',  'GRD',  'GRL',  'GTM',  'GUF',  'GUM',  'GUY',  'HKG',  'HMD',  'HND',  'HRV',  'HTI',  'HUN',  'IDN',  'IND',  'IOT',  'IRL',  'IRN',  'IRQ',  'ISL',
                  'ISR',  'ITA',  'JAM',  'JOR',  'JPN',  'KAZ',  'KEN',  'KGZ',  'KHM',  'KIR',  'KNA',  'KOR',  'KWT',  'LAO',  'LBN',  'LBR',  'LBY',  'LCA',  'LIE',  'LKA',  'LSO',
                  'LTU',  'LUX',  'LVA',  'MAC',  'MAR',  'MCO',  'MDA',  'MDG',  'MDV',  'MEX',  'MHL',  'MKD',  'MLI',  'MLT',  'MMR',  'MNG',  'MNP',  'MOZ',  'MRT',  'MSR',  'MTQ',
                  'MUS',  'MWI',  'MYS',  'MYT',  'NAM',  'NCL',  'NER',  'NFK',  'NGA',  'NIC',  'NIU',  'NLD',  'NOR',  'NPL',  'NRU',  'NZL',  'OMN',  'PAK',  'PAN',  'PCN',  'PER',
                  'PHL',  'PLW',  'PNG',  'POL',  'PRI',  'PRK',  'PRT',  'PRY',  'PYF',  'QAT',  'REU',  'ROM',  'RUS',  'RWA',  'SAU',  'SDN',  'SEN',  'SGP',  'SGS',  'SHN',  'SJM',
                  'SLB',  'SLE',  'SLV',  'SMR',  'SOM',  'SPM',  'STP',  'SUR',  'SVK',  'SVN',  'SWE',  'SWZ',  'SYC',  'SYR',  'TCA',  'TCD',  'TGO',  'THA',  'TJK',  'TKL',  'TKM',
                  'TMP',  'TON',  'TTO',  'TUN',  'TUR',  'TUV',  'TWN',  'TZA',  'UGA',  'UKR',  'UMI',  'URY',  'USA',  'UZB',  'VAT',  'VCT',  'VEN',  'VGB',  'VIR',  'VNM',  'VUT',
                  'WLF',  'WSM',  'YEM',  'YUG',  'ZAF',  'ZAR',  'ZMB',  'ZWE'
  ]
	belongs_to :addressable, polymorphic: true


  def country_codes
    COUNTRY_CODES
  end
end
