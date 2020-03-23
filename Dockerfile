################## BASE IMAGE ######################
FROM rocker/rstudio:devel

################## METADATA ######################
LABEL base.image="rocker/rstudio:devel"
LABEL version="devel"
LABEL software="CeTF"
LABEL software.version="0.99.16"
LABEL about.summary="An implementation of PCIT and RIF algorthms in R"
LABEL about.home="https://github.com/cbiagii/CeTF"
LABEL about.documentation="https://github.com/cbiagii/CeTF"
LABEL license="https://github.com/cbiagii/CeTF"
LABEL about.tags="Genomics"

################## MAINTAINER ######################
MAINTAINER Carlos Biagi Jr <cbiagijr@gmail.com>

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
	zlib1g-dev \
	libpng-dev \
	libfontconfig1-dev \
	libcairo2-dev


# Installing BiocManager
RUN Rscript -e "install.packages('BiocManager')"

# Update BiocManager to development version 
RUN Rscript -e "BiocManager::install(version='devel')"

# Installing CeTF package
RUN Rscript -e "BiocManager::install('CeTF')"

# Installing Bioconductor dependencies
RUN Rscript -e "BiocManager::install(c('snpStats', 'airway', 'ComplexHeatmap', 'org.Hs.eg.db', 'RCy3'))"

# Installing CRAN dependencies
RUN Rscript -e "install.packages(c('circlize', 'GenomicTools', 'WebGestaltR'))"
