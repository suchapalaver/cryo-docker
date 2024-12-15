FROM rust:1.83-bookworm as build

WORKDIR /root

ENV CARGO_HOME=/root/.cargo

RUN cargo install cryo_cli

########################################################################################

FROM debian:bookworm-slim

RUN apt-get update && apt-get install -y --no-install-recommends \
    openssl ca-certificates \
    && rm -rf /var/lib/apt/lists/*

COPY --from=build /root/.cargo/bin/cryo /usr/local/bin/cryo

RUN mkdir -p /app/cryo_output \
    && chmod -R 777 /app/cryo_output

WORKDIR /app

ENTRYPOINT [ "/usr/local/bin/cryo" ]
