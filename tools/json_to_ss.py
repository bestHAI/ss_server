import sys
import base64
import json
from urllib import parse

json_file = sys.argv[1]

with open(json_file, encoding='utf-8') as json_data:
    json_data = json.load(json_data)

configs = json_data.get('configs')
for i in configs:
    configs = "{}:{}@{}:{}".format(i["method"], i["password"], i["server"], i["server_port"])
    configs_encode = base64.urlsafe_b64encode(bytes(configs, "utf8"))
    remarks = parse.quote(i["remarks"])

    print('ss://%s#%s' % (str(configs_encode, 'utf-8'), remarks))

