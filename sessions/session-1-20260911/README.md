# Pokemon UMAP Analysis

Proyecto de analisis exploratorio de datos de Pokemon utilizando R, UMAP y visualizaciones con `ggplot2`.

El proyecto esta preparado para utilizar [`renv`](https://rstudio.github.io/renv/) para mantener las dependencias reproducibles y `.env` para la configuracion del entorno.

## Requisitos

Antes de ejecutar el proyecto necesitas tener instalado:

- R
- Positron, RStudio u otro IDE compatible con R
- Git

No es necesario instalar manualmente los paquetes utilizados por el proyecto. Las dependencias se gestionan mediante `renv`.

## Estructura del proyecto

```text
.
├── R/
│   ├── main.R
│   ├── setup.R
│   ├── import.R
│   ├── analysis.R
│   └── plots.R
├── renv/
├── .env
├── renv.lock
├── main.R
└── README.md
```

### Responsabilidad de cada componente

| Archivo        | Responsabilidad                                  |
| -------------- | ------------------------------------------------ |
| `main.R`       | Punto de entrada y ejecucion del proyecto        |
| `R/setup.R`    | Preparacion del ambiente y carga de dependencias |
| `R/import.R`   | Obtencion de los datos                           |
| `R/analysis.R` | Analisis y calculo de UMAP                       |
| `R/plots.R`    | Creacion y visualizacion de graficos             |
| `.env`         | Variables de configuracion del entorno           |
| `renv.lock`    | Versiones de las dependencias del proyecto       |

## 2. Reproduccion del ambiente

Abre el proyecto desde Positron o RStudio

En la sesion de R, restaura las dependencias definidas en `renv.lock`:

```r
renv::restore()
```

`renv` instalara las versiones de los paquetes necesarias para reproducir el proyecto.

## 3. Configuracion del entorno

El proyecto puede utilizar un archivo `.env` para definir variables de entorno.

La semilla elegida para este analizis es `7`:

```conf
# .env
R_SEED=7
```

La variable `R_SEED` determina la semilla utilizada durante el analisis.

Si `.env` no existe o `R_SEED` no esta definida, el proyecto utiliza `7` como valor predeterminado.

Puedes utilizar `.env.example` como referencia para crear tu configuracion local.

## 4. Ejecutar el proyecto

El punto de entrada del proyecto es:

```text
main.R
```

Ejecuta `main.R` desde la raiz del proyecto.

El flujo de ejecucion es:

```text
main.R
   │
   ├── setup.R
   │     └── carga dependencias
   │
   ├── import.R
   │     └── obtiene los datos
   │
   ├── analysis.R
   │     └── ejecuta el analisis UMAP
   │
   └── plots.R
         └── genera las visualizaciones
```

## Fuente de datos

Los datos de Pokemon se obtienen durante la ejecucion desde:

```text
https://data.biofreelancer.com/starter
```

## Por lo tanto, se requiere conexion a Internet para ejecutar la etapa de importacion.

## Variables del proyecto

- env_file → ubicacion del archivo de configuracion
- seed → semilla utilizada para reproducibilidad
- pokemon_dataframe → datos originales de Pokemon
- pokemon_umap → datos originales + coordenadas UMAP
- umap_reponse → resultado del calculo UMAP
- type_colors → colores asociados a cada tipo
- umap_plot → grafico de la representacion UMAP
