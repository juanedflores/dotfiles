#!/usr/bin/python
import sys
import datetime
import calendar

SUFFIXES = {1: 'st', 2: 'nd', 3: 'rd'}
def ordinal(num):
    """Returns ordinal number string from int,
       e.g. 1, 2, 3 becomes 1st, 2nd, 3rd, etc. """

    # 10-20 don't follow the normal counting scheme.

    if 10 <= num % 100 <= 20:
        suffix = 'th'
    else:
        # the second parameter is a default.
        suffix = SUFFIXES.get(num % 10, 'th')
    return str(num) + suffix

dow = calendar.day_name[datetime.date.today().weekday()]
m = datetime.datetime.now().strftime("%b")
day = datetime.datetime.today().day
d = ordinal(day)

date = (datetime.date.today())

template = "== " + dow + ", " + m + " " + d + " ==" + """

=== Goals for Today | due:({date}) ===

=== Issues Encountered ===

=== Notes ===
"""

print(template.format(date=date))
