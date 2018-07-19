from django import template

register = template.Library()

@register.filter(name='toint')
def debug(item):
  return int(item)
