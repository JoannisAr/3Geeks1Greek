<div id="content">
    <div class="container background-white">
        <div class="row margin-vert-30">
            <!-- Register Box -->
            <div class="col-md-6 col-md-offset-3 col-sm-offset-3">
                <form class="neka">
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
                        <input class="form-control margin-bottom-20" type="file" name="pic" accept="image/*">
                    </div>	
                    <div>                      
                        <label class="pull-left"><b>Instructions:</b></label>
                        <textarea rows="4" cols="50" name="instructions" style="width:476px;height:290px;resize:none">Enter text here...</textarea>
                    </div>
                    <label><b>Choose a recipe category:</b></label>
                    <select class="form-control margin-bottom-20" required size="5">
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
                    <select class="form-control margin-bottom-20" required size="5">
                        <option value="Breakfast">Breakfast</option>
                        <option value="Lunch">Lunch</option>
                        <option value="Dessert">Dessert</option>
                        <option value="Dinner">Dinner</option>
                    </select>	
                    <label><b>Holiday recipe :</b></label>
                    <select class="form-control margin-bottom-20" required size="5">
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
            <!-- End Register Box -->
        </div>
    </div>
</div>