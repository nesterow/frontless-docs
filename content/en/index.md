---
title: "Home"
language: "en"
next: "start.html"
---


## About

-----------
**Frontless** is a minimalistic node.js stack  for building universal (ismorphic) javascript applications. It is built to boost developer's productivity and eliminate as much repeated routine as possible.

At the core Frontless is just a tiny [Express](https://expressjs.com/) server which provides a developer with powerful tools for building SSR web applications. 

Frontless is built around best javascript technologies: [Feathers](https://feathersjs.com), [Riot.JS](https://riot.js.org), [Turbolinks](https://github.com/turbolinks/turbolinks), and [Express](https://expressjs.com/). It plays well with stock templates, any javascript UI components and CSS frameworks like Bootstrap4 or SemanticUI.  


## Motivation

----------
Frontless is built to solve many issues, here are some of them:

#### Reduce repeated routine

In practice, the classic MMVM approach significantly complicates work with data. That causes a front-end developer to write the code, which would be better performed by the server rather than a browser application. I believe, the server has to be responsible for things like routing, data requests, user state (sessions), and in some cases - component's view-model. It would make a front-end developer better concentrate on UI rather than repeating the functionality which is done by back-end in more reliable way.

#### Use any UI frameworks

With power and simplicity of [Riot.JS](https://riot.js.org) you can use any UI components or stock templates. It plays well with any javascript frameworks or without them. If you're looking for a simple and elegant way to create user interface check out Riot.JS

#### Stay close to the database

A common hussle for a full-stack developer is that he has to go trough a lot of routine tasks to get the application work. A great part of this routine is usually related to writing API. [Feathers.JS](https://feathersjs.com) helps to overcome most of routine you would do to get a REST API working.


#### Syncronous rendering

Another common developer routine is to handle asyncronous calls to APIs and databases before rendering UI. *Frontless* can render pages after all asyncronous calls are complete. Including children riot components nested inside the page markup. 

#### Simplify routing schemes

*Routing* in web applications should be as simple as it is in static sites. With that in mind, any Riot.JS component placed in **pages** directory is accesible by browser: 
```bash
[ pages/foo.riot -> GET http://example.com/foo ]
```
Also, a page can accept *positional arguments* and it has access to the Express request context:
```javascript
// GET http://example.com/foo@bar
export default {
  async fetch(){
    const {args} = this.req.params;
    const [userId] = args;
    console.log(userId === 'bar') // true
  }
}
```

---------------
## Stack Summary


| SERVER        | CLIENT        |
| :------------- |:-------------|
| Routing - *express.js* | Navigation - *turbolinks* |
| View Model - *feathers*    | Data Representation - *riot.js* |
| Layout Rendering - *riot/ssr* | User input - *riot.js*  |
| Sessions - *express.js* | *JWT, Cookies* |
| Realtime - *feathers, socket.io* | *@feathers/client* |
| DB Interface - *@feathers/client* | Rest/IO - *@feathers/client* |

----------------
## License

This project is licensed under the MIT License - see the [LICENSE.md](https://github.com/nesterow/frontless/blob/master/LICENSE) file for details

-----------------
## Authors

**Anton Nesterov** - [@nesterow](https://github.com/nesterow)

-----------------
## Credits
**Gianluca Guarini** - [@GianlucaGuarini](https://github.com/GianlucaGuarini) - *[riot/hydrate](https://github.com/riot/hydrate)*, *[Riot.js](https://github.com/riot/riot)*

**Feathers.JS Community** - [Github](https://github.com/feathersjs/feathers/graphs/contributors)

