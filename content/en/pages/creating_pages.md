---
title: "Creating Pages"
language: "en"
next: "/en/pages/components.html"
---

# Creating Pages

Pages in Frontless are pure Riot.JS components. The pages have the same structure and logics as Riot.JS components - hooks, plugins, bindings, etc.
The only difference is that a page context is availbale in the [layouts](#layouts) scope. 

**Page Example:**

```html
<my-page>
  <app-header></app-header>
  <h1>Hello World</h1>
  <script>
    import AppHeader from 'header.riot'
    export default () => ({
      components: {
        [AppHeader.name]: AppHeader
      },
      title: 'Example page',
      foo: 'bar',
      onMounted() {},
      onHydrated() {}
    })
  </script>
</my-page>
```

## Layouts

Layouts provide HTML page structure for Riot.JS components. Frontless makes use of [EJS](https://ejs.co/) in order to render output html on the server side.
A page can specify a dedicated layout trough corresponding options.

**A layout example:**

```html
<html>
  <head>
    <meta charset="utf-8">
    <link rel="stylesheet" href="/assets/css/styles.min.css"> 
    <script src="/assets/application.js"></script>
    <%- head %>
    <title><%- page.title %></title>
  </head>
  <body>
    <style data-ssr-jss><%- stylesheet %></style>
    <%- output %>
    <script>document.__GLOBAL_SHARED_STATE = <%- Global %>;</script>  
    <script type="data/json" id="globals"><%- req.session.globals %></script>
    <script type="data/json" id="state"><%- state %></script>
    <script type="data/json" id="attributes"><%- shared %></script>
  </body>
</html>
```

Page context is available in the layouts trough the `page` variable.

-------------------------------

### PAGE LIFECYCLE <br><br>

<pre>
                        INITIALIZE RIOT.JS ON SERVER

           1.               2.                 3.                  4.
     +-------------+   +-----------+    +----------------+     +----------+
     | GET '/page' +-->+ onMounted() +-->+ beforeRequest()+---->+ fetch() |
     +-------------+   +-----------+    +----------------+ |   +----------+
                                                           |   +----------+
                                                           +-->+ fetch()..|
                                                           |   +----------+
                                     5.                    +----... |
                             +----------------+                     |
                             | afterRequest() |     <---------------+
                             +----------------+
                                     |
                                     v
                                     6.
                             +----------------+
                             |  RETURN MARKUP |
                             +----------------+
                                     |
                                     |
                                     |
                                     v
                      INITIALIZE RIOT.JS APP IN BROWSER

              +-----------+   +------------+   +-------------+
              |onMounted()+-->+ onBrowser()+-->+ onHydrated()|
              +-----------+   +------------+   +-------------+
                                      |
                                      |
                                      v
                            +-------------------+
                            > APPLICATION READY |
                            +-------------------+
</pre>
------------------------------------
<br>
<br>

**All hooks and options:**

```javascript
export default () => ({

  layout: 'base', // default to 'base'
  title: 'Page Title',
  access: {}, // access oprions
  
  beforeRequest() { /** Before `fetch` */ },
  async fetch() { /** Operations on server, emits automatically in every mounted component */ },
  afterRequest() { /** After `fetch` */  },
  onRendered() { /** After everything is rendered on server */  },

  onMounted() { /** Emits on server and bowser */ },
  onBrowser() { /** Emits on browser after mounted*/ },
  onHydrated() { /** Emits on browser only in page scope */ },
  
})
```
