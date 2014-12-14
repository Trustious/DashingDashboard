class Dashing.EntryPoint extends Dashing.Widget

  ready: ->
    # This is fired when the widget is done being rendered
    $(".widget-entry-point").removeClass( "widget" )

  onData: (data) ->
    # Handle incoming data
    # You can access the html node of this widget with `@node`
    # Example: $(@node).fadeOut().fadeIn() will make the node flash each time data comes in.

    unless data.metric
        return

    # $.post( "/widgets/welcome", JSON.stringify({auth_token: "YOUR_AUTH_TOKEN", text: data.data}) );

    if data.metric == "timeout"
        $.post( "/widgets/timeouts", JSON.stringify({auth_token: "YOUR_AUTH_TOKEN", operation: "increment"}) );
    else if data.metric == "error"
        $.post( "/widgets/timeouts", JSON.stringify({auth_token: "YOUR_AUTH_TOKEN", operation: "increment"}) );
    else
        return
