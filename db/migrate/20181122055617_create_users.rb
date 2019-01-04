class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :mobile_number
      t.string :provider
      t.string :uid

      t.timestamps
    end
  end
end
