
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%!
    private String escapeHtml(Object value) {
        if (value == null) return "";

        return value.toString()
                .replace("&", "&amp;")
                .replace("<", "&lt;")
                .replace(">", "&gt;")
                .replace("\"", "&quot;")
                .replace("'", "&#39;");
    }

    private String getInitials(String name) {
        if (name == null || name.trim().isEmpty()) {
            return "U";
        }

        String[] words = name.trim().split("\\s+");

        if (words.length == 1) {
            String word = words[0];
            return word.substring(0, Math.min(2, word.length()))
                    .toUpperCase();
        }

        return (words[0].substring(0, 1)
                + words[words.length - 1].substring(0, 1))
                .toUpperCase();
    }
%>

<%
    String rawName = (String) request.getAttribute("name");

    String initials = getInitials(rawName);

    String name = escapeHtml(rawName);
    String studentId = escapeHtml(request.getAttribute("studentId"));
    String program = escapeHtml(request.getAttribute("program"));
    String email = escapeHtml(request.getAttribute("email"));
    String introduction = escapeHtml(request.getAttribute("introduction"));

    String[] hobbies = (String[]) request.getAttribute("hobbies");
%>

<!DOCTYPE html>
<html>
<head>
    <title>My Profile</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <style>
        * {
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            background: #FFF8ED;
            margin: 0;
            padding: 40px 15px;
            color: #263238;
        }

        .container {
            max-width: 680px;
            margin: auto;
            background: white;
            padding: 40px;
            border-radius: 20px;
            box-shadow: 0 8px 30px rgba(8,127,140,0.12);
        }

        .avatar {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            margin: auto;
            background: #087F8C;
            color: white;
            display: flex;
            justify-content: center;
            align-items: center;
            font-size: 32px;
            font-weight: bold;
        }

        h1 {
            text-align: center;
            color: #087F8C;
            margin-bottom: 8px;
        }

        .subtitle {
            text-align: center;
            color: #78909C;
            margin-bottom: 30px;
        }

        .profile-item {
            padding: 17px;
            margin-bottom: 13px;
            background: #EAF7F4;
            border-radius: 10px;
            line-height: 1.6;
            overflow-wrap: anywhere;
        }

        .profile-item strong {
            display: block;
            color: #087F8C;
            margin-bottom: 5px;
        }

        .item-icon {
            margin-right: 7px;
        }

        .intro {
            white-space: pre-wrap;
        }

        .hobby-tag {
            display: inline-block;
            background: white;
            border: 1px solid #C8E8E1;
            border-radius: 20px;
            padding: 5px 12px;
            margin: 4px;
        }

        .button {
            display: block;
            text-align: center;
            margin-top: 25px;
            padding: 15px;
            background: #087F8C;
            color: white;
            text-decoration: none;
            border-radius: 9px;
            font-weight: bold;
        }

        .button:hover {
            background: #06636D;
        }

        .footer {
            text-align: center;
            color: #90A4AE;
            font-size: 12px;
            margin-top: 22px;
        }

        @media (max-width: 600px) {
            .container {
                padding: 25px 20px;
            }
        }
    </style>
</head>

<body>

<div class="container">

    <div class="avatar">
        <%= initials %>
    </div>

    <h1>My Profile</h1>

    <p class="subtitle">
        Your profile has been submitted successfully!
    </p>

    <div class="profile-item">
        <strong><span class="item-icon">👤</span>Full Name</strong>
        <%= name %>
    </div>

    <div class="profile-item">
        <strong><span class="item-icon">🪪</span>Student ID</strong>
        <%= studentId %>
    </div>

    <div class="profile-item">
        <strong><span class="item-icon">🎓</span>Program</strong>
        <%= program %>
    </div>

    <div class="profile-item">
        <strong><span class="item-icon">✉️</span>Email Address</strong>
        <%= email %>
    </div>

    <div class="profile-item">
        <strong><span class="item-icon">❤️</span>Hobbies</strong>

        <%
            if (hobbies != null && hobbies.length > 0) {
                for (String hobby : hobbies) {
        %>
                    <span class="hobby-tag">
                        <%= escapeHtml(hobby) %>
                    </span>
        <%
                }
            } else {
        %>
                No hobbies selected.
        <%
            }
        %>
    </div>

    <div class="profile-item">
        <strong><span class="item-icon">📝</span>Self Introduction</strong>

        <div class="intro"><%= introduction %></div>
    </div>

    <a href="index.html" class="button">
        ← Back to Profile Form
    </a>

    <div class="footer">
        Personal Profile Web Application
    </div>

</div>

</body>
</html>
