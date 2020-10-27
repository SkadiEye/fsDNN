bfDNN
================

## Installation

In R:

``` r
devtools::install_github("SkadiEye/bfDNN")
```

## Example

``` r
suppressMessages(library(bfDNN))
library(ROCR)
data("example_dat")

set.seed(10086)
# Set Hyper-parameters for DNN
esCtrl <- list(n.hidden = 5:2*10, l1.reg = 10**-4, n.batch = 50, n.epoch = 100)
# Import Data and create a dnnetInput object
dnn_obj <- importDnnet(x = example_dat$x, y = example_dat$y)
# Build the two-part ensemble DNN model
modx <- twoPartDNN(dnn_obj, n.ensemble = 10, esCtrl = esCtrl, verbose = 0)
# Prediction
pred <- predict(modx, example_dat$x_test)

# AUC for binary prediction
cat("AUC =", performance(prediction(pred[, "cls"], (example_dat$y_test > 0)*1), "auc")@y.values[[1]], "\n")
```

    ## AUC = 0.9180223

``` r
# MSE for overall performance
cat("MSE =", mean((pred[, "combined"] - example_dat$y_test)**2))
```

    ## MSE = 0.249847
