class CreateLikes < ActiveRecord::Migration[5.0]
    def up
        create_table :likes do |t|
        end
    end

    def change
        add_column :users, :like_id :integer
        add_column :blog, :like_id :integer
    end

    def down
      drop_table :likes :integer
    end
   end