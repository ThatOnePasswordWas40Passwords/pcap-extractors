# pcap-extractor

> Pre-built, containerized applications for extraction methods of assorted auth types
> for cracking assorted packet capture authentication methods.

## Running

For supported `<bin>s`, refer to [currently packaged](#currently-packaged) section.

```bash
docker run --rm \
    -it \
    --platform linux/amd64 \
    ghcr.io/thatonepasswordwas40passwords/pcap-extractor <bin> <flags>
```

## Currently packaged

### hcxtools

> All credit belongs to https://github.com/ZerBea/hcxtools/tree/master for bins.

#### [`hcxpcapngtool`][1]

> Tool to convert raw capture files to Hashcat and JtR readable formats.

#### [`hcxhashtool`][1]

> Tool to filter hashes from HC22000 files based on user input.

#### [`hcxpsktool`][1]

> Tool to get weak PSK candidates from hash files or user input.

#### [`hcxpmktool`][1]

> Tool to calculate and verify a PSK and/or a PMK.

#### [`hcxeiutool`][1]

> Tool to prepare -E -I -U output of hcxpcapngtool for use by Hashcat + rule or JtR + rule.

#### [`hcxwltool`][1]

> Tool to calculate candidates for Hashcat and JtR based on mixed wordlists.

#### [`hcxhash2cap`][1]

> Tool to convert hash files (PMKID&EAPOL, PMKID, EAPOL-hccapx, EAPOL-hccap, WPAPSK-john) to cap.

#### [`wlancap2wpasec`][1]

> Tool to upload multiple (gzip compressed) pcapng, pcap and cap files to https://wpa-sec.stanev.org

#### [`whoismac`][1]

> Tool to show vendor information and/or download oui reference list.

[1]: <https://github.com/ZerBea/hcxtools/tree/master>


### Know of/want any more?

Drop an issue for `[request]: <tool>` and I'll look into adding it.

---

[2]: <https://github.com/aircrack-ng/aircrack-ng/tree/master>

## Requirements (building)

### CI

Builds are automatically triggered and published regularly as part of this repository's
pull request process.


### Manually

- docker cli
- Container engine (tested with [colima](https://github.com/abiosoft/colima) on
  macOS)
- GNU Make and GNU utils

## Build

```bash
make
```

... verbosely:

```bash
make VERBOSE=y
```

... with arbitrary docker CLI args, use envar `EXTRA_DOCKER_ARGS`:

```bash
make VERBOSE=y EXTRA_DOCKER_ARGS="--no-cache <etc.>"
```

## Publish

Need
[access to Github Container Registry set up](#github-container-registry-setup),
then:

```bash
make PUBLISH=y
```

