import taskiq_fastapi
from taskiq import TaskiqScheduler
from taskiq.schedule_sources import LabelScheduleSource
from taskiq_aio_pika import AioPikaBroker
from taskiq_redis import RedisAsyncResultBackend

from settings import DEBUG

if DEBUG:
    rabbit = 'localhost'
    redis = 'localhost'
else:
    rabbit = 'rabbitmq'
    redis = 'redis'

broker = AioPikaBroker(
    f"amqp://guest:guest@{rabbit}:5672"
).with_result_backend(
    RedisAsyncResultBackend(
        f"redis://{redis}:6379"
    )
)

scheduler = TaskiqScheduler(
    broker=broker,
    sources=[LabelScheduleSource(broker)]
)

taskiq_fastapi.init(broker, "main:app")