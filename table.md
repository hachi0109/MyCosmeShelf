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
