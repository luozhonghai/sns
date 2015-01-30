class CreateInfos < ActiveRecord::Migration
  def change
    create_table :infos do |t|
      t.integer :data
      t.text :comment

      t.timestamps
    end
  end
end
