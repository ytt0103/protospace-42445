# テーブル設計

## Users テーブル

| Column              | Type   | Options                   |
|---------------------|--------|----------------------------|
| name                | string | null: false               |
| email               | string | null: false, unique: true |
| encrypted_password  | string | null: false               |
| created_at          | datetime | null: false              |
| updated_at          | datetime | null: false              |

### Association
- has_many :prototypes
- has_many :comments

---

## Prototypes テーブル

| Column      | Type       | Options                        |
|-------------|------------|--------------------------------|
| title       | string     | null: false                    |
| catch_copy  | text       | null: false                    |
| concept     | text       | null: false                    |
| user        | references | null: false, foreign_key: true|

※ ActiveStorage を使うため、image カラムは不要です

### Association
- belongs_to :user  
- has_many :comments  
- has_one_attached :image

---

## Comments テーブル

| Column      | Type       | Options                        |
|-------------|------------|--------------------------------|
| text        | text       | null: false                    |
| user        | references | null: false, foreign_key: true|
| prototype   | references | null: false, foreign_key: true|

### Association
- belongs_to :user  
- belongs_to :prototype