class CreateMovies < ActiveRecord::Migration[7.1]
  def change
    create_table :movies do |t|
      t.string :title
      t.decimal :vote_average

      t.timestamps
    end
  end
end
