# get the base image, the rocker/verse has R, RStudio and pandoc
FROM rocker/verse:4.2.2

# required
LABEL Joey Trampush <j.trampush@gmail.com>

COPY . /pj.research.compendium.root

# go into the repo directory
RUN . /etc/environment \
  # Install linux depedendencies here
  # e.g. need this for ggforce::geom_sina
  && sudo apt-get update \
  && sudo apt-get install libudunits2-dev -y \
  # build this compendium package
  && R -e "install.packages('remotes', repos = c(CRAN = 'https://cloud.r-project.org'))" \
  && R -e "remotes::install_github(c('rstudio/renv', 'quarto-dev/quarto-r'))" \
  # install pkgs we need
  && R -e "renv::restore()" \
  # render the manuscript into a docx, you'll need to edit this if you've
  # customised the location and name of your main qmd file
  && R -e "quarto::quarto_render('/pj.research.compendium.root/analysis/paper/paper.qmd')"


## rcompendium
## Based on the image RStudio with R 4.2.2 ----

##FROM rocker/rstudio:4.2.2

## LABEL Joey Trampush <j.trampush@gmail.com>


## Install system dependencies ----

RUN sudo apt update -yq \
 && sudo apt install --no-install-recommends libxml2-dev -yq \
 && sudo apt clean all \
 && sudo apt purge \
 && sudo rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


## Copy local project ----

ENV folder="/home/rstudio/"

COPY . $folder
RUN chown -R rstudio:rstudio $folder


## Set working directory ----

WORKDIR $folder


## Install R packages ----

RUN R -e "install.packages('remotes', repos = c(CRAN = 'https://cloud.r-project.org'))" \
 && R -e "remotes::install_deps(upgrade = 'never')"
