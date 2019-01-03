# gcc-arm-none-eabi

`gcc-arm-none-eabi` from Debian Testing. The default workdir is `/source`, so
mount a volume there.

```bash
# Runs make by default
docker run --rm --volume "${PWD}":/source tiryoh/gcc-arm-none-eabi

# But you can pass anything
docker run --rm --volume "${PWD}":/source tiryoh/gcc-arm-none-eabi make dist
```
