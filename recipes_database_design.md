# {{TABLE NAME}} Model and Repository Classes Design Recipe

## 1. Design and create the Table

As a food lover,
So I can stay organised and decide what to cook,
I'd like to keep a list of all my recipes with their names.

As a food lover,
So I can stay organised and decide what to cook,
I'd like to keep the average cooking time (in minutes) for each recipe.

As a food lover,
So I can stay organised and decide what to cook,
I'd like to give a rating to each of the recipes (from 1 to 5).

```
Table: recipes

Columns:
id | name | time | rating
```

## 2. Create Test SQL seeds

Your tests will depend on data stored in PostgreSQL to run.

If seed data is provided (or you already created it), you can skip this step.

```sql
DROP TABLE IF EXISTS "public"."recipes";

CREATE SEQUENCE IF NOT EXISTS recipes_id_seq;

CREATE TABLE "public"."recipes" (
    "id" SERIAL,
    "name" text,
    "time" int4,
    "rating" int4,
    PRIMARY KEY ("id")
);

INSERT INTO "public"."recipes" ("id", "name", "time", "rating") VALUES 
(1, 'Carbonara', 30, 3),
(2, 'Baked potato', 35, 2),
(3, 'Salad', 10, 3),
(4, 'Fish pie', 60, 4);
```

```bash

createdb recipes
psql -h 127.0.0.1 recipes < spec/seeds_recipes.sql

```

## 3. Define the class names

Usually, the Model class name will be the capitalised table name (single instead of plural). The same name is then suffixed by `Repository` for the Repository class name.

```ruby
class Recipe
end 

class RecipeRepository
end 
```

## 4. Implement the Model class

Define the attributes of your Model class. You can usually map the table columns to the attributes of the class, including primary and foreign keys.

```ruby
class Recipe
    atr_accessor :id, :name, :time, :rating
end 

```

## 5. Define the Repository Class interface

```ruby
class RecipeRepository
    def all 
    end 
    def find_by_time(time)
    end 
    def find_by_rating(rating)
    end 
end 

```

## 6. Write Test Examples

Write Ruby code that defines the expected behaviour of the Repository class, following your design from the table written in step 5.

These examples will later be encoded as RSpec tests.

```ruby
repo = RecipeRespository.new 
recipes = repo.all

recipes.length # => 4

recipes.find_by_time(30) # => ['Carbonara']

recipes.find_by_rating(4) # => ['Fish pie']

```

Encode this example as a test.

## 7. Reload the SQL seeds before each test run

Running the SQL code present in the seed file will empty the table and re-insert the seed data.

This is so you get a fresh table contents every time you run the test suite.

```ruby
# EXAMPLE

# file: spec/student_repository_spec.rb

def reset_recipes_table
  seed_sql = File.read('spec/seeds_recipes.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'recipes' })
  connection.exec(seed_sql)
end

describe RecipeRepository do
  before(:each) do 
    reset_recipes_table
  end

  # (your tests will go here).
end
```

## 8. Test-drive and implement the Repository class behaviour

_After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour._