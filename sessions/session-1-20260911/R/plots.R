# Define los colores que serán utilizados para representar
# cada tipo de Pokémon en las visualizaciones
type_colors <- c(
  "Grass" = "green",
  "Water" = "blue",
  "Fire" = "red",
  "Normal" = "gray",
  "Electric" = "yellow"
)


# Construye un gráfico de dispersión para visualizar la relación
# entre las variables 'Grass' y 'Fire', diferenciando los puntos por tipo
type_plot <- ggplot(
  data = pokemon_dataframe,
  mapping = aes(
    x = Grass,
    y = Fire,
    color = Type
  )
) +
  geom_point(size = 3) +
  scale_color_manual(values = type_colors) +
  theme_classic()

# print(type_plot)

# Construye una matriz de gráficos para visualizar las relaciones
pairs_plot <- ggpairs(
  data = pokemon_dataframe,
  columns = c(
    "Grass",
    "Fire",
    "Water",
    "Normal",
    "Electric"
  ),
  mapping = aes(color = Type),
  upper = "blank",
  diag = "blank"
) +
  scale_color_manual(values = type_colors) +
  theme_linedraw(base_size = 20)

# print(pairs_plot)

# Construye el gráfico de la representación UMAP
# Las coordenadas u1 y u2 representan las dos dimensiones generadas
umap_plot <- ggplot(
  data = pokemon_umap,
  mapping = aes(
    x = u1,
    y = u2,
    fill = Type
  )
) +
  geom_point(
    size = 3,
    shape = 21
  ) +
  scale_fill_manual(values = type_colors)

# Muestra la representación UMAP en la salida de Positron
print(umap_plot)

# Muestra la representación UMAP identificado mediante las etiquetas
print(
  umap_plot +
    geom_label_repel(
      data = starters_to_label,
      mapping = aes(label = Starter)
    ) +
    theme_classic(base_size = 20)
)
