# インクリメンタルサーチ用 idと商品名を取り出す
json.array! @search_products do |product| 
  json.id product.id
  json.name product.name
end