<div id="content">
    <div class="container background-white">
        <div class="row margin-vert-30">
            <!-- Register Box -->
            <div class="col-md-6 col-md-offset-3 col-sm-offset-3">
                <form class="upload recipe" action="<?php echo site_url('Kuvar/postavitiRecept');?> " method='post'  enctype="multipart/form-data">
                    <div class="neka-a">
                        <h2><b>Recipe upload</b></h2>
                    </div>
                    <hr>
                    <div class="col-md-6">
                        <label><b>Name of recipe :</b></label>
                        <div class="input-group margin-bottom-20">
                            <input class="form-control" type="text" name="recipe_name" >
                        </div>
                    </div>
                    <div class="col-md-6">			
                        <label><b>Place to upload a photo:</b></label>
                        <input class="form-control margin-bottom-20" type="file" name="image" accept="image/*">
                    </div>	
                    <div>                      
                        <label class="pull-left"><b>Instructions:</b></label>
                        <textarea rows="4" cols="50" name="instructions" style="width:476px;height:290px;resize:none">Enter text here...</textarea>
                    </div>
                    <br>
                   <label>Fruit and vegetables</label>
                    <div>
                        <input type="checkbox" name="chk_group[]" value="Potato" />Potato
                        <input type="checkbox" name="chk_group[]" value="Onion" />Onion
                        <input type="checkbox" name="chk_group[]" value="Pepper" />Pepper<br />
                        <input type="checkbox" name="chk_group[]" value="Carrot" />Carrot
                        <input type="checkbox" name="chk_group[]" value="GreenBeans" />Green beans
                        <input type="checkbox" name="chk_group[]" value="Peas" />Peas<br />
                        <input type="checkbox" name="chk_group[]" value="Broccoli" />Broccoli
                        <input type="checkbox" name="chk_group[]" value="Corn" />Corn
                        <input type="checkbox" name="chk_group[]" value="Tomato" />Tomato<br />
                        <input type="checkbox" name="chk_group[]" value="Beetroot" />Beetroot
                        <input type="checkbox" name="chk_group[]" value="Pumpkin" />Pumpkin
                        <input type="checkbox" name="chk_group[]" value="Apple" />Apple<br />
                        <input type="checkbox" name="chk_group[]" value="Pear" />Pear
                        <input type="checkbox" name="chk_group[]" value="Berries" />Berries
                        <input type="checkbox" name="chk_group[]" value="Pineapple" />Pineapple<br />
                        <input type="checkbox" name="chk_group[]" value="Orange" />Orange  
                    </div>
                    <label>Meats</label>
                    <div>
                        <input type="checkbox" name="chk_group[]" value="Lamb" />Lamb
                        <input type="checkbox" name="chk_group[]" value="Pork" />Pork
                        <input type="checkbox" name="chk_group[]" value="Beef" />Beef
                        <input type="checkbox" name="chk_group[]" value="Chicken" />Chicken<br />
                        <input type="checkbox" name="chk_group[]" value="Fish" />Fish
                        <input type="checkbox" name="chk_group[]" value="Seafood" />seafood
                        <input type="checkbox" name="chk_group[]" value="Other" />Other<br />
                    </div>

                    <label>Dessert flavours</label>
                    <div>
                        <input type="checkbox" name="chk_group[]" value="Chocolate" />Chocolate
                        <input type="checkbox" name="chk_group[]" value="Vanilla" />Vanilla
                        <input type="checkbox" name="chk_group[]" value="Caramel" />Caramel<br />
                        <input type="checkbox" name="chk_group[]" value="Berries" />Berries
                        <input type="checkbox" name="chk_group[]" value="OtherFruits" />Other fruits
                        <input type="checkbox" name="chk_group[]" value="Nuts" />Nuts<br />
                    </div>
                    <label><b>Choose a recipe category:</b></label>
                    <select class="form-control margin-bottom-20" required size="5" name="categories[]" >
                        <option value="Lamb">Lamb</option>
                        <option value="Turkey">Turkey</option>
                        <option value="Chicken">Chicken</option>
                        <option value="Beef">Beef</option>
                        <option value="Pork">Pork</option>
                        <option value="Fish">Fish</option>
                        <option value="Seafood">Seafood</option>
                        <option value="Fruit">Fruit</option>
                        <option value="Vegetables">Vegetables</option>
                        <option value="Pasta">Pasta</option>
                        <option value="RiceRisottoOrzo">Rice, Risotto, Orzo</option>
                        <option value="Chocolate">Chocolate</option>
                    </select>	
                    <label><b>Special meal :</b></label>
                    <select class="form-control margin-bottom-20" required size="5" name="specMeals[]" >
                        <option value="Breakfast">Breakfast</option>
                        <option value="Lunch">Lunch</option>
                        <option value="Dessert">Dessert</option>
                        <option value="Dinner">Dinner</option>
                    </select>	
                    <label><b>Holiday recipe :</b></label>
                    <select class="form-control margin-bottom-20" required size="5" name="holidayRecipe[]" >
                        <option value="Christmas">Christmas</option>
                        <option value="Easter">Easter</option>
                        <option value="Dinner Parties">Dinner Parties</option>
                        <option value="Valentines Day">Valentines Day</option>
                        <option value="Bbq">Bbq</option>
                        <option value="Children's birthday party">Children's birthday party</option>
                    </select>	
                    <button class="btn btn-primary" type="submit">Upload</button>
                </form>
            </div>
        </div>
    </div>
</div>