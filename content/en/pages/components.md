---
title: "Riot.JS"
language: "en"
next: "/en/pages/dependencies.html"
---

# Riot.JS Components

Riot.JS components in Frontless are rendered on server and browser in the same way. However, working with javascript on server side is different in many ways.
It is easy to get shot in the leg or open a security vulnerability. In this section we outline some things that need more attention when writing components for server.

## Shared access to the variables

The main difference between server and browser javascript is that a browser application is intended to use by a single user when 
a process of server application is used by many clients. Therefore, the memory alocated inside a node.js process can be shared between clients. 
It's simple to avoid related issues by following this simple rules:

### Rule #1: Never use global variables in application logic

Once a global variable is changed - all clients will be affected by it. Consider following over-simplificated example:

```javascript

var language = 'en'

app.get('/set-language', (req, res)=> {
  language = 'de'
  res.end()
})

app.get('/', (req, res) => {
  res.render('view', {language,})
})

```

The result of this logic would be that all users would see pages in laguage set by the last user. Even though it would be acceptable for a browser application you should never do it in `node.js`.

### Rule #2: Avoid module caching in Riot.JS components

[Module caching](https://nodejs.org/api/modules.html#modules_caching) in javascript is a way to avoid multiple execution every time you import a module.
While it brings a great performance benefit it is not what we would wanted to use when we work with UI. Consider following example:

**BAD:** 

```javascript
//an alert component
export default {
  state: {
    open: false
  },
  open(){
    this.update({open: true})
  }
}
```

We export an object it gets cached by node.js then after a client calls `open()` all users would see an open alert because the state was changed globaly. 
In fact, this issue is also true for pure browser application - when an application has more than one `alert` component the first call would change initial state for all of them.

In order to avoid this behaviour, export a function that returns a new component instance:

**GOOD:**

```javascript
export default () => ({
  state: {
    open: false
  },
  open(){
    this.update({open: true})
  }
})
```

Which is equal to:

```javascript
class Component {}
export default () => new Component()
```

## Global Objects

### 1. HTML Document

On the server side there is no a `window` object and we cannot mutate `node.js` globals when rendering UI. 
However, at the runtime the `document` object works the same way as in browser. Every time the server renders markup it creates 
a new `document` instance which is only acessible in current rendering task. Therefore, it can be used inside Riot.JS components.

### 2. Redux Store

Fronless makes use of [frontless-redux](https://github.com/nesterow/frontless-redux) plugin to provide a global store and action dispatcher.


## Security

Frontless is an _isomorphic_ stack, which means, the Riot.JS components are rendered on both sides - server and client. 
With that in mind, the application UI must not include sensitive variables used on backend because the user interface share the code with browser environment.

