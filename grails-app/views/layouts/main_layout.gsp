<!doctype html>
<html lang="en">
    <head>
        <title>
            <g:layoutTitle default="Grails + bootstrap"/>
        </title>


       <meta charset="utf-8">
       <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
       <meta name="description" content="Bootstrap Admin App + jQuery">
       <meta name="keywords" content="app, responsive, jquery, bootstrap, dashboard, admin">
       <title>Grails + Bootstrap</title>
       <!-- =============== VENDOR STYLES ===============-->
       <!-- FONT AWESOME-->
       <asset:stylesheet src="vendor/fontawesome/css/font-awesome.min.css" />
       <!-- SIMPLE LINE ICONS-->
       <asset:stylesheet src="vendor/simple-line-icons/css/simple-line-icons.css" />
       <!-- ANIMATE.CSS-->
       <asset:stylesheet src="vendor/animate.css/animate.min.css" />
       <!-- WHIRL (spinners)-->
       <asset:stylesheet src="vendor/whirl/dist/whirl.css" />
       <!-- =============== BOOTSTRAP STYLES ===============-->
       <asset:stylesheet src="bootstrap.css" />
       <!-- =============== APP STYLES ===============-->
       <asset:stylesheet src="app.css" />

        <g:layoutHead/>
    </head>

    <body class="layout-h">
       <div class="wrapper">
          <!-- top navbar-->
          <header class="topnavbar-wrapper">
             <!-- START Top Navbar-->
             <nav role="navigation" class="navbar topnavbar">
                <!-- START navbar header-->
                <div class="navbar-header">
                   <button type="button" data-toggle="collapse" data-target=".navbar-collapse" class="navbar-toggle">
                      <span class="sr-only">Toggle navigation</span>
                      <span class="icon-bar"></span>
                      <span class="icon-bar"></span>
                      <span class="icon-bar"></span>
                   </button>
                   <a href="#/" class="navbar-brand">
                      <div class="brand-logo">
                          <asset:image src="atkloud_logo.png" class="img-responsive" alt="App Logo"/>
                      </div>
                      <div class="brand-logo-collapsed">
                          <asset:image src="atkloud_logo.png" class="img-responsive" alt="App Logo"/>
                      </div>
                   </a>
                </div>
                <!-- END navbar header-->
                <!-- START Nav wrapper-->
                <div class="navbar-collapse collapse">
                   <!-- START Left navbar-->
                   <ul class="nav navbar-nav">
                      <li></li>
                      <li><a href="#dashboard" data-toggle="dropdown">Products</a>
                         <ul class="dropdown-menu animated fadeIn">
                            <li><g:link controller="product" action="list">List</g:link>
                            </li>
                             <li><g:link controller="product" action="list">New</g:link>
                             </li>
                         </ul>
                      </li>
                   </ul>
                </div>
             </nav>
          </header>
           <section>
                <!-- Page content-->
                <div class="content-wrapper">
                    <g:layoutBody/>
                </div>

                <footer>
                    <span>&copy; 2016 - David </span>
                </footer>
            </section>
        </div>

   <!-- =============== VENDOR SCRIPTS ===============-->
   <!-- MODERNIZR-->
    <asset:javascript src="vendor/modernizr/modernizr.custom.js"/>
   <!-- MATCHMEDIA POLYFILL-->
    <asset:javascript src="vendor/matchMedia/matchMedia.js"/>
   <!-- JQUERY-->
    <asset:javascript src="vendor/jquery/dist/jquery.js"/>
   <!-- BOOTSTRAP-->
    <asset:javascript src="vendor/bootstrap/dist/js/bootstrap.js"/>
   <!-- STORAGE API-->
    <asset:javascript src="vendor/jQuery-Storage-API/jquery.storageapi.js"/>
   <!-- JQUERY EASING-->
    <asset:javascript src="vendor/jquery.easing/js/jquery.easing.js"/>
   <!-- ANIMO-->
    <asset:javascript src="vendor/animo.js/animo.js"/>
   <!-- SLIMSCROLL-->
    <asset:javascript src="vendor/slimScroll/jquery.slimscroll.min.js"/>
   <!-- =============== PAGE VENDOR SCRIPTS ===============-->
   <!-- SPARKLINE-->
    <asset:javascript src="vendor/sparkline/index.js"/>
   <!-- CLASSY LOADER-->
    <asset:javascript src="vendor/jquery-classyloader/js/jquery.classyloader.min.js"/>
   <!-- =============== APP SCRIPTS ===============-->


    </body>
</html>
