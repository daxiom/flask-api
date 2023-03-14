"""Date time utilities."""
import time as _time
from datetime import date  # noqa: F401
from datetime import datetime as _datetime
from datetime import timezone


class datetime(_datetime):
    """Alternative to the built-in datetime.

    that has a timezone on the UTC call.
    """

    @classmethod
    def utcnow(cls):
        """Construct a UTC non-naive datetime.

        meaning it includes timezone from time.time().
        """
        time_stamp = _time.time()
        return super().utcfromtimestamp(time_stamp).replace(tzinfo=timezone.utc)
