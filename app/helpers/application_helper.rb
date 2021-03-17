module ApplicationHelper
  def full_title(page_title = '')  #メソッド定義とオプション引数
    base_title = "Rails勉強会" #変数への代入
    if page_title.empty? #論理値のテスト
      base_title #暗黙の戻り値
    else
      page_title + " | " + base_title  #文字列の結合
    end
  end
end
