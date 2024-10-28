## users

|Column            |Type  |Options                  |
|------------------|------|-------------------------|
|nickname          |string|null: false              |
|email             |string|null: false, unique: true|
|encrypted_password|string|null: false              |
|last_name         |string|null: false              |
|first_name        |string|null: false              |
|last_name_kana    |string|null: false              |
|first_name_kana   |string|null: false              |
|birth_date        |date  |null: false              |

### Association
- has_many :items
- has_many :orders



## items

|Column            |Type      |Options                       |
|------------------|----------|------------------------------|
|user              |references|null: false, foreign_key:true |
|name              |string    |null: false                   |
|description       |text      |null: false                   |
|category_id       |integer   |null: false                   |
|condition_id      |integer   |null: false                   |
|delivery_charge_id|integer   |null: false                   |
|prefectures_id    |integer   |null: false                   |
|delivery_days_id  |integer   |null: false                   |
|price             |integer   |null: false                   |

### Association
- has_one :order
- belongs_to :user



## shipping_addresses

|Column          |Type      |Options                       |
|----------------|----------|------------------------------|
|post_code       |string    |null: false                   |
|prefectures_id  |integer   |null: false                   |
|city            |string    |null: false                   |
|address         |string    |null: false                   |
|building        |string    |                              |
|mobile          |string    |null: false                   |
|order           |references|null: false, foreign_key:true |

### Association
- belongs_to :order


## orders

|Column     |Type      |Options                       |
|-----------|----------|------------------------------|
|user       |references|null: false, foreign_key:true |
|item       |references|null: false, foreign_key:true |

### Association
- belongs_to :user
- belongs_to :shipping_address
- belongs_to :item

