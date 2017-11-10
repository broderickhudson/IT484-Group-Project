class CreateMovies < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.string :creator
      t.text :description
      # Add fields that let Rails automatically keep track
      # of when projects are added or modified:
      t.timestamps
    end
  end
end
