require_relative 'lib/database_connection'

# We need to give the database name to the method `connect`.
DatabaseConnection.connect('recipes_test')

# Perform a SQL query on the database and get the result set.
sql = 'SELECT id, name, time, rating FROM recipes;'
result = DatabaseConnection.exec_params(sql, [])

# Print out each record from the result set .
result.each do |record|
  p record
end