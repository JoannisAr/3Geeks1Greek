    <!-- === BEGIN CONTENT === -->
            <div id="content">
                <div class="container background-white">
                    <div class="container">
                        <div class="row margin-vert-30">
                            <!-- Login Box -->
                            <div class="col-md-6 col-md-offset-3 col-sm-offset-3">
                                 <form class="login-page" action="<?php echo site_url('Gost/ulogujSe') ?>" method="post">
                                    <?php if(isset($poruka))
					echo "<font color='red'>$poruka</font><br>";
                                    ?>
                                     <div class="login-header margin-bottom-30">
                                        <h2>Login to your account</h2>
                                    </div>
                                    <div class="input-group margin-bottom-20">
                                        <span class="input-group-addon">
                                            <i class="fa fa-user"></i>
                                        </span>
                                        <input placeholder="Username" class="form-control" type="text" name="username">
                                         <td><?php echo form_error("username","<font color='red'>","</font>"); ?></td>
                                    </div>
                                    <div class="input-group margin-bottom-20">
                                        <span class="input-group-addon">
                                            <i class="fa fa-lock"></i>
                                        </span>
                                        <input placeholder="Password" class="form-control" type="password" name="password">
                                         <td><?php echo form_error("password","<font color='red'>","</font>"); ?></td>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <label class="checkbox">
                                                <input type="checkbox">Stay signed in</label>
                                        </div>
                                        <div class="col-md-6">
                                            <button class="btn btn-primary pull-right" type="submit">Login</button>
                                        </div>
                                    </div>
                                   
                                </form>
                            </div>
                            <!-- End Login Box -->
                        </div>
                    </div>
                </div>
            </div>
   