#!/usr/bin/env python

"""https://www.youtube.com/watch?v=LjjujVxI0js&list=PLw02n0FEB3E3VSHjyYMcFadtQORvl1Ssj&index=13"""
"""https://getbootstrap.com/docs/4.3/components/buttons/"""
import os
import sys

if __name__ == '__main__':
    os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'mysite.settings')
    try:
        from django.core.management import execute_from_command_line
    except ImportError as exc:
        raise ImportError(
            "Couldn't import Django. Are you sure it's installed and "
            "available on your PYTHONPATH environment variable? Did you "
            "forget to activate a virtual environment?"
        ) from exc
    execute_from_command_line(sys.argv)
