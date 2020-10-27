###########################################################
### twoPartDNN

#' A Two-Part Ensemble DNN Model
#'
#' @param object A dnnetInput object
#' @param ... Other parameters passing to ensemble_dnnet
#'
#' @return Returns a twoPartDNN object
#'
#' @export
twoPartDNN <- function(object, ...) {

  object1 <- importDnnet(x = object@x, y = factor(ifelse(object@y > 0, "NonZero", "Zero")))
  object2 <- importDnnet(x = as.matrix(object@x[object@y > 0, ]), y = object@y[object@y > 0])

  # browser()

  mod1 <- do.call(ensemble_dnnet, appendArg(list(...), "object", object1, TRUE)) # ensemble_dnnet(object = object1, ...)
  mod2 <- do.call(ensemble_dnnet, appendArg(list(...), "object", object2, TRUE)) # ensemble_dnnet(object = object2, ...)

  return(new("twoPartDNN", model.cls = mod1, model.reg = mod2))
}
