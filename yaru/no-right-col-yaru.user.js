// ==UserScript==
// @name          Стиль, убирающий правую колонку на ya.ru
// @namespace     http://userstyles.org
// @description   Стиль убирающий правую колонку в ленте «Что нового» на http://my.ya.ru
// @author        kugaevsky&lynn
// @homepage      http://userstyles.org/styles/17207
// @include       *ya.ru*
// ==/UserScript==
(function() {
var css = "table.b-page-lenta td.b-page-body { width:100% !important; } table.b-page-lenta td.b-page-right { overflow: hidden; padding-top: 1.6em; background: url(http://kugaevsky.ru/yaru/filter-icon.png) no-repeat top left !important;} td.b-page-right .b-lenta-filter { width: 14em; margin-right: -15em !important; border: 1px solid #dcdcdc; border-width: 0 0 1px 1px; z-index: 300 !important;} td.b-page-right .b-lenta-filter:first-child { border-top-width: 1px;} td.b-page-right .b-lenta-filter + .b-lenta-filter { margin-top: 0 !important; } table.b-page-lenta td.b-page-right:hover { overflow: visible; } td.b-page-right:hover .b-lenta-filter { width: 14em; margin-left: -15em !important; margin-right: 0 !important;} td.exit {padding-left:1.7em !important;}";
if (typeof GM_addStyle != "undefined") {
        GM_addStyle(css);
} else if (typeof addStyle != "undefined") {
        addStyle(css);
} else {
        var heads = document.getElementsByTagName("head");
        if (heads.length > 0) {
                var node = document.createElement("style");
                node.type = "text/css";
                node.appendChild(document.createTextNode(css));
                heads[0].appendChild(node);
        }
}
})();
