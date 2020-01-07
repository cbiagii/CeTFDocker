################## BASE IMAGE ######################
FROM rocker/rstudio:3.6.2

################## METADATA ######################
LABEL base.image="rocker/rstudio:3.6.2"
LABEL version="3.6.2"
LABEL software="CeTF"
LABEL software.version="1.0"
LABEL about.summary="An implementation of PCIT and RIF algorthms in R"
LABEL about.home="https://github.com/cbiagii/CeTF"
LABEL about.documentation="https://github.com/cbiagii/CeTF"
LABEL license="https://github.com/cbiagii/CeTF"
LABEL about.tags="Genomics"

################## MAINTAINER ######################
MAINTAINER Carlos Biagi Jr <biagi@usp.br>

################## INSTALLATION ######################
# Install Linux dependencies
RUN apt-get update && apt-get install -y \
	build-essential \
	libcurl4-openssl-dev \
	libssl-dev \
	libxml2-dev \
	gfortran \
	build-essential \ 
	libz-dev \ 
	zlib1g-dev

# Install CRAN packages dependencies
RUN Rscript -e "install.packages(c('BiocManager', 'crayon', 'dplyr', 'geomnet', 'GGally', 'ggplot2', 'ggpubr', 'ggrepel', 'kableExtra', 'knitr', 'network', 'pbapply', 'reshape2', 'rmarkdown', 'scales', 'testthat', 'tidyr'))"

# Install Bioconductor packages dependencies
RUN Rscript -e "BiocManager::install(c('airway', 'clusterProfiler', 'DESeq2', 'org.Hs.eg.db', 'SummarizedExperiment', 'S4Vectors'))"

# Install CeTF package
#RUN Rscript -e "devtools::install_github('cbiagii/CeTF')"
