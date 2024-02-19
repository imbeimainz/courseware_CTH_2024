## Software requirements

* Participants are required to bring their own laptop, with the most recent release versions of R (and Bioconductor) installed: [R >= R-4.3.0](https://cran.r-project.org/).
* An IDE like [RStudio](https://posit.co/download/rstudio-desktop/) is not mandatory, but very recommended.

For the hands-on analysis sessions, you will need some CRAN/Bioconductor packages - simply run this chunk in R/RStudio to install the ones required.

```
install.packages(
  c("knitr",
    "rmarkdown",
    "ggplot2",
    "gapminder"
  )
)
```

If this returns no errors, you should be all set.

<details>
<summary>
You can test whether you can load the packages by running the lines of code included in this collapsible element (click to display)
</summary>

```
library("knitr")
library("rmarkdown")
library("ggplot2")
library("gapminder")
```

</details>

<hr>

**Additional packages** might be installed during the workshop, but this will be explained by the instructors.

**Please try to set up your computer beforehand!** While an internet connection at the course venue is available and we have a troubleshooting session on the same day, it might be beneficial to have your system all set!
