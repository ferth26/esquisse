
#' @importFrom htmltools tags tagList
#' @importFrom shiny getDefaultReactiveDomain modalDialog
#' @importFrom shinyWidgets alert prettyCheckboxGroup
modal_settings <- function(aesthetics = NULL, session = shiny::getDefaultReactiveDomain()) {
  ns <- session$ns
  modalDialog(
    title = tagList(
      "Configuración de Esquisse",
      tags$button(
        icon("close"),
        class = "btn btn-default pull-right",
        style = "border: 0 none;",
        `data-dismiss` = "modal"
      )
    ),
    tags$label(
      "Seleccione la estética (aesthetics) que se utilizará para crear un gráfico.:",
      `for` = ns("aesthetics"),
      class = "control-label"
    ),
    shinyWidgets::alert(
      icon("info"), "Las asignaciones estéticas describen cómo las variables de los datos se asignan a las propiedades visuales de las geoms.",
      status = "info"
    ),
    prettyCheckboxGroup(
      inputId = ns("aesthetics"),
      label = NULL,
      choiceNames = list(
        tagList(tags$b("fill:"), "Relleno de color para formas"),
        tagList(tags$b("color:"), "Color de puntos y líneas"),
        tagList(tags$b("size:"), "Tamaño de los puntos"),
        tagList(tags$b("shape:"), "Forma de los puntos"),
        tagList(tags$b("weight:"), "Pesos de frecuencia"),
        tagList(tags$b("group:"), "Identifica una serie de puntos con una variable de agrupación"),
        tagList(tags$b("ymin:"), "Se utiliza en gráficos de cintas con ymax para mostrar un intervalo entre dos líneas"),
        tagList(tags$b("ymax:"), "Se utiliza en gráficos de cintas con ymin para mostrar un intervalo entre dos líneas"),
        tagList(tags$b("facet:"), "Divide un gráfico en una matriz de paneles"),
        tagList(tags$b("facet row:"), "Divide un gráfico en varios paneles por fila"),
        tagList(tags$b("facet col:"), "Divide un gráfico en varios paneles por columna")
      ),
      choiceValues = c("fill", "color", "size", "shape", "weight", "group", "ymin", "ymax", "facet", "facet_row", "facet_col"),
      selected = aesthetics %||% c("fill", "color", "size", "facet"),
      status = "primary"
    ),
    easyClose = TRUE,
    footer = NULL
  )
}


