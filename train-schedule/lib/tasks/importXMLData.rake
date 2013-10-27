namespace :data do
  desc 'Import train schedule xml data'
  task :import, [:dir, :days] => :environment do |task, args|
    p 'start to import xml...'
    dir = args[:dir]
    days = args[:days]

    if dir.nil?
      p "Usage: rake data:import[{XMLDir}]"
      p "Usage: rake data:import[{XMLDir}, {Days}]"
      return
    end

    begin
      days = days.to_i
    rescue
      days = nil
    end

    importer = Import::Importer.new
    importer.execute(dir, days)
  end
end
