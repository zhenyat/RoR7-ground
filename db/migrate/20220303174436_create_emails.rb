class CreateEmails < ActiveRecord::Migration[7.0]
  def change
    create_table :emails do |t|
      t.references :emailable, null: false, polymorphic: true
      t.integer    :kind,      null: false, default: 0, limit: 1
      t.string     :address,   null: false
      t.string     :comment
      t.integer    :status,    null: false, default: 0, limit: 1

      t.timestamps
    end
  end
end
