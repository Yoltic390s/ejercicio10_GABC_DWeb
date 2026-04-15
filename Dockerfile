# Etapa 1: Construcción (Build)
FROM eclipse-temurin:25-jdk AS build
WORKDIR /app

# Copiamos los archivos de configuración y el wrapper de Maven
COPY .mvn/ .mvn
COPY mvnw pom.xml ./

# Le damos permisos de ejecución al wrapper (necesario en entornos Linux)
RUN chmod +x mvnw

# Descargamos las dependencias (esto cachea las librerías)
RUN ./mvnw dependency:go-offline

# Copiamos el código fuente y compilamos
COPY src ./src
RUN ./mvnw clean package -DskipTests

# Etapa 2: Ejecución (Run)
FROM eclipse-temurin:25-jdk
WORKDIR /app

# Copiamos el .jar generado en la etapa anterior
COPY --from=build /app/target/*.jar app.jar

# Exponemos el puerto por defecto de Spring Boot
EXPOSE 8080

# Comando para arrancar la aplicación
ENTRYPOINT ["java", "-jar", "app.jar"]