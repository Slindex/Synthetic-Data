from random import randint, choice
from datetime import date, timedelta

def randomDate(startDate=date(2019,1,1), endDate=date(2021,12,31)):

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
    Returns a random value between 20000 and 200000 divisible by 20000.

    Parameters:
    None

    Returns:
    - value(int): A random value divisible by 20000.
    """

    value = randint(1, 10) * 20000

    return value

def randomPrice():

    """
    Returns a random value between 2000 and 20000 divisible by 2000.

    Parameters:
    None

    Returns:
    - value(int): A random value divisible by 2000.
    """

    value = randint(1, 10) * 2000

    return value