class CreateBanks < ActiveRecord::Migration[7.0]
  def change
    create_table :banks do |t|
      t.string  :name,   null: false, index: {unique: true}
      t.string  :title,  null: false, index: {unique: true}
      t.string  :bic,    null: false, index: {unique: true}
      t.string  :url
      t.string  :comment
      t.integer :status, null: false, default: 0, limit: 1

      t.timestamps
    end
  end
end
