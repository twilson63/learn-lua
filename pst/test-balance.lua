local json = require "json"
local contract = require "contract"

function start(stateJSON, actionJSON, SmartWeaveJSON) 
  -- decode inputs
  local state = json.decode(stateJSON)
  local action = json.decode(actionJSON)
  local SmartWeave = json.decode(SmartWeaveJSON)
  -- handle contract
  local response = contract.handle(state, action, SmartWeave)
  -- encode output
  local responseJSON =  json.encode(response)
  return responseJSON
end
local state = '{"name": "pst", "balances": {"tom": 1}}'
local action = '{"input": {"function": "balance", "target": "tom"}, "caller": "tom"}'
local response = start(state, action, '{}')

print(response == '{"result":{"target":"tom","balance":1}}')