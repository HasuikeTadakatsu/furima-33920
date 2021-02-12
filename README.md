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

* has_many :items
* has_many :comments
* has_one  :credit_cards
* has_one  :addresses

## items table（商品情報） ※(出品画像(exhibition_image)はActiveStorageで実装予定の為、記載しない)

| Column                         | Type                | Options                    |
|--------------------------------|---------------------|----------------------------|
| product_name(商品名)            | string              | null: false                |
| product_description(商品の説明)  | text                | null: false                |
| product_category(カテゴリー)     | string              | null: false                |
| product_status(商品の状態)       | string              | null: false                |
| shipping_fee_burden(配送料の負担)| integer             | null: false                |
| shipping_area(発送元の地域)      | string              | null: false                |
| days_to_ship(発送までの日数)     | string              | null: false                |
| selling_price(販売価格)         | integer             | null: false                |

### Association

* has_many    :comments
* belongs_to  :users

## addresses table（住所(発送先)） 

| Column                         | Type                | Options                    |
|--------------------------------|---------------------|----------------------------|
| postal_code(郵便番号)           | integer             | null: false                |
| prefectures(都道府県)           | string              | null: false                |
| municipality(市区町村)          | string              | null: false                |
| address(番地)                  | string              | null: false                |
| building_name(建物名)           | string              |                           |
| phone_number(電話番号)           | string              | null:false                |

### Association

* belongs_to  :users

##  credit_cards table（クレジットカード） 

| Column                         | Type                | Options                      |
|--------------------------------|---------------------|------------------------------|
| user_id(ユーザid)               | integer             | null: false,foreign_key:true |
| customer_id(カスタマーid)        | references          | null: false,foreign_key:true |
| card_id(カードid)               | references          | null: false,foreign_key:true |

### Association

* belongs_to  :users

##  comments table(コメント)※追加実装予定

| Column                         | Type                | Options                       |
|--------------------------------|---------------------|-------------------------------|
| comment(コメント)                | text                | null: false                   |
| item(アイテム)                   | references          | null: false,foreign_key: true |
| user(ユーザー)                   | references          | null: false,foreign_key: true |

### Association

* belongs_to  :items
* belongs_to  :users