---
title: "Quick Start"
language: "en"
next: "applayout.html"
previous: "index.html"
---

## Quick Start

Before getting started, make sure you have installed required software. 
If you don't need MongoDB for your application you can skip installation part.

----------------------

### Install Git

If you are using Windows download [git-scm installer](https://git-scm.com/downloads) and follow instructions.

----------------------

### Install Node.JS

Frontless requires *node.js >= v10*
We recomend to use [nvm](https://github.com/nvm-sh/nvm) to get right Node.JS version.

----------------------

## Create a new app

Now you can start you first application

```bash
~$> npx create-frontless myapp
~$> cd myapp
```

### Connect to MongoDB

Open `myapp/config/config.env` and change `MONGODB_URI` variable to match your server address:

<img src="/en/start/conf_env.png" />


### Start App

```
~$> npm start
```

That's it! The application should be running on [http://localhost:6767](http://localhost:6767)

### A clean skeleton

In order to help you get familiar with Frontless the core distribution is packed with some examples.
If you don't need them you can start with a clean application skeleton:

```bash
~$> npx create-frontless myapp --clean
```

----------------------
