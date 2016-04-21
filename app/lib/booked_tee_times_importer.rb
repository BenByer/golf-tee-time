class BookedTeeTimesImporter

  def initialize(filename=File.absolute_path('db/data/booked_tee_times.csv'))
    @filename = filename
  end

  def import
    field_names = ['user_id', 'tee_time_at', 'golfer_count']
    puts "Importing booked tee times from '#{@filename}'"
    failure_count = 0
      Booking.transaction do
      File.open(@filename).each do |line|
        data = line.chomp.split(',')
        attribute_hash = Hash[field_names.zip(data)]
        begin
          Booking.create!(attribute_hash)
          print '.'
        rescue ActiveRecord::UnknownAttributeError
          failure_count += 1
          print '!'
        ensure
          STDOUT.flush
        end
      end
    end
    failures = failure_count > 0 ? "(failed to create #{failure_count} booked tee time records)" : ''
    puts "\nDONE #{failures}\n\n"
  end

end