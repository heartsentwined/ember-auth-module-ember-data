class Em.Auth.EmberDataAuthModule
  init: ->
    @config? || (@config = @auth.emberData)
    @patch()

    @auth.reopen
      user: Em.computed.alias 'module.emberData.user'

    @auth.addHandler 'signInSuccess',  @findUser
    @auth.addHandler 'signInError',    @clearUser
    @auth.addHandler 'signOutSuccess', @clearUser

  # @property [DS.Model|null] current signed in user, if signed in and
  #   enabled auto-find user; otherwise null
  user: null

  # find the current signed in user
  findUser: ->
    return unless @auth.userId? && @config.userModel
    @store.find(@config.userModel, @auth.userId).then (user) => @user = user

  # clear any current signed in user
  clearUser: ->
    @user = null

  patch: ->
    self = this
    DS.RESTAdapter.reopen
      ajax: (url, type, settings) ->
        super url, type, self.auth._strategy.serialize(settings || {})

Em.onLoad 'Ember.Application', (application) ->
  application.initializer
    name: 'ember-auth.ember-data'
    before: 'ember-auth-load'

    initialize: (container, app) ->
      app.inject 'authModule:emberData', 'store', 'store:main'
