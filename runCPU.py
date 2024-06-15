# API usage example: 
# curl http://localhost:8084/cpu/1000

import http.server
import json

# creating a class for handling  
# basic Get and Post Requests 
class MyHandler(http.server.SimpleHTTPRequestHandler):

    def do_GET(self):
        ''' a function for Get Request '''

        # Success Response --> 200 
        self.send_response(200)

        # Type of file that we are using for creating our web server. 
        self.send_header('Content-type', 'application/json')

        # self.send_header('Connection', 'keep-alive')
        # self.send_header('Keep-Alive', 'timeout=60')
        self.end_headers()

        path_parts = self.path.split("/")
        # ['', 'cpu', '3']
        param_cpu_run = int(path_parts[2])

        res = self.runCPU(param_cpu_run)

        self.wfile.write(json.dumps(res).encode())

    def runCPU(self, num):
        # num = 0
        # cur = 0
        # for i in range(100000000):
        #     num += i
        #     cur = i
        # return cur
        cur = 0
        for i in range(num):
            for x in range(1, 1000):
                3.141592 * 2 ** x  # Multiplying the number Pi by 2 to the power of xx
            for x in range(1, 10000):
                float(x) / 3.141592  # Dividing x by Pi
            for x in range(1, 10000):
                float(3.141592) / x  # Dividing the number Pi by x
            cur = i
        return cur

PORT = 8084
httpd = http.server.HTTPServer(("", PORT), MyHandler)
httpd.serve_forever()
