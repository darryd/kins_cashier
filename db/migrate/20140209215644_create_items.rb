class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :question
      t.string :answer

      t.timestamps
    end
  end
end
