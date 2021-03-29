// app/javascript/packs/application.js

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
//= require select2
import "bootstrap"
import "../stylesheets/application"
import "../select2/select2.min"
var moment = require('moment')

var jQuery = require('jquery')

import "daterangepicker"

// include jQuery in global and window scope (so you can access it globally)
// in your web browser, when you type $('.div'), it is actually refering to global.$('.div')
global.$ = global.jQuery = jQuery;
window.$ = window.jQuery = jQuery;

// include moment in global and window scope (so you can access it globally)
global.moment = moment;
window.moment = moment;
