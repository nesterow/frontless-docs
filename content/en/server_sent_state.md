---
title: "Server-sent state"
language: "en"
next: "forms/handling_forms.html"
---

# Server-sent State

When we make API requests which are supposed to show changes in UI. The best way would be to format a response the same way as the component's state. Frontless provides a simple method for that purpose - `app.setState(id, state)`. When a response is composed with this method the target component (id) will automatically update with the returned state.

**Normally, you should follow thress simple steps to make it work:**

1. Give your component an unique id:

```html
<my-component>
  <div>{state.value}</div>
  <script>
    export default () => ({
      id: "message",
      state: {
        value: ''
      }
    })
  </script>
</my-component>
```

2. On backend use method app.setState() to compose a response:

```javascript
app.use('myservice',{
  async create(data){
    return app.setState('message', {
      value: 'Hello!'
    })
  }
})
```

3. Whenever you need to update the component's state, call the API method:

```javascript
client.service('myservice').create({})
```