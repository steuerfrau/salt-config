pkg-isc-dhcp-server:
  pkg.installed:
    - pkgs:
      - isc-dhcp-server

isc-dhcp-server:
  service.running:
    - pkg: pkg-isc-dhcp-server
    - file: /etc/dhcp/dhcpd.conf

/etc/dhcp/dhcpd.conf:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://dhcp/dhcpd.conf
    - require:
      - pkg: pkg-isc-dhcp-server

/usr/share/vim/vim74/syntax/dhcpd.vim:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://dhcp/dhcpd.vim
     

