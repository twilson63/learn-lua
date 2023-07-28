local json = require "json"

local jsonString = '{"name": "John Doe", "age": 30, "city": "New York"}'

function hello(something) 
  local data, pos, err = json.decode(jsonString)
  return ('Hello, %s!'):format(data.name)
end
