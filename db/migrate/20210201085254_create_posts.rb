class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :date
      t.string :explanation
      t.string :url
      t.string :hdurl
      t.string :title
      t.string :service_version
      t.string :media_type
      t.string :copyright
      

      t.timestamps
    end
  end
end
