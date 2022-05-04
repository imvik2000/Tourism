from rest_framework import renderers
import json

class CustomRenderer(renderers.JSONRenderer):
  charset='utf-8'
  def render(self, data, accepted_media_type=None, renderer_context=None):
    response = ''
    if 'ErrorDetail' in str(data):
      response = json.dumps({'errors':data},indent = 2)
    else:
      response = json.dumps(data,indent = 2)
    
    return response