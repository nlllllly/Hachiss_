$(document).on('turbolinks:load', function(){
  const inputForm = $('#searching-form');
  const url = location.href;
  const searchResult = $('#result ul');

  function builtHTML(data){
    let html = `
    <li>${data.name}</li>
    `
    searchResult.append(html);
  }

  function NoResult(message){
    let html = `
    <li>${message}</li>
    `
    searchResult.append(html);
  }

  // フォームに入力すると発火する
  inputForm.on('keyup', function(){
    const target = $(this).val();
    search(target);
  });

  // ajax処理
  function search(target){
    $.ajax({
      type: 'GET',
      url: 'search',
      data: {keyword: target},
      dataType: 'json'
    })
    .done(function(data){
      searchResult.empty(); 
      if (data.length !== 0) {
        data.forEach(function(data) {
          builtHTML(data)
        });
      } else {
        NoResult('該当する商品はありません')
      }
    })
    .fail(function(data){
      alert('非同期通信に失敗しました');
    })
  }
});
