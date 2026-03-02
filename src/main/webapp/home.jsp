<!DOCTYPE html>
<html>
<head>
    <title>MultiDomain Decision Engine</title>
    <link rel="stylesheet" href="style.css">

    <style>
        body {
            overflow-x: hidden;
        }

        .landing {
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 40px;
            text-align: center;
            transition: transform 0.8s ease, opacity 0.8s ease;
        }

        .hero {
            max-width: 900px;
        }

        .hero h1 {
            font-size: 48px;
            margin-bottom: 20px;
            background: linear-gradient(90deg, #3b82f6, #06b6d4);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }

        .hero p {
            max-width: 650px;
            margin: 0 auto 50px auto;
            opacity: 0.8;
            font-size: 17px;
            line-height: 1.6;
        }

        .feature-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 40px;
            margin-bottom: 60px;
        }

        .feature {
            background: rgba(255,255,255,0.05);
            padding: 25px;
            border-radius: 16px;
            backdrop-filter: blur(10px);
            transition: transform 0.3s ease;
        }

        .feature:hover {
            transform: translateY(-6px);
        }

        .feature h3 {
            font-size: 18px;
            margin-bottom: 10px;
        }

        .feature p {
            font-size: 14px;
            opacity: 0.7;
        }

        .cta-button {
            width: 220px;
            font-size: 16px;
        }

        .slide-out {
            transform: translateX(-100%);
            opacity: 0;
        }

        @media (max-width: 900px) {
            .feature-grid {
                grid-template-columns: 1fr;
                gap: 25px;
            }
        }
    </style>
</head>
<body>

<div class="landing" id="landing">

    <div class="hero">

        <h1>MultiDomain Decision Engine</h1>

        <p>
            A structured, rule-based decision platform that evaluates multiple domains
            using normalized scoring, weighted similarity, and confidence analysis
            to generate explainable, data-driven recommendations.
        </p>

        <div class="feature-grid">

            <div class="feature">
                <h3>Multi-Criteria Evaluation</h3>
                <p>Analyze multiple factors simultaneously using normalized scoring logic.</p>
            </div>

            <div class="feature">
                <h3>Weighted Importance Modeling</h3>
                <p>Adjust influence dynamically based on user-defined priorities.</p>
            </div>

            <div class="feature">
                <h3>Confidence Assessment</h3>
                <p>Understand how strongly the top recommendation outperforms alternatives.</p>
            </div>

        </div>

        <button class="cta-button" onclick="startTransition()">
            Get Started
        </button>

    </div>

</div>

<script>
    function startTransition() {
        const landing = document.getElementById("landing");
        landing.classList.add("slide-out");

        setTimeout(function() {
            window.location.href = "index.jsp";
        }, 750);
    }
</script>

</body>
</html>