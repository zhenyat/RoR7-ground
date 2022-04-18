class CreateDetailSets < ActiveRecord::Migration[7.0]
  def change
    create_table :detail_sets do |t|
      t.references :detailable,   null: false, polymorphic: true
      t.string     :inn,          null: false, index: {unique: true}
      t.string     :kpp
      t.string     :ogrn
      t.string     :ogrnip
      t.string     :okpo
      t.string     :okato
      t.string     :certificate_number
      t.date       :certificate_date
      t.string     :comment
      t.integer    :status,       null: false, default: 0, limit: 1

      t.timestamps
    end
  end
end
