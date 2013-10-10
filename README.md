# ember-data integration module for ember-auth

1. injects signed in session data (if any) to all ember-data server requests
2. optional: auto-loads an ember-data user model upon sign in

## Config

```coffeescript
App.Auth = Em.Auth.extend
  modules: ['emberData']

  emberData:
    # [string|false] enable auto-loading user model by setting this to a
    #   model type, as in store.find(userModel, id);
    #   or false to disable auto-loading user model
    userModel: false
```

## Usage

```coffeescript
@auth.user # access the auto-loaded user model
```
