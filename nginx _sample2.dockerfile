# Succefully Worked..

ARG VERSION=latest

FROM nginx:${VERSION}

ENV DIRPATH=/home/myterm

RUN apt update && \
    apt upgrade && \
    apt install -y nano && \
    apt install -y iputils-ping && \
    sevice nginx start  && \
    mkdir ${DIRPATH}

COPY index.html /usr/share/nginx/html
COPY scorekeeper.js /usr/share/nginx/html
COPY style.css /usr/share/nginx/html

ADD sample.tar ${DIRPATH}  
# Succefully Untar happend with samplewebpage directory and all its files are exist.

#ENTRYPOINT date 
# CMD["bash"]   -----   Do not give these inputs , since we specified WORKDIR path which get contradicts with these commands.

WORKDIR ${DIRPATH} 

RUN pwd && sed -i '12 a <h1>Click and Identify exact Color Matach</h1>' /usr/share/nginx/html/index.html

EXPOSE 80/tcp