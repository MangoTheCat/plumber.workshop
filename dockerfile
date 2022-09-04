# pull a docker image for a baseline image
# contains linux libraries, R and plumber 
FROM rstudio/plumber

# create the ENV object for authentication (demo only)
# WARNING! this is not a secure way to store passwords 
ENV plumber_auth_key="test123"

# install packages 
RUN Rscript -e "install.packages(c('remotes', 'CVrisk', 'readr'))"

# copy everything into a build directory
# then install the plumber package  
RUN mkdir /build_zone
ADD . /build_zone
WORKDIR /build_zone
RUN Rscript -e 'remotes::install_local(upgrade="never")'

# open port 80 to traffic
EXPOSE 80

# when the container starts, start the main.R script
ENTRYPOINT ["Rscript", "main.R"]