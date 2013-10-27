require 'nokogiri'

module Import
  class Importer
    FILE_PATTERN=/\d*.xml/
    def extract_dir(dir)
      dirs = []
      Dir.foreach(dir) do |filename|
        next unless FILE_PATTERN.match filename
        dirs << filename
      end
      dirs
    end

    TRAIN_ATTS = { 'CarClass'     => :car_class,
                   'Cripple'      => :cripple,
                   'Dinning'      => :dinning,
                   'Line'         => :line,
                   'LineDir'      => :line_dir,
                   'Note'         => :note,
                   'OverNightStn' => :over_night_stn,
                   'Package'      => :package,
                   'Route'        => :route,
                   'Train'        => :train,
                   'Type'         => :type
                 }
    TIME_ATTS =  { 'ARRTime'      => :arr_time,
                   'DEPTime'      => :dep_time,
                   'Order'        => :order,
                   'Route'        => :time_route,
                   'Station'      => :station
                 }
    def load_xml(filepath)
      xml = Nokogiri::XML(File.open(filepath))
      root = xml.children[0]

      data = []
      root.children.each do |train_info|
        next if train_info.name == 'text'
        train = {}
        TRAIN_ATTS.each do |train_att, att_sym|
          attribute = train_info.attribute(train_att)
          train[att_sym] = if attribute.nil?
                                      ""
                                    else
                                      attribute.value
                                    end
        end
        train_info.children.each do |time_info|
          next if time_info.name == 'text'
          car = {}
          TIME_ATTS.each do |time_att, att_sym|
            attribute = time_info.attribute(time_att)
            next if attribute.nil?
            value = if attribute.nil?
                      ""
                    else
                      attribute.value
                    end
            car[att_sym] = value
          end

          next if car.empty?
          train.each do |att, value|
            car[att] = value
          end
          data << car
        end
      end

      data
    end

    def importToDB(data)
      # TODO: Need to use single sql mass inserting
      RawDatum.create(data)
      nil
    end

    def execute(dir, days)
      return if dir.blank?
      root = Rails.root
      # dir = "#{root}/../crawler/data/xml"
      files = extract_dir(dir)
      unless days.nil?
        index = 0
        days.times do |day|
          break if index >= days
          p "Import #{files[index]} data"
          data = load_xml("#{dir}/#{files[index]}")
          importToDB(data)
          index += 1
        end
      else
        files.each do |filepath|
          data = load_xml("#{dir}/#{filepath}")
          importToDB(data)
        end
      end
    end
  end
end
