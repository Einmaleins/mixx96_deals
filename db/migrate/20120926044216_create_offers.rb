class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|
      t.string      :name
      t.string      :tagline
      t.text        :description
      t.decimal     :normal_price, precision: 8, scale: 2
      t.decimal     :price, precision: 8, scale: 2
      t.integer     :quantity
      t.datetime    :start_date
      t.datetime    :end_date
      t.datetime    :expiration_date
      t.string      :type
      t.string      :image
      t.integer     :merchant_id
      t.string      :printable_file
      t.datetime    :deleted_at
      t.timestamps
    end
  end
end