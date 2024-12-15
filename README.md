# cryo-docker

Check out [cryo](https://github.com/paradigmxyz/cryo).

## Build

```terminal
docker build -t cryo-docker .
```

## Run

Example arguments to run the `erc20_transfers` command:

```terminal
podman run --rm \
  cryo-docker \
  erc20_transfers \
  --rpc "{$RPC_URL}{$API_KEY}" \
  --blocks "{$START_BLOCK}:{$END_BLOCK}" \
  --to-address "{$ADDRESS}" \
  --output-dir "/app/cryo_output" \
  --chunk-size "5000" \
  --max-concurrent-chunks "2" \
  --exclude-failed \
  --no-report
  ```
