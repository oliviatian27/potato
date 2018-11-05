class CreateTvmovies < ActiveRecord::Migration[5.2]
  def change
    create_table :tvmovies do |t|
      t.string :name
      t.integer :tmdbid
      t.integer :rating_count
      t.integer :rating_average
      t.timestamps
    end
  end
end
