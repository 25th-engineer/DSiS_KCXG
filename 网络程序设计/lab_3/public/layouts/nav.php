    <nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Menu</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="/">隔壁班花好漂酿~~~</a>
        </div>
        <div id="navbar" class="collapse navbar-collapse">
          <ul class="nav navbar-nav">
          <li class="active"><a href="#">Home</a></li>
          <?php 
              if (!isset($_SESSION['user'])) {
           ?>
            <li><a href="#Register" data-toggle="modal" data-target="#register">Register</a></li>
            <li><a href="#Register" data-toggle="modal" data-target="#login">Login</a></li>
            <?php
               }else{ 
             ?>
              <li><a href="https://blog.csdn.net/u25th_engineer" target="_blank">Blog</a></li>
              <li><a href="admin/Logout.php" >Logout</a></li>
            <?php
               } 
             ?>
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </nav>