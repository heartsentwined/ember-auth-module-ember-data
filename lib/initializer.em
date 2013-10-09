Em.onLoad 'Ember.Application', (application) ->
  application.initializer
    name: 'ember-auth.module.ember-data'
    after: 'ember-auth'

    initialize: (container, app) ->
      app.register 'authModule:emberData', Em.Auth.EmberDataAuthModule
