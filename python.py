#!/usr/bin/python

import json
import urllib2

data = {
        'name': 'PythonTest',
	'description': 'PythonDescriptionTet'
}

req = urllib2.Request('http://localhost:3000/api/v1/items')
req.add_header('Content-Type', 'application/json')
req.add_header('Authorization', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE0Nzc5MjQzNDB9.SjM9Rdv9-NP_2KIOhPVV14GiNCLWwhp-5R6bdQy_QoQ')
response = urllib2.urlopen(req, json.dumps(data))
