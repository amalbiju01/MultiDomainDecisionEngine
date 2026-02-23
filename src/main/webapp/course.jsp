<!DOCTYPE html>
<html>
<head>
    <title>Select Course</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>

<div class="container">
    <h1>FutureTech Academy</h1>
    <p class="subtitle">Select Courses You Are Interested In</p>

    <!-- Use POST (more professional) -->
    <form action="assessment.jsp" method="post">

        <div class="section">

            <label>
                <input type="checkbox" name="course"
                       value="Java Full Stack Developer">
                Java Full Stack Developer
            </label>
            <br><br>

            <label>
                <input type="checkbox" name="course"
                       value="MERN Stack Developer">
                MERN Stack Developer
            </label>
            <br><br>

            <label>
                <input type="checkbox" name="course"
                       value="Software Testing & Automation">
                Software Testing & Automation
            </label>

        </div>

        <br>

        <button type="submit" class="submit-btn">
            Next
        </button>

    </form>
</div>

</body>
</html>
