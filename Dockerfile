# Use Microsoft's official .NET image.
FROM mcr.microsoft.com/dotnet/sdk:3.1

# Copy csproj and restore as distinct layers.
WORKDIR /app
COPY *.csproj .
RUN dotnet restore

# Copy local code to the container image.
COPY . .

# Build a release artifact.
RUN dotnet publish -c Release -o out

# app binds to port 8080
ENV ASPNETCORE_URLS http://*:8080

# Run the web service on container startup.
CMD ["dotnet", "out/HelloWorldAspNetCore.dll"]