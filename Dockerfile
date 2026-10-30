FROM rust:1.89-slim as builder
WORKDIR /app
ARG DATABASE_URL
ENV DATABASE_URL=$DATABASE_URL
COPY . .
RUN cargo build --release
FROM debian:bookworm-slim
WORKDIR /usr/local/bin
COPY --from=builder /app/target/release/rust-crud-api .
CMD ["./rust-crud-api"]
