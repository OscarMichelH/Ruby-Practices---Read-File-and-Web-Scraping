require 'csv'

nambase = 'download'
extension = '.csv'

p "Give numbe of files"
total = gets.chomp.to_i

rows = Array.new


(0..total-1).each do |i|

    fileName = ''
    if i == 0
        fileName = nambase + extension
    else
        fileName = nambase + ' - Copy (' + i.to_s + ')' + extension
    end

    charliesId = ''
    ##Open files
    CSV.open(fileName, 'r').each_with_index do |row, index|
        if index == 1
            charliesId = row[7]
            p charliesId
        end

        if index > 5
            rows.push(row.insert(0, charliesId))
        end
    end
    charliesId = ''
end
CSV.open('data.csv', 'w') do |csv|
    rows.each do |row|
        csv << row
    end
end

