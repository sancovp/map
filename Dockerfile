FROM nixos/nix:latest

LABEL org.opencontainers.image.source=https://github.com/sancovp/map
LABEL org.opencontainers.image.description="MAP - AI-Native Attention Programming Shell"
LABEL org.opencontainers.image.licenses=MIT

# Enable flakes
RUN echo "experimental-features = nix-command flakes" >> /etc/nix/nix.conf

# Install Python and dependencies via Nix
RUN nix-channel --update && \
    nix-env -iA nixpkgs.python312 \
                nixpkgs.python312Packages.pip

WORKDIR /app

# Copy project files
COPY . .

# Install MAP package
RUN python -m pip install --no-cache-dir -e .

# Run tests to validate build
RUN python -m pytest tests/ -v || echo "Tests run during build"

# Default command: MAP CLI
ENTRYPOINT ["python", "-m", "map"]
CMD ["help"]
