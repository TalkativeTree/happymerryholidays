class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :url
      t.string :to_email
      t.string :subject
      t.text   :message

      t.timestamps
    end
  end
end
