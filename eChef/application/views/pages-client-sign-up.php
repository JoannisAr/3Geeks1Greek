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
                        <option value="potato">Potato</option>
                        <option value="onion">Onion</option>
                        <option value="pepper">Pepper</option>
                        <option value="carrot">Carrot</option>
                        <option value="peas">Peas</option>
                        <option value="broccoli">Broccoli</option>
			<option value="avocado">Avocado</option>
                        <option value="corn">Corn</option>
                        <option value="tomato">Tomato</option>
                        <option value="beetroot">Beetroot</option>
                        <option value="pumpkin">Pumpkin</option>
                        <option value="apple">Apple</option>
                        <option value="pear">Pear</option>
                        <option value="strawberry">Strawberry</option>
                        <option value="pineapple">Pineapple</option>
                        <option value="orange">Orange</option>
                    </select>
                    <label>Meats</label>
                    <select class="form-control margin-bottom-20" multiple size="5" name="meat[]" required>
                        <option value="lamb">Lamb</option>
                        <option value="pork">Pork</option>
                        <option value="chicken">Chicken</option>
                        <option value="fish">Fish</option>
                        <option value="seafood">Seafood</option>
                    </select>

                </label>Dessert flavours<label>
                <select class="form-control margin-bottom-20" multiple size="5" name="ukusi[]" required>
                    <option value="chocolate">Chocolate</option>
                    <option value="vanilla">Vanilla</option>
                    <option value="caramel">Caramel</option>
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
                        <option value="milk">Milk</option>
                        <option value="peanut">Peanut</option>
                        <option value="hazelnut">Hazelnut</option>
                        <option value="soy">Soy</option>

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