## Users table

|Column|Type|Options|
|:---|:---|:---|
nickname|string|null:false|
email|string|null:false, unique: true|
password|string|null:false|
first_name|string|null:false|
family_name|	string|	null:false|
first_name_kana|	string|	null:false|
family_name_kana|	string|	null:false|
birth_year|	date|	null:false|
birth_month|	date|	null:false|
birth_day|	date|	null:false|
image|	string|	
introduction|	text|	


## Association

* has_many :comments
* has_many :favorites
* has_many :products, dependent: destroy
* has_one :sending_adress, dependent: :destroy
* has_one :credit_card, dependent: :destroy
* has_many :seller_products, foreign_key:"seller_id" ,class_name:"products"
* has_many :buyer_products, foreign_key:"buyer_id" ,class_name: "products"


***

## sending_adress

|Column|Type|Options|
|:---|:---|:---|
first_name|	string|	null: false
family_name|	string|	null: false
first_name_kana|	string|	null: false
family_name_kana|	string|	null: false
post_code|	integer(7)|	null:false
prefecture_code|	integer|	null:false
city|	string|	null:false
house_number|	string|	null:false
building_name|	string	
phone_number|	integer|	unique: true
user_id|	references|	 foreign_key: true

## Asociation

* belongs_to :user
* Gem：jp_prefecture

***

## credit_cards(Pay.jp) table

|Column|Type|Options|
|:---|:---|:---|
customer_id|	string|	null:false
card_id|	string|	null:false
user_id|	references|	 foreign_key: true

## Asociation

* belongs_to :user

***

## Products table

|Column|Type|Options|
|:---|:---|:---|
name|	string|	null: false
profile|	text|	null: false
price|	integer|	null: false
category_id|	references|	 foreign_key: true
brand_id|	references|	foreign_key: true
size_id|	references|	 foreign_key: true
condition_id|	references|	foreign_key: true
sending_day_id| references| foreign_key: true
postage_id|	references|	foreign_key: true
prefecture_code|	integer|	null: false
sending_type_id| references| foreign_key: true
seller_id|	references|	null: false, foreign_key: true
buyer_id|	references|	foreign_key: true
deal_closed_day|	timestamp	


## Asociation

* has_many :comments, dependent: :destroy
* has_many :product_images, dependent: :destroy
* has_many :favorites
* has_many :users,through: :comments,dependent: :destroy
* has_many :users,through: :favorites,dependent: :destroy
* belongs_to :brand
* belongs_to :category
* belongs_to_active_hash :size
* belongs_to_active_hash :condition
* belongs_to_active_hash :sending_day
* belongs_to_active_hash :postage
* belongs_to_active_hash :sending_type
* belongs_to :seller, class_name: "User"
* belongs_to :buyer, class_name: "User"
* Gem：jp_prefecture

***



## brands table

|Column|Type|Options|
|:---|:---|:---|
name|	string | null: false

## Asociation

* has_many :products

***


## product_images table

|Column|Type|Options|
|:---|:---|:---|
product_id|	references|	null: false, foreign_key: true
url|	string|	null: false


## Asociation

* belongs_to :product

***


## favorites table

|Column|Type|Options|
|:---|:---|:---|
user_id|	references|	 null: false, foreign_key: true
product_id|	references|	 null: false, foreign_key: true


## Asociation

* belongs_to :user
* belongs_to :product


***

## comments table

|Column|Type|Options|
|:---|:---|:---|
body|	text|	null: false
user_id|	references|	 null: false, foreign_key: true
product_id|	references|	 null: false, foreign_key: true
created_at|	timestamp|


## Asociation

* belongs_to :user
* belongs_to :product

***


## Categories table

|Column|Type|Options|
|:---|:---|:---|
name|	string|	null:false
ancestry|	string|	null:false


## Asociation

* has_many :products
