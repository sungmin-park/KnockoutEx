{bindingHandlers} = ko
{unwrapObservable} = ko.utils

ko.bindingHandlers.backgroundCover =
  update: (element, valueAccessor) ->
    value = unwrapObservable valueAccessor()
    if $.browser.msie and parseInt($.browser.version) < 9
      $el = $(element)
      $el.css('position', 'relative').prepend(
        $('<img>')
          .attr('src', value)
          .css('position', 'relative')
          .css('top', 0).css('left', 0)
          .width($el.width()).height($el.height())
      )
    else
      $(element)
        .css('background-image', "url(#{value})")
        .css('background-size', 'cover')