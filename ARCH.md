# Data Curator Architectural Review
<!-- TOC -->

- [Data Curator Architectural Review](#data-curator-architectural-review)
    - [At a glance](#at-a-glance)
    - [In Depth](#in-depth)
    - [Toolchain](#toolchain)
        - [Webpack](#webpack)
    - [Code review](#code-review)
        - [Threading](#threading)
        - [Coding Standards](#coding-standards)
    - [Dead Code](#dead-code)
    - [Unused dependencies](#unused-dependencies)
        - [Used tools](#used-tools)
    - [Sustainability Factors](#sustainability-factors)

<!-- /TOC -->

Review template: `memory-managed`, `procedural`

## At a glance

DataCurator or `data-curator` is a desktop application (i.e. a native executable) that provides functionality around the creation, update, and packaging of tabular data. It runs on Windows and Mac OS X.

## In Depth

`data-curator` is a multiplatform desktop application built on the [Electron framework](https://www.electronjs.org/), which itself relies on the Node.js runtime environment. Electron allows the use of many web technologies, including web frontends. `data-curator` uses [Vue.js](https://vuejs.org/) as the front end technology.


|Third party  |Role     |
|-------------|---------|
|Node.js      |Runtime  |
|Electron.js  |Runtime  |
|Vue.js       |Front-end|

## Toolchain

`data-curator` relies on a number of tools for building. `yarn` is used as the package manager, and also runs required scripts. `webpack` is used to transpile various resources so that they can be understood by `electron`.

### Webpack

Webpack has a plugin model. `data-curator` uses several `webpack` plugins.


|Plugin   |Role     |
|---------|---------|
|babili-webpack-plugin| babel based minifier         |
|copy-webpack-plugin|Copy files && directories with webpack         |
|mini-css-extract-plugin|extracts CSS into separate files|
|html-webpack-plugin|Simplifies creation of HTML files to serve your webpack bundles         |
|vue-loader|Vue single-file component loader for Webpack|

> Roles come from NPM package descriptions. No further analysis was performed.

> Non exhaustive look at webpack files

> It is unclear to me what benefit minifying code is on a desktop application. Obfuscation?

|Tool     |Role  |
|---------|---------------|
|yarn     |package manager|
|Row2     |               |
|Row3     |               |
|Row4     |               |


## Code review

### Threading

`data-curator` like all `electron.js` applications, is multithreaded. There are two threads, `main` and `renderer`. `main` has access to the node.js libraries, while `rendered` is sandboxed in Google Chrome's renderer. This is a [standard setup](https://www.electronjs.org/docs/tutorial/application-architecture) for an electron app.

> Essentially the `main` and `renderer` threads are running in totally different runtimes (Node.js vs Chrome)

### Coding Standards

`data-curator` claims conformance against two coding standards:


|Standard       |Scope      |
|---------------|-----------|
|StandardJs     |JavaScript |
|Vue Recommended|Vue        |


## Dead Code

## Unused dependencies

Unused dependencies may increase the attack surface of the application. `depcheck` was used to determine which packages were used.

The analyst ran the following commands.

`npm install -g depcheck`
`depcheck --specials=babel,bin,eslint,karma,mocha,webpack`

The following dependencies were found to be unused:

- bootstrap
- components-font-awesome
- csv
- escape-regexp
- font-awesome
- imports-loader
- pikaday
- request
- slug
- svgo
- vue-electron
- zeroclipboard

### Used tools

The analyst used the following tools to perform this analysis.

|Tool                 |Version  |
|---------------------|---------|
|depcheck             |0.9.2    |
|vue-template-compiler|2.6.11   |


| Package                 | Version | Modified       | Version Avg    | Maintainers | Dependencies | Monthly Downloads | Open Issues | Open PRs |
|-------------------------|---------|----------------|----------------|-------------|--------------|-------------------|-------------|----------|
| archiver                | 3.1.1   | 5 months ago   | every a month  | 1           | 7            | 7,876,229         | 61          | 4        |
| autosize                | 4.0.2   | 2 years ago    | every 2 months | 1           | 0            | 940,999           | 37          | 6        |
| axios                   | 0.19.2  | a day ago      | every 3 months | 3           | 0            | 9,100,416         | 423         | 85       |
| bootstrap               | 4.4.1   | 8 months ago   | every 2 months | 2           | 0            | 27,834            | 2           | 0        |
| components-font-awesome | 5.9.0   | 2 months ago   | every 2 months | 1           | 4            | 1,170,946         | 2           | 0        |
| csv                     | 5.3.1   | every 2 months | 4              | 54,526      | 282,017      | 0                 | 2,583       | 43       |
| csv-sniffer             | 0.1.1   | every 9 months | 0              | 202         | 1,155        | 0                 | 7           | 4        |
| datapackage             | 1.1.7   | every 2 months | 12             | 74          | 408          | 0                 | 32          | 9        |
| detect-newline          | 3.1.0   | every 6 months | 0              | 1,129,486   | 5,973,772    | 0                 | 30          | 8        |
| electron-settings       | 3.2.0   | every a month  | 2              | 764         | 4,901        | 3                 | 535         | 10       |
| escape-regexp           | 0.0.1   | every 7 years  | 0              | 75,559      | 404,080      | 0                 | 0           | 0        |
| etl                     | 0.6.12  | every 17 days  | 5              | 593         | 3,108        | 0                 | 161         | 11       |
| font-awesome            | 4.7.0   | every 8 months | 0              | 144,135     | 739,766      | 16                | 62,001      | 1,407    |
| fs-extra                | 8.1.0   | every a month  | 3              | 4,169,011   | 22,040,556   | 2                 | 6,547       | 82       |
| handsontable            | 7.3.0   | every 23 days  | 6              | 11,381      | 53,982       | 28                | 13,160      | 485      |
| imports-loader          | 0.8.0   | 8 months ago   | every 7 months | 10          | 2            | 1,875,908         | 26          | 3        |
| lodash                  | 4.17.15 | a month ago    | every a month  | 2           | 0            | 112,221,695       | 46          | 19       |
| markdown-it             | 10.0.0  | 5 months ago   | every a month  | 1           | 5            | 4,456,862         | 10          | 2        |
| moment                  | 2.24.0  | 2 months ago   | every 2 months | 5           | 0            | 44,421,123        | 483         | 146      |
| pikaday                 | 1.8.0   | a year ago     | every 6 months | 1           | 0            | 740,112           | 291         | 78       |
| request                 | 2.88.0  | 4 months ago   | every a month  | 4           | 20           | 69,331,535        | 208         | 56       |
| rxjs                    | 6.5.4   | a month ago    | every a month  | 1           | 1            | 66,962,014        | 382         | 66       |
| sifter                  | 0.5.4   | a month ago    | every 3 months | 2           | 5            | 293,582           | 17          | 3        |
| slug                    | 2.1.1   | 12 days ago    | every 4 months | 1           | 1            | 379,964           | 1           | 0        |
| sortablejs              | 1.10.2  | a month ago    | every 2 months | 2           | 0            | 1,448,092         | 215         | 14       |
| spectron-fake-dialog    | 0.0.1   | every 2 years  | 0              | 201         | 753          | 0                 | 0           | 0        |
| svgo                    | 1.3.2   | every a month  | 13             | 1,197,368   | 6,261,120    | 26                | 13,601      | 253      |
| tmp                     | 0.1.0   | every 3 months | 1              | 2,744,313   | 14,622,968   | 0                 | 535         | 11       |
| unzipper                | 0.10.8  | every 20 days  | 10             | 91,426      | 483,118      | 3                 | 185         | 5        |
| vee-validate            | 3.2.3   | every 10 days  | 0              | 31,810      | 158,602      | 2                 | 7,318       | 128      |
| vue                     | 2.6.11  | 10 days ago    | every 9 days   | 1           | 0            | 5,676,488         | 443         | 154      |
| vue-async-computed      | 3.8.2   | a month ago    | every a month  | 1           | 0            | 88,307            | 11          | 3        |
| vue-directive-tooltip   | 1.6.3   | 3 months ago   | every a month  | 1           | 1            | 40,127            | 9           | 2        |
| vue-electron            | 1.0.6   | 3 years ago    | every 7 months | 1           | 0            | 14,072            | 5           | 0        |
| vue-good-table          | 2.18.1  | 3 months ago   | every 6 days   | 1           | 7            | 37,173            | 86          | 12       |
| vue-router              | 3.1.5   | 22 days ago    | every a month  | 2           | 0            | 3,948,278         | 192         | 62       |
| vue-rx                  | 6.2.0   | 9 months ago   | every 2 months | 1           | 0            | 37,706            | 22          | 6        |
| vue-template-compiler   | 2.6.11  | 2 months ago   | every 13 days  | 1           | 2            | 6,091,347         | 443         | 154      |
| vuex                    | 3.1.2   | 2 months ago   | every a month  | 3           | 0            | 3,840,623         | 130         | 48       |
| xlsx                    | 0.15.5  | 10 days ago    | every a month  | 1           | 7            | 1,966,247         | 328         | 20       |
| xlsx                    | 0.15.5  | 10 days ago    | every a month  | 1           | 7            | 1,966,247         | 328         | 20       |
| yargs-parser            | 16.1.0  | 3 months ago   | every a month  | 2           | 2            | 134,293,009       | 25          | 4        |
| zeroclipboard           | 2.3.0   | 3 years ago    | every 2 months | 2           | 0            | 54,869            | 86          | 4        |
## Sustainability Factors

Sustainability includes factors such as health of project. Additionally because node.js software development relies very heavily on third party libraries (called packages), those libraries must be evaluated as well.

> Packages may have dependencies as well. For this analysis, we will perform manual analysis on packages at the surface layer only. Nested dependencies will be checked through automated analysis.




> This was done manually via npmcompare, in the future use https://github.com/doowb/github-metadata
