---
title: "Working with MongoDB"
language: "en"
next: "/en/config.html"
---

# Working with MongoDB

By default Frontless is configured to use MongoDB, however advanced users can use any database of choice. In order to run default Frontless distribution you need a running MongoDB instance whether on localhost or remote. For this tutorial I recomend to use free plan on [cloud.mongodb.com](https://cloud.mongodb.com).

### DB Configuration
Open `config -> environ.env` and add `MONGO_DATABASE` and `MONGODB_URI` variables for accessing your mongo instance:
```bash
MONGO_DATABASE=test
MONGODB_URI=mongodb+srv://user:password@cluster0-fffff.mongodb.net/microtw?retryWrites=true
```

#### Accessing MongoDB 
There are two ways to acess the storage in Frontless:

1. Using Mongo Driver:

```javascript
const {MONGO_DATABASE} = process.env
export default (app, mongo) => {
  const Todos = mongo.db(MONGO_DATABASE).collection('todos')
  app.use('signup', {
    async get(id) {
      const todo = await Todos.findOne({id,})
      return todo
    },
  })
}
```

2. Using [Feathers MongoDB](https://github.com/feathersjs-ecosystem/feathers-mongodb)

```javascript
const {MONGO_DATABASE} = process.env
export default (app, mongo) => {
  const Todos = mongo.db(MONGO_DATABASE).collection('todos')
  app.use('/messages', service({ Todos, events, paginate }));
}
```

Cunsult [Feathers Common DB Adapter API](https://docs.feathersjs.com/api/databases/common.html)