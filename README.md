# WebAssembly Lua for NodeJS

This is an example of creating a smartweave contract with Lua and Wasm

## Notes

With this build you need to bundle all of your lua files into a single file, the entry point should be main.lua. 

This example takes strings and decodes them into json.

This will allow us to take a json string of state and a json string of action and parse them into lua tables, then
process them via a contracts actions, and return a stringified table to the caller.

## Ideal Lua Contract function

input
- state - the current state of the contract/process
- action - the requested action to process
- SmartWeave - env table that contains all of the readonly metadata about the contract, block, transaction

output
- state - the new state based on the request
- result - a set of messages for outbox

```lua
function handle(state, action, SmartWeave) 
  if (action.input.function == "balance") {
    return handle(state, action, SmartWeave)
  }
  if (action.input.function == "transfer") {
    return handle(state, action, SmartWeave)
  }

end

```

## HyperBeam - wasm smartweave system

Build using lunatic runtime and rust, consume wasm contracts as processes and instanciate them in the hyperbeam platform. - Take U and UCM, and any Atomic Asset v2 and put on the hyper beam, 

Relay = Rust(Lunatic Runtime) - Distributed Network
DRE = Rust(Lunatic Runtime) - Distributed Network

- Evaluator 
  - load contract wasm
  - load snapshot
  - load interactions diff from snapshot to current block
  - for each interaction evaluate
  

Process/Contracts - WASM TX's 
  Input:
    - state
    - action
    - env
  Output:
    - state
    - result

With Lua to build for Wasm we need to expose a method that takes three strings and returns one string.

Each Argument will be a JSON string that will be parsed into a Lua Table, the result should be JSON string 

The Lua/Wasm builder will need to be agnostic and know nothing about HyperBeam.

The packager will need to do the following:

- install dependencies from luarocks
- bundle dependencies and source files into single file
- compile with emscripten 

Need to build a loader that can load the wasm file into rust and execute the `cwrap` function.


how to transfer an asset from an old version to a new version?

- burn the old contract by transferring balances to 0x0
- add evolve?
- other?


---

Summary -

Rust is too low level
AS is a subset of typescript, but it does not support closures and requires Strict Types and is a mid-level
Lua is functional, dynamic, supports closures 




## Note

support `evolve` with the ability to elect a controller by voting?

