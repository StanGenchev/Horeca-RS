from django import template

register = template.Library()

@register.filter(name='toint')
def toint(item):
    return int(item)
