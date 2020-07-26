require 'test_helper'

class ClientTest < ActiveSupport::TestCase
  test 'Test fixture data' do
    client = clients(:testclient)
    assert_equal client.user.email, 'test@user.com'
    assert_equal client.name, 'Test Client'
  end

  test "should not save a new Client without 'name'" do
    @client = Client.new

    assert_not @client.save, "Saved Client without 'name'"
  end

  test "'draft_invoices' method should return correct invoices" do
    test_client = clients(:testclient)
    assert_not_empty test_client.draft_invoices
    assert_equal test_client.draft_invoices.first.invoice_number, 'INV-123'
    assert_equal test_client.draft_invoices.first.status, 'draft'
  end

  test "'sent_invoices' method should return correct invoices" do
    test_client = clients(:testclient)
    assert_not_empty test_client.sent_invoices
    assert_equal test_client.sent_invoices.first.invoice_number, 'INV-1234'
    assert_equal test_client.sent_invoices.first.status, 'sent'
  end

  test "'paid_invoices' method should return correct invoices" do
    test_client = clients(:testclient)
    assert_not_empty test_client.paid_invoices
    assert_equal test_client.paid_invoices.first.invoice_number, 'INV-12345'
    assert_equal test_client.paid_invoices.first.status, 'paid'
  end
end
