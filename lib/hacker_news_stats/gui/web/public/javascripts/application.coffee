$ ->
  posts_plain_attributes = ["author","karma","submitted"]
  $("#posts tbody [data-id]:lt(10)").each ->
    row = $(this)
    id = row.data("id")

    render_post = (data)->
      _(posts_plain_attributes).each (k)->
        row.find("td."+k).html(data[k])
      stack_user = data["stack_user"]
      if(stack_user)
        row.find("td.stack_user").html(stack_user["display_name"])
        row.find("td.stack_reputation").html(data["stack_reputation"])
      else
        row.find("td.stack_user").html('<i class="fa fa-times red">')

      tw_user = data["twitter_user"]
      if(tw_user)
        row.find("td.twitter_user").html(tw_user)
        row.find("td.twitter_tweets").html(data["twitter_tweets"])
      else
        row.find("td.twitter_user").html('<i class="fa fa-times red">')

    render_fail = ->
      row.find("i.fa").removeClass("fa-spinner fa-pulse").addClass("fa-exclamation-triangle")

    $.getJSON("/posts/"+id+".json").done(render_post).fail(render_fail)