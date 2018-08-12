require 'smarter_csv'
require 'ostruct'
require 'csv'

nambase = 'download'
extension = '.csv'

p "Give number of files"
total = gets.chomp.to_i

rows = Array.new

sheet = Array.new

(0..total-1).each do |i|

    fileName = ''
    if i == 0
        fileName = nambase + extension
    else
        fileName = nambase + ' - Copy (' + i.to_s + ')' + extension
    end

    data = SmarterCSV.process(
        'download.csv',
        {
          headers_in_file: false,
          # :file_encoding => "utf-16le",
          user_provided_headers: %i[a b c d e f g h i j k l m n o p q r s],
          remove_empty_values: false,
          remove_zero_values: false,
        }
      )
      
      charliesId = ''
      data.each_with_index do |item, index|
          row = item.values
      
          if (index == 1)
              charliesId = item[:h]
          end
      
          if (index > 4)
              row.insert(0, charliesId)
              sheet.push(row)
          end
      end
end

CSV.open('data.csv', 'w') do |csv|
    sheet.each do |row|
        csv << row
    end
end
