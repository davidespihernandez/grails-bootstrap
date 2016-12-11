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

    <body>
       <div class="wrapper">
           <!-- top navbar-->
           <header class="topnavbar-wrapper">
               <!-- START Top Navbar-->
               <nav role="navigation" class="navbar topnavbar">
                   <!-- START navbar header-->
                   <div class="navbar-header">
                       <a href="#/" class="navbar-brand">
                           <div class="brand-logo">
                               <asset:image src="logo.png" class="img-responsive" alt="App Logo"/>
                           </div>
                           <div class="brand-logo-collapsed">
                               <asset:image src="logo-single.png" class="img-responsive" alt="App Logo"/>
                           </div>
                       </a>
                   </div>
                   <div class="nav-wrapper">
                       <ul class="nav navbar-nav navbar-right">
                           <!-- START lock screen-->
                           <li class="dropdown">
                               <sec:ifLoggedIn>
                                   <g:link controller="logout">
                                       <em class="icon-logout"></em> &nbsp;
                                       <sec:username/>
                                   </g:link>
                               </sec:ifLoggedIn>
                           </li>
                       </ul>
                   </div>
               <!-- END navbar header-->
               </nav>
           <!-- END Top Navbar-->
           </header>

           <aside class="aside">
               <!-- START Sidebar (left)-->
               <div class="aside-inner">
                   <nav data-sidebar-anyclick-close="" class="sidebar">
                       <!-- START sidebar nav-->
                       <ul class="nav">
                           <li class=" ">
                               <a href="#master" title="Master tables" data-toggle="collapse">
                                   <em class="icon-grid"></em>
                                   <span>Master tables</span>
                               </a>
                               <ul id="master" class="nav sidebar-subnav collapse">
                                   <li class="sidebar-subnav-header">Master tables</li>
                                   <li class=" ">
                                       <g:link controller="product" action="index">Products</g:link>
                                   </li>
                                   <li class=" ">
                                       <g:link controller="product" action="index">Other...</g:link>
                                   </li>
                               </ul>
                               <a href="#security" title="Security" data-toggle="collapse">
                                   <em class="icon-lock"></em>
                                   <span>Security</span>
                               </a>
                               <ul id="security" class="nav sidebar-subnav collapse">
                                   <li class="sidebar-subnav-header">Security</li>
                                   <li class=" ">
                                       <g:link controller="role">Roles</g:link>
                                   </li>
                                   <li class=" ">
                                       <g:link controller="group" action="search">Groups</g:link>
                                   </li>
                                   <li class=" ">
                                       <g:link controller="requestmap">Request maps</g:link>
                                   </li>
                               </ul>

                           </li>
                       </ul>
                       <!-- END sidebar nav-->
                   </nav>
               </div>
               <!-- END Sidebar (left)-->
           </aside>

           <section>
                <!-- Page content-->
                <div class="content-wrapper">
                    <g:layoutBody/>
                </div>

            </section>
           <footer>
               <span>&copy; 2016 - David </span>
           </footer>
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
