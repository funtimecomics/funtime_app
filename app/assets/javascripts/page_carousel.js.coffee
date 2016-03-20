class Page
  constructor: (pageId) ->
    @pageId = pageId
    @el = $(".carousel .item[data-page-id='#{pageId}']")
    @nextPageId = @el.data("next-page-id")
    @prevPageId = @el.data("prev-page-id")
    @nextEl = $(".carousel .item[data-page-id='#{@nextPageId}']")
    @prevEl = $(".carousel .item[data-page-id='#{@prevPageId}']")

  fetch: ->
    this.fetchPage(@pageId, @el)
    this.fetchPage(@nextPageId, @nextEl)
    this.fetchPage(@prevPageId, @prevEl)

  fetchPage: (pageId, element) ->
    unless element.data('loaded')
      request = $.ajax(
        url: "/pages/#{pageId}.json"
        method: 'GET'
        dataType: 'json')
      request.done (data) =>
        this.show(element, data.image_url, data.image_alt)
      request.fail (jqXHR, textStatus) ->
        console.log 'Request failed: ' + textStatus

  show: (element, imageUrl, imageAlt) ->
    imageTag = "<img src='#{imageUrl}' class='img-responsive' alt='#{imageAlt}'>"
    element.html(imageTag)
    element.data('loaded', true)

class Carousel
  constructor: () ->
    @element = $('#carousel-pages')
    @pageCount = @element.find('.item').length
    @element.carousel({
      interval: false
    })
    @element.on 'slid.bs.carousel', =>
      this.updateActivePageThumbnail()
      this.update()
    $(document).keydown (e) ->
      switch e.which
        when 37 #left arrow
          $('#carousel-pages').carousel('prev')
        when 38 #up arrow
          $('#carousel-pages').carousel(0)
        when 39, 32 #right arrow, space
          $('#carousel-pages').carousel('next')
        when 40 #down arrow
          $('#carousel-pages').carousel(@pageCount-1)
      return

  update: () ->
    currentPageId = @element.find('.item.active').data('page-id')
    page = new Page(currentPageId)
    page.fetch()

  updateActivePageThumbnail: () ->
    activePageIndex = $('#carousel-pages .carousel-inner .item.active').index()
    newActivePage = $("ol.pages li[data-slide-to='#{activePageIndex}']")
    $('ol.pages li').removeClass("active")
    newActivePage.addClass("active")

$(document).on 'ready page:load', ->
  carousel = new Carousel()
  carousel.update()
