# Configs

Configuration files used during the execution of the setup scripts.

<hr />

<br />

# Contents

## [resolv.conf](./resolv.conf)

**Overview:**

Contains reference to [OpenDNS]("https://www.opendns.com/") primary and secondary servers.

**Referenced by:**
1. [fix_dns.sh](../scripts/wsl2/fix_dns.sh)

## [wsl.conf](./wsl.conf)

**Overview:**

Contains WSL2 configuration to avoid automatic creation of <code>resolv.conf</code>.

**Referenced by:**
1. [fix_dns.sh](../scripts/wsl2/fix_dns.sh)
