local contract = { _version = "0.0.0" }
local function assert(expr, msg)
  if not expr then error(msg) end
end

local function balance(state, action) 
  local target = action.caller
  if action.input.target then
    target = action.input.target
  end

  local balance = 0
  balance = state.balances[target]
  return {
    result = {
      target = target,
      balance = balance
    }
  }
end

local function is_integer(n) 
  return n == math.floor(n)
end

local function transfer(state, action)
  assert(type(action.input.qty) == 'number', 'qty must be a number')
  assert(action.input.qty > 0, 'qty must be greater than 0')
  assert(is_integer(action.input.qty), 'qty must be integer')
  assert(state.balances[action.caller] >= action.input.qty, "not enough balance to transfer")
  assert(type(action.input.target) == 'string', 'target must be a string')
  
  if not state.balances[action.input.target] then
    state.balances[action.input.target] = 0
  end

  state.balances[action.caller] = state.balances[action.caller] - action.input.qty
  state.balances[action.input.target] = state.balances[action.input.target] + action.input.qty

  return { state = state }
end

function contract.handle(state, action, SmartWeave)   
  local cmd = action.input['function']
  if cmd == 'balance' then
    return balance(state, action)
  end

  if cmd == 'transfer' then
    return transfer(state, action)
  end
  error("Function is not found")
end

return contract
