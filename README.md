andrewrothstein.sops
=========
![Build Status](https://github.com/andrewrothstein/ansible-sops/actions/workflows/build.yml/badge.svg)

Installs Mozilla's [sops](https://github.com/mozilla/sops)

Requirements
------------

See [meta/main.yml](meta/main.yml)

Role Variables
--------------

See [defaults/main.yml](defaults/main.yml)

Dependencies
------------

See [meta/main.yml](meta/main.yml)

Example Playbook
----------------

```yml
- hosts: servers
  roles:
    - andrewrothstein.sops
```

License
-------

MIT

Author Information
------------------

Andrew Rothstein <andrew.rothstein@gmail.com>
