class AddApiIdToMovies < ActiveRecord::Migration[5.1]
  def change
    add_column :movies, :api_id, :string
  end
end
