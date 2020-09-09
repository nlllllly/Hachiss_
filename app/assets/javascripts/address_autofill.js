$(function() {
    return $('#customer_postcode').jpostal({
      postcode: ['#customer_postcode'],
      address: {
        '#customer_prefecture_code': '%3',
        '#customer_address_city': '%4',
        '#customer_address_street': '%5%6%7',
      },
    });
  });


$(function() {
    return $('#shipping_postcode').jpostal({
      postcode: ['#shipping_postcode'],
      address: {
        '#shipping_prefecture_code': '%3',
        '#shipping_address_city': '%4',
        '#shipping_address_street': '%5%6%7',
      },
    });
  });