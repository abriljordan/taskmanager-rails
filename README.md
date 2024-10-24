# README

rails generate controller Tasks index new edit
rails g controller Main index
conclusion - if you want to generate views and controllers, you have to generate them in the same command

rails generate model Task name:string description:text position:integer completed:boolean created_at:datetime updated_at:datetime category_id:integer

rails generate model Category name:string description:text position:integer created_at:datetime updated_at:datetime