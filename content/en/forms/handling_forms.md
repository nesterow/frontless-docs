---
title: "Handling Forms"
language: "en"
next: "forms/handling_forms.html"
---

# Handling User Input

Frontless provides utils for handling HTML forms.

## Serializing Forms

The simplest way to get the values from a form is to use method serializeForm which takes the form's collected data and returns a name-value map.

Example:

```html
<my-form>
  <form onsubmit={submit}>
    <input type="text" name="search" />
  </form>
  <script>
    import {serializeForm} from '@frontless/core'
    export default () => ({
      submit(ev) {
        ev.preventDefault()
        const formData = serializeForm(ev.target)
        // formData == { name: 'value' }
      }
    })
  </script>
</my-form>
```

The method `submit` is executed whenever the user tries to submit form. Then serializer handles the form element from `ev.target` and returns a JSON-serializable object.

## Validating Forms

It is recommended to use [validate.js](https://validatejs.org/) since it works the same way in node.js as in the browser and it gives convenient output to use within javascript components.

Simple Example:

```html
<my-form>
  <form onsubmit={submit}>
    <input type="text" name="search" />
    <span class="error" each={error in errors}>{error}</span>
  </form>
  <script>
    import {serializeForm} from '@frontless/core'
    import validate from 'validators/myform'
    export default () => ({
      submit(ev) {
        ev.preventDefault()
        const formData = serializeForm(ev.target)
        const errors = validate(formData)
        if (errors) {
          return this.update({errors,}) // stop and show the errors
        }
      }
    })
  </script>
</my-form>
```