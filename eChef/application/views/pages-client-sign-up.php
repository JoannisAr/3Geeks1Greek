<!-- End Top Menu -->
<!-- === END HEADER === -->
<!-- === BEGIN CONTENT === -->
<div id="content">
    <div class="container background-white">
        <div class="row margin-vert-30">
            <!-- Register Box -->
            <div class="col-md-6 col-md-offset-3 col-sm-offset-3">
                <form class="signup-page" action="<?php echo site_url('Gost/registrujSeKorisnik'); ?>" method="post">
                    <?php if(isset($poruka))
					echo "<font color='red'>$poruka</font><br>";
                    ?>
                    <input type="hidden" value="<?php echo $ime; ?>" name="ime">
                    <input type="hidden" value="<?php echo $prezime; ?>" name="prezime">
                    <input type="hidden" value="<?php echo $email; ?>" name="email">
                    <input type="hidden" value="<?php echo $username; ?>" name="username">
                    <input type="hidden" value="<?php echo $password; ?>" name="password">
                    

                    <div class="signup-header">
                        <h2>Client registration</h2>
                        <p>Please fill the following form to get started.</p>
                    </div>
                    <label><b>My prefered food:</b></label>
                    <br>
                    <label>Fruit and vegetables</label>
                    <select class="form-control margin-bottom-20" multiple size="5" name="veggie[]" required>
  

                        <option value="Potato">Potato</option>
                        <option value="Onion">Onion</option>
                        <option value="Pepper">Pepper</option>
                        <option value="carrot">Carrot</option>

                        <option value="Peas">Peas</option>
                        <option value="Broccoli">Broccoli</option>
			<option value="Avocado">Avocado</option>

                        <option value="Corn">Corn</option>
                        <option value="Tomato">Tomato</option>
                        <option value="Beetroot">Beetroot</option>
                        <option value="Pumpkin">Pumpkin</option>
                        <option value="Apple">Apple</option>
                        <option value="Pear">Pear</option>

                        <option value="Strawberry">Strawberry</option>
                        <option value="Pineapple">Pineapple</option>
                        <option value="Orange">Orange</option>
                    </select>
                    <label>Meats</label>

                    <select class="form-control margin-bottom-20" multiple size="5" name="meat[]" required>
                        <option value="Lamb">Lamb</option>
                        <option value="Pork">Pork</option>
                        <option value="Chicken">Chicken</option>
                        <option value="Fish">Fish</option>
                        <option value="Seafood">Seafood</option>
                    </select>

                </label>Dessert flavours<label>
                <select class="form-control margin-bottom-20" multiple size="5" name="ukusi[]" required>
                    <option value="Chocolate">Chocolate</option>
                    <option value="Vanilla">Vanilla</option>
                    <option value="Caramel">Caramel</option>


                </select>
                <div class="row">
                    <div class="col-sm-6">
                        <label><b>Gender:</b>
                        </label>
                    </div>
                    <div class="col-sm-6">
                        <input type="radio" name="gender" value="female" checked> Female
                    </div>
                    <div class="col-sm-6">
                        <input type="radio" name="gender" value="male"> Male
                    </div>
                </div>
                <hr>

                <div class="row">
                    <div class="col-sm-6">
                    </label>Allergies<label>
                    <select class="form-control margin-bottom-20" multiple size="3" name="alergije[]">
                        <option value="Milk">Milk</option>
                        <option value="Peanut">Peanut</option>
                        <option value="Hazelnut">Hazelnut</option>
                        <option value="Soy">Soy</option>

                    </select>
                     </div>

            <div class="col-lg-4 text-right">
                <a><button class="btn btn-primary" type="submit">Submit and get started</button></a>
            </div>
        </div>
</form>
</div>
<!-- End Register Box -->
</div>
</div>
</div>
<!-- === END CONTENT === -->	