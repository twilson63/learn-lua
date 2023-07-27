var factory = require('./hello.js')

factory().then(i => {
  const hello = i.cwrap('hello', 'string', ['string'])
  console.log(hello('Tom'))
})
// // import('./hello.js')
// //   .then(result => result.default)
// //   .then(Module => Module.cwrap('hello_world', 'string', []))
// //   .then(hello => console.log(hello()))

// const util = require('util')
// const fs = require('fs')
// const bytes = new Uint8Array(fs.readFileSync('./hello.wasm'))

// const env = {
//   memoryBase: 0,
//   tableBase: 0,
//   memory: new WebAssembly.Memory({
//     initial: 256
//   }),
//   table: new WebAssembly.Table({
//     initial: 0,
//     element: 'anyfunc'
//   })
// }

// WebAssembly.instantiate(bytes, { env: env, a: { w: syscall_dup3 } })
//   .then(result => console.log(result))


// function syscall_dup3(fd, suggestFD, flags) {
//   try {
//     var old = SYSCALLS.getStreamFromFD(fd); if (old.fd === suggestFD) return -28; var suggest = FS.getStream(suggestFD); if (suggest) FS.close(suggest); return FS.createStream(old, suggestFD, suggestFD + 1).fd
//   } catch (e) {
//     if (typeof FS == "undefined" || !(e instanceof FS.ErrnoError)) throw e; return -e.errno
//   }
// }
