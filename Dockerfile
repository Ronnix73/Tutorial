FROM python:3.9

ARG POETRY_INSTALLER="https://install.python-poetry.org"
ENV POETRY_INSTALLER=${POETRY_INSTALLER}

RUN mkdir /fastapi_app

WORKDIR /fastapi_app

COPY pyproject.toml poetry.lock /fastapi_app/

RUN curl -sSL "${POETRY_INSTALLER}" | POETRY_HOME=/opt/poetry python3 - --version 1.4.2 && \
    cd /usr/local/bin && \
    ln -s /opt/poetry/bin/poetry && \
    poetry config virtualenvs.create false

RUN poetry install --no-root --no-interaction --no-ansi

COPY . .

WORKDIR app

CMD ["poetry", "run", "uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]