require('./main.css');

// Assets that are loaded from here are picked up by WebPack
var srcLogo = require('./logo.svg');

var Elm = require('./Main.elm');
var root = document.getElementById('root');

Elm.Main.embed(root, srcLogo);
