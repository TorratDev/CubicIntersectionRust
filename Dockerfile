# Stage 1: Build the Rust project
FROM rust:latest AS builder

# Set the working directory inside the container
WORKDIR /usr/src/app

# Copy the Cargo.toml and Cargo.lock files to the container
COPY Cargo.toml Cargo.lock ./

# Pre-fetch dependencies (this will help in caching)
RUN cargo fetch

# Copy the source code to the container
COPY . .

# Build the project in release mode
RUN cargo build --release

# Stage 2: Create a minimal image with the compiled binary
FROM debian:buster-slim

# Copy the compiled binary from the builder stage
COPY --from=builder /usr/src/app/target/release/app /usr/local/bin/app

# Set the command to run the binary
CMD ["app"]
