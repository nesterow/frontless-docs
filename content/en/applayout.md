---
title: "Directory Structure"
language: "en"
next: "pages/markup.html"
previous: "start.html"
---


# Application Structure

<img src="/en/start/app_layout.png" />

#### 1. Assets

Media assets, external CSS and Javascript modules should be kept here.

#### 2. Components

Riot.JS components and application modules. `components` is set as a root module directory along with `./` and `node_modules`.

#### 3. Config

Configuration files for browser and server environments.

#### 4. Pages

A web root directory. All Riot.JS components placed in this folder are actual site pages. 
`pages/index.js` is an entry point for the javascript application itself.

#### 5. Services

Feathers.JS services and backend related modules should be placed here.

#### 6. Specs

Unit & E2E tests for your application.

#### 7. Client.js

Feathers.JS isomorphic client factory.

#### 8. Plugins.js 

Riot.JS plugins. This file should handle server-side and client-side plugins.

#### 9. Styles.scss

An entry point for application styles.