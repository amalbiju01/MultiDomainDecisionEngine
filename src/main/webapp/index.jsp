<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>MultiDomain Decision Engine</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>

<div class="container">
    <h1>Decision Companion System</h1>
    <p class="subtitle">Choose the domain you want to evaluate</p>

    <form action="router.jsp" method="get">



        <div class="section">

            <label>
                <input type="radio" name="domain" value="career" required>
                Career Decision System
            </label>

            <br><br>

            <label>
                <input type="radio" name="domain" value="laptop">
                Laptop Recommendation System
            </label>

        </div>

        <br>

        <button type="submit" class="submit-btn">
            Continue
        </button>

    </form>

</div>

</body>
</html>