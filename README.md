# Work in progress fork

# email
Email application for based on [https://github.com/indiehosters/email](IndieHosters network)

## Prerequistes

 - docker
 - docker-compose

Modify the following files:
 - copy `env.template` to `data/config/env` and modify

Add the following files:
 - data/config/TLS/chain.pem
 - data/config/TLS/cert.pem
 - data/config/TLS/ssl_certificate.pem
 - data/config/TLS/ssl_private_key.pem

If they do not exist a self signed certificate will be created.

## Run

```
./create.sh hostname
```

Everything should be up and running.

## Backup

To backup, just run the `BACKUP` in your folder, supplying a target path and password. This will create an encrypted duplicity backup.

`./BACKUP /some/target/path super-secure-password`

### Listing available backups

`./LIST_BACKUPS /some/target/path`

### Restore a backup

To restore the latest backup:

`./RESTORE /some/target/path super-secure-password now`

To restore a specific date list them with `LIST_BACKUPS`. Example result:

```
Number of contained backup sets: 2
Total number of contained volumes: 3
 Type of backup set:                            Time:      Num volumes:
                Full         Thu Jan  5 14:07:57 2017                 2
         Incremental         Thu Jan  5 14:35:49 2017                 1
```

To restore the FULL backup in this example, run:

`./RESTORE /some/target/path super-secure-password 2017-01-05T14:07:57`

## Features

indiehosters/email | mail-in-a-box/mailinabox | status
------------------ | ------------- | -----------
[x] SMTP (postfix) | [x] SMTP (postfix) | :white_check_mark: 
[x] IMAP (dovecot) | [x] IMAP (dovecot) | :white_check_mark: 
[x] POP  (dovecot) | [x] POP  (dovecot) | :white_check_mark: 
[ ] search (dovecot-lucene) | [x] search (dovecot-lucene) | [planned](https://github.com/indiehosters/email/issues/5)
[x] CardDAV/CalDAV (Nextcloud) | [x] CardDAV/CalDAV (ownCloud) | :white_check_mark:
[ ] Exchange ActiveSync (z-push) | [x] Exchange ActiveSync (z-push) | [planned](https://github.com/indiehosters/email/issues/3)
[x] Webmail (Roundcube) | [x] Webmail (Roundcube) | :white_check_mark:
[ ] static website hosting (nginx) | [x] static website hosting (nginx) | part of other package
[x] Spam filtering (spamassassin) | [x] Spam filtering (spamassassin) | :white_check_mark:
[x] greylisting (postgrey) | [x] greylisting (postgrey) | :white_check_mark: 
[x] Backups (duplicity) | [x] Backups (duplicity) | :white_check_mark:
[ ] firewall (ufw) | [x] firewall (ufw) | planned, as part of [firewall](https://github.com/IndiePaaS/IndiePaaS/issues/108) package
[ ] intrusion protection (fail2ban) | [x] intrusion protection (fail2ban) | ? (difficult in docker)
[ ] system monitoring (munin) | [x] system monitoring (munin) | planned, as part of other package

DNS (nsd4):

indiehosters/email | mail-in-a-box/mailinabox | status
------------------ | ------------- | ----
[x] DKIM (OpenDKIM) | [x] DKIM (OpenDKIM) | :white_check_mark: 
[x] DMARC | [x] DMARC (postgrey) | :white_check_mark: 
[ ] SPF | [x] SPF | planned, as part of [DNS](https://github.com/IndiePaaS/IndiePaaS/issues/98)
[ ] DNSSEC | [x] DNSSEC | planned, as part of [DNS](https://github.com/IndiePaaS/IndiePaaS/issues/98)
[ ] DANE TLSA | [x] DANE TLSA | planned, as part of [DNS](https://github.com/IndiePaaS/IndiePaaS/issues/98)
[ ] SSHFP records | [x] SSHFP records | planned, as part of [DNS](https://github.com/IndiePaaS/IndiePaaS/issues/98)

control panel and API:

indiehosters/email | mail-in-a-box/mailinabox | status
------------------ | ------------- | ----------
[x] vimbadmin | [x] custom coded | :white_check_mark: 
[x] Add/Remove mail User | [x] Add/Remove mail User | :white_check_mark: 
[x] Add/Remove Aliases | [x] Add/Remove Aliases | :white_check_mark: 
[ ] custom DNS records | [x] custom DNS records | planned, as part of [DNS](https://github.com/IndiePaaS/IndiePaaS/issues/98)
[x] multiadmin | [ ] mutliadmin | :white_check_mark: 

## OpenDKIM

Run the `add_domain.sh` script inside the postix container, and configure your DNS, you should be fine!

## Add a mailbox

You can find a script [here](https://github.com/IndiePaaS/IndiePaaS/blob/master/utils/add_mailbox.sh)

## Contributing

If you have any issue (something not working, mail marked as spam, missing doc), please do report an issue here! Thanks

This system is used in production at [IndieHosters](https://indiehosters.net/) so it is maintained. If you use it, please tell us, and we'll be really happy to update this README!

You can help us by:
 - starring this project
 - sending us a thanks email
 - reporting bugs
 - writing documentation/blog on how you got up and running in 5mins
 - writing more documentation
 - sending us cake :) We loove cake!

## TODO
 - documentation for TLS for the web (reverse proxy FTW!)
 - separate processes in postfix (one process/container! damn!)
 - postfix/dovecot - try to sync install instructions with mailinabox

Heavily inspired by [mail-in-a-box](https://mailinabox.email/)! Thanks to the amazing work they produced. It is the best up to date `how to` for email hosting out there :)
