## Based on the image RStudio with R 4.2.2 ----

FROM rocker/rstudio:4.2.2

MAINTAINER Joey Trampush <j.trampush@gmail.com>


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
