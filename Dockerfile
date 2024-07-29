FROM ubuntu:latest AS build

# Instale Java e Maven
RUN apt-get update && apt-get install -y openjdk-17-jdk maven

# Copie o código fonte
COPY . /app

# Defina o diretório de trabalho
WORKDIR /app

# Compile e construa o projeto
RUN mvn clean install -e -X

# Use uma imagem mais leve para o ambiente de execução
FROM openjdk:17-jdk-slim

# Defina o diretório de trabalho
WORKDIR /app

# Exponha a porta que o aplicativo usa
EXPOSE 8080

# Copie o JAR do estágio de construção
COPY --from=build /app/target/my-chat-0.0.1-SNAPSHOT.jar app.jar

# Defina o comando de entrada
ENTRYPOINT ["java", "-jar", "app.jar"]
