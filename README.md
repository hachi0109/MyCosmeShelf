# アプリケーション名
My Cosme Shelf

# アプリケーション概要
自分が持っているコスメを写真付きで登録・管理できる「コスメ在庫管理アプリケーション」です。
購入日や開封日を記録することで、使用期限が切れたコスメをアラートでお知らせします。また、在庫数の管理や「使い切り」機能により、コスメの消費状況を可視化し、無駄買い防止や使い切りをサポートします。

# URL
https://my-cosme-shelf.onrender.com/

# テスト用アカウント
- Basic認証ID：admin
- Basic認証パスワード：2222
- メールアドレス：test@test
- パスワード：test1234

# 利用方法
## 1. ユーザー登録
トップページの「新規登録」から、ニックネーム・メールアドレス・パスワード・お好みのテーマカラーを入力して登録します。

## 2. コスメの登録
マイページまたは一覧画面の「＋」ボタンから、手持ちのコスメを登録します。写真、商品名、ブランド、カテゴリ、購入日・開封日、在庫数などを入力できます。

## 3. 在庫・期限の管理
- **一覧画面**: 登録したコスメを一覧で確認できます。カテゴリごとの絞り込みや、使用期限切れ（開封から1年以上経過）コスメのチェックが可能です。
- **詳細画面**: 「使い切り」ボタンで在庫数を減らすことができます。在庫が0になると一覧画面でグレーアウトされます。
- **マイページ**: よく使うカテゴリの在庫総数や、使用期限切れのアラート通知を確認できます。

# アプリケーションを作成した背景
友人や親に困っていることをヒアリングした結果、コスメの在庫管理が日常のストレスとなっていることが判明しました。
私自身、自分が持っている在庫を把握しないまま出先やセールで衝動買いしてしまい、同じコスメを重複して購入したり
いつの間にか使用期限が切れていることがあったため、アプリで一括管理できれば分かりやすいのではないかと仮説を立て、
コスメの在庫管理アプリを開発することにしました。

# データベース設計
## users テーブル

| Column             | Type     | Options     |
| ------------------ | -------- | ----------- |
| name               | string   | null: false |
| email              | string   | null: false, unique: true |
| encrypted_password | string   | null: false |
| theme_color_id     | integer  | null: false |

### Association

- has_many :cosmetics
- belongs_to_active_hash :theme_color

## cosmetics テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| name               | string     | null: false |
| price              | integer    |             |
| brand              | string     |             |
| genre_id           | integer    | null: false |
| color_id           | integer    |             |
| usage_count_id     | integer    | null: false |
| purchase_date      | date       |             |
| open_date          | date       |             |
| stock              | integer    | null: false |
| official_url       | text       |             |
| is_favorite        | boolean    | null: false, default: false |
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :comments
- belongs_to_active_hash :genre
- belongs_to_active_hash :color
- belongs_to_active_hash :usage_count

## comments テーブル

| Column        | Type       | Options     |
| ------------- | ---------- | ------------|
| cosmetic      | references | null: false, foreign_key: true |
| content       | text       | null: false |
| rating        | integer    | null: false |
| status_id     | integer    | null: false |

### Association

- belongs_to :cosmetic
- belongs_to_active_hash :status

# 画面遷移図

# 開発環境
- フロントエンド：HTML / CSS / JavaScript
- バックエンド：Ruby / Ruby on Rails
- データベース：MySQL（開発環境）/PostgreSQL（本番環境）
- インフラ：Render
- エディタ：VSCode

# ローカルでの動作方法
以下のコマンドを順に実行してください。
```bash
% git clone https://github.com/hachi0109/MyCosmeShelf.git
% cd MyCosmeShelf
% bundle install
% rails db:create
% rails db:migrate
% rails s
```
その後、ブラウザで `http://localhost:3000` にアクセスしてください。

# 工夫したポイント
**1. ユーザー体験を向上させるテーマカラー機能**
ユーザーが自分の好みに合わせてアプリの雰囲気をカスタマイズできるよう、4色のテーマカラー（グリーン、ピンク、ブルー、ミルクティー）を用意しました。
CSS変数を活用して動的に配色を変更する仕組みを実装しました。これにより、毎日のコスメ管理が楽しくなるようなデザインを目指しました。

**2. 「使い切り」を可視化する在庫管理**
単に在庫数を記録するだけでなく、詳細画面に「使い切り」ボタンを設置し、ワンクリックで在庫を減らせるようにしました。
在庫が0になったコスメは一覧画面でグレーアウト表示され、画像もモノクロになるようCSSで制御しています。これにより、「使い切った達成感」と「現在の在庫状況」が一目でわかるように工夫しました。

**3. ストレスのない使用期限アラート**
開封日から1年以上経過したコスメを自動検出し、マイページでアラートを表示します。
ただし、警告が常に大きく表示されるとユーザーのストレスになるため、折りたたみ形式にしました。必要な時だけ詳細を確認できるUI設計にこだわりました。

# 改善点
- **非同期通信（Ajax）の導入**: 現在は「使い切り」ボタンを押すと画面遷移が発生しますが、JavaScriptを用いて非同期処理化し、よりスムーズな操作感を実現したいと考えています。
- **検索機能の強化**: 現在はジャンルごとの絞り込みのみですが、ブランド名や商品名でのキーワード検索機能を追加し、登録数が増えても目的のコスメをすぐに見つけられるようにしたいです。
- **グラフによる可視化**: ジャンルごとの所持割合や、月ごとのコスメ購入額などをグラフで表示し、より様々な分析をしやすくしたり、アプリの付加価値を追求したいです。

# 制作時間
約3週間