require 'recipe_repository'

RSpec.describe RecipeRepository do 
    def reset_recipes_table
        seed_sql = File.read('spec/seeds_recipes.sql')
        connection = PG.connect({ host: '127.0.0.1', dbname: 'recipes' })
        connection.exec(seed_sql)
    end
      
    before(:each) do 
          reset_recipes_table
    end
    it "returns all recipes" do 
        repo = RecipeRepository.new

        recipes = repo.all

        expect(recipes.length).to eq 4
    end 
    it "returns one recipe with the given id" do 
        repo = RecipeRepository.new
        recipes = repo.find(1)
        expect(recipes.name).to eq 'Carbonara'
    end 
    it "returns recipes that match time condition" do 
        repo = RecipeRepository.new
        recipes = repo.find_by_time('30')
        expect(recipes.name).to eq 'Carbonara'
    end
    it "returns recipes that match time condition" do 
        repo = RecipeRepository.new
        recipes = repo.find_by_time('60')
        expect(recipes.name).to eq 'Fish pie'
    end
    it "returns recipes that match rating condition" do 
        repo = RecipeRepository.new
        recipes = repo.find_by_rating('2')
        expect(recipes.name).to eq 'Baked potato'
    end

end