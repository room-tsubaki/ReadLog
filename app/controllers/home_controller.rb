class HomeController < ApplicationController
  layout 'application_top'

  def top
    @titles = [["プリズナートレーニング", "日本国紀", "医者が教える食事術 最強の教科書", "欅坂46ファースト写真集『21人の未完成』"],
              ["岡靖知画集", "年収1億円になる人の習慣", "月星座パワーブック", "学びを結果に変えるアウトプット大全"]]
    @pic_paths = [["/assets/pic1.jpg", "/assets/pic2.jpg", "/assets/pic3.jpg", "/assets/pic4.jpg"],
                ["/assets/pic5.jpg", "/assets/pic6.jpg", "/assets/pic7.jpg", "/assets/pic8.jpg"]]

  end
end
