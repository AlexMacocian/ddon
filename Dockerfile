FROM mcr.microsoft.com/dotnet/aspnet:6.0

EXPOSE 52099
EXPOSE 52000
EXPOSE 52100

COPY start.sh /start.sh
COPY install.sh /install.sh

WORKDIR "/ddon"

ENTRYPOINT ["./start.sh"]