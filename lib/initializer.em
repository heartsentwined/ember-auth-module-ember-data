Em.onLoad 'Ember.Application', (application) ->
  application.initializer
    name: 'ember-auth.module.ember-data'
    before: 'ember-auth-load'

    initialize: (container, app) ->
      app.register 'authModule:emberData', Em.Auth.EmberDataAuthModule

Em.onLoad 'Ember.Application', (application) ->
  application.initializer
    name: 'ember-auth.module.ember-data.injection'
    after: 'ember-auth.module.ember-data'

    initialize: (container, app) ->
      app.inject 'authModule:emberData', 'store', 'store:main'
