class CreatePhones < ActiveRecord::Migration[7.0]
  def change
    create_table :phones do |t|
      t.references :phoneable,         null: false, polymorphic: true
      t.integer    :kind,              null: false, default: 0, limit: 1
      t.string     :country_code,      null: false, default: '+7'
      t.string     :destination_code,  null: false
      t.string     :subscriber_number, null: false
      t.string     :comment
      t.integer    :status,            null: false, default: 0, limit: 1

      t.timestamps
    end
  end
end
