Em.onLoad 'Ember.Application', (application) ->
  application.initializer
    name: 'ember-auth.module.ember-data'
    before: 'ember-auth-load'

    initialize: (container, app) ->
      app.register 'authModule:emberData', Em.Auth.EmberDataAuthModule
      app.inject 'authModule:emberData', 'auth', 'auth:main'
      app.inject 'authModule:emberData', 'store', 'store:main'
