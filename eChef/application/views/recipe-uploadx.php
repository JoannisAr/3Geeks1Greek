<div id="content">
    <div class="container background-white">
        <div class="row margin-vert-30">
            <!-- Register Box -->
            <div class="col-md-6 col-md-offset-3 col-sm-offset-3">
                <form class="upload recipe" action="<?php echo site_url('Kuvar/postavitiRecept');?> " method='post'>
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
                        <input type="checkbox" name="chk_group1[]" value="potato" />Potato
                        <input type="checkbox" name="chk_group1[]" value="onion" />Onion
                        <input type="checkbox" name="chk_group1[]" value="pepper" />Pepper<br />
                        <input type="checkbox" name="chk_group1[]" value="carrot" />Carrot
                        <input type="checkbox" name="chk_group1[]" value="greenBeans" />Green beans
                        <input type="checkbox" name="chk_group1[]" value="peas" />Peas<br />
                        <input type="checkbox" name="chk_group1[]" value="broccoli" />Broccoli
                        <input type="checkbox" name="chk_group1[]" value="corn" />Corn
                        <input type="checkbox" name="chk_group1[]" value="tomato" />Tomato<br />
                        <input type="checkbox" name="chk_group1[]" value="beetroot" />Beetroot
                        <input type="checkbox" name="chk_group1[]" value="pumpkin" />Pumpkin
                        <input type="checkbox" name="chk_group1[]" value="apple" />Apple<br />
                        <input type="checkbox" name="chk_group1[]" value="pear" />Pear
                        <input type="checkbox" name="chk_group1[]" value="berries" />Berries
                        <input type="checkbox" name="chk_group1[]" value="pineapple" />Pineapple<br />
                        <input type="checkbox" name="chk_group1[]" value="orange" />Orange  
                    </div>
                    <label>Meats</label>
                    <div>
                        <input type="checkbox" name="chk_group2[]" value="lamb" />Lamb
                        <input type="checkbox" name="chk_group2[]" value="pork" />Pork
                        <input type="checkbox" name="chk_group2[]" value="chicken" />Chicken<br />
                        <input type="checkbox" name="chk_group2[]" value="fish" />Fish
                        <input type="checkbox" name="chk_group2[]" value="seafood" />seafood
                        <input type="checkbox" name="chk_group2[]" value="other" />Other<br />
                    </div>

                    <label>Dessert flavours</label>
                    <div>
                        <input type="checkbox" name="chk_group3[]" value="chocolate" />Chocolate
                        <input type="checkbox" name="chk_group3[]" value="vanilla" />Vanilla
                        <input type="checkbox" name="chk_group3[]" value="caramel" />Caramel<br />
                        <input type="checkbox" name="chk_group3[]" value="berries" />Berries
                        <input type="checkbox" name="chk_group3[]" value="otherFruits" />Other fruits
                        <input type="checkbox" name="chk_group3[]" value="nuts" />Nuts<br />
                    </div>
                    <label><b>Choose a recipe category:</b></label>
                    <select class="form-control margin-bottom-20" required size="5" name="categories[]">
                        <option value="lamb">Lamb</option>
                        <option value="turkey">Turkey</option>
                        <option value="chicken">Chicken</option>
                        <option value="beef">Beef</option>
                        <option value="pork">Pork</option>
                        <option value="fish">Fish</option>
                        <option value="seafood">Seafood</option>
                        <option value="fruit">Fruit</option>
                        <option value="vegetables">Vegetables</option>
                        <option value="pasta">Pasta</option>
                        <option value="riceRisottoOrzo">Rice, Risotto, Orzo</option>
                        <option value="chocolate">Chocolate</option>
                    </select>	
                    <label><b>Special meal :</b></label>
                    <select class="form-control margin-bottom-20" required size="5" name="specMeals[]">
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