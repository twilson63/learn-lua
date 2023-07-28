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
local action = '{"input": {"function": "transfer", "target": "sam", "qty": 1}, "caller": "tom"}'
local response = start(state, action, '{}')

local result = json.decode(response)
print(result.state.balances['sam'] == 1)