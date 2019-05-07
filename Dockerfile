FROM node:8-alpine
RUN apk add git
RUN apk add --no-cache python3 && \
      python3 -m ensurepip && \
      rm -r /usr/lib/python*/ensurepip && \
      pip3 install --upgrade pip setuptools && \
      if [ ! -e /usr/bin/pip ]; then ln -s pip3 /usr/bin/pip ; fi && \
      if [[ ! -e /usr/bin/python ]]; then ln -sf /usr/bin/python3 /usr/bin/python; fi && \
      rm -r /root/.cache
 
 # install aws cli
 RUN pip3 install awscli --upgrade --user
 
 ENV PATH=$PATH:/root/.local/bin