// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
Element.update = function (element, html) {
  $('#' + element).html(html);
}
