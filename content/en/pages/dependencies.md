---
title: "Managing Dependencies"
language: "en"
next: "pages/layouts.html"
---

# Managing Dependencies

Frontless plays well with any javascript libraries or frameworks. It is possible to add dependencies to the bundle or load them from external sources.

## External Dependenicies

Adding external libraries as easy as editing HTML. Just modify `<head>` section in the page layout:

```html
<link rel="stylesheet" href="/assets/bootstrap.css" />
```

If there is a need to execute javascript code after the page content is loaded, use following snippet:

```javascript
function onLoaded() {
  // execute once all content is loaded and Riot components are mounted
}
document.addEventListener('frontless:loaded', onLoaded, {once: true})
```

## Modifying Bundle

The entry point for frontend bundle located at `pages/index.js`. You can add global dependencies simply by importing required modules there. 
For example:

```javascript
import $ from 'jquery/dist/jquery'
window.$ = $;
```


## Working with styles

Frontles can work with any CSS frameworks written with SASS. The entry point for SASS modules is `./styles.scss`. 
In the other cases, it is always possible to add css as an external dependency.

Example for `bootstrap.css` and `FontAwesome`:

```css
// Global styles
@import 'node_modules/bootstrap/scss/bootstrap.scss';
@import 'node_modules/font-awesome/scss/font-awesome.scss';
```
