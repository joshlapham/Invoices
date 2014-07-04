module InvoicesHelper

  def setup_invoice(invoice)
    invoice.items ||= Item.new
    3.times { invoice.items.build }
    invoice
  end

end
