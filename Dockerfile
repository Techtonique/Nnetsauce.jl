# Use an official Python image as a parent image
FROM python:3.8

# Set the working directory inside the container
WORKDIR /app

# Install any needed Python packages
RUN pip3 install numpy scipy scikit-learn nnetsauce

# Download and extract Julia (from https://julialang.org/downloads/platform/#linux_and_freebsd)
RUN wget https://julialang-s3.julialang.org/bin/linux/x64/1.10/julia-1.10.0-linux-x86_64.tar.gz
RUN tar zxvf julia-1.10.0-linux-x86_64.tar.gz

# Move Julia installation to /usr/local/julia
RUN mv julia-1.10.0 /usr/local/julia

# Set up environment variables for Julia and run Julia commands
RUN /usr/local/julia/bin/julia --project=/app -e 'using Pkg; Pkg.add(["Conda", "PyCall"])'

# Copy all files from the current directory to /app in the container
COPY . .

# Run Julia commands during the image build process with logging
RUN echo "Running Pkg.instantiate()..." && \
    /usr/local/julia/bin/julia --project=/app -e 'using Pkg; Pkg.resolve(); Pkg.instantiate()' && \
    echo "Running Pkg.build()..." && \
    /usr/local/julia/bin/julia --project=/app -e 'using Pkg; Pkg.build()'


# Specify the default command to run when the container starts
CMD ["/usr/local/julia/bin/julia", "--project=/app", "-e", "using Pkg; Pkg.test()"]