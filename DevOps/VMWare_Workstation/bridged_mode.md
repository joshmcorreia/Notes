# Bridged Mode
Bridged mode allows you to replicate connecting a physical machine to your network.

## Enabling Bridged Mode
1. Right click your VM and go to `Settings`
1. On the Hardware tab select `Network Adapter`
1. Put a checkmark next to `Connected` and `Connect at power on`
1. Under "Network connection" select `Bridged: Connected directly to the physical network` and put a checkmark on `Replicate physical network connection state`.
1. Click `OK`

Once the above steps are completed you can (optionally) set up your VM to have a static lease on your router. This will ensure that you get the same hostname and same IP address every time you boot your VM.
