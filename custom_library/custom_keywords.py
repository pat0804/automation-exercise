import random
from datetime import datetime, timedelta

def generate_random_date():
    """Generate a random date and return day, month, year as separate variables."""
    start_date = datetime(1950, 1, 1)
    today = datetime.now()
    end_date = datetime(today.year, today.month, today.day)

    delta = end_date - start_date
    random_days = random.randint(0, delta.days)
    random_date = start_date + timedelta(days=random_days)

    day = random_date.day
    month = random_date.month
    year = random_date.year

    return day, month, year
