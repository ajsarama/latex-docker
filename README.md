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
- Adds the LaTeX binaries to the `PATH`

**WARNING:** Building may take several hours depending on many factors. Adjusting the build command to download from a closer server is possible.

```bash
docker build --tag LaTeX .
```

3. Run the container for the first time and verify the installation went smoothly

Initialize the container using:
```bash
docker run --interactive --tty --rm LaTeX
```
*Arguments:*
- `interactive` signifies that we intend on using the shell inside the container interactively.
- `tty` allows the interactive session to be displayed in the current terminal.
- `rm` the container will be deleted automatically upon exiting.

Inside the container, run:
```bash
pdflatex --version
```

The installation was successful if the `pdflatex` binary is found and there are no errors.

## Using the Container

### Exiting Containers

While inside the container, just type `exit` into the shell. This will put the container into a stopped state.

### Compiling Local LaTeX Files

First, create a directory that will be mounted to the container. In this example, `output/` will be mounted. Use the following command to run a container and bind your local directory:
```bash
docker run --interactive --tty --mount type=bind,source="$(pwd)"/output,target=/output/ LaTeX
```

*Arguments:*
- `mount` has a `source` and `target`. `source` is the directory on your local machine, and `target` is the directory inside the container.
- Note that the last argument is the image we previously created, `LaTeX`.

From inside the interactive environment, use `pdflatex` as if it were installed locally. Make sure the output ends up in the mounted directory from the previous command.

**Example:**
```bash
cd /output/
pdflatex file.tex # file.tex is the same as a local file.tex existing in the source directory
```

If you find yourself outside the container when it already exists, do:
```bash
docker ps -a # remember the container ID
docker start [container ID]
docker attach [container ID]
```

To quickly run a single compile command, try `exec`:
```bash
docker exec [container ID] /usr/local/texlive/2023/bin/x86_64-linux/pdflatex [ARGS]
```
*Note that the container must be started to use the above command.*

**Example:**
```bash
docker exec [container ID] \
    /usr/local/texlive/2023/bin/x86_64-linux/pdflatex \
    -output-directory=/output/ \
    /output/file.tex
```

The above code will run `pdflatex` on `output/file.tex` and place the PDF file in the mounted `/output/` directory.

### Stopping the Container

When finished compiling LaTeX files, just run:
```bash
docker stop [container ID]
```

## Other Notes

- Instead of using a container ID, when instantiating the container, feel free to use the `--name [name]` flag.
