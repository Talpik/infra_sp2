FROM python:3.8.5

LABEL author='Talpa Vladimir' version=1 about='YaMdb'

# System environments
ENV LANG=C.UTF-8 \
    PYTHONUNBUFFERED=1

RUN mkdir /code

COPY requirements.txt /code

RUN pip install gunicorn
RUN pip install -r /code/requirements.txt

COPY . /code

WORKDIR /code

CMD ["gunicorn", "api_yamdb.wsgi", "-w", "4", "-t", "600", "-b", "0.0.0.0:8000"]
