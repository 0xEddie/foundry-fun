# foundry-fun
Project work for learning Solidity and Foundry

## Local Development Environment
### New Project

To add a new project folder in the main directory, execute
```sh
forge init project-name
```

Then in `project-name` delete the `.gitmodules` file and the `.git/` directory to make this new project not a git submodule. Then any changes can be tracked normally with git.

### Environment Variables

Check that `.env` is in the `.gitignore` then add the first anvil private key, and the RPC URL to `.env` as environment variables

```
PRIVATE_KEY=0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80
RPC_URL=http://127.0.0.1:8545
```

### Fast Local Testing
In one shell run `anvil`

In a second shell run
```sh
forge script script/DeployScript.s.sol --rpc-url $RPC_URL --broadcast --private-key $PRIVATE_KEY
```
