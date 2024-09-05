FROM python:3.9-slim
WORKDIR /app

COPY . .

# RUN export http_proxy=socks5://localhost:1080
# RUN export https_proxy=socks5://localhost:1080



RUN apt-get update && apt-get install -y build-essential curl software-properties-common
RUN pip3 install -r requirements.txt

EXPOSE 8001

HEALTHCHECK CMD curl --fail http://localhost:8001/_stcore/health

# ENTRYPOINT ["streamlit", "run", "main.py", "--server.port=8001", "--server.address=0.0.0.0"]
ENTRYPOINT ["streamlit", "run", "main.py", "--server.port=8001"]

