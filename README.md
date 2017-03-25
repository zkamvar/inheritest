
<!-- README.md is generated from README.Rmd. Please edit that file -->
Testing S4 inheritance
======================

I have a problem with basic inheritance of the `[` operator for S4 objects that implement custom arguments. This is a working example from [a stackoverflow post I created](http://stackoverflow.com/q/42894213/2752888).

Installation
------------

You can install it via github, and it should work:

``` r
devtools::install_github("zkamvar/inheritest")
```

When it works
-------------

It works if the package is built to your system

``` r
library("inheritest")
foo <- new("foo", x = pi, y = 2)
foo["x"]
#> FOOOOOOO
#> [1] 3.141593
foo["y", foo = FALSE]
#> [1] 2
bar <- new("bar", x = pi, y = 2, distance = 0)
bar["x"]
#> BAAAAAAR
#> FOOOOOOO
#> [1] 3.141593
bar["distance", bar = FALSE]
#> [1] 0
```

When it doesn't work
--------------------

It doesn't work if the package is simply loaded:

In the shell:

``` sh
git clone https://github.com/zkamvar/inheritest.git
cd inheritest
```

In R:

``` r
devtools::load_all(".")
#> Loading inheritest
foo <- new("foo", x = pi, y = 2)
foo["x"]
#> FOOOOOOO
#> [1] 3.141593
foo["y", foo = FALSE]
#> [1] 2
bar <- new("bar", x = pi, y = 2, distance = 0)
bar["x"]
#> BAAAAAAR
#> Error in callNextMethod(x, i, j, ..., drop): bad object found as method (class "function")
bar["distance", bar = FALSE]
#> [1] 0
```
