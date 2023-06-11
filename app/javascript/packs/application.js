// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

import $ from "expose-loader?exposes[]=$&exposes[]=jQuery!jquery";
import "popper.js"
import "bootstrap"
import "../stylesheets/application"
import "jquery-validation"
import 'jquery-validation/dist/additional-methods'
import 'jquery-validation/dist/localization/messages_ja'
import "bootstrap-show-password"

import "./validates/admin_category"
import "./validates/admin_company"
import "./validates/admin_subscription"
import "./validates/admin"
import "./validates/user_subscription"
import "./validates/user"

import "./switch_tab"

Rails.start()
Turbolinks.start()
ActiveStorage.start()
