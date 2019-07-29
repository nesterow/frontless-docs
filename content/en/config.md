---
title: "Config"
language: "en"
next: "/en/license.html"
---

# Configuration

Server varibales are loaded from `config/environ.env`. This config file is used only by server and shouldn't be shared with UI components. 

#### environ.env
```bash
HTTP_SESSION_SECRET=keyboardcat
HTTP_SESSION_SECURE=no
REST_AUTH_SECRET=keyboardcat
REST_AUTH_SERVICE=users
ALOWED_HOSTS=*,localhost
ORIGIN=http://localhost:6767
PORT=6767
MONGO_DATABASE=test
MONGODB_URI=mongodb://
```


Another server-only configuration file is `config/server.js`. This file is loaded at server initialization time and can provide dynamic code. For example, `cors resolution` or express middlewares.

#### server.js
```javascript
// Use CORS
// you can use dynamic resolution if allowed hosts are kept in some storage
const ALOWED_HOSTS = (process.env.ALOWED_HOSTS || '*').split(',')
const corsResolver = async (host, cb) => {
  if (ALOWED_HOSTS.includes('*') || ALOWED_HOSTS.includes(host))
    return cb(null, true);
  return cb('Host is not alowed', false)
}
module.exports.corsResolver = corsResolver
```