class CreateLeadsLeads < ActiveRecord::Migration[6.0]
  def change
    create_table :leads_leads do |t|
      t.string :email
      t.string :name
      t.string :phone

      t.timestamps
    end
  end
end
