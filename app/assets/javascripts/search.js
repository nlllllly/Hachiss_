$(document).on('turbolinks:load', function(){
  var inputForm = $('#searching-form');
  var url = location.href;
  var searchResult = $('#result');

  // 検索結果がヒットしたときの表示
  function builtHTML(data){
    var html = `
    <li class="list-group-item list-group-item-action">
      <a href="/products/${data.id}">
        ${data.name}
      </a>
    </li>
    `
    searchResult.append(html);
  }
  // 検索結果が空のときの表示
  function NoResult(message){
    var html = `
    <li class="list-group-item list-group-item-action">${message}</li>
    `
    searchResult.append(html);
  }

  // フォームに入力すると発火する
  inputForm.on('keyup', function(e){
    e.preventDefault();
    var target = $(this).val(); 
    search(target);
  });

  // ajax処理
  function search(target){
    $.ajax({
      type: 'GET',
      url: '/search',
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