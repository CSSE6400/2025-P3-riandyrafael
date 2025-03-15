FROM python:latest

#install pipx
RUN apt-get update && apt-get install -y pipx
RUN pipx ensurepath

#install poetry
RUN pip3 install poetry

#setting the working directory
WORKDIR /app

#install poetry dependencies
COPY pyproject.toml ./
RUN pipx run poetry install --no-root

#copying our application into the container
COPY todo todo

# #Running our application
# CMD ["pipx", "run", "poetry", "run", "flask", "--app", "todo", "run", \ 
# "--host", "0.0.0.0", "--port", "6400"]

# Adding a delay to our application startup 
CMD ["bash", "-c", "sleep 10 && pipx run poetry run flask --app todo run \ 
   --host 0.0.0.0 --port 6400"]