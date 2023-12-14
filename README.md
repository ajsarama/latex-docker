# Simple LaTeX Container

This is an extremely barebones LaTeX container setup. Follow the instructions below to setup the container and use it to generate PDFs for any LaTeX source file. 

## Instructions

1. Clone the repository

Use the following command to clone the repository somewhere on your local machine:
```bash
git clone https://github.com/ajsarama/latex-docker.git && cd latex-docker
```

2. Build a Docker image

The image outlined in `Dockerfile` does the following:
- Installs dependencies for the build
- Downloads the TeX Live source
- Runs the associated build commands
- Adds the LaTeX binaries the the `PATH`

**WARNING:** Building may take several hours depending on many factors. Adjusting the build command to download from a closer server is possible.

```bash
docker build --tag LaTeX .
```

3. Run the container for the first time

Initialize the container using:
```bash
docker run --interactive --tty LaTeX
```


