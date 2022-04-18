class CreatePartners < ActiveRecord::Migration[7.0]
  def change
    create_table :partners do |t|
      t.string   :name,   null: false
      t.string   :code,   null: false
      t.string   :title,  null: false
      t.integer  :kind,   null: false, default: 0, limit: 1
      t.integer  :role,   null: false, default: 0, limit: 1
      t.string   :url
      t.string   :comment
      t.integer  :status, null: false, default: 0, limit: 1

      t.timestamps
    end
  end
end