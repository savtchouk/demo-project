FROM python

WORKDIR /app

RUN pip install poetry

COPY . /app

RUN poetry config virtualenvs.create false
RUN poetry install

CMD ["python", "test.py"]
