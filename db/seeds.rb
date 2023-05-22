Admin.create!(
  email: "a@a",
  password: "aaaaaa"
)

companies = ["Alpha Systems Inc.", "Beta Builders LLC", "Crimson Consulting Group", "Delta Dynamics Corporation", "Eclipse Enterprises Limited"]
categories = [["本・電子書籍", "book"], ["食べ物・フード", "utensils"], ["レジャー", "suitcase-rolling"], ["日用品", "home"], ["健康・ヘルスケア", "seedling"]]
categories.each do |category|
  Category.create!(name: category[0], icon: category[1])
end

subscriptions = [
  [1, "A+ Fitness", "忙しい現代人にとって理想的な、柔軟で手軽なフィットネスソリューション", %Q{A+ Fitnessは、オンラインで提供されるフィットネスサブスクリプションサービスです。\n\n ユーザーは、ワークアウトプログラム、ライブストリーミングクラス、ビデオライブラリ、専属のトレーナーとのオンラインセッションなどを含む、多様なコンテンツにアクセスできます。\n\n サービスは、個人のフィットネス目標に合わせて、カスタマイズされたワークアウトプランを提供し、自宅で自分のペースで運動できるようにします。\n\n また、トレーナーや他のユーザーとのコミュニケーションを通じて、モチベーションを高め、目標達成に向けたサポートを提供します。\n\n さらに、A+ Fitnessのアプリを利用することで、ワークアウトプランの履歴や進捗状況を追跡することができ、自己評価を促進します。\n\n A+ Fitnessは、忙しい現代人にとって理想的な、柔軟で手軽なフィットネスソリューションです。}, 4000, 1, 1, 5],
  [2, "Beyond Books", "あらゆる方に向けて、豊富な書籍を提供するサービス", %Q{Beyond Booksは、定額制のオンライン図書館サービスです。\n\n 登録者は、月額料金を支払うことで、様々なジャンルの書籍や雑誌を、いつでもどこでも読むことができます。\n また、会員限定のオンライン読書会や、オンラインストアでの書籍購入時の割引などの特典もあります。\n\n Beyond Booksの最大の魅力は、圧倒的な書籍の豊富さです。\n 幅広いジャンルから、ベストセラー小説やビジネス書、コミックや雑誌まで、数千冊以上の書籍を取り揃えています。\n\n また、登録者は最大で5冊まで同時に借りることができ、返却期限もないため、ゆっくりと読書を楽しむことができます。\n\n Beyond Booksは、オンライン図書館としては最大手のサービスの一つであり、現在も急速に拡大しています。\n 書籍好きな方はもちろん、新しい趣味を見つけたい方や、多忙なビジネスパーソンなど、あらゆる方に向けて、豊富な書籍を提供するサービスです。}, 1500, 1, 2, 1],
  [3, "Cloud Cuisine", "料理好きな人々に向けた料理レシピのサブスクリプションサービス", %Q{Cloud Cuisineは、料理好きな人々に向けた料理レシピのサブスクリプションサービスです。\n\n 月に3回、サブスクリプションメンバーには、オンライン上でアクセスできる簡単なレシピが提供されます。\n\n レシピは、季節の新鮮な食材を使用しているため、栄養価が高く、健康にも配慮されています。\n加えて、毎月、サブスクリプションメンバー限定の特別なレシピも提供されます。\n\n Cloud Cuisineでは、サブスクリプションメンバーのフィードバックを収集し、サービスの改善に取り組んでいます。\mまた、コミュニティフォーラムを通じて、メンバー同士が料理のアイデアを共有し、コミュニケーションを深めることもできます。\n\n Cloud Cuisineは、食を愛する人々にとって、革新的なサブスクリプションサービスであり、健康的なライフスタイルを促進することを目的としています。}, 980, 1, 3, 2],
  [4, "Dream Delivered", "新鮮で健康的な食材を手軽に自宅に届けるサブスクリプションサービス", %Q{Dream Deliveredは、新鮮で健康的な食材を手軽に自宅に届けるサブスクリプションサービスです。\n\n 月額料金5,500円で、週に3回、自然栽培、無農薬の新鮮な野菜とフルーツ、オーガニックの鶏肉や豚肉、無添加の魚介類などが届きます。\n 食材は、シェフが考案した簡単で美味しいレシピと共に届き、栄養バランスにも配慮されています。\n また、食材に関する質問や相談は、専属の管理栄養士に電話やメールで相談が可能です。\n\n 忙しい現代人に向けた手軽でヘルシーな食生活を提供するDream Deliveredは、高品質な食材とレシピで、健康な生活をサポートします。}, 5500, 1, 4, 2],
  [5, "Eco Essentials", "毎月、環境に配慮した再利用可能なエコ製品をお届けします", %Q{毎月、サブスクリプションに登録したユーザーに、使い捨てではなく再利用可能なエコ製品をお届けします。\n その製品には、石鹸やシャンプー、ボディローション、歯ブラシ、ストロー、タンブラーなどがあります。\n\n また、Eco Essentialsの製品は、環境に配慮した素材で作られています。\n 例えば、竹や麻、再生プラスチックなどが使用されています。\n サブスクリプションに登録することで、プラスチックゴミの削減に貢献することができます。\n\n さらに、毎月届く製品は、サブスクリプションに登録したユーザーにとっては、コストパフォーマンスに優れたものとなります。\nEco Essentialsは、環境問題に取り組むことを目的としているため、より多くの人々がエコライフスタイルを取り入れることを促進しています。}, 2300, 1, 5, 4],
  [1, "XploreBox", "旅行好きのあなたに、毎月新しい冒険をお届けします", %Q{XploreBoxは、旅行や冒険に興味のある人向けのサブスクリプションサービスです。\n\n 月額料金を支払うことで、毎月新しい冒険が届きます。\n XploreBoxには、旅行の計画を支援するアイテム、地域の食品やお土産、ガイドブック、アクティビティのチケット、アウトドアギアなどが含まれます。\n\n XploreBoxは、新しい場所や体験を探求することを促進することを目的としています。\n 自分自身で旅行を計画する必要がなく、XploreBoxがその手間を取り除いてくれます。\n\n また、あなたの好みに合わせたXploreBoxを選ぶことができ、自分自身で冒険を選択するよりも新しい発見を見つける可能性が高くなります。}, 1980, 1, 6, 3],
  [2, "YourWellness", "毎月、健康的で美味しいレシピや、エクササイズの動画、美容グッズ、そして健康や美容に役立つ情報を提供しています", %Q{YourWellnessは、健康と美容に関するサブスクリプションサービスです。\n\n 毎月、健康的で美味しいレシピや、エクササイズの動画、美容グッズ、そして健康や美容に役立つ情報を提供しています。\n\n YourWellnessは、あなたの健康と美容についてのアイデアや知識を拡大できるように設計されています。\n サブスクリプションに登録することで、毎月専門家によるカスタマイズされたヘルスケア情報を手に入れることができます。\n\n YourWellnessは、より健康的で美しいライフスタイルを実現するために、必要な知識、ツール、そして励ましを提供します。}, 2480, 1, 7, 5],
  [5, "Eco Essentials -3ヵ月パック-", "毎月、環境に配慮した再利用可能なエコ製品をお届けします", %Q{毎月、サブスクリプションに登録したユーザーに、使い捨てではなく再利用可能なエコ製品をお届けします。\n その製品には、石鹸やシャンプー、ボディローション、歯ブラシ、ストロー、タンブラーなどがあります。\n\n また、Eco Essentialsの製品は、環境に配慮した素材で作られています。\n 例えば、竹や麻、再生プラスチックなどが使用されています。\n サブスクリプションに登録することで、プラスチックゴミの削減に貢献することができます。\n\n さらに、毎月届く製品は、サブスクリプションに登録したユーザーにとっては、コストパフォーマンスに優れたものとなります。\nEco Essentialsは、環境問題に取り組むことを目的としているため、より多くの人々がエコライフスタイルを取り入れることを促進しています。}, 5900, 3, 5, 4],
  [5, "Eco Essentials Plus", "環境に配慮し、高品質でおしゃれな商品を求めるユーザーに向けた究極のサブスクリプションサービス", %Q{Eco Essentialsをより豪華にご提供します!\n\n Eco Essentials Plusでは、オーガニック素材を使用した高級スキンケア製品や、持続可能な材料を使ったファッションアイテムなど、より高級でエコロジカルな商品を提供します。\n\n 定期的に特別なプロモーションや限定商品を提供することで、皆様に驚きと喜びを与えます。\n\n Eco Essentials Plusは、環境に配慮し、高品質でおしゃれな商品を求めるユーザーに向けた究極のサブスクリプションサービスです。}, 4000, 1, 5, 4],
  [5, "Eco Essentials Plus -3ヵ月パック-", "環境に配慮し、高品質でおしゃれな商品を求めるユーザーに向けた究極のサブスクリプションサービス", %Q{Eco Essentialsをより豪華にご提供します!\n\n Eco Essentials Plusでは、オーガニック素材を使用した高級スキンケア製品や、持続可能な材料を使ったファッションアイテムなど、より高級でエコロジカルな商品を提供します。\n\n 定期的に特別なプロモーションや限定商品を提供することで、皆様に驚きと喜びを与えます。\n\n Eco Essentials Plusは、環境に配慮し、高品質でおしゃれな商品を求めるユーザーに向けた究極のサブスクリプションサービスです。}, 11000, 3, 5, 4]
]

