packages_stage01:
  pkg.installed:
    - pkgs:
      - apt-file
      - aptitude
      - man
      - screen
      - sudo
      - vim

packages_stage02:
  pkg.installed:
    - pkgs:
      - bind9-host
      - dnsutils
      - iputils-ping
      - tcpdump
      - wget
      - syslog-ng-mod-sql
      - syslog-ng-mod-mongodb
      - syslog-ng-mod-json
      - syslog-ng-core
      - syslog-ng

include:
  - core_users

/etc/hosts:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://etc/hosts

/etc/vim/vimrc:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://etc/vimrc
    - require:
      - pkg: packages_stage01

/etc/resolv.conf:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://etc/resolv.conf

