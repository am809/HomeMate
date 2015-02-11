    <!-- #########################################################      go top button     ############################################################              -->    
    
    <a id="back-to-top" href="#" class="btn btn-primary btn-lg back-to-top" role="button"><span class="glyphicon glyphicon-chevron-up"></span></a>
    <hr class="featurette-divider">
    <div class="container">
    
    
    
<!-- #########################################################      footer     ############################################################              -->
    
    <footer>
        <div class="contact-box">
            <div class="row">
                <div class="col-sm-3">
                    <p>Copyright © HomeMate 2014-2015</p>
                </div>
                <div class="col-sm-9">
                    <h5>Follow me on <a href="https://www.facebook.com">Facebook</a>, <a href="https://plus.google.com">Google Plus</a> & <a href="https://www.youtube.com">Youtube</a> or send mail to <a href="mailto:dev@homemate.com">Developer</a></h5>
                </div>
            </div>
        </div>
    </footer>
    
    </div>
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
    <script>$(document).ready(function(){
     $(window).scroll(function () {
            if ($(this).scrollTop() > 50) {
                $('#back-to-top').fadeIn();
            } else {
                $('#back-to-top').fadeOut();
            }
        });
        $('#back-to-top').click(function () {
            $('body,html').animate({
                scrollTop: 0
            }, 800);
            return false;
        });
    });
    </script>
    <script language="javascript">
        document.onmousedown=disableclick;
        status="Right Click Disabled";
        Function disableclick(event)
        {
          if(event.button==2)
           {
             alert(status);
             return false;    
           }
        }
    </script>


  
  <!-- END BODY -->
