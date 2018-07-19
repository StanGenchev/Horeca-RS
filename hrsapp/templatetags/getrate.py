from django import template

register = template.Library()

@register.filter(name='getrate')
def debug(obj_item):
  return obj_item[1]
