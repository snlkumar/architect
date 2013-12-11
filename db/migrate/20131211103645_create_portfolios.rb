class CreatePortfolios < ActiveRecord::Migration
  def change
    create_table :portfolios do |t|
      t.string :title
      t.string :description
      t.references :user
      t.attachment :avatar
      t.timestamps
    end
  end
end
