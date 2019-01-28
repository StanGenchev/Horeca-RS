from django import template

register = template.Library()

@register.filter(name='getrate')
def getrate(item_id, rates):
    for rate in rates:
        if rate[0] == item_id:
            return rate[4]
    return 0
