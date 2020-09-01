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