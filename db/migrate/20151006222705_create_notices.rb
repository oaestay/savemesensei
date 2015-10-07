class CreateNotices < ActiveRecord::Migration
  def change
    create_table :notices do |t|
        t.string :title
        t.string :message
        t.integer :qcomments
        t.timestamps :created_at
        t.references :user

      t.timestamps null: false
    end
  end
end
