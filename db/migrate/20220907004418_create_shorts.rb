class CreateShorts < ActiveRecord::Migration[7.0]
  def change
    create_table :shorts do |t|
      t.string :title
      t.string :url
      t.string :shortcode
      t.datetime :start_date
      t.integer :visit_count
      t.datetime :last_seen_date

      t.timestamps
    end
  end
end
