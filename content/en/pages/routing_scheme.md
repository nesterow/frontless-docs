---
title: "Routing Scheme"
language: "en"
next: "/en/forms/handling_forms.html"
---

# Routing Scheme

Any Riot.JS component placed in the page’s directory is accessible by its name in the browser, much like a .php script or a static page.
For example: `[pages/index.riot -> GET /]`, `[pages/page.riot -> GET /page]`. 
The same rule applies to the sub-directories placed inside the `pages` folder. For example: For example: `[pages/foo/index.riot -> GET /foo`], `[/pages/foo/bar.riot -> GET /foo/bar]`.

## URL Query on the server side

Every Riot component on the server side has access to the current `express.js` request context. 
Getting url paramenters is one of the many things you can do with it:

```javascript
export default () => ({
  async fetch(){
    const {query} = this.req;
    console.log(query)
  }
})
```

## Positional Arguments

Positional argumnets are very convenient when you need to pass a positional parameter to the URL, like an `id`.
Using a standard URL separator ('/') is not possible in Frontless, so additional parameters are separated by `@` sign.
A semicolon-separated string after @ will be parsed as positional arguments.

For example consider following request:

```bash
GET /page@foo;bar
```

This request will fetch page.riot and pass positional arguments into 'request.params.args':

```javascript
export default () => ({
  async fetch(){
    const {params} = this.req;
    const [first, second] = params.args;
    // first === 'foo'
    // second === 'bar'
  })
}
```

## Push State

It is possible to cache page state into URL using HTML5 history API without reloading current location.
For this purpose, Frontless provides a simple `pushQuery` method:

```javascript
// If userId = 10, age = 35
// this would result to: http://example.com/page@10?age=35
export default ()=> ({
  cacheState(){
    const {userId, age} = this.state
    this.pushQuery([userId], { age, })
  }
})
```

## Redirect

Redirect calls are universal and work the same way on client and server:

```javascript
// If user is not logged in
// this would result to: http://example.com/login?backTo=/dashboard
export default () => ({
  onMounted(){
    this.redirect('/login', [], { backTo: '/dashboard'})
  }
})
```