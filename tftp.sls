pkg-tftp-server:
  pkg.installed:
    - pkgs:
      - tftpd-hpa 

tftpd-hpa:
  service.running:
    - pkg: pkg-tftp-server
    - file: /etc/default/tftpd-hpa

/etc/default/tftpd-hpa:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://tftp/default-tftpd-hpa
    - require:
      - pkg: pkg-tftp-server 

