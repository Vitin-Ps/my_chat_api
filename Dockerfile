FROM ubuntu:latest AS build

# Defina o diretório de trabalho
WORKDIR /app

# Atualize o sistema e instale JDK e Maven
RUN apt-get update && \
    apt-get install -y openjdk-17-jdk maven && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Copie o código fonte para o diretório de trabalho
COPY . .

# Compile e construa o projeto
RUN mvn clean install

FROM openjdk:17-jdk-slim

# Defina o diretório de trabalho
WORKDIR /app

# Exponha a porta na qual o aplicativo estará rodando
EXPOSE 8080

# Copie o JAR do estágio de build
COPY --from=build /app/target/my-chat-0.0.1-SNAPSHOT.jar app.jar

# Defina o ponto de entrada do contêiner
ENTRYPOINT ["java", "-jar", "app.jar"]
