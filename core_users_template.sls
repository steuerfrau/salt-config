melly:
  user.present:
    - fullname: Melanie Desaive 
    - shell: /bin/bash
    - home: /home/melly
    - uid: 1000
    - password: <put password hash here>
    - groups:
      - sudo
      - users

/home/melly/.screenrc:
  file.managed:
    - user: melly
    - group: melly
    - mode: 644
    - source: salt://users/melly/screenrc
    - require:
      - pkg: packages_stage01
      - user: melly

/home/melly/.bashrc:
  file.managed:
    - user: melly
    - group: melly
    - mode: 644
    - source: salt://users/melly/bashrc
    - require:
      - user: melly

