     <!-- === BEGIN CONTENT === -->
            <div id="content">
                <div class="container background-white">
                    <div class="row margin-vert-30">
                        <!-- Register Box -->
                        <div class="col-md-6 col-md-offset-3 col-sm-offset-3">
                            <form class="signup-page" method="post" action="<?php echo site_url('Gost/registerKorisnik') ?>">
                                
                                <?php if(isset($poruka))
					echo "<font color='red'>$poruka</font><br>";
                                ?>
                                <div class="signup-header">
                                    <h2>Register a new account</h2>
                                    <p>Already a member? Click
                                        <a href=<?php echo site_url("Gost/login") ?>>HERE</a>to login to your account.</p>
                                </div>
                                <label>First Name</label>
                                <input class="form-control margin-bottom-20" type="text" name="ime" value="<?php echo set_value('ime') ?>">
                                 <td><?php echo form_error("ime","<font color='red'>","</font>"); ?></td>
                                <label>Last Name</label>
                                <input class="form-control margin-bottom-20" type="text" name="prezime" value="<?php echo set_value('prezime') ?>">
                                 <td><?php echo form_error("prezime","<font color='red'>","</font>"); ?></td>
                                <label>Email Address
                                    <span class="color-red">*</span>
                                </label>
                                <input class="form-control margin-bottom-20" type="text" name="email" value="<?php echo set_value('email') ?>">
                                 <td><?php echo form_error("email","<font color='red'>","</font>"); ?></td>
                                <label>Username</label>
                                <input class="form-control margin-bottom-20" type="text" name="username">
                                 <td><?php echo form_error("username","<font color='red'>","</font>"); ?></td>
                                <div class="row">
                                    <div class="col-sm-6">
                                        <label>Password
                                            <span class="color-red">*</span>
                                        </label>
                                        <input class="form-control margin-bottom-20" type="password" name="password">
                                         <td><?php echo form_error("password","<font color='red'>","</font>"); ?></td>
                                    </div>
                                    <div class="col-sm-6">
                                        <label>Confirm Password
                                            <span class="color-red">*</span>
                                        </label>
                                        <input class="form-control margin-bottom-20" type="password" name="password2">
                                         <td><?php echo form_error("password2","<font color='red'>","</font>"); ?></td>
                                    </div>
                                </div>
                                <hr>
                                <div class="row">
                                    <div class="col-lg-8">
                                        <label class="checkbox">
                                            <input type="checkbox">I read the
                                            <a href="#">Terms and Conditions</a>
                                        </label>
                                    </div>
                                    <div class="col-lg-4 text-right">
										
                                        <button class="btn btn-primary" type="submit" name="client">Register as a client</button>
                                        
                                        <br>
                                        <br>
										
                                        <button class="btn btn-primary" type="submit" name="chef">Register as a chef</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <!-- End Register Box -->
                    </div>
                </div>
            </div>
       