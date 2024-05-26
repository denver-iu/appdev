<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Milk Tea Order Form</title>
    <style>
    body {
    font-family: 'Roboto', sans-serif;
    background-color: #f9f5f2;
    margin: 0;
    padding: 0;
    background-image: url('./imgs/bg.jpg');
}

.container {
    width: 90%;
    max-width: 800px;
    margin: 30px auto;
    padding: 20px;
    background-color: #fff;
    box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
    border-radius: 10px;
}

h1 {
    text-align: center;
    color: #6d4c41;
    font-size: 2em;
}

form {
    display: flex;
    flex-direction: column;
}

.cus-details, .order-details, .toppings {
    margin-bottom: 20px;
    padding: 10px;
    border: 1px solid #000;
    border-radius: 8px;
}

.form-group {
    display: flex;
    align-items: center;
    margin-bottom: 10px;
}

.form-group label {
    width:150px;
    margin-right: 10px;
    font-weight: bold;
}

.sugar-lvl, .checkbox-group {
    display: flex;
    flex-direction: column;
}

.sugar-lvl .form-group, .checkbox-group .form-group {
    display: flex;
    align-items: center;
    margin-bottom: 5px;
}

input[type="radio"], input[type="checkbox"] {
    margin-right: 10px;
}


input[type="text"],
input[type="tel"],
input[type="email"],
select {
    margin-bottom: 10px;
}

input[type="submit"] {
	margin-top: 1em;
	padding: 10px;
}
    </style>
</head>
<body>

 		<% String username = request.getParameter("username"); %>
        <% if (username == null) { %>
        <% 		response.sendRedirect("login.jsp"); %>
        <% } %>
     <div class="container">
        <h1>Milk Tea Order Form</h1>
        <form action=<%=  "Pos?username="+username %> method="post">
            <div class="cus-details">
                <h2>Order Information</h2>
                <div class="form-group">
                    <label for="phone">Contact Number:</label>
                    <input type="tel" id="phone" name="contact_number" required>
                </div>
            </div>

            <div class="order-details">
                <h2>Order Details</h2>
                <div class="form-group">
                    <label for="tea_base">Tea Base:</label>
                    <select id="tea_base" name="tea_base" required>
                        <option value="CMT">Classic Milk Tea -  145.00</option>
						<option value="TMT">Taro Milk Tea -  165.00</option>
<option value="WMT">Wintermelon Milk Tea -  192.50</option>
<option value="OOMT">Oolong Milk Tea -  195.00</option>
<option value="SMT">Strawberry Milk Tea -  200.00</option>
<option value="ThMT">Thai Milk Tea -  200.00</option>
<option value="MMT">Matcha Milk Tea -  210.00</option>
<option value="CoMT">Coconut Milk Tea -  210.50</option>
					<option value="HMT">Hokkaido Milk Tea -  220.50</option>

                    </select>
                </div>

                <label>Sugar Level:</label>
                <div class="sugar-lvl">
                    <div class="form-group">
                        <input type="radio" id="sugar-0" name="sugar_level" value="0" required>
                        <label for="sugar-0">0% Sugar</label>
                    </div>
                    <div class="form-group">
                        <input type="radio" id="sugar-25" name="sugar_level" value="25" required>
                        <label for="sugar-25">25% Sugar</label>
                    </div>
                    <div class="form-group">
                        <input type="radio" id="sugar-50" name="sugar_level" value="50" required>
                        <label for="sugar-50">50% Sugar</label>
                    </div>
                    <div class="form-group">
                        <input type="radio" id="sugar-75" name="sugar_level" value="75" required>
                        <label for="sugar-75">75% Sugar</label>
                    </div>
                    <div class="form-group">
                        <input type="radio" id="sugar-100" name="sugar_level" value="100" required>
                        <label for="sugar-100">100% Sugar</label>
                    </div>
                </div> <!-- sugar lvl-->
            </div> <!-- order details-->

            <div class="toppings">
                <div class="checkbox-group">
    <div class="form-group">
        <input type="checkbox" id="boba" name="toppings" value="TPB" data-price="5">
        <label for="boba">Tapioca Pearls (Boba) -  5.00</label>
    </div>
    <div class="form-group">
        <input type="checkbox" id="grass_jelly" name="toppings" value="GJ" data-price="5">
        <label for="grass_jelly">Grass Jelly -  5.00</label>
    </div>
    <div class="form-group">
        <input type="checkbox" id="pudding" name="toppings" value="P" data-price="5">
        <label for="pudding">Pudding -  5.00</label>
    </div>
    <div class="form-group">
        <input type="checkbox" id="red_bean" name="toppings" value="RB" data-price="5">
        <label for="red_bean">Red Bean -  5.00</label>
    </div>
    <div class="form-group">
        <input type="checkbox" id="lychee_jelly" name="toppings" value="LJ" data-price="5">
        <label for="lychee_jelly">Lychee Jelly -  5.00</label>
    </div>
    <div class="form-group">
        <input type="checkbox" id="coconut_jelly" name="toppings" value="CJ" data-price="5">
        <label for="coconut_jelly">Coconut Jelly -  5.00</label>
    </div>
    <div class="form-group">
        <input type="checkbox" id="cheese_foam" name="toppings" value="CF" data-price="5">
        <label for="cheese_foam">Cheese Foam -  5.00</label>
    </div>
    <div class="form-group">
        <input type="checkbox" id="acai_seeds" name="toppings" value="AS" data-price="5">
        <label for="acai_seeds">Acai Seeds -  5.00</label>
    </div>
</div>

            </div> <!-- toppings -->
            <label for="amount_paid">Amount to Pay: </label>
                <input type="number" min=1 id="amount_paid" name="amount_paid" required>
                <input type="submit" value="Pay">
        </form>
    </div>
</body>
</html>