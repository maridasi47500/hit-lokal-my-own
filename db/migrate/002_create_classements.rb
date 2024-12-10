# db/migrate/002_create_classements.rb
class CreateClassements < ActiveRecord::Migration[6.0]
  def change
    create_table :classements do |t|
      t.references :chanson, foreign_key: true
      t.integer :semaine_no
      t.integer :annee

      t.timestamps
    end
  end
end

