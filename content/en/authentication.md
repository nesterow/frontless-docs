---
title: "Working with MongoDB"
language: "en"
next: "mongodb.html"
---

### User Authentication

By default, Frontless supports user sessions and basic login. It comes with basic user model out of the box.

#### User model
Default user model consists of following fields: 
```bash
_id: ObjectID [primary key]
usename: varchar
password: Bcrypt
group: varchar
agreed: bool
```
User is a MongoDB document so you can extend this model at will.

### FeathersJS API

Frontless implements [FeathersJS Local Auth Strategy](https://docs.feathersjs.com/api/authentication/local.html). The user verification module can be found at `components/verifier.js`.

On the client side  Feathers.JS handles authentication per secification:

#### Login example:

```javascript
this.client.authenticate({
    strategy: 'local',
    username: data.username,
    password: data.password
}).

then((res) => {
    return this.client.passport.verifyJWT(res.accessToken)
}).

then((res) => {
    this.redirect('/profile')
}).
```

#### Logout example:

```javascript
this.logout()
```

#### Resticting access to Pages

Add `access` options to the page specifying if it should be accessed by `loggedIn` users. Optionaly, it is also possible to verify user `group`

```javascript
export default () => ({

    access: {
        loggedIn: true, // only logged users see this page
        group: 'staff' // (optional) only staff has access to it
    }

})
```

