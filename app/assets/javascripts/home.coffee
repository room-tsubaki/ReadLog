# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
do ->
  # Vertical Timeline - by CodyHouse.co

  VerticalTimeline = (element) ->
    @element = element
    @blocks = @element.getElementsByClassName('js-cd-block')
    @images = @element.getElementsByClassName('js-cd-img')
    @contents = @element.getElementsByClassName('js-cd-content')
    @offset = 0.8
    @hideBlocks()
    return

  checkTimelineScroll = ->
    verticalTimelinesArray.forEach (timeline) ->
      timeline.showBlocks()
      return
    scrolling = false
    return

  VerticalTimeline::hideBlocks = ->
    #hide timeline blocks which are outside the viewport
    if !'classList' of document.documentElement
      return
    self = this
    i = 0
    while i < @blocks.length
      do (i) ->
        if self.blocks[i].getBoundingClientRect().top > window.innerHeight * self.offset
          self.images[i].classList.add 'cd-is-hidden'
          self.contents[i].classList.add 'cd-is-hidden'
        return
      i++
    return

  VerticalTimeline::showBlocks = ->
    if !'classList' of document.documentElement
      return
    self = this
    i = 0
    while i < @blocks.length
      do (i) ->
        if self.contents[i].classList.contains('cd-is-hidden') and self.blocks[i].getBoundingClientRect().top <= window.innerHeight * self.offset
          # add bounce-in animation
          self.images[i].classList.add 'cd-timeline__img--bounce-in'
          self.contents[i].classList.add 'cd-timeline__content--bounce-in'
          self.images[i].classList.remove 'cd-is-hidden'
          self.contents[i].classList.remove 'cd-is-hidden'
        return
      i++
    return

  verticalTimelines = document.getElementsByClassName('js-cd-timeline')
  verticalTimelinesArray = []
  scrolling = false
  if verticalTimelines.length > 0
    i = 0
    while i < verticalTimelines.length
      do (i) ->
        verticalTimelinesArray.push new VerticalTimeline(verticalTimelines[i])
        return
      i++
    #show timeline blocks on scrolling
    window.addEventListener 'scroll', (event) ->
      if !scrolling
        scrolling = true
        if !window.requestAnimationFrame then setTimeout(checkTimelineScroll, 250) else window.requestAnimationFrame(checkTimelineScroll)
      return
  return
