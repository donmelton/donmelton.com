---
coffeescript: { bare: true }
---
###
Copyright (c) 2012 Don Melton
http://opensource.org/licenses/MIT
Adapted from 'jquery.timeago.js'
Copyright (c) 2008-2011 Ryan McGeary
###

(($) ->
  $.fn.timeago = ->
    @each adjustTime

    setInterval =>
        @each adjustTime
        return
      , 60000

    this

  adjustTime = ->
    element = $ this
    data = element.data 'timeago'

    unless data
      text = $.trim element.text()
      element.attr 'title', text if text.length > 0

      datetime = element.attr 'datetime'
      datetime = $.trim datetime
      datetime = datetime .replace(/\.\d\d\d+/, '')
                          .replace(/-/, '/').replace(/-/, '/')
                          .replace(/T/, ' ').replace(/Z/, ' UTC')
                          .replace /([\+\-]\d\d)\:?(\d\d)/, " $1$2"

      data = new Date datetime
      element.data 'timeago', data

    return false if isNaN data

    seconds = Math.abs(new Date().getTime() - data.getTime()) / 1000
    minutes = seconds / 60
    hours   = minutes / 60
    days    = hours   / 24
    years   = days    / 365

    words   = seconds < 60  and 'seconds ago'                                         or
              minutes < 2   and 'a minute ago'                                        or
              minutes < 60  and properNumber(Math.floor minutes)    + ' minutes ago'  or
              hours   < 2   and 'an hour ago'                                         or
              hours   < 24  and properNumber(Math.floor hours)      + ' hours ago'    or
              days    < 2   and 'yesterday'                                           or
              days    < 7   and properNumber(Math.floor days)       + ' days ago'     or
              days    < 14  and 'last week'                                           or
              days    < 30  and properNumber(Math.floor days / 7)   + ' weeks ago'    or
              days    < 60  and 'last month'                                          or
              days    < 365 and properNumber(Math.floor days / 30)  + ' months ago'   or
              years   < 2   and 'last year'                                           or
              properNumber(Math.floor years)                        + ' years ago'

    element.text words

    return

  properNumber = (number) ->
    number = parseInt number, 10

    if number > 1 and number < 10
      number = ['two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine'][number - 2]

    number

  return
) jQuery
