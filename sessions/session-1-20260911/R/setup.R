# Carga las dependencias necesarias para ejecutar el proyecto.
# 'pacman::p_load()' carga los paquetes y puede instalarlos si no
# se encuentran disponibles en el ambiente actual
pacman::p_load(
  dplyr,
  vroom,
  uwot,
  ggplot2,
  GGally,
  ggrepel
)

# Ruta relativa al archivo de configuración del proyecto
# Contiene variables de entorno específicas de la ejecución
env_file <- ".env"

# Carga el archivo '.env' únicamente si existe en el directorio raiz 'session-1-20260911'
if (file.exists(env_file)) {
  readRenviron(env_file)
}
