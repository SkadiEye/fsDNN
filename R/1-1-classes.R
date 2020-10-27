#################################
#### dnnetInput class
#' An S4 class containing predictors (x), response (y) and sample weights (w)
#'
#' @slot x A numeric matrix, the predictors
#' @slot y A factor or numeric vector, either the class labels or continuous responses
#' @slot w A numeric vector, sample weights
#'
#' @seealso
#' \code{\link{dnnet-class}}\cr
#' @export
setClass("dnnetInput",
         slots = list(
           x = "matrix",
           y = "ANY",
           w = "numeric"
         ))

#################################
#### dnnet class
#' An S4 class containing a deep neural network
#'
#' @slot norm A list, containing the centers and s.d.'s of x matrix and y vector (if numeric)
#' @slot weight A list of matrices, weight matrices in the fitted neural network
#' @slot bias A list of vectors, bias vectors in the fitted neural network
#' @slot loss The minimum loss acheived from the validate set
#' @slot loss.traj The loss trajectory
#' @slot label If the model is classification, a character vectors containing class labels
#' @slot model.type Either "Classification" or "Regression"
#' @slot model.spec Other possible information
#'
#' @seealso
#' \code{\link{dnnetInput-class}}\cr
#' \code{\link{dnnet}}\cr
#' @export
setClass("dnnet",
         slots = list(
           norm = "list",
           weight = "list",
           bias = "list",
           loss = "numeric",
           loss.traj = "numeric",
           label = "character",
           model.type = "character",
           model.spec = "list"
         ))

#################################
#### dnnetEnsemble class
#' An S4 class containing an ensemble of deep neural networks
#'
#' @slot model.list A list of dnnet models
#' @slot model.type Either "Classification" or "Regression"
#' @slot model.spec Other possible information
#' @slot loss A numeric vector of loss from all DNNs
#' @slot keep Whether the model is kept when put in the predict function
#'
#' @seealso
#' \code{\link{dnnet-class}}\cr
#' \code{\link{ensemble_dnnet}}\cr
#' @export
setClass("dnnetEnsemble",
         slots = list(
           model.list = "list",
           model.type = "character",
           model.spec = "list",
           loss = "numeric",
           keep = "ANY"
         ))

#################################
#### twoPartDNN class
#' An S4 class containing a twoPartDNN object
#'
#' @slot model.cls A binary classification ensemble DNN model
#' @slot model.reg A regression ensemble DNN model
#'
#' @seealso
#' \code{\link{dnnet-class}}\cr
#' \code{\link{ensemble_dnnet}}\cr
#' @export
setClass("twoPartDNN",
         slots = list(
           model.cls = "dnnetEnsemble",
           model.reg = "dnnetEnsemble"
         ))

