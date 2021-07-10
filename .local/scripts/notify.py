import asyncio
from random import randint

from dbus_next import Message, Variant
from dbus_next.aio import MessageBus
from dbus_next.constants import BusType, MessageType


async def _notify(app, title, message, urgency, timeout, msg_id):
    body = [app,  # Application name
            msg_id,  # id
            "",  # icon
            title,  # summary
            message,  # body
            [],  # actions
            {"urgency": Variant("y", urgency)},  # hints
            timeout]  # timeout

    bus = await MessageBus(bus_type=BusType.SESSION).connect()

    await bus.call(
        Message(message_type=MessageType.METHOD_CALL,
                destination="org.freedesktop.Notifications",
                interface="org.freedesktop.Notifications",
                path="/org/freedesktop/Notifications",
                member="Notify",
                signature="susssasa{sv}i",
                body=body))

    bus.disconnect()


def send(app, title, message, urgent=False, timeout=1000, msg_id=None):
    """
    Send a notification.
    The msg_id argument, if passed, requests the notification server to replace a visible
    notification with the same ID. See: https://developer.gnome.org/notification-spec/
    """
    msg_id = randint(10, 1000) if msg_id is None else msg_id
    urgency = 2 if urgent else 1
    asyncio.run(_notify(app, title, message, urgency, timeout, msg_id))
    return msg_id
