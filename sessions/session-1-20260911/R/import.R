# Obtiene los datos de Pokémon desde una fuente externa
pokemon_dataframe <- vroom(
  file = "https://data.biofreelancer.com/starter"
)
