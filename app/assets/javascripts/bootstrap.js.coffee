jQuery ->
  $('a[rel~=popover], .has-popover').popover()
  $('a[rel~=tooltip], .has-tooltip').tooltip()
  $('#carousel-pages').carousel({
    interval: false
  })
  $('button#carousel-prev').on 'click', ->
    $('#carousel-pages').carousel('prev')
  $('button#carousel-next').on 'click', ->
    $('#carousel-pages').carousel('next')

  $('#carousel-pages').on 'slid.bs.carousel', ->
  	active_page_index = $('#carousel-pages .carousel-inner .item.active').index()
  	new_active_page = $('ol.pages li[data-slide-to="' + active_page_index + '"]')
  	$('ol.pages li').removeClass("active")
  	new_active_page.addClass("active")
  
  
  $(document).keydown (e) ->
    switch e.which
      when 37 #left arrow
        $('#carousel-pages').carousel('prev')
      when 39, 32 #right arrow, space
        $('#carousel-pages').carousel('next')
    return
