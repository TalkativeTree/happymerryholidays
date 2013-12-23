class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :url
      t.string :sender_name
      t.string :receiver_name
      t.text   :message

      t.timestamps
    end
  end
end
