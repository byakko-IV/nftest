require 'application_system_test_case'

class BillsTest < ApplicationSystemTestCase
  test 'should list all bills' do
    visit '/'
    assert_selector 'h1', text: 'Facturas'
    within '#bill-list' do
      assert_text 'Pedro García'
    end
  end

  test 'should create a new bill' do
    visit '/'
    click_on 'Nueva Factura'
    fill_in 'Cliente', with: 'Fernando Rodríguez'
    fill_in 'Fecha Emición', with: '11-08-2018'
    fill_in 'Fecha Vencimiento', with: '30-08-2018'
    click_on 'Guardar'

    assert_text 'Factura Guardada'
    assert_text 'Fernando Rodríguez'
    assert_text '11-08-2018'
    assert_text '30-08-2018'
  end

  test 'should edit existing bill' do
    visit '/'
    within '#bill-list' do
      first(:link, 'Editar').click
    end
    fill_in 'Cliente', with: 'Fernando Rodríguez'
    fill_in 'Fecha Emición', with: '11-08-2018'
    fill_in 'Fecha Vencimiento', with: '30-08-2018'
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
        first(:link, 'Borrar').click
      end
    end
    assert_text 'Factura Borrada'
  end
end
