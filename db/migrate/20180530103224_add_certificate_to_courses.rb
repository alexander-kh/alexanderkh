class AddCertificateToCourses < ActiveRecord::Migration[5.1]
  def change
    add_column :courses, :certificate_url, :string
  end
end
