<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>MultiDomain Decision Engine</title>
    <link rel="stylesheet" href="style.css">

    <style>
        body {
            overflow-x: hidden;
        }

        .page-wrapper {
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 40px 20px;
            animation: fadeSlideIn 0.8s ease forwards;
        }

        @keyframes fadeSlideIn {
            from {
                opacity: 0;
                transform: translateY(40px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .container {
            max-width: 750px;
            width: 100%;
            padding: 60px;
        }

        .title {
            font-size: 32px;
            margin-bottom: 10px;
        }

        .subtitle {
            opacity: 0.7;
            margin-bottom: 40px;
        }

        .domain-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 25px;
            margin-bottom: 30px;
        }

        .domain-card {
            background: rgba(255,255,255,0.06);
            border-radius: 20px;
            padding: 30px;
            cursor: pointer;
            transition: 0.3s ease;
            border: 2px solid transparent;
        }

        .domain-card input {
            display: none;
        }

        .domain-card:hover {
            transform: translateY(-6px);
        }

        .domain-card input:checked + .card-content {
            border: 2px solid #3b82f6;
            border-radius: 15px;
            padding: 25px;
        }

        .card-content {
            text-align: center;
        }

        .card-content .icon {
            font-size: 40px;
            margin-bottom: 15px;
        }

        .card-content h3 {
            margin-bottom: 10px;
        }

        .card-content p {
            font-size: 14px;
            opacity: 0.7;
        }

        .validation-message {
            display: none;
            background: rgba(255, 77, 77, 0.15);
            border: 1px solid rgba(255, 77, 77, 0.4);
            color: #ff6b6b;
            padding: 12px;
            border-radius: 10px;
            margin-bottom: 20px;
            font-size: 14px;
            text-align: center;
        }

        .button-group {
            display: flex;
            flex-direction: column;
            gap: 16px;
        }

        .primary-btn {
            width: 100%;
            padding: 15px;
            border-radius: 14px;
            border: none;
            background: linear-gradient(90deg, #3b82f6, #2563eb);
            color: white;
            font-weight: 600;
            cursor: pointer;
            transition: 0.3s ease;
        }

        .primary-btn:hover {
            transform: translateY(-3px);
        }

        .secondary-btn {
            display: block;
            text-align: center;
            padding: 14px;
            border-radius: 14px;
            border: 2px solid rgba(255,255,255,0.3);
            background: transparent;
            color: white;
            font-weight: 600;
            text-decoration: none;
            transition: 0.3s ease;
        }

        .secondary-btn:hover {
            background: rgba(255,255,255,0.08);
        }

        @media (max-width: 768px) {
            .domain-grid {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>

<body>

<div class="page-wrapper">
    <div class="container">

        <h1 class="title">Decision Companion System</h1>
        <p class="subtitle">
            Select a domain to begin your structured multi-criteria evaluation process.
        </p>

        <form action="router.jsp" method="get" id="domainForm">

            <div class="domain-grid">

                <label class="domain-card">
                    <input type="radio" name="domain" value="career">
                    <div class="card-content">
                        <div class="icon">💼</div>
                        <h3>Career Decision System</h3>
                        <p>
                            Compare career paths using weighted scoring,
                            similarity modeling and confidence evaluation.
                        </p>
                    </div>
                </label>

                <label class="domain-card">
                    <input type="radio" name="domain" value="laptop">
                    <div class="card-content">
                        <div class="icon">💻</div>
                        <h3>Laptop Recommendation System</h3>
                        <p>
                            Evaluate devices based on performance,
                            budget and usage requirements.
                        </p>
                    </div>
                </label>

            </div>

            <!-- Validation Message -->
            <div id="validationMessage" class="validation-message"></div>

            <div class="button-group">
                <button type="submit" class="primary-btn">
                    Continue
                </button>

                <a href="home.jsp" class="secondary-btn">
                    Back to Home
                </a>
            </div>

        </form>

    </div>
</div>

<script>
document.getElementById("domainForm").addEventListener("submit", function(e) {

    const selected = document.querySelector('input[name="domain"]:checked');
    const messageBox = document.getElementById("validationMessage");

    if (!selected) {
        e.preventDefault();
        messageBox.innerText = "Please select one of these options to continue.";
        messageBox.style.display = "block";
    } else {
        messageBox.style.display = "none";
    }
});
</script>

</body>
</html>