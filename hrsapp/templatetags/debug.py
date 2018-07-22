from django import template

register = template.Library()

@register.filter(name='debug')
def debug(item):
    print(item)
