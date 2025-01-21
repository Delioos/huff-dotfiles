# huff workflow
## editor 
I'm currently using neovim with the following config 
### syntax highlighting
https://github.com/Philogy/vim-huff (Philogy's edited version of https://github.com/pedrommaiaa/vim-huff)

### formatter
stack formating is primordial so I built my own linter (see `huff-formatter.lua`)

## debugging
I debug using a combination of 
- [foundry debugger](https://book.getfoundry.sh/forge/debugger/) to digg deeply the stack (e.g. : `forge debug --debug test/Path.1.t.sol --sig "test_define_and_get_path()" --tc "PublicTest1"`)
- [evm playground](https://www.evm.codes/playground) to visualize the state of memory, storage, stack and easily try things around calldata

## note
It appears that a linter was developped by the commmunity but I didn't dug into it yet because I'm still in the early stage of my learning.