class Dashing.Timeout extends Dashing.Widget

  @accessor 'value', Dashing.AnimatedValue

  ready: ->
    # This is fired when the widget is done being rendered

  onData: (data) ->
    # Handle incoming data
    # You can access the html node of this widget with `@node`
    # Example: $(@node).fadeOut().fadeIn() will make the node flash each time data comes in.
    if data.operation == "set"
        @set('value', data.number_of_timeouts)
    else if data.operation == "increment"
        if @get('value')
            @set('value', parseInt(@get('value'))+1)
        else
            @set('value', 1)
