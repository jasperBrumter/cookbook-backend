json.extract! recipe, :id, :name, :user_id, :image, :created_at, :updated_at
json.url recipe_url(recipe, format: :json)
