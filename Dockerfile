FROM alpine:3.19

RUN apk add --no-cache \
    curl \
    bash \
    ca-certificates \
    socat \
    tzdata \
    sqlite \
    && ln -sf /usr/share/zoneinfo/Asia/Tehran /etc/localtime

# نصب X-UI
RUN curl -L https://release-assets.githubusercontent.com/github-production-release-asset/599735720/eb7e31f1-953b-4051-89be-3d59a7a2abee?sp=r&sv=2018-11-09&sr=b&spr=https&se=2026-06-23T21%3A12%3A57Z&rscd=attachment%3B+filename%3Dx-ui-linux-arm64.tar.gz&rsct=application%2Foctet-stream&skoid=96c2d410-5711-43a1-aedd-ab1947aa7ab0&sktid=398a6654-997b-47e9-b12b-9515b896b4de&skt=2026-06-23T20%3A12%3A00Z&ske=2026-06-23T21%3A12%3A57Z&sks=b&skv=2018-11-09&sig=%2B5ZsvWplK1UL36L9lRhB22rm5BTzUZ8ad1t4xO7wWSc%3D&jwt=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmVsZWFzZS1hc3NldHMuZ2l0aHVidXNlcmNvbnRlbnQuY29tIiwia2V5Ijoia2V5MSIsImV4cCI6MTc4MjI0NzM2MCwibmJmIjoxNzgyMjQ1NTYwLCJwYXRoIjoicmVsZWFzZWFzc2V0cHJvZHVjdGlvbi5ibG9iLmNvcmUud2luZG93cy5uZXQifQ.9s4BbBz6HN1zjtQewiKNYJHl8vwEJ_kx-PAn3QSxtz8&response-content-disposition=attachment%3B%20filename%3Dx-ui-linux-arm64.tar.gz&response-content-type=application%2Foctet-stream -o /tmp/x-ui.tar.gz \
    && tar -xzf /tmp/x-ui.tar.gz -C /usr/local/ \
    && rm /tmp/x-ui.tar.gz \
    && chmod +x /usr/local/x-ui/x-ui

RUN mkdir -p /etc/x-ui /var/log/x-ui

COPY start.sh /start.sh
RUN chmod +x /start.sh

EXPOSE ${PORT}

CMD ["/start.sh"]
