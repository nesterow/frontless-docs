---
title: "Feathers.JS Client"
language: "en"
next: "/en/server_sent_state.html"
previous: "start.html"
---

# API Client

Frontless makes use of [Feathers.JS Client](https://docs.feathersjs.com/api/client.html) because it works the same way in any environment.
There are two general ways to call API methods from the application:

### 1. Unauthorized mode

API Client imported directly from the module is not authorized:

```javascript
import 'client' from 'client'

const Model = client.service('/myservice')

Model.create({message: 'hello!'}).then((res)=>{
  alert('Message created!')
})

```

### 2. Authorized mode

Frontless provides a Riot.JS plugin to make authorized API requests:

```html
<my-component>
  <div>{state.value}</div>
  <script>
    export default () => ({
      state: {
        value: ''
      },
      createItem(data){
        const Model = this.client.service('items')
        Model.create(data)
      }
    })
  </script>
</my-component>
```

The plugin makes authorized requests that work on the server and browser.

