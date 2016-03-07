pkg-bind9:
  pkg.installed:
    - pkgs:
      - bind9

# isc-dhcp-server:
#   service.running:
#     - pkg: pkg-isc-dhcp-server
#     - file: /etc/dhcp/dhcpd.conf
# 
/etc/bind/db.hoppetosse.loc:
   file.managed:
     - user: root
     - group: root
     - mode: 644
     - source: salt://bind9/db.hoppetosse.loc
     - require:
       - pkg: pkg-bind9

/etc/bind/db.hoppetosse.loc.inv:
   file.managed:
     - user: root
     - group: root
     - mode: 644
     - source: salt://bind9/db.hoppetosse.loc.inv
     - require:
       - pkg: pkg-bind9

/etc/bind/named.conf.local:
   file.managed:
     - user: root
     - group: root
     - mode: 644
     - source: salt://bind9/named.conf.local
     - require:
       - pkg: pkg-bind9
 
/etc/bind/named.conf.options:
   file.managed:
     - user: root
     - group: root
     - mode: 644
     - source: salt://bind9/named.conf.options
     - require:
       - pkg: pkg-bind9
     

