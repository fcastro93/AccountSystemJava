<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="robots" content="noindex,nofollow" />
<title>Dynamically attach jQuery DatePicker to Text box </title>
<link rel="stylesheet" href="/resources/themes/master.css" type="text/css" />
<link
 href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css"
 rel="stylesheet" type="text/css" />
<script
 src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.js"
 type="text/javascript"></script>
<script
 src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"
 type="text/javascript"></script>
<script
 src="http://ajax.microsoft.com/ajax/jquery.validate/1.7/jquery.validate.js"
 type="text/javascript"></script>
<script src="/resources/scripts/mysamplecode.js" type="text/javascript"></script>
 
<script type="text/javascript">
$(document).ready(function() {
 
 var myCounter = 1;
 $(".myDate").datepicker();
  
 $("#moreDates").click(function(){
   
  $('.myTemplate')
   .clone()
   .removeClass("myTemplate")
   .addClass("additionalDate")
   .show()
   .appendTo('#importantDates');
   
  myCounter++;
  $('.additionalDate input[name=inputDate]').each(function(index) {
   $(this).addClass("myDate");
   $(this).attr("name",$(this).attr("name") + myCounter);
  });
   
  $(".myDate").on('focus', function(){
      var $this = $(this);
      if(!$this.data('datepicker')) {
       $this.removeClass("hasDatepicker");
       $this.datepicker();
       $this.datepicker("show");
      }
  });
   
 });
  
});
</script>
</head>
<body>
 <div id="allContent">
  <div id="myContent">
   <form id="samplecode" name="samplecode" method="POST" action="">
     <fieldset>
      <legend><b>&nbsp;&nbsp;&nbsp;jQuery DatePicker DEMO&nbsp;&nbsp;&nbsp;</b></legend>
      <div id="importantDates">
       <p>
        Please list all important dates for 2012...
       </p>
       <p>
        <input class="myDate" type="text" name="inputDate1" size="10" value=""/>&nbsp;(mm/dd/yyyy)
       </p>
      <div class="myTemplate" style="display:none">
       <p>
        <input type="text" name="inputDate" size="10" value=""/>&nbsp;(mm/dd/yyyy)
       </p>
      </div>
      </div>
      <input id="moreDates" type="button" value="Add more Dates" /> 
       
     </fieldset>
   </form>
  </div>
 </div>
 
 <div></div>
</body>
</html>