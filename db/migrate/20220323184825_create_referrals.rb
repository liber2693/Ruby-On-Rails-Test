class CreateReferrals < ActiveRecord::Migration[6.1]
  def change
    create_table :referrals do |t|
      t.string :code
      t.bigint :count, default: 0

      t.timestamps
    end
  end
end
