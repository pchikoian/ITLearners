class CreateRawData < ActiveRecord::Migration
  def change
    create_table :raw_data do |t|
      t.string :car_class
      t.string :cripple
      t.string :dinning
      t.string :line
      t.string :line_dir
      t.string :note
      t.string :over_night_stn
      t.string :package
      t.string :route
      t.string :train
      t.string :type
      t.string :arr_time
      t.string :dep_time
      t.string :order
      t.string :time_route
      t.string :station

      t.timestamps
    end
  end
end
