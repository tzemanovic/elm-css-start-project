require('./style/main.css');

// Assets that are loaded from here are picked up by WebPack
var assets = {
    logo: require('./assets/logo.svg')
};

var Elm = require('./Main.elm');
var root = document.getElementById('root');

Elm.Main.embed(root, assets);
