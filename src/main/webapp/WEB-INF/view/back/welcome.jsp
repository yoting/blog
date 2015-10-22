<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/tagLib.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>孤思八九博客后台管理系统</title>
    <style>
        html, body, div, span, applet, object, iframe, h1, h2, h3, h4, h5, h6, p, blockquote, pre, a, abbr, acronym, address, big, cite, code, del, dfn, em, img, ins, kbd, q, s, samp, small, strike, strong, sub, sup, tt, var, b, u, i, center, dl, dt, dd, ol, ul, li, fieldset, form, label, legend, table, caption, tbody, tfoot, thead, tr, th, td, article, aside, canvas, details, embed, figure, figcaption, footer, header, hgroup, menu, nav, output, ruby, section, summary, time, mark, audio, video
        {
            margin: 0;
            padding: 0;
            border: 0;
            font-size: 100%;
            font: inherit;
            vertical-align: baseline;
        }
        article, aside, details, figcaption, figure, footer, header, hgroup, menu, nav, section
        {
            display: block;
        }
        body
        {
            line-height: 1;
        }
        ol, ul
        {
            list-style: none;
        }
        blockquote, q
        {
            quotes: none;
        }
        blockquote:before, blockquote:after, q:before, q:after
        {
            content: '';
            content: none;
        }
        table
        {
            border-collapse: collapse;
            border-spacing: 0;
        }
    </style>
    <style>
        html, body
        {
            margin: 0;
            padding: 0;
        }
        body
        {
            background: #171717;
            color: #999;
            font: 100%/18px helvetica, arial, sans-serif;
        }
        a
        {
            color: #2fa1d6;
            font-weight: bold;
            text-decoration: none;
        }
        a:hover
        {
            text-decoration: underline;
/*             color: #fff; */
        }
        #canvas-container
        {
            background: #000 url(resource/fireworks/bg.jpg);
            height: 400px;
            left: 50%;
            margin: -200px 0 0 -300px;
            position: absolute;
            top: 50%;
            width: 600px;
            z-index: 2;
        }
        canvas
        {
            cursor: crosshair;
            display: block;
            position: relative;
            z-index: 3;
        }
        canvas:active
        {
            cursor: crosshair;
        }
        #skyline
        {
            background: url(resource/fireworks/skyline.png) repeat-x 50% 0;
            bottom: 0;
            height: 135px;
            left: 0;
            position: absolute;
            width: 100%;
            z-index: 1;
        }
        #mountains1
        {
            background: url(resource/fireworks/mountains1.png) repeat-x 40% 0;
            bottom: 0;
            height: 200px;
            left: 0;
            position: absolute;
            width: 100%;
            z-index: 1;
        }
        #mountains2
        {
            background: url(resource/fireworks/mountains2.png) repeat-x 30% 0;
            bottom: 0;
            height: 250px;
            left: 0;
            position: absolute;
            width: 100%;
            z-index: 1;
        }
        #gui
        {
            right: 0;
            position: fixed;
            top: 0;
            z-index: 3;
        }
    </style>
    <script src="${ctxResource }/fireworks/js/prefixfree.min.js"></script>
</head>
<body>
    <div style="text-align: center; clear: both;">
        <script src="/scripts/2bc/_gg_970_90.js" type="text/javascript"></script>
    </div>
    <div style="display: none;" id="gui">
    </div>
    <div id="canvas-container">
        <div id="mountains2">
        </div>
        <div id="mountains1">
        </div>
        <div id="skyline">
        </div>
    </div>
    <script src='${ctxResource }/fireworks/js/jquery.js'></script>
    <script src='${ctxResource }/fireworks/js/dat.gui.min.js'></script>
    <script src="${ctxResource }/fireworks/js/index.js"></script>
</body>
</html>
