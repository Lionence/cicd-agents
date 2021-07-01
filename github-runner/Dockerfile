FROM mcr.microsoft.com/dotnet/sdk:3.1 AS github-runner
WORKDIR /app

COPY ./actions-runner-linux-x64-2.278.0.tar.gz /app
COPY ./entrypoint.sh /app

RUN tar -xvf actions-runner-linux-x64-2.278.0.tar.gz -C /app

RUN chmod 777 /app
RUN useradd -m installuser
USER installuser

ENTRYPOINT "/app/entrypoint.sh"