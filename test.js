var factory = require('./pst.js')
/*
// get balance
factory().then(i => {
  const handle = i.cwrap('start', 'string', ['string', 'string', 'string'])
  const state = JSON.stringify({ name: "pst", balances: { tom: 1 } })
  const action = JSON.stringify({ caller: 'tom', input: { function: 'balance' } })
  const SmartWeave = JSON.stringify({})
  const result = handle(state, action, SmartWeave)
  console.log(result)
  console.log(JSON.parse(result).result.balance === 1)
})
*/


// transfer balance
factory().then(i => {
  const handle = i.cwrap('start', 'string', ['string', 'string', 'string'])
  const state = JSON.stringify({ name: "pst", balances: { tom: 1 } })
  const action = JSON.stringify({
    caller: 'tom', input: {
      function: 'transfer',
      target: 'sam',
      qty: 1
    }
  })
  const SmartWeave = JSON.stringify({})
  const result = handle(state, action, SmartWeave)
  console.log(result)
  console.log(JSON.parse(result).state.balances['sam'] === 1)
})

