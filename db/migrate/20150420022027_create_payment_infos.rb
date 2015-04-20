class CreatePaymentInfos < ActiveRecord::Migration
  def change
    create_table :payment_infos do |t|
      t.string :card_num
      t.date :expiration_date
      t.string :ccv
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :payment_infos, :users
  end
end
