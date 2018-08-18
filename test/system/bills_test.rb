require 'application_system_test_case'

class BillsTest < ApplicationSystemTestCase
  setup do
    @bill = bills(:one)
  end

  test 'should list all bills' do
    visit '/'
    assert_selector 'h1', text: 'Facturas'
    within '#bill-list' do
      assert_text 'Pedro García'
    end
    assert_text @bill.client_names
  end

  test 'should show bill' do
    visit '/'
    within '#bill-list' do
      first('a[data-title="Ver"]').click
    end
  end

  test 'should create a new bill' do
    visit '/'
    click_on 'Nueva Factura'
    fill_in 'Cliente', with: 'Fernando Rodríguez'
    page.find('#bill_emitting_date').set('2018-08-11')
    page.find('#bill_expiration_date').set('2018-08-30')
    click_on 'Guardar'

    assert_text 'Factura Guardada'
    assert_text 'Fernando Rodríguez'
    assert_text '11-08-2018'
    assert_text '30-08-2018'
  end

  test 'should edit existing bill' do
    visit '/'
    within '#bill-list' do
      first('a[data-title="Editar"]').click
    end
    fill_in 'Cliente', with: 'Fernando Rodríguez'
    page.find('#bill_emitting_date').set('2018-08-11')
    page.find('#bill_expiration_date').set('2018-08-30')
    click_on 'Guardar'

    assert_text 'Factura Editada Correctamente'
    assert_text 'Fernando Rodríguez'
    assert_text '11-08-2018'
    assert_text '30-08-2018'
  end

  test 'should delete bill' do
    visit '/'
    within '#bill-list' do
      accept_alert do
        first('a[data-title="Eliminar"]').click
      end
    end
    assert_text 'Factura Borrada'
  end

  test 'should create a new bill with items' do
    visit '/'
    click_on 'Nueva Factura'
    fill_in 'Cliente', with: 'Fernando Rodríguez'
    page.find('#bill_emitting_date').set('2018-08-11')
    page.find('#bill_expiration_date').set('2018-08-30')
    click_on 'Agregar Concepto'
    fill_in 'Concepto', with: 'Servicio'
    fill_in 'Monto', with: 1000
    fill_in 'Cantidad', with: 1
    click_on 'Guardar'

    assert_text 'Factura Guardada'
    assert_text 'Fernando Rodríguez'
    assert_text '11-08-2018'
    assert_text '30-08-2018'
    assert_text 'Servicio'
    assert_text '$1,000.00'
    assert_text '1'
  end

  test 'should create bill payment' do
    visit '/'
    within '#bill-list' do
      first('a[data-title="Pagar"]').click
    end

    fill_in 'Monto', with: 1800
    select('transferencia', from: 'Tipo Pago')
    click_on 'Guardar'
    assert_text 'Estatus: pagada'
  end

  test 'shoudl create bill payment with delay' do
    visit '/'
    within '#bill-list' do
      within all('tr').last do
        first('a[data-title="Pagar"]').click
      end
    end

    fill_in 'Monto', with: 1800
    select('transferencia', from: 'Tipo Pago')
    click_on 'Guardar'
    assert_text 'Estatus: pendiente'
  end
end
