# pull official base image
FROM python:3.9


# set work directory
WORKDIR /usr/src/site_portfolio
ADD . /usr/src/site_portfolio

# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

RUN pip install --upgrade pip
COPY ./requirements.txt .
RUN pip install -r requirements.txt
RUN pip install gunicorn
COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /usr/src/site_portfolio/docker-entrypoint.sh

COPY . /usr/src/site_portfolio

ENTRYPOINT ["/usr/src/site_portfolio/docker-entrypoint.sh"]