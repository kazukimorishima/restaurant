class AddImageColumnToCourses < ActiveRecord::Migration[5.0]
  def change
    add_attachment :courses, :image
  end
end
