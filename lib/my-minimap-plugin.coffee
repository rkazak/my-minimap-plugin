{CompositeDisposable} = require 'event-kit'

module.exports =
  active: false

  isActive: -> @active

  activate: (state) ->
    @subscriptions = new CompositeDisposable

  consumeMinimapServiceV1: (@minimap) ->
    @minimap.registerPlugin 'my-minimap-plugin', this

  deactivate: ->
    @minimap.unregisterPlugin 'my-minimap-plugin'
    @minimap = null

  activatePlugin: ->
    return if @active

    @active = true

    @minimapsSubscription = @minimap.observeMinimaps (minimap) =>
      minimapElement = atom.views.getView(minimap)

      # ...

  deactivatePlugin: ->
    return unless @active

    @active = false
    @minimapsSubscription.dispose()
    @subscriptions.dispose()
