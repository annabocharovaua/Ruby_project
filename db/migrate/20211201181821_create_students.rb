class CreateStudents < ActiveRecord::Migration[6.1]
  def change
    create_table :students do |t|
      t.string :surname
      t.integer :school
      t.integer :grade
      t.integer :place

      t.timestamps
    end
  end
end
