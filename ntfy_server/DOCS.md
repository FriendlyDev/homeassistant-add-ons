## Configuration

> ⚠️ **NOTE**  
> DO NOT RE-MAP PORTS IN YOUR CONFIG FILE.  
> This is handled by the configuration tab.  


- The `/addons_config/b6e75a8c_ntfy_server` folder is mapped to `/etc/ntfy`. This folder is where everything will go.  

- There is a `server.yml.example` thats downloaded from the ntfy.sh GitHub - [https://github.com/binwiederhier/ntfy/blob/main/server/server.yml](https://docs.ntfy.sh/config)  

- ntfy Configuration documentation is here - [https://docs.ntfy.sh/config](https://docs.ntfy.sh/config)  

--   
   
If you haven't added a `server.yml` file, then the default one will be written. This includes an example admin account with credentials;
- username: admin
- password: changeme

The default `server.yml` file is;

```yaml
auth-file: "/var/lib/ntfy/user.db"
auth-users:
  # admin user for initial setup
  # admin:changeme
  - "admin:$2a$12$5U5l4UVmRRG7.pM5ba2yHe3JSPnZuC9HSkTcpQhOlC6WZevvfRd6q:admin"
enable-signup: true
enable-login: true
```

The passwords are Bcrypt encrypted, you can use this website to generate the password if you want to manually add the user credentials [https://bcrypt-generator.com](https://bcrypt-generator.com)
