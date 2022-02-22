class CreateLiveStreams < ActiveRecord::Migration[7.0]
  def change
    create_table :live_streams do |t|
      t.string :name
      t.string :url

      t.timestamps
    end
  end
end
