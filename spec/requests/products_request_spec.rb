require 'rails_helper'

RSpec.describe "Products", type: :request do
    describe '商品一覧ページ' do
        context "商品一覧ページに変遷する" do
            before do
                get products_path
            end
            it 'タイトルが正しく表示されていること' do
                expect(response.body).to include("商品一覧")
            end
            it '商品一覧がページに表示されていること' do
                expect(@products).to eq(@products)
            end
        end
    end
end
