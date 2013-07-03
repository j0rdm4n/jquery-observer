###
jQuery observe
Copyright 2013 Kevin Sylvestre
###

"use strict"

$ = jQuery

class observe
  
  @settings:
    interval: 800

  constructor: (form, callback, settings = {}) ->
    @form = form
    @callback = callback
    @settings = $.extend {}, observe.settings, settings
    @observe()

  observe: ->
    $(@form.elements).change =>
      @modified = new Date()
    $(@form.elements).keypress =>
      @modified = new Date()

    @every @settings.interval, =>
      @callback.call(@form) if @modified?
      delete @modified

  every: (interval, callback) ->
    setInterval callback, interval

$.fn.extend
  observer: (callback, options = {}) ->
    @each -> new observe(this, callback, options)
