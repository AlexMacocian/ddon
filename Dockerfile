FROM mcr.microsoft.com/dotnet/aspnet:6.0

EXPOSE 52099
EXPOSE 52000
EXPOSE 52100

RUN apt-get update && \
    apt-get install -y --no-install-recommends curl jq && \
    rm -rf /var/lib/apt/lists/*

COPY start.sh start.sh
COPY install.sh install.sh

RUN chmod +x start.sh && \
    chmod +x install.sh

ENTRYPOINT ["./start.sh"]