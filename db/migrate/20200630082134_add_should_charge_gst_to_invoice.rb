class AddShouldChargeGstToInvoice < ActiveRecord::Migration[5.2]
  def change
    add_column :invoices, :should_charge_gst, :boolean, default: false
  end
end
