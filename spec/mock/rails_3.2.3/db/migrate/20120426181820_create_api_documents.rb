class CreateApiDocuments < ActiveRecord::Migration
  def change
    create_table :api_documents do |t|

      t.timestamps
    end
  end
end
