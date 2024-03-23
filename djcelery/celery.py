import os
import time
from celery import Celery

os.environ.setdefault("DJANGO_SETTINGS_MODULE", "djcelery.settings")

app = Celery("djcelery")
app.config_from_object("django.conf:settings", namespace="CELERY")


@app.task()
def test_celery():
    print("sleeping...")
    time.sleep(3)
    print("Done. All OK...")

app.autodiscover_tasks()
