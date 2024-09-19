# Use the official Rust image as the builder
FROM rust:1.81 as builder

# Set the working directory in the container
WORKDIR /app

# Copy the Cargo.toml and Cargo.lock files
COPY Cargo.toml ./

# Create a dummy file to cache dependencies
RUN mkdir src && echo "fn main() {}" > src/main.rs

# Fetch dependencies
RUN cargo fetch

# Copy the rest of the source code
COPY . .

# Build the project
RUN cargo build --release

# Use a minimal base image for running the application
FROM debian:buster-slim

# Set the working directory
WORKDIR /usr/local/bin

# Copy the compiled binary from the builder stage
COPY --from=builder /app/target/release/cubic_intersection_rust .

# Define the entry point
ENTRYPOINT ["./cubic_intersection_rust"]
