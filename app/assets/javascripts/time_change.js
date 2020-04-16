//夕方以降の背景変更
$(document).on('turbolinks:load',function(){
  var getH = new Date().getHours();
  if((getH >= 6) && (getH < 17)) { $('.chat').removeClass('night').addClass('morning'); }
  else if( (getH >= 18) || (getH < 5) ) { $('.chat').removeClass('morning').addClass('night'); }
});