class CreateRepos < ActiveRecord::Migration[5.1]
  def change
    create_table :repos do |t|
      t.string :name
      t.string :full_name
      t.string :owner
      t.string :private
      t.string :fork
      t.string :html_url
      t.string :size
      t.string :language
      t.string :forks
      t.string :open_issues
      t.string :watchers
      t.string :default_branch

      t.timestamps
    end
  end
end
