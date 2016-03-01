local requests = require('requests')

local params = {
  headers = {
    ['Content-Type'] = 'application/json',
    -- ['Content-Encoding'] =  "gzip"
  }

}
print "http"
local resp = requests.get("http://localhost:9090/index.html",params)
print(resp.text)
print "https"
-- local resp = requests.get "https://localhost:8444/index.html"
local resp = requests.get "http://localhost:9090/hello/michal"

print(resp.text)

print "post"
auth = requests.HTTPBasicAuth('user', 'passwd')
local resp = requests.post {url = "http://localhost:9090/index.html", data =
{pokus =  "hello world"}, headers = params.headers, cookies = cookies, auth = auth}

print(resp.text)
for k,v in pairs(resp.headers) do
  print("resp", k,v)
end

