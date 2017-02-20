/*
 MIT License {@link http://creativecommons.org/licenses/MIT/}
 */
(function (m, n) {
    var e, k;
    e = m.jQuery;
    k = e.ScrollTo = e.ScrollTo || {
            config: {duration: 400, easing: "swing", callback: n, durationMode: "each", offsetTop: 0, offsetLeft: 0},
            configure: function (f) {
                e.extend(k.config, f || {});
                return this
            },
            scroll: function (f, c) {
                var a, b, d, g, i, h, l, j;
                a = f.pop();
                b = a.$container;
                d = b.get(0);
                g = a.$target;
                i = e("<span/>").css({position: "absolute", top: "0px", left: "0px"});
                h = b.css("position");
                b.css("position", "relative");
                i.appendTo(b);
                a = i.offset().top;
                a = g.offset().top - a - parseInt(c.offsetTop, 10);
                j = i.offset().left;
                j = g.offset().left - j - parseInt(c.offsetLeft, 10);
                g = d.scrollTop;
                d = d.scrollLeft;
                i.remove();
                b.css("position", h);
                i = function (a) {
                    0 === f.length ? "function" === typeof c.callback && c.callback.apply(this, [a]) : k.scroll(f, c);
                    return !0
                };
                c.onlyIfOutside && (h = g + b.height(), l = d + b.width(), g < a && a < h && (a = g), d < j && j < l && (j = d));
                h = {};
                a !== g && (h.scrollTop = a + "px");
                j !== d && (h.scrollLeft = j + "px");
                h.scrollTop || h.scrollLeft ? b.animate(h, c.duration, c.easing, i) : i();
                return !0
            },
            fn: function (f) {
                var c, a, b;
                c = [];
                var d = e(this);
                if (0 === d.length)return this;
                f = e.extend({}, k.config, f);
                a = d.parent();
                for (b = a.get(0); 1 === a.length && b !== document.body && b !== document;) {
                    var g;
                    g = "visible" !== a.css("overflow-y") && b.scrollHeight !== b.clientHeight;
                    b = "visible" !== a.css("overflow-x") && b.scrollWidth !== b.clientWidth;
                    if (g || b)c.push({$container: a, $target: d}), d = a;
                    a = a.parent();
                    b = a.get(0)
                }
                c.push({$container: e(e.browser.msie || e.browser.mozilla ? "html" : "body"), $target: d});
                "all" === f.durationMode && (f.duration /= c.length);
                k.scroll(c, f);
                return this
            }
        };
    e.fn.ScrollTo = e.ScrollTo.fn
})(window);

//end scrollto plugin

$(function () {
    $.ajax({url: '/getVenues?dhm'});
});


;(function (d) {
    var k = d.scrollTo = function (a, i, e) {
        d(window).scrollTo(a, i, e)
    };
    k.defaults = {axis: 'xy', duration: parseFloat(d.fn.jquery) >= 1.3 ? 0 : 1};
    k.window = function (a) {
        return d(window)._scrollable()
    };
    d.fn._scrollable = function () {
        return this.map(function () {
            var a = this, i = !a.nodeName || d.inArray(a.nodeName.toLowerCase(), ['iframe', '#document', 'html', 'body']) != -1;
            if (!i)return a;
            var e = (a.contentWindow || a).document || a.ownerDocument || a;
            return d.browser.safari || e.compatMode == 'BackCompat' ? e.body : e.documentElement
        })
    };
    d.fn.scrollTo = function (n, j, b) {
        if (typeof j == 'object') {
            b = j;
            j = 0
        }
        if (typeof b == 'function')b = {onAfter: b};
        if (n == 'max')n = 9e9;
        b = d.extend({}, k.defaults, b);
        j = j || b.speed || b.duration;
        b.queue = b.queue && b.axis.length > 1;
        if (b.queue)j /= 2;
        b.offset = p(b.offset);
        b.over = p(b.over);
        return this._scrollable().each(function () {
            var q = this, r = d(q), f = n, s, g = {}, u = r.is('html,body');
            switch (typeof f) {
                case'number':
                case'string':
                    if (/^([+-]=)?\d+(\.\d+)?(px|%)?$/.test(f)) {
                        f = p(f);
                        break
                    }
                    f = d(f, this);
                case'object':
                    if (f.is || f.style)s = (f = d(f)).offset()
            }
            d.each(b.axis.split(''), function (a, i) {
                var e = i == 'x' ? 'Left' : 'Top', h = e.toLowerCase(), c = 'scroll' + e, l = q[c], m = k.max(q, i);
                if (s) {
                    g[c] = s[h] + (u ? 0 : l - r.offset()[h]);
                    if (b.margin) {
                        g[c] -= parseInt(f.css('margin' + e)) || 0;
                        g[c] -= parseInt(f.css('border' + e + 'Width')) || 0
                    }
                    g[c] += b.offset[h] || 0;
                    if (b.over[h])g[c] += f[i == 'x' ? 'width' : 'height']() * b.over[h]
                } else {
                    var o = f[h];
                    g[c] = o.slice && o.slice(-1) == '%' ? parseFloat(o) / 100 * m : o
                }
                if (/^\d+$/.test(g[c]))g[c] = g[c] <= 0 ? 0 : Math.min(g[c], m);
                if (!a && b.queue) {
                    if (l != g[c])t(b.onAfterFirst);
                    delete g[c]
                }
            });
            t(b.onAfter);
            function t(a) {
                r.animate(g, j, b.easing, a && function () {
                        a.call(this, n, b)
                    })
            }
        }).end()
    };
    k.max = function (a, i) {
        var e = i == 'x' ? 'Width' : 'Height', h = 'scroll' + e;
        if (!d(a).is('html,body'))return a[h] - d(a)[e.toLowerCase()]();
        var c = 'client' + e, l = a.ownerDocument.documentElement, m = a.ownerDocument.body;
        return Math.max(l[h], m[h]) - Math.min(l[c], m[c])
    };
    function p(a) {
        return typeof a == 'object' ? a : {top: a, left: a}
    }
})(jQuery);