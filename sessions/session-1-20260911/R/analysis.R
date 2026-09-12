# Obtiene la semilla utilizada para las operaciones aleatorias.
# Si R_SEED no está definida en el entorno, utiliza 7 como valor predeterminado.
seed <- as.integer(Sys.getenv("R_SEED", "7"))
# print(seed) - imprime el valor almacenado en 'R_SEED'
print(seed)
# Establece la semilla para garantizar resultados reproducibles
set.seed(seed)

# Selecciona únicamente las variables numéricas del conjunto de datos
# y calcula su representación en un espacio de dos dimensiones mediante UMAP
umap_response <- pokemon_dataframe |>
  select(where(is.numeric)) |>
  umap(
    n_neighbors = 9,
    min_dist = 0.1,
    metric = "euclidean"
  )

# Agrega las dos coordenadas generadas por UMAP al conjunto de datos original
pokemon_umap <- pokemon_dataframe |>
  mutate(
    u1 = umap_response[, 1],
    u2 = umap_response[, 2]
  )

# Filtra los Pokémon que se desean identificar mediante etiquetas
starters_to_label <- pokemon_umap |>
  filter(
    Starter %in% c("Pikachu", "Eevee")
  )
