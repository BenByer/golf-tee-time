class GolferImporter

  def initialize(filename=File.absolute_path('db/data/user.csv'))
    @filename = filename
  end

  def import
    field_names = ['first_name', 'last_name', 'phone','email']
    puts "Importing golfers from '#{@filename}'"
    failure_count = 0
    User.transaction do
      File.open(@filename).each do |line|
      puts "Importing golfers from #{line}'"
        data = line.chomp.split(',')
          puts "Importing golfers from #{data}'"
        attribute_hash = Hash[field_names.zip(data)]
        begin
            puts "Importing golfers from #{attribute_hash}'"
          User.create!(attribute_hash)
          print '.'
        rescue ActiveRecord::UnknownAttributeError
          failure_count += 1
          print '!'
        ensure
          STDOUT.flush
        end
      end
    end
    failures = failure_count > 0 ? "(failed to create #{failure_count} golfer records)" : ''
    puts "\nDONE #{failures}\n\n"
  end

end
