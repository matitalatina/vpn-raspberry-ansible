# VPN Raspberry Pi Ansible Playbook

Setup VPN IKEv2 [Road Warrior](https://en.wikipedia.org/wiki/Road_warrior_(computing)) with private/public key authentication for local side, username/password for Road Warrior client.

## What does the playbook do?

- Create private/public keys using [Let's Encrypt](https://letsencrypt.org/) for your domain.
- Automatic renewal of the keys.
- Install VPN IKEv2 Road Warrior using [strongSwan](https://www.strongswan.org/).
- Configure Raspberry Pi firewall to allow VPN work properly.

## Requirements

- [Ansible](https://www.ansible.com/) installed on your local machine.
- A [Dynamic DNS](https://en.wikipedia.org/wiki/Dynamic_DNS) that points to your home. Only if your internet service provider assigns a dynamic IP to you.
- Your firewall router:
  - should forward VPN ports to your Raspberry Pi
    ```
    UDP *:500 -> Raspberry Pi:500
    UDP *:4500 -> Raspberry Pi:4500
    ```
  - should forward port 80 (or 443) to allow Let's Encrypt to verify your domain ownership.
    ```
    TCP *:80 (or 443) -> Raspberry Pi:80 (or 443)
    ```
  - should allow incoming VPN packets from outside.
    ```
    From any host in wan, ESP protocol -> ALLOW
    From any host in wan, AH protocol -> ALLOW
    ```
    [You can find more information about firewall here.](https://openwrt.org/docs/guide-user/services/vpn/ipsec/strongswan/roadwarrior)
- A Raspberry Pi with Raspbian (Debian) Stretch.

## Dependencies

- [ansible-role-certbot](https://github.com/geerlingguy/ansible-role-certbot) in order to get private/public keys for your domain.

## Getting Started

I assume that you know how to use [Ansible](https://docs.ansible.com/ansible/latest/user_guide/intro_getting_started.html).

- Rename `hosts.example` to `hosts`, replace `YOUR-HOST-HERE` with your Raspberry Pi. [More info here](https://docs.ansible.com/ansible/latest/user_guide/intro_inventory.html).
- In `host_vars`, rename the file name replacing `YOUR-HOST-HERE` with your Raspberry Pi. In that file, replace UPPERCASE variables with your data. You can find more variables to customize in [ansible-role-certbot](https://github.com/geerlingguy/ansible-role-certbot).
- `ansible-playbook -vv -i hosts vpn.yml` to start it.

## Support my work

Everything I made is open source.
If you like what I'm doing and you want to support me, you can help me 😄!

- Sponsor me with [Github](https://github.com/sponsors/matitalatina)
- [Buy me a coffee](https://www.buymeacoffee.com/mattianatali)
- [Paypal](https://paypal.me/mattianatali)