class CreateReports < ActiveRecord::Migration[5.0]
  def change
    create_table :reports do |t|
      t.references :user, type: :uuid, foreign_key: true, null: false
      t.string :name, null: false
      t.datetime :start, null: false
      t.datetime :stop, null: false
      t.timestamps
    end
  end
end
