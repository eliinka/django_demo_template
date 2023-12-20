FROM python:latest

COPY . .

RUN pip install -r requirements.txt

CMD ["python", "-m", "uvicorn", "django_demo_site.asgi:application"]