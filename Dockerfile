FROM jetbrains/teamcity-agent:latest

USER root

# Instalacja Pythona, Pipenv i Allure
RUN apt-get update && apt-get install -y \
    python3.10 python3-pip curl unzip \
    && pip3 install pipenv \
    && curl -sLo allure-2.27.0.tgz https://github.com/allure-framework/allure2/releases/download/2.27.0/allure-2.27.0.tgz \
    && tar -xzf allure-2.27.0.tgz -C /opt/ && ln -s /opt/allure-2.27.0/bin/allure /usr/bin/allure \
    && rm allure-2.27.0.tgz \
    && apt-get clean

WORKDIR /tests

COPY Pipfile* ./
RUN pipenv install --system --deploy --ignore-pipfile

COPY tests/ .

CMD ["sleep", "infinity"]