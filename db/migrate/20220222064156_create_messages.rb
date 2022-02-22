class CreateMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :messages do |t|
      t.string :body
      t.belongs_to :live_stream, null: false, foreign_key: true

      t.timestamps
    end
  end
end