companies.each do |company|
  company = Company.create!(name: company)
  company.image.attach(io: File.open("./app/assets/images/logo_#{company.name}.png"), filename: "#{company.name}.png")
end

7.times do
  Group.create!
end

subscriptions.each do |subscription|
  subsc = AdminSubscription.create!(
    company_id: subscription[0],
    name: subscription[1],
    catch_copy: subscription[2],
    description: subscription[3],
    price: subscription[4],
    update_cycle: subscription[5],
    group_id: subscription[6],
    category_id: subscription[7]
  )
  subsc.image.attach(io: File.open("./app/assets/images/logo_#{subsc.name}.png"), filename: "#{subsc.name}.png")
end

users = [{ email: "yagi@test", name: "やぎ", introduction: "IPUT ２期生 Web Engineer" }, { email: "spring@test", name: "はる", introduction: "お花に囲まれて過ごしていたい" }, { email: "summer@test", name: "なつ", introduction: "音楽とスポーツ観戦が趣味です" }, { email: "autumn@test", name: "あき", introduction: "食欲旺盛な読書好き" }, { email: "winter@test", name: "ふゆ", introduction: "こたつで寝てたいよ～" }]
user_images = ["building.jpg", "spring.jpg", "summer.jpg", "autumn.jpg", "winter.jpg"]
user_ids = [0]

users.size.times do |n|
  user = User.new(users[n])
  user.password = 123456
  user.save
  user_ids.push(user.id)
  user.image.attach(io: File.open("./app/assets/images/#{user_images[n]}"), filename: user_images[n])
end

relationships = [[1, 2], [1, 3], [1, 4], [2, 1], [2, 3], [2, 5], [3, 2], [3, 4], [3, 5], [4, 2], [5, 1], [5, 2], [5, 3], [5, 4]]
relationships.each do |relationship|
  Relationship.create!(follower_id: user_ids[relationship[0]], followed_id: user_ids[relationship[1]])
end

subscribes = [[1, 1, "2023-04-01"], [1, 2, "2023-03-21"], [1, 9, "2023-02-16"], [2, 1, "2022-09-30"], [2, 4, "2023-05-04"], [2, 6, "2023-03-27"], [3, 1, "2023-01-11"], [3, 4, "2022-12-06"], [3, 7, "2023-02-22"], [4, 6, "2023-05-03"], [5, 10, "2023-04-25"]]
subscribes.each do |subscribe|
  Subscribe.create!(
    user_id: user_ids[subscribe[0]],
    admin_subscription_id: subscribe[1],
    contract_day: subscribe[2],
  )
end