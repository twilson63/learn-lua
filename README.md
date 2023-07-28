# WebAssembly Lua for NodeJS

This is an example of creating a smartweave contract with Lua and Wasm

## Notes

With this build you need to bundle all of your lua files into a single file, the entry point should be main.lua. 

This example takes strings and decodes them into json.

This will allow us to take a json string of state and a json string of action and parse them into lua tables, then
process them via a contracts actions, and return a stringified table to the caller.

