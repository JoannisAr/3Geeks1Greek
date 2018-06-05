           <!-- === BEGIN CONTENT === -->
            <div id="content">
                <div class="container background-white">
                    <div class="row margin-vert-30">
                        <!-- Register Box -->
                        <div class="col-md-6 col-md-offset-3 col-sm-offset-3">
                            <form class="signup-page" action="<?php echo site_url('Gost/registrujSeKuvar'); ?>" enctype="multipart/form-data" method='post'>
                                <input type="hidden" value="<?php echo $ime; ?>" name="ime">
                                <input type="hidden" value="<?php echo $prezime; ?>" name="prezime">
                                <input type="hidden" value="<?php echo $email; ?>" name="email">
                                <input type="hidden" value="<?php echo $username; ?>" name="username">
                                <input type="hidden" value="<?php echo $password; ?>" name="password">
                                
                                <div class="signup-header">
                                    <h2>Chef registration</h2>
                                    <p>Please fill in the following registration form.</p>
                                </div>
                               
								<hr>
								<label><b>Place to upload a CV:</b></label>
                                <input class="form-control margin-bottom-20" type="file" name='cv' required>
                                 <td><?php echo form_error("cv","<font color='red'>","</font>"); ?></td>
								<br>
								<label><b>Additional comments:</b></label>
                               
                                <textarea rows="4" cols="50" name="comment">
								Enter text here...</textarea>
								<br>
								<button class="btn btn-primary" type="submit">Submit and get started</button>
                            </form>
                        </div>
                        <!-- End Register Box -->
                    </div>
                </div>
            </div>