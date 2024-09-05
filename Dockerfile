FROM python:3.9-slim
WORKDIR /app

COPY . .
RUN export http_proxy=socks5://localhost:1080
RUN export https_proxy=socks5://localhost:1080
RUN pip3 install -r requirements.txt

EXPOSE 8001

HEALTHCHECK CMD curl --fail http://localhost:8501/_stcore/health

ENTRYPOINT ["streamlit", "run", "main.py", "--server.port=8001", "--server.address=0.0.0.0"]

