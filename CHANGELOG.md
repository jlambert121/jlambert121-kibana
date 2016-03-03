# Change Log

## [2.5.0](https://github.com/jlambert121/jlambert121-kibana/tree/2.5.0) (2015-05-11)
[Full Changelog](https://github.com/jlambert121/jlambert121-kibana/compare/2.4.0...2.5.0)

**Closed issues:**

- Support for server.basePath [\#78](https://github.com/jlambert121/jlambert121-kibana/issues/78)
- HTTPS/SSL Support [\#72](https://github.com/jlambert121/jlambert121-kibana/issues/72)
- kibana 4.3.0 needs small systemd change to start [\#65](https://github.com/jlambert121/jlambert121-kibana/issues/65)
- Github module code different from Puppet Forge module code [\#63](https://github.com/jlambert121/jlambert121-kibana/issues/63)
- Exec 'ensure\_correct\_permissions' occurs before kibana user/group is created [\#62](https://github.com/jlambert121/jlambert121-kibana/issues/62)
- Repo description is wrong, please update. [\#59](https://github.com/jlambert121/jlambert121-kibana/issues/59)
- Tag for 2.2.0 missing from github repo [\#56](https://github.com/jlambert121/jlambert121-kibana/issues/56)

**Merged pull requests:**

- Added the new config since kibana 4.2.x, support for custom log file and server.basePath [\#79](https://github.com/jlambert121/jlambert121-kibana/pull/79) ([caskolkm](https://github.com/caskolkm))
- Fix systemd service file path for Debian Jessie [\#76](https://github.com/jlambert121/jlambert121-kibana/pull/76) ([mikemead](https://github.com/mikemead))
- SSL support [\#75](https://github.com/jlambert121/jlambert121-kibana/pull/75) ([smetj](https://github.com/smetj))
- Remove duplicate params and fix spec tests [\#74](https://github.com/jlambert121/jlambert121-kibana/pull/74) ([mikemead](https://github.com/mikemead))
- prevent puppet from fetching and amazon linux support [\#69](https://github.com/jlambert121/jlambert121-kibana/pull/69) ([jensendw](https://github.com/jensendw))
- add plugin support [\#68](https://github.com/jlambert121/jlambert121-kibana/pull/68) ([bilsch](https://github.com/bilsch))
- Fixes for kibana with systemd [\#67](https://github.com/jlambert121/jlambert121-kibana/pull/67) ([atopian](https://github.com/atopian))
- version bump: 2.3.0 [\#64](https://github.com/jlambert121/jlambert121-kibana/pull/64) ([jlambert121](https://github.com/jlambert121))
- sheild ssl + credentials pickup from pabrahamsson [\#60](https://github.com/jlambert121/jlambert121-kibana/pull/60) ([bilsch](https://github.com/bilsch))
- Use the service provider defined in params [\#54](https://github.com/jlambert121/jlambert121-kibana/pull/54) ([nerzhul](https://github.com/nerzhul))
- Add dependency on User resource to fix race condition [\#52](https://github.com/jlambert121/jlambert121-kibana/pull/52) ([mikemead](https://github.com/mikemead))

## [2.2.0](https://github.com/jlambert121/jlambert121-kibana/tree/2.2.0) (2015-08-24)
[Full Changelog](https://github.com/jlambert121/jlambert121-kibana/compare/2.1.0...2.2.0)

**Closed issues:**

- Service is restarting upon every puppet run [\#49](https://github.com/jlambert121/jlambert121-kibana/issues/49)
- RHEL6 needs architecture of x86\_64 [\#41](https://github.com/jlambert121/jlambert121-kibana/issues/41)
- /etc/init.d/kibana status does not set return code [\#36](https://github.com/jlambert121/jlambert121-kibana/issues/36)
- Kibana Service Not Installed [\#34](https://github.com/jlambert121/jlambert121-kibana/issues/34)
- Not Working Behind Proxy [\#33](https://github.com/jlambert121/jlambert121-kibana/issues/33)

**Merged pull requests:**

- version bump: 2.2.0 [\#51](https://github.com/jlambert121/jlambert121-kibana/pull/51) ([jlambert121](https://github.com/jlambert121))
- only reset perms on install [\#50](https://github.com/jlambert121/jlambert121-kibana/pull/50) ([jlambert121](https://github.com/jlambert121))
- allow verify\_ssl to be configured [\#47](https://github.com/jlambert121/jlambert121-kibana/pull/47) ([bilsch](https://github.com/bilsch))
- Missing logfile property [\#46](https://github.com/jlambert121/jlambert121-kibana/pull/46) ([bilsch](https://github.com/bilsch))
- Adds the ability to supply a non-default user, a uid, and a non-default group. [\#45](https://github.com/jlambert121/jlambert121-kibana/pull/45) ([seanmckinley](https://github.com/seanmckinley))
- define default-start for legacy init script [\#44](https://github.com/jlambert121/jlambert121-kibana/pull/44) ([toepi](https://github.com/toepi))
- status returns not 0 if kibana is not running [\#43](https://github.com/jlambert121/jlambert121-kibana/pull/43) ([toepi](https://github.com/toepi))
- Add x86\_64 support [\#42](https://github.com/jlambert121/jlambert121-kibana/pull/42) ([jlambert121](https://github.com/jlambert121))
- lint warning fix: ensure should be the first attribute [\#40](https://github.com/jlambert121/jlambert121-kibana/pull/40) ([toepi](https://github.com/toepi))
- create legacy init script in dependence of operatingsystem [\#39](https://github.com/jlambert121/jlambert121-kibana/pull/39) ([toepi](https://github.com/toepi))
- add support for 32bit linux [\#38](https://github.com/jlambert121/jlambert121-kibana/pull/38) ([toepi](https://github.com/toepi))
- define relationship between init file and service with fullqualified [\#37](https://github.com/jlambert121/jlambert121-kibana/pull/37) ([toepi](https://github.com/toepi))
- Decide which init system to use based on host OS. [\#32](https://github.com/jlambert121/jlambert121-kibana/pull/32) ([philipwigg](https://github.com/philipwigg))
- Quote the file mode for compatibility with Puppet4. [\#31](https://github.com/jlambert121/jlambert121-kibana/pull/31) ([philipwigg](https://github.com/philipwigg))
- version bump: 2.1.0 [\#30](https://github.com/jlambert121/jlambert121-kibana/pull/30) ([jlambert121](https://github.com/jlambert121))

## [2.1.0](https://github.com/jlambert121/jlambert121-kibana/tree/2.1.0) (2015-05-11)
[Full Changelog](https://github.com/jlambert121/jlambert121-kibana/compare/2.0.1...2.1.0)

**Closed issues:**

- systemd on Centos 6 [\#29](https://github.com/jlambert121/jlambert121-kibana/issues/29)
- Suffix added to download url is incorrect in version 2.0.1 [\#28](https://github.com/jlambert121/jlambert121-kibana/issues/28)

**Merged pull requests:**

- Added init SysV script funcationality to this module [\#27](https://github.com/jlambert121/jlambert121-kibana/pull/27) ([soumentrivedi](https://github.com/soumentrivedi))
- add lint plugins [\#26](https://github.com/jlambert121/jlambert121-kibana/pull/26) ([jlambert121](https://github.com/jlambert121))

## [2.0.1](https://github.com/jlambert121/jlambert121-kibana/tree/2.0.1) (2015-03-19)
[Full Changelog](https://github.com/jlambert121/jlambert121-kibana/compare/0.2.0...2.0.1)

**Closed issues:**

- Can not install kibana repo [\#17](https://github.com/jlambert121/jlambert121-kibana/issues/17)

**Merged pull requests:**

- version bump: 2.0.1 [\#25](https://github.com/jlambert121/jlambert121-kibana/pull/25) ([jlambert121](https://github.com/jlambert121))
- support stdlib 3.2.0 [\#24](https://github.com/jlambert121/jlambert121-kibana/pull/24) ([jlambert121](https://github.com/jlambert121))
- version bump: 2.0.0 [\#23](https://github.com/jlambert121/jlambert121-kibana/pull/23) ([jlambert121](https://github.com/jlambert121))
- rewrite for kibana 4 [\#22](https://github.com/jlambert121/jlambert121-kibana/pull/22) ([jlambert121](https://github.com/jlambert121))
- normalize common files [\#21](https://github.com/jlambert121/jlambert121-kibana/pull/21) ([jlambert121](https://github.com/jlambert121))
- version bump: 1.1.0 [\#20](https://github.com/jlambert121/jlambert121-kibana/pull/20) ([jlambert121](https://github.com/jlambert121))
- enable travis for puppet 3.5,3.6 testing [\#19](https://github.com/jlambert121/jlambert121-kibana/pull/19) ([jlambert121](https://github.com/jlambert121))
- update for kibana 3.1.0 [\#18](https://github.com/jlambert121/jlambert121-kibana/pull/18) ([jlambert121](https://github.com/jlambert121))
- switch ripienaar/concat to puppetlabs/concat [\#16](https://github.com/jlambert121/jlambert121-kibana/pull/16) ([jlambert121](https://github.com/jlambert121))
- add puppet 3.4 tests, remove puppet 3.0 [\#15](https://github.com/jlambert121/jlambert121-kibana/pull/15) ([jlambert121](https://github.com/jlambert121))
- release version 1.0.0 [\#14](https://github.com/jlambert121/jlambert121-kibana/pull/14) ([jlambert121](https://github.com/jlambert121))
- update to newest kibana versions [\#13](https://github.com/jlambert121/jlambert121-kibana/pull/13) ([jlambert121](https://github.com/jlambert121))
- add travis 3.3 tests [\#12](https://github.com/jlambert121/jlambert121-kibana/pull/12) ([jlambert121](https://github.com/jlambert121))
- config.js lives in script dir [\#11](https://github.com/jlambert121/jlambert121-kibana/pull/11) ([nibalizer](https://github.com/nibalizer))

## [0.2.0](https://github.com/jlambert121/jlambert121-kibana/tree/0.2.0) (2013-09-02)
[Full Changelog](https://github.com/jlambert121/jlambert121-kibana/compare/0.1.0...0.2.0)

**Merged pull requests:**

- version 0.2.0 [\#10](https://github.com/jlambert121/jlambert121-kibana/pull/10) ([jlambert121](https://github.com/jlambert121))
- Dashboard docs [\#9](https://github.com/jlambert121/jlambert121-kibana/pull/9) ([jlambert121](https://github.com/jlambert121))
- update travis checks [\#8](https://github.com/jlambert121/jlambert121-kibana/pull/8) ([jlambert121](https://github.com/jlambert121))
- install custom dashboards [\#7](https://github.com/jlambert121/jlambert121-kibana/pull/7) ([jlambert121](https://github.com/jlambert121))
- add additional default checks [\#6](https://github.com/jlambert121/jlambert121-kibana/pull/6) ([jlambert121](https://github.com/jlambert121))
- version 0.1.0 [\#5](https://github.com/jlambert121/jlambert121-kibana/pull/5) ([jlambert121](https://github.com/jlambert121))

## [0.1.0](https://github.com/jlambert121/jlambert121-kibana/tree/0.1.0) (2013-08-30)
[Full Changelog](https://github.com/jlambert121/jlambert121-kibana/compare/0.0.1...0.1.0)

**Merged pull requests:**

- updated panel modules, add default panel [\#4](https://github.com/jlambert121/jlambert121-kibana/pull/4) ([jlambert121](https://github.com/jlambert121))
- pupet 3.2 tests, lint cleanup [\#3](https://github.com/jlambert121/jlambert121-kibana/pull/3) ([jlambert121](https://github.com/jlambert121))
- add option for vhost json logging [\#2](https://github.com/jlambert121/jlambert121-kibana/pull/2) ([jlambert121](https://github.com/jlambert121))
- add travis-ci integration [\#1](https://github.com/jlambert121/jlambert121-kibana/pull/1) ([jlambert121](https://github.com/jlambert121))

## [0.0.1](https://github.com/jlambert121/jlambert121-kibana/tree/0.0.1) (2013-05-29)


\* *This Change Log was automatically generated by [github_changelog_generator](https://github.com/skywinder/Github-Changelog-Generator)*
