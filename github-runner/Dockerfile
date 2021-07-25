FROM mcr.microsoft.com/dotnet/sdk:3.1 AS github-runner
WORKDIR /app

COPY ./actions-runner-linux-x64-2.278.0.tar.gz /app
COPY ./entrypoint.sh /app

RUN tar -xvf actions-runner-linux-x64-2.278.0.tar.gz -C /app

RUN chmod 777 /app

RUN apt-get update && apt-get install -y gnupg software-properties-common curl
RUN curl -fsSL https://apt.releases.hashicorp.com/gpg | apt-key add -
RUN apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
RUN apt-get update && apt-get install terraform

RUN useradd -m runner-user
USER runner-user

ENTRYPOINT "/app/entrypoint.sh"