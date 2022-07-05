require 'recipe'

class RecipeRepository
    def all 
        recipes = []

        sql = 'SELECT id, name, time, rating FROM recipes'
        results = DatabaseConnection.exec_params(sql, [])
        results.each do |record|
            recipe = Recipe.new 
            recipe.id = record['id']
            recipe.name = record['name']
            recipe.time = record['time']
            recipe.rating = record['rating']
            recipes << recipe
        end 
        return recipes
    end
    def find(id)
        sql = 'SELECT id, name, time, rating FROM recipes WHERE id = $1'
        params = [id]
        results = DatabaseConnection.exec_params(sql, params)
        record = results[0]

        recipe = Recipe.new
        recipe.id = record['id']
        recipe.name = record['name']
        recipe.time = record['time']
        recipe.rating = record['rating']

        return recipe
    end
    def find_by_time(minutes)
        recipes = []

        sql = 'SELECT id, name, time, rating FROM recipes'
        results = DatabaseConnection.exec_params(sql, [])
        results.each do |record|
            recipe = Recipe.new 
            recipe.id = record['id']
            recipe.name = record['name']
            recipe.time = record['time']
            recipe.rating = record['rating']
            if recipe.time == minutes
                return recipe
            end 
        end 
    end
    def find_by_rating(rating)
        recipes = []

        sql = 'SELECT id, name, time, rating FROM recipes'
        results = DatabaseConnection.exec_params(sql, [])
        results.each do |record|
            recipe = Recipe.new 
            recipe.id = record['id']
            recipe.name = record['name']
            recipe.time = record['time']
            recipe.rating = record['rating']
            if recipe.rating == rating
                return recipe
            end 
        end 
    end 
end 
    