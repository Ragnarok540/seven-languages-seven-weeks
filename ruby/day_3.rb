# Modify the CSV application to support an each method to return a
# CsvRow object. Use method_missing on that CsvRow to return the value
# for the column for a given heading.

module ActsAsCsv
    def self.included(base)
        base.extend ClassMethods
    end
  
    module ClassMethods
        def acts_as_csv
            include InstanceMethods
        end
    end
    
    class CsvRow
        attr_accessor :row

        def initialize(header, csv_content)
            row_array = header.zip(csv_content)
            @row = {}
            row_array.each {|hd, ct| @row[hd] = ct}

            @row.map do |k, v|
                define_singleton_method(k) {v}
            end
        end
    end

    module InstanceMethods
        def read
            @csv_contents = []
            @rows = []
            filename = self.class.to_s.downcase + '.txt'
            file = File.new(filename)
            @headers = file.gets.chomp.split(', ')

            file.each do |row|
                csv_content = row.chomp.split(', ')
                @csv_contents << csv_content
                @rows << CsvRow.new(@headers, csv_content)
            end
        end

        def each(&block)
            @rows.each(&block)
        end
    
        attr_accessor :headers, :csv_contents, :rows

        def initialize
            read 
        end
    end
end

class RubyCsv
    include ActsAsCsv
    acts_as_csv
end

m = RubyCsv.new
puts m.headers.inspect
puts m.csv_contents.inspect
m.each {|row| puts row.one}
m.each {|row| puts row.two}
