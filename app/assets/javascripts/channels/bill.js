//= require cable
//= require_self

(function(){
  App.bills = App.cable.subscriptions.create('BillsChannel', {
    received: function(bill){
      var $bills = $('#bill-list');
      var $bill = $('tr[data-bill-id="' + bill.id  +'"]');
      if($bill.length > 0) {
        switch(bill.status) {
          case 'saved':
            $bill.replaceWith(bill.html)
            break;
          case 'deleted':
            $bill.remove()
            break;
        }
      }else{
        console.log('Nueva');
        $bills.append(bill.html);
      }
    }
  });
}).call(this);
