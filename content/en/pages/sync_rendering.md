---
title: "Syncronous Rendering"
language: "en"
next: "/en/pages/routing_scheme.html"
---

# Syncronous Rendering

Frontless can render pages after all asynchronous calls are complete. Including children riot components nested inside the page markup.
You can achieve this behaviour by using the `async fetch()` hook. 

Also, all Riot.JS components are initialized in the browser with the last `state` they were on the server side. So there's no need to make the same API calls twice per one request. 


## The fetch hook

On the server side, the render function emits all `fetch()` hooks presented in the Riot.JS component tree before redering actual HTML.
The fetch hook gives a guaranty that the components always render after the required data is fetched. 
It is convenient when there is a need to request data from an API and then update component's state.

The `fetch()` method is emited automatically on the server side, however on the browser it must be called manually (for example when you need to refresh UI).

The fetch() hook must return a Promise. It is recommended to use `async - await` syntax when making API calls.

**Example:**

```html
<my-component>
  <h1>{state.title}</h1>
  <script>
    export default () => ({
      async fetch() {
        const title = await Model.get('/title').data
        this.update({title,})
      }
    })
  </script>
</my-component>
```

In this example the fetch method is emited on server and after requesting data from API it updates components state. 
When this component is mounted in browser it will already be initialized with the state it received on the server side.

## Caveats

Since the fetch hook works with promises there are couple things that should be considered:

- Frontless doesn't handle promise rejections and will render the page even if there were unhandled errors. Handling promise rejections is left up to user.
- Promises and async function on server side run in global context so careful usage of global variables is advised.

