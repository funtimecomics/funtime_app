jQuery ->
  $('a[rel~=popover], .has-popover').popover()
  $('a[rel~=tooltip], .has-tooltip').tooltip()
  $('.carousel').carousel({
    interval: false
  })
  $('button#carousel-prev').on 'click', ->
    $('#carousel-pages').carousel('prev')
  $('button#carousel-next').on 'click', ->
    $('#carousel-pages').carousel('next')