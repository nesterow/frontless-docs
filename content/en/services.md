---
title: "Feathers.JS Services"
language: "en"
next: "/en/mongodb.html"
---


# Feathers.JS Services 
A service is a set of CRUD methods. In Frontless services can be accessed whether with REST client or Socket.IO
Full documentation on Feathers.JS services can be found in the [dedicated readme](https://github.com/feathersjs/docs/blob/master/api/services.md)

### Service Structure

```javascript
const {MONGO_DATABASE} = process.env

module.exports = (app, mongo) => {

  const Model =  mongo.db(MONGO_DATABASE).collection('mydata')

  app.use('myservice', {

    async find() {
      return []
    },

    async get() {
      return {}
    },

    async create() {
      return {}
    },

    async update() {
      return []
    },

    async remove() {
      return []
    },

  })


  app.service('myservice').hooks({
    before: {
     create: [
     ],
     remove: [
     ]
    }
   });

}
```

### Socket.IO

One of the great features of Feathers.JS is that it can work with Socket.IO and this feature is shipped with Frontless server and client modules.
For the full docs please refer to [Feathers.JS official docs](https://docs.feathersjs.com/api/socketio.html)

#### Calling API though WebSocket

The `client` module provides a socket wrapper which works the same way as usual rest API client with difference that it can subscribe Feathers.JS channels.
This is a browser-only feature. It is not recommended to use web sockets when rendering components on server, because it establishes a constant live connection.

```javascript
import client from 'client'

if (isBrowser) {
  client.ws.service('chat').create({ message: 'Hello!' })
  client.ws.on('chat created', (data) => {
    this.state.messages.push(data)
    this.update()
  })
}
```

