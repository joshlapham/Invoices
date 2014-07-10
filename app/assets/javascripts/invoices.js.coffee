# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# Datepicker for Invoices
jQuery ->
	$('#invoice_date_sent').datepicker()
	$('#invoice_date_due').datepicker()
