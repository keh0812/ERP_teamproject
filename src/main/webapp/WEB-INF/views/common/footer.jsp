<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <!-- Favicon -->
    <link rel="shortcut icon" href="${project}img/favicon.ico">

    <!-- Template -->
    <link rel="stylesheet" href="${project}css/graindashboard.css">
</head>
<body>
<!-- Footer -->
        <footer class="small p-3 px-md-4 mt-auto">
            <div class="row justify-content-between">
                <div class="col-lg text-center text-lg-left mb-3 mb-lg-0">
                    <ul class="list-dot list-inline mb-0">
                        <li class="list-dot-item list-dot-item-not list-inline-item mr-lg-2"><a class="link-dark" href="#">FAQ</a></li>
                        <li class="list-dot-item list-inline-item mr-lg-2"><a class="link-dark" href="#">Support</a></li>
                        <li class="list-dot-item list-inline-item mr-lg-2"><a class="link-dark" href="#">Contact us</a></li>
                    </ul>
                </div>

                <div class="col-lg text-center mb-3 mb-lg-0">
                    <ul class="list-inline mb-0">
                        <li class="list-inline-item mx-2"><a class="link-muted" href="#"><i class="gd-twitter-alt"></i></a></li>
                        <li class="list-inline-item mx-2"><a class="link-muted" href="#"><i class="gd-facebook"></i></a></li>
                        <li class="list-inline-item mx-2"><a class="link-muted" href="#"><i class="gd-github"></i></a></li>
                    </ul>
                </div>
			  <script>
			  window.addEventListener("message", function (event) {
			      if (event.data.hasOwnProperty("frameSize")) {
			          const size = event.data.frameSize;
			          document.getElementById("uipath-chatbot-iframe").style.height = size.height;
			          document.getElementById("uipath-chatbot-iframe").style.width = size.width;
			      }
			  });
			</script>
			<iframe src="https://chatbot.uipath.com/web-channel?connectionId=3320a4f5-a034-4f82-b5ad-b5373f46d6b6"
			  id="uipath-chatbot-iframe"
			  style="
			      z-index: 9999;
			      position: fixed;
			      bottom: 0;
			      right: 0;
			      height: 112px;
			      width: 120px;
			      border: 0;">
			</iframe>
				
                <div class="col-lg text-center text-lg-right">
                    &copy; 2021. Team UsERP. all rights reserved.
                </div>
            </div>
        </footer>
        <!-- End Footer -->
</body>
</html>