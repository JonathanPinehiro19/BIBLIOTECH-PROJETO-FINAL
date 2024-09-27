<%-- 
    Document   : elements
    Created on : 13 de set. de 2024, 00:22:23
    Author     : jonat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>


<%
   String sMessage = ("<style> \n" +
                ".card {\n" +
                "\toverflow: hidden;\n" +
                "\tposition: relative;\n" +
                "\ttext-align: left;\n" +
                "\tborder-radius: 0.5rem;\n" +
                "\tmax-width: 290px;\n" +
                "\tbox-shadow: 0 20px 25px -5px rgba(0, 0, 0, 0.1), 0 10px 10px -5px rgba(0, 0, 0, 0.04);\n" +
                "\tbackground-color: #fff;\n" +
                "}\n" +
                ".dismiss {\n" +
                "\tposition: absolute;\n" +
                "\tright: 10px;\n" +
                "\ttop: 10px;\n" +
                "\tdisplay: flex;\n" +
                "\talign-items: center;\n" +
                "\tjustify-content: center;\n" +
                "\tpadding: 0.5rem 1rem;\n" +
                "\tbackground-color: #fff;\n" +
                "\tcolor: black;\n" +
                "\tborder: 2px solid #D1D5DB;\n" +
                "\tfont-size: 1rem;\n" +
                "\tfont-weight: 300;\n" +
                "\twidth: 30px;\n" +
                "\theight: 30px;\n" +
                "\tborder-radius: 7px;\n" +
                "\ttransition: .3s ease;\n" +
                "}\n" +
                ".dismiss:hover {\n" +
                "\tbackground-color: #ee0d0d;\n" +
                "\tborder: 2px solid #ee0d0d;\n" +
                "\tcolor: #fff;\n" +
                "}\n" +
                ".header {\n" +
                "\tpadding: 1.25rem 1rem 1rem 1rem;\n" +
                "}\n" +
                ".image {\n" +
                "\tdisplay: flex;\n" +
                "\tmargin-left: auto;\n" +
                "\tmargin-right: auto;\n" +
                "\tbackground-color: #e2feee;\n" +
                "\tflex-shrink: 0;\n" +
                "\tjustify-content: center;\n" +
                "\talign-items: center;\n" +
                "\twidth: 3rem;\n" +
                "\theight: 3rem;\n" +
                "\tborder-radius: 9999px;\n" +
                "\tanimation: animate .6s linear alternate-reverse infinite;\n" +
                "\ttransition: .6s ease;\n" +
                "}\n" +
                ".image svg {\n" +
                "\tcolor: #0afa2a;\n" +
                "\twidth: 2rem;\n" +
                "\theight: 2rem;\n" +
                "}\n" +
                ".content {\n" +
                "\tmargin-top: 0.75rem;\n" +
                "\ttext-align: center;\n" +
                "}\n" +
                ".title {\n" +
                "\tcolor: #066e29;\n" +
                "\tfont-size: 1rem;\n" +
                "\tfont-weight: 600;\n" +
                "\tline-height: 1.5rem;\n" +
                "}\n" +
                ".message {\n" +
                "\tmargin-top: 0.5rem;\n" +
                "\tcolor: #595b5f;\n" +
                "\tfont-size: 0.875rem;\n" +
                "\tline-height: 1.25rem;\n" +
                "}\n" +
                ".actions {\n" +
                "\tmargin: 0.75rem 1rem;\n" +
                "}\n" +
                ".history {\n" +
                "\tdisplay: inline-flex;\n" +
                "\tpadding: 0.5rem 1rem;\n" +
                "\tbackground-color: #1aa06d;\n" +
                "\tcolor: #ffffff;\n" +
                "\tfont-size: 1rem;\n" +
                "\tline-height: 1.5rem;\n" +
                "\tfont-weight: 500;\n" +
                "\tjustify-content: center;\n" +
                "\twidth: 100%;\n" +
                "\tborder-radius: 0.375rem;\n" +
                "\tborder: none;\n" +
                "\tbox-shadow: 0 1px 2px 0 rgba(0, 0, 0, 0.05);\n" +
                "}\n" +
                ".track {\n" +
                "\tdisplay: inline-flex;\n" +
                "\tmargin-top: 0.75rem;\n" +
                "\tpadding: 0.5rem 1rem;\n" +
                "\tcolor: #242525;\n" +
                "\tfont-size: 1rem;\n" +
                "\tline-height: 1.5rem;\n" +
                "\tfont-weight: 500;\n" +
                "\tjustify-content: center;\n" +
                "\twidth: 100%;\n" +
                "\tborder-radius: 0.375rem;\n" +
                "\tborder: 1px solid #D1D5DB;\n" +
                "\tbackground-color: #fff;\n" +
                "\tbox-shadow: 0 1px 2px 0 rgba(0, 0, 0, 0.05);\n" +
                "}\n" +
                "@keyframes animate {\n" +
                "\tfrom {\n" +
                "\t\ttransform: scale(1);\n" +
                "\t}\n" +
                "\tto {\n" +
                "\t\ttransform: scale(1.5);\n" +
                "\t}\n" +
                "}\n" +
                "</style>\n" +
                "<div class=\"card\">\n" +
                "\t<div class=\"header\"> \n" +
                "\t\t<div class=\"image\">\n" +
                "\t\t\t<svg viewBox=\"0 0 24 24\" fill=\"none\" xmlns=\"http://www.w3.org/2000/svg\">\n" +
                "\t\t\t\t<g id=\"SVGRepo_bgCarrier\" stroke-width=\"0\"></g>\n" +
                "\t\t\t\t<g id=\"SVGRepo_tracerCarrier\" stroke-linecap=\"round\" stroke-linejoin=\"round\"></g>\n" +
                "\t\t\t\t<g id=\"SVGRepo_iconCarrier\">\n" +
                "\t\t\t\t\t<path d=\"M20 7L9.00004 18L3.99994 13\" stroke=\"#000000\" stroke-width=\"1.5\" stroke-linecap=\"round\" stroke-linejoin=\"round\"></path>\n" +
                "\t\t\t\t</g>\n" +
                "\t\t\t</svg>\n" +
                "\t\t</div>\n" +
                "\t\t<div class=\"content\">\n" +
                "\t\t\t<span class=\"title\">Cadastro Realizado!</span>\n" +
                "\t\t\t<p class=\"message\">Cadastro realizado com sucesso, agora você pode logar e aproveitar. </p>\n" +
                "\t\t</div>\n" +
                "\t\t<div class=\"actions\">\n" +
                "\t\t\t<button class=\"history\" type=\"button\">Logar</button>\n" +
                "\t\t\t<button class=\"track\" type=\"button\">Voltar</button>\n" +
                "\t\t</div>\n" +
                "\t</div>\n" +
                "</div>");

    session.setAttribute("successMessage", sMessage);
    out.println("<p>Mensagem de sucesso definida: " + sMessage + "</p>");
%>

</html>