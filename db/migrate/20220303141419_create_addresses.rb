class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.references :addressable,  null: false, polymorphic: true
      t.integer    :kind,         null: false, default: 0, limit: 1
      t.string     :postal_code
      t.string     :country,      null: false
      t.string     :region,       null: false
      t.string     :city,         null: false
      t.string     :street,       null: false
      t.string     :comment
      t.integer    :status,       null: false, default: 0, limit: 1

      t.timestamps
    end
  end
end
