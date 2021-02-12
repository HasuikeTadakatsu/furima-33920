# DB 設計

## users table(ユーザ情報)

| Column                         | Type                | Options                    |
|--------------------------------|---------------------|----------------------------|
| nickname(ニックネーム)           | string              | null: false                |
| email(メールアドレス)            | string              | null: false,unique: true   |
| password(パスワード)            | string              | null: false,unique: true   |
| last_name(お名前(全角)苗字))     | string              | null: false                |
| first_name(お名前(全角)名前))    | string              | null: false                |
| last_name_kana(お名前(全角)苗字) | string              | null: false                |
| first_name_kana(お名前(全角)名前)| string              | null: false                |
| birthday_date(生年月日)         | date                | null: false                |

### Association

* has_many   :items
* has_many   :comments
* has_one    :purchase_histories

## items table（商品情報） ※(出品画像(exhibition_image)はActiveStorageで実装予定の為、記載しない)

| Column                            | Type                | Options                         |
|-----------------------------------|---------------------|---------------------------------|
| product_name(商品名)               | string              | null: false                     |
| product_description(商品の説明)     | text                | null: false                    |
| product_category_id(カテゴリー)     | integer             | null: false,foreign_key: true  |
| product_status_id(商品の状態)       | integer             | null: false,foreign_key: true  |
| shipping_fee_burden_id(配送料の負担)| integer             | null: false,foreign_key: true  |
| prefectures_id(発送元の地域)        | integer             | null: false,foreign_key: true  |
| days_to_ship_id(発送までの日数)     | integer             | null: false,foreign_key: true  |
| selling_price(販売価格)            | integer             | null: false                    |

### Association

* has_many   :comments
* has_one    :purchase_histories

## purchase_history table（購入履歴） 

| Column                          | Type                  | Options                       |
|---------------------------------|-----------------------|-------------------------------|
| item(アイテム)                   | references            | null: false,foreign_key: true |
| user(ユーザー)                   | references            | null: false,foreign_key: true |

### Association

* belongs_to  :item
* belongs_to  :user
* has_one     :address

## addresses table（住所(発送先)） 

| Column                         | Type                | Options                                   |
|--------------------------------|---------------------|-------------------------------------------|
| postal_code(郵便番号)           | string              | null: false                               |
| prefectures_id(都道府県)        | string              | null: false null: false,foreign_key: true |
| municipality(市区町村)          | string              | null: false                               |
| address(番地)                  | string              | null: false                               |
| building_name(建物名)           | string              |                                           |
| phone_number(電話番号)           | string              | null:false                               |

### Association

* belongs_to :purchase_history

##  comments table(コメント)※追加実装予定

| Column                         | Type                | Options                       |
|--------------------------------|---------------------|-------------------------------|
| comment(コメント)                | text                | null: false                   |
| item(アイテム)                   | references          | null: false,foreign_key: true |
| user(ユーザー)                   | references          | null: false,foreign_key: true |

### Association

* belongs_to  :item
* belongs_to  :user