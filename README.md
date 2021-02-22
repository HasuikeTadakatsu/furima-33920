# DB 設計

## users table(ユーザ情報)

| Column                         | Type                | Options                    |
|--------------------------------|---------------------|----------------------------|
| nickname(ニックネーム)           | string              | null: false                |
| email(メールアドレス)            | string              | null: false,unique: true   |
| encrypted_password(パスワード)  | string              | null: false                |
| last_name(お名前(全角)苗字))     | string              | null: false                |
| first_name(お名前(全角)名前))    | string              | null: false                |
| last_name_kana(お名前(全角)苗字) | string              | null: false                |
| first_name_kana(お名前(全角)名前)| string              | null: false                |
| birthday_date(生年月日)         | date                | null: false                |

### Association

* has_many   :items
* has_many   :orders
* has_many   :purchase_histories

## items table（商品情報） ※(出品画像(exhibition_image)はActiveStorageで実装予定の為、記載しない)

| Column                            | Type                | Options                         |
|-----------------------------------|---------------------|---------------------------------|
| name(商品名)                       | string              | null: false                     |
| description(商品の説明)             | text                | null: false                    |
| category_id(カテゴリー)             | integer             | null: false                    |
| status_id(商品の状態)               | integer             | null: false                    |
| shipping_fee_burden_id(配送料の負担)| integer             | null: false                    |
| prefectures_id(発送元の地域)        | integer             | null: false                    |
| days_to_ship_id(発送までの日数)     | integer             | null: false                    |
| selling_price(販売価格)            | integer             | null: false                    |
| user(users table id参照)           | references          | null: false,foreign_key: true  |

### Association

* has_one    :purchase_history
* belongs_to :user
* has_one    :order

## addresses table（住所(発送先)） 

| Column                            | Type                    | Options                               |
|-----------------------------------|-------------------------|---------------------------------------|
| postal_code(郵便番号)              | string                  | null: false                           |
| prefectures_id(都道府県)           | integer                 | null: false                           |
| municipality(市区町村)             | string                  | null: false                           |
| address(番地)                     | string                  | null: false                           |
| building_name(建物名)              | string                 |                                       |
| phone_number(電話番号)             | string                  | null:false                            |
| order(order table id参照)           | references             | null: false,foreign_key: true         |

### Association

* belongs_to :purchase_history
* belongs_to :order

##  orders(購入履歴) table

| Column                         | Type                | Options                       |
|--------------------------------|---------------------|-------------------------------|
| user(users table id参照)        | references          | null: false,foreign_key: true |
| item(item table id参照)         | references          | null: false,foreign_key: true |

### Association

* belongs_to  :user
* belongs_to  :item
- has_one :address