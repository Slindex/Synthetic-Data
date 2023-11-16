from random import randint, choice
from datetime import date, timedelta

def randomDate(startDate=date(2023, 11, 16), endDate=date(2023, 11, 30)):

    """
    Generate a random date between startDate and endDate.

    Parameters:
    - startDate (datetime.date): The start date of the range.
    - endDate (datetime.date): The end date of the range.

    Returns:
    - date (datetime.date): A random date between startDate and endDate.
    """

    delta = endDate - startDate
    rDays = randint(0, delta.days)

    date = startDate + timedelta(days=rDays)

    return date

def randomValue():

    """
    Returns a random value between 2000 and 20000 divisible by 2000.

    Parameters:
    None

    Returns:
    - value(int): A random value divisible by 2000.
    """

    value = randint(1, 10) * 2000

    return value