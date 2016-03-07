#   pkgrepo.managed:
#     - humanname: Debian Testing
#     - name: deb http://ftp.de.debian.org/debian testing main
#     - dist: testing
#     - file: /etc/apt/sources.list.d/debian-testing.list
#     # - require_in:
#     #  - pkg: google-chrome-stable
#     # - gpgcheck: 1
#     # - key_url: https://dl-ssl.google.com/linux/linux_signing_key.pub

repo-stretch:
  pkgrepo.managed:
    - humanname: Debian Stretch (Testing)
    - name: deb http://ftp.de.debian.org/debian stretch main
    - dist: stretch
    - file: /etc/apt/sources.list.d/debian-stretch.list

repo-jessie-backports:
  pkgrepo.managed:
    - humanname: Debian Jessie Backports
    - name: deb http://ftp.de.debian.org/debian jessie-backports main
    - dist: jessie-backports
    - file: /etc/apt/sources.list.d/jessie-backports.list

repo-mel01repo01:
  pkgrepo.managed:
    - humanname: Mels Local Repository
    - name: deb http://mel01repo01.hoppetosse.loc/apt/debian/ jessie main
    - dist: jessie
    - file: /etc/apt/sources.list.d/mel01repo01.list
    - gpgkey: http://mel01repo01.hoppetosse.loc/apt/debian/conf/melanie.desaive.gpg.key

/etc/apt/preferences.d/preferences-stretch.pref:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://apt/preferences-stretch.pref

/etc/apt/preferences.d/preferences-jessie-backports.pref:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://apt/preferences-jessie-backports.pref

/etc/apt/preferences.d/preferences-mel01repo01.pref:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://apt/preferences-mel01repo01.pref

cluster_01.packages:
  pkg.installed:
    - fromrepo: stretch
    - pkgs:
      - libqb0 
      - fence-agents

cluster_02.packages:
  pkg.installed:
    - pkgs:
      - pacemaker 
      - corosync
      - pcs
      - drbd-utils
      - drbd8-utils


# echo "deb http://ftp.de.debian.org/debian testing main" > /etc/apt/sources.list.d/testing.list
# packages_stage01:
#   pkg.installed:
#     - pkgs:
#       - apt-file
#       - aptitude
#       - man
#       - screen
#       - sudo
#       - vim
# 
# packages_stage02:
#   pkg.installed:
#     - pkgs:
#       - bing9-host
#       - dnsutils
#       - iputils-ping
#       - tcpdump
#       - wget
#       - syslog-ng-mod-sql
#       - syslog-ng-mod-mongodb
#       - syslog-ng-mod-json
#       - syslog-ng-core
#       - syslog-ng
# 
# melly:
#   user.present:
#     - fullname: Melanie Desaive 
#     - shell: /bin/bash
#     - home: /home/melly
#     - uid: 1000
#     - gid: 1000
#     - password: $6$9eQMaxcG$5pNGURENs3bY/HcWx4CSRgfuLmKPOnq2Irh5ubX2W1CAZV0ztirgFZgVLNcbqAsJIJ300CvgUXlGz/QNJcm4l/
#     - groups:
#       - sudo
#       - users
# 
# /home/melly/.screenrc:
#   file.managed:
#     - user: melly
#     - group: melly
#     - mode: 644
#     - source: salt://melly/screenrc
#     - require:
#       - pkg: packages_stage01
#       - user: melly
# 
# /home/melly/.bashrc:
#   file.managed:
#     - user: melly
#     - group: melly
#     - mode: 644
#     - source: salt://melly/bashrc
#     - require:
#       - user: melly
# 
# 
# /etc/hosts:
#   file.managed:
#     - user: root
#     - group: root
#     - mode: 644
#     - source: salt://etc/hosts
# 
# /etc/vim/vimrc:
#   file.managed:
#     - user: root
#     - group: root
#     - mode: 644
#     - source: salt://etc/vimrc
#     - require:
#       - pkg: packages_stage01
# 
# /etc/resolv.conf:
#   file.managed:
#     - user: root
#     - group: root
#     - mode: 644
#     - source: salt://etc/resolv.conf
# 
