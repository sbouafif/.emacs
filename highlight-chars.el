<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><head><title>EmacsWiki: highlight-chars.el</title><link rel="alternate" type="application/wiki" title="Edit this page" href="http://www.emacswiki.org/emacs?action=edit;id=highlight-chars.el" />
<link type="text/css" rel="stylesheet" href="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.0/css/bootstrap-combined.min.css" />
<link type="text/css" rel="stylesheet" href="/css/bootstrap.css" />
<meta name="robots" content="INDEX,FOLLOW" /><link rel="alternate" type="application/rss+xml" title="EmacsWiki" href="http://www.emacswiki.org/emacs?action=rss" /><link rel="alternate" type="application/rss+xml" title="EmacsWiki: highlight-chars.el" href="http://www.emacswiki.org/emacs?action=rss;rcidonly=highlight-chars.el" />
<link rel="alternate" type="application/rss+xml"
      title="Emacs Wiki with page content"
      href="http://www.emacswiki.org/emacs/full.rss" />
<link rel="alternate" type="application/rss+xml"
      title="Emacs Wiki with page content and diff"
      href="http://www.emacswiki.org/emacs/full-diff.rss" />
<link rel="alternate" type="application/rss+xml"
      title="Emacs Wiki including minor differences"
      href="http://www.emacswiki.org/emacs/minor-edits.rss" />
<link rel="alternate" type="application/rss+xml"
      title="Changes for highlight-chars.el only"
      href="http://www.emacswiki.org/emacs?action=rss;rcidonly=highlight-chars.el" /><meta name="viewport" content="width=device-width" />
<script type="text/javascript" src="/outliner.0.5.0.62-toc.js"></script>
<script type="text/javascript">

  function addOnloadEvent(fnc) {
    if ( typeof window.addEventListener != "undefined" )
      window.addEventListener( "load", fnc, false );
    else if ( typeof window.attachEvent != "undefined" ) {
      window.attachEvent( "onload", fnc );
    }
    else {
      if ( window.onload != null ) {
	var oldOnload = window.onload;
	window.onload = function ( e ) {
	  oldOnload( e );
	  window[fnc]();
	};
      }
      else
	window.onload = fnc;
    }
  }

  var initToc=function() {

    var outline = HTML5Outline(document.body);
    if (outline.sections.length == 1) {
      outline.sections = outline.sections[0].sections;
    }

    if (outline.sections.length > 1
	|| outline.sections.length == 1
           && outline.sections[0].sections.length > 0) {

      var toc = document.getElementById('toc');

      if (!toc) {
	var divs = document.getElementsByTagName('div');
	for (var i = 0; i < divs.length; i++) {
	  if (divs[i].getAttribute('class') == 'toc') {
	    toc = divs[i];
	    break;
	  }
	}
      }

      if (!toc) {
	var h2 = document.getElementsByTagName('h2')[0];
	if (h2) {
	  toc = document.createElement('div');
	  toc.setAttribute('class', 'toc');
	  h2.parentNode.insertBefore(toc, h2);
	}
      }

      if (toc) {
        var html = outline.asHTML(true);
        toc.innerHTML = html;
      }
    }
  }

  addOnloadEvent(initToc);
  </script>

<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
<script src="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.0/js/bootstrap.min.js"></script>
<script src="http://emacswiki.org/emacs/emacs-bootstrap.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /></head><body class="http://www.emacswiki.org/emacs"><div class="header"><span class="gotobar bar"><a class="local" href="http://www.emacswiki.org/emacs/SiteMap">SiteMap</a> <a class="local" href="http://www.emacswiki.org/emacs/Search">Search</a> <a class="local" href="http://www.emacswiki.org/emacs/ElispArea">ElispArea</a> <a class="local" href="http://www.emacswiki.org/emacs/HowTo">HowTo</a> <a class="local" href="http://www.emacswiki.org/emacs/Glossary">Glossary</a> <a class="local" href="http://www.emacswiki.org/emacs/RecentChanges">RecentChanges</a> <a class="local" href="http://www.emacswiki.org/emacs/News">News</a> <a class="local" href="http://www.emacswiki.org/emacs/Problems">Problems</a> <a class="local" href="http://www.emacswiki.org/emacs/Suggestions">Suggestions</a> </span><h1><a title="Click to search for references to this page" rel="nofollow" href="http://www.emacswiki.org/emacs?search=%22highlight-chars%5c.el%22">highlight-chars.el</a></h1></div><div class="wrapper"><div class="content browse"><p class="download"><a href="http://www.emacswiki.org/emacs-en/download/highlight-chars.el">Download</a></p><pre><span class="comment">;;; highlight-chars.el --- Highlight specified sets of characters, including whitespace.</span>
<span class="comment">;;</span>
<span class="comment">;; Filename: highlight-chars.el</span>
<span class="comment">;; Description: Highlight specified sets of characters, including whitespace.</span>
<span class="comment">;; Author: Drew Adams</span>
<span class="comment">;; Maintainer: Drew Adams</span>
<span class="comment">;; Copyright (C) 2000-2013, Drew Adams, all rights reserved.</span>
<span class="comment">;; Created: Fri Nov 16 08:37:04 2012 (-0800)</span>
<span class="comment">;; Version: 0</span>
<span class="comment">;; Package-Requires: ()</span>
<span class="comment">;; Last-Updated: Sun Sep  8 12:20:31 2013 (-0700)</span>
<span class="comment">;;           By: dradams</span>
<span class="comment">;;     Update #: 210</span>
<span class="comment">;; URL: http<span class="builtin">://www</span>.emacswiki.org/highlight-chars.el</span>
<span class="comment">;; Doc URL: http<span class="builtin">://www</span>.emacswiki.org/ShowWhiteSpace#HighlightChars</span>
<span class="comment">;; Keywords: highlight, whitespace, characters, Unicode</span>
<span class="comment">;; Compatibility: GNU Emacs: 20.x, 21.x, 22.x, 23.x, 24.x</span>
<span class="comment">;;</span>
<span class="comment">;; Features that might be required by this library<span class="builtin">:</span></span>
<span class="comment">;;</span>
<span class="comment">;;   None</span>
<span class="comment">;;</span>
<span class="comment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>
<span class="comment">;;</span>
<span class="comment">;;; Commentary<span class="builtin">:</span></span>
<span class="comment">;;</span>
<span class="comment">;;    Highlight specified sets of characters, including whitespace.</span>
<span class="comment">;;</span>
<span class="comment">;; This library provides commands and non-interactive functions for</span>
<span class="comment">;; highlighting the following<span class="builtin">:</span></span>
<span class="comment">;;</span>
<span class="comment">;; * Tab chars (command `<span class="constant important">hc-toggle-highlight-tabs</span>').</span>
<span class="comment">;;</span>
<span class="comment">;; * Hard space (aka no-break space, aka non-breaking space) chars</span>
<span class="comment">;;   (command `<span class="constant important">hc-toggle-highlight-hard-spaces</span>').</span>
<span class="comment">;;</span>
<span class="comment">;; * Hard hyphen (aka non-breaking hyphen) chars (command</span>
<span class="comment">;;   `<span class="constant important">hc-toggle-highlight-hard-hyphens</span>').</span>
<span class="comment">;;</span>
<span class="comment">;; * Trailing whitespace: tabs, spaces, and hard spaces at the end of</span>
<span class="comment">;;   a line of text (command</span>
<span class="comment">;;   `<span class="constant important">hc-toggle-highlight-trailing-whitespace</span>')</span>
<span class="comment">;;</span>
<span class="comment">;; * Any set of chars you choose (commands `<span class="constant important">hc-highlight-chars</span>' and</span>
<span class="comment">;;   `<span class="constant important">hc-toggle-highlight-other-chars</span>').  You can specify characters</span>
<span class="comment">;;   in four ways: (1) individually, (2) using ranges, (3) using</span>
<span class="comment">;;   character classes (e.g. [<span class="builtin">:digit:</span>]), and (4) using character sets</span>
<span class="comment">;;   (e.g. `iso-8859-1' or `<span class="constant important">lao</span>').</span>
<span class="comment">;;</span>
<span class="comment">;;   For `<span class="constant important">hc-toggle-highlight-other-chars</span>', you can also specify</span>
<span class="comment">;;   characters (<span class="keyword cl">the</span> same four ways) that are to be *excluded* from</span>
<span class="comment">;;   highlighting.</span>
<span class="comment">;;</span>
<span class="comment">;;   You can thus, for example, highlight all characters in character</span>
<span class="comment">;;   set `greek-iso8859-7' except `GREEK SMALL LETTER LAMBDA'.  Or all</span>
<span class="comment">;;   characters in class `[<span class="builtin">:space:</span>]' (whitespace) except `<span class="constant important">tab</span>'.  Or</span>
<span class="comment">;;   all Unicode characters in the range ?\u2190 through ?\u21ff</span>
<span class="comment">;;   (mathematical arrows) except ?\u21b6, ?\u21b7, ?\u21ba, and</span>
<span class="comment">;;   ?\u21bb (curved arrows).  You get the idea.</span>
<span class="comment">;;</span>
<span class="comment">;;   - Command `<span class="constant important">hc-highlight-chars</span>' prompts you for the characters to</span>
<span class="comment">;;     highlight and the face to use.  With a prefix arg it</span>
<span class="comment">;;     unhighlights.</span>
<span class="comment">;;</span>
<span class="comment">;;   - Command `<span class="constant important">hc-toggle-highlight-other-chars</span>' toggles highlighting,</span>
<span class="comment">;;     using face `<span class="constant important">hc-other-char</span>', of the characters specified by user</span>
<span class="comment">;;     option `<span class="constant important">hc-other-chars</span>', but excluding the characters specified</span>
<span class="comment">;;     by option `<span class="constant important">hc-other-chars-NOT</span>'.  With a prefix arg it prompts</span>
<span class="comment">;;     you for the face to use.</span>
<span class="comment">;;</span>
<span class="comment">;;   For these particular commands and functions, option</span>
<span class="comment">;;   `<span class="constant important">hc-other-chars-font-lock-override</span>' controls whether the current</span>
<span class="comment">;;   highlighting face overrides (`<span class="constant important">t</span>'), is overridden by (`<span class="constant important">keep</span>'), or</span>
<span class="comment">;;   merges with (`<span class="constant important">append</span>' or `<span class="constant important">prepend</span>') any existing highlighting.</span>
<span class="comment">;;</span>
<span class="comment">;; To use this library, add this to your init file (~/.emacs)<span class="builtin">:</span></span>
<span class="comment">;;</span>
<span class="comment">;;      (<span class="keyword">require</span> '<span class="constant">highlight-chars</span>) ; Load this library.</span>
<span class="comment">;;</span>
<span class="comment">;; You can then use the commands and functions defined here to turn</span>
<span class="comment">;; the various kinds of highlighting on and off when in Font-Lock</span>
<span class="comment">;; mode.  For example, you can bind a key to toggle highlighting of</span>
<span class="comment">;; trailing whitespace<span class="builtin">:</span></span>
<span class="comment">;;</span>
<span class="comment">;;      (global-set-key (kbd <span class="string">"&lt;f11&gt;"</span>)</span>
<span class="comment">;;                      'hc-toggle-highlight-trailing-whitespace)</span>
<span class="comment">;;</span>
<span class="comment">;; Because variable `<span class="constant important">font-lock-keywords</span>' is buffer-local, that key</span>
<span class="comment">;; binding lets you use `f11' to toggle highlighting separately in</span>
<span class="comment">;; each buffer.</span>
<span class="comment">;;</span>
<span class="comment">;; But if you want to use a particular kind of highlighting by default</span>
<span class="comment">;; globally, then just add the corresponding `<span class="constant important">hc-highlight-*</span>' function</span>
<span class="comment">;; to the hook `<span class="constant important">font-lock-mode-hook</span>'.  Then, whenever Font-Lock mode</span>
<span class="comment">;; is turned on (in any buffer), the appropriate highlighting will</span>
<span class="comment">;; also be turned on.</span>
<span class="comment">;;</span>
<span class="comment">;; For example, you can turn on tab highlighting everywhere by default</span>
<span class="comment">;; by adding function `<span class="constant important">hc-highlight-tabs</span>' to `<span class="constant important">font-lock-mode-hook</span>' in</span>
<span class="comment">;; your init file (`~/.emacs'), as follows<span class="builtin">:</span></span>
<span class="comment">;;</span>
<span class="comment">;;     (add-hook 'font-lock-mode-hook 'hc-highlight-tabs)</span>
<span class="comment">;;</span>
<span class="comment">;; In addition to buffer-specific highlighting and global</span>
<span class="comment">;; highlighting, you can turn on a given kind of highlighting</span>
<span class="comment">;; automatically for all buffers that are in a certain major mode.</span>
<span class="comment">;;</span>
<span class="comment">;; For that, do the following, where `<span class="constant important">THE-MODE</span>' is the appropriate</span>
<span class="comment">;; mode symbol (value of variable `<span class="constant important">major-mode</span>'), such as `<span class="constant important">text-mode</span>'.</span>
<span class="comment">;; This example turns on trailing whitespace highlighting - use</span>
<span class="comment">;; different `<span class="constant important">hc-highlight-*</span>' and `<span class="constant important">hc-dont-highlight-*</span>' functions for</span>
<span class="comment">;; other kinds of highlighting.</span>
<span class="comment">;;</span>
<span class="comment">;;      (add-hook 'change-major-mode-hook</span>
<span class="comment">;;                (<span class="keyword elisp">lambda</span> ()</span>
<span class="comment">;;                  (add-hook 'font-lock-mode-hook</span>
<span class="comment">;;                            'hc-highlight-trailing-whitespace)))</span>
<span class="comment">;</span>
<span class="comment">;;      (add-hook 'after-change-major-mode-hook</span>
<span class="comment">;;                (<span class="keyword elisp">lambda</span> ()</span>
<span class="comment">;;                  (<span class="keyword cl">when</span> (eq major-mode 'THE-MODE)</span>
<span class="comment">;;                    (remove-hook 'font-lock-mode-hook</span>
<span class="comment">;;                                 'hc-highlight-trailing-whitespace)</span>
<span class="comment">;;                    (hc-dont-highlight-trailing-whitespace)))</span>
<span class="comment">;;                'APPEND)</span>
<span class="comment">;;</span>
<span class="comment">;; Highlighting Different Sets of Characters in Different Buffers</span>
<span class="comment">;; --------------------------------------------------------------</span>
<span class="comment">;;</span>
<span class="comment">;; Especially for highlighting non-whitespace characters (commands</span>
<span class="comment">;; `<span class="constant important">hc-toggle-highlight-other-chars</span>' and `<span class="constant important">hc-highlight-chars</span>'), it can</span>
<span class="comment">;; sometimes be useful to highlight different characters in different</span>
<span class="comment">;; buffers.  For example, you might want to highlight all Chinese</span>
<span class="comment">;; characters in a Gnus buffer and all hexadecimal digits in a CSS or</span>
<span class="comment">;; HTML buffer.</span>
<span class="comment">;;</span>
<span class="comment">;; You can do this by setting the local value of option</span>
<span class="comment">;; `<span class="constant important">hc-other-chars</span>' (and perhaps option `<span class="constant important">hc-other-chars-NOT</span>') in each</span>
<span class="comment">;; of the buffers.  For example<span class="builtin">:</span></span>
<span class="comment">;;</span>
<span class="comment">;;      (<span class="keyword elisp">with-current-buffer</span> (current-buffer)</span>
<span class="comment">;;        (set (make-local-variable 'hc-other-chars)</span>
<span class="comment">;;             '(chinese-big5-1)))</span>
<span class="comment">;;</span>
<span class="comment">;; You can use Customize to find the Lisp value that corresponds to</span>
<span class="comment">;; the highlighting you want: `M-x customize-option hc-other-chars',</span>
<span class="comment">;; then use button `Value Menu' to choose a value, then button `State</span>
<span class="comment">;; to `Set for Current Session'.</span>
<span class="comment">;;</span>
<span class="comment">;; Then use `C-h v hc-other-chars' to see what the Lisp value is (for</span>
<span class="comment">;; example, `(chinese-big5-1)'), and plug that value into the</span>
<span class="comment">;; `<span class="constant important">make-local-variable</span>' expression.</span>
<span class="comment">;;</span>
<span class="comment">;; Vanilla Emacs Highlighting of Hard Spaces and Hyphens</span>
<span class="comment">;; -----------------------------------------------------</span>
<span class="comment">;;</span>
<span class="comment">;; Vanilla Emacs can itself highlight hard spaces and hard hyphens,</span>
<span class="comment">;; and it does so whenever `<span class="constant important">nobreak-char-display</span>' is non-nil, which it</span>
<span class="comment">;; is by default.  By <span class="string">"hard"</span> space and hyphen I mean <span class="string">"no-break"</span> or</span>
<span class="comment">;; non-breaking.  These are the non-ASCII Unicode characters with code</span>
<span class="comment">;; points 160 (#xa0) and 8209 (#x2011), respectively.</span>
<span class="comment">;;</span>
<span class="comment">;; This low-level vanilla Emacs highlighting does not use Font Lock</span>
<span class="comment">;; mode, and it cannot highlight only one of these characters and not</span>
<span class="comment">;; the other.</span>
<span class="comment">;;</span>
<span class="comment">;; Using `highlight-chars.el' to highlight hard space and hyphen chars</span>
<span class="comment">;; requires turning off their default highlighting provided by vanilla</span>
<span class="comment">;; Emacs, that is, setting `<span class="constant important">nobreak-char-display</span>' to nil.  This is</span>
<span class="comment">;; done automatically by the functions defined here.  When you turn</span>
<span class="comment">;; off this font-lock highlighting, the vanilla Emacs highlighting is</span>
<span class="comment">;; automatically restored.</span>
<span class="comment">;;</span>
<span class="comment">;; That is, the value of variable `<span class="constant important">nobreak-char-display</span>' is reset to</span>
<span class="comment">;; its original value when `highlight-chars.el' was loaded (`<span class="constant important">t</span>' is the</span>
<span class="comment">;; default value, so if you didn't change it prior to loading</span>
<span class="comment">;; `highlight-chars.el' then t is restored).</span>
<span class="comment">;;</span>
<span class="comment">;; NOTE: If you byte-compile this file in an older version of Emacs</span>
<span class="comment">;; (prior to Emacs 23) then the code for highlighting hard hyphens and</span>
<span class="comment">;; hard spaces will not work, even in Emacs 23+.  If you use Emacs 23+</span>
<span class="comment">;; then you should either byte-compile it using Emacs 23+ or evaluate</span>
<span class="comment">;; the source code that defines functions that highlight such</span>
<span class="comment">;; characters.  (This is because older Emacs versions interpret</span>
<span class="comment">;; [\u2011] as just [u2011], etc.)</span>
<span class="comment">;;</span>
<span class="comment">;;</span>
<span class="comment">;; See Also<span class="builtin">:</span></span>
<span class="comment">;;</span>
<span class="comment">;; * Library `highlight.el' for ways to highlight text more generally,</span>
<span class="comment">;;   not just specific characters.  It is available here<span class="builtin">:</span></span>
<span class="comment">;;   http<span class="builtin">://www</span>.emacswiki.org/cgi-bin/wiki/highlight.el     (code)</span>
<span class="comment">;;   http<span class="builtin">://www</span>.emacswiki.org/cgi-bin/wiki/HighlightLibrary (doc)</span>
<span class="comment">;;</span>
<span class="comment">;; * Standard library `whitespace.el' for other ways to highlight</span>
<span class="comment">;;   whitespace characters.</span>
<span class="comment">;;</span>
<span class="comment">;;   This does some things similar to what `highlight-chars.el' does,</span>
<span class="comment">;;   plus other, unrelated things.  As its name suggests, its effects</span>
<span class="comment">;;   are limited to whitespace characters.  It is also somewhat</span>
<span class="comment">;;   complicated to use (10 faces, 24 options!), and it seems to have</span>
<span class="comment">;;   more than a few bugs.</span>
<span class="comment">;;</span>
<span class="comment">;;   Besides being simpler, I think that `highlight-chars.el' has an</span>
<span class="comment">;;   advantage of letting you easily highlight ONLY particular</span>
<span class="comment">;;   whitespace characters.  `whitespace.el' apparently makes you pick</span>
<span class="comment">;;   whether to highlight spaces and hard spaces together, or not, for</span>
<span class="comment">;;   instance.</span>
<span class="comment">;;</span>
<span class="comment">;;   (As a workaround, With `whitespace.el' you can get the effect of</span>
<span class="comment">;;   highlighting only one of these kinds of space by customizing the</span>
<span class="comment">;;   face used to highlight the other one so that it is the same as</span>
<span class="comment">;;   the `<span class="constant important">default</span>' face.  But that will interfere with other font-lock</span>
<span class="comment">;;   highlighting of that other character.  Maybe I'm missing</span>
<span class="comment">;;   something, this seems to me the only workaround.)</span>
<span class="comment">;;</span>
<span class="comment">;;</span>
<span class="comment">;; Faces defined here<span class="builtin">:</span></span>
<span class="comment">;;</span>
<span class="comment">;;    `<span class="constant important">hc-hard-hyphen</span>' (Emacs 23+), `<span class="constant important">hc-hard-space</span>', `<span class="constant important">hc-other-char</span>',</span>
<span class="comment">;;    `<span class="constant important">hc-tab</span>', `<span class="constant important">hc-trailing-whitespace</span>'.</span>
<span class="comment">;;</span>
<span class="comment">;; User options defined here<span class="builtin">:</span></span>
<span class="comment">;;</span>
<span class="comment">;;    `<span class="constant important">hc-other-chars</span>', `<span class="constant important">hc-other-chars-font-lock-override</span>',</span>
<span class="comment">;;    `<span class="constant important">hc-other-chars-NOT</span>'.</span>
<span class="comment">;;</span>
<span class="comment">;; Commands defined here<span class="builtin">:</span></span>
<span class="comment">;;</span>
<span class="comment">;;    `<span class="constant important">toggle-highlight-hard-hyphens</span>' (alias, Emacs 23+),</span>
<span class="comment">;;    `<span class="constant important">toggle-highlight-hard-spaces</span>' (alias),</span>
<span class="comment">;;    `<span class="constant important">toggle-highlight-other-chars</span>', `<span class="constant important">toggle-highlight-tabs</span>' (alias),</span>
<span class="comment">;;    `<span class="constant important">toggle-highlight-trailing-whitespace</span>' (alias),</span>
<span class="comment">;;    `<span class="constant important">hc-highlight-chars</span>', `<span class="constant important">hc-toggle-highlight-hard-hyphens</span>' (Emacs</span>
<span class="comment">;;    23+), `<span class="constant important">hc-toggle-highlight-hard-spaces</span>',</span>
<span class="comment">;;    `<span class="constant important">hc-toggle-highlight-other-chars</span>', `<span class="constant important">hc-toggle-highlight-tabs</span>',</span>
<span class="comment">;;    `<span class="constant important">hc-toggle-highlight-trailing-whitespace</span>'.</span>
<span class="comment">;;</span>
<span class="comment">;; Non-interactive functions defined here<span class="builtin">:</span></span>
<span class="comment">;;</span>
<span class="comment">;;    `<span class="constant important">hc-dont-highlight-hard-hyphens</span>' (Emacs 23+),</span>
<span class="comment">;;    `<span class="constant important">hc-dont-highlight-hard-spaces</span>',</span>
<span class="comment">;;    `<span class="constant important">hc-dont-highlight-other-chars</span>', `<span class="constant important">hc-dont-highlight-tabs</span>',</span>
<span class="comment">;;    `<span class="constant important">hc-dont-highlight-trailing-whitespace</span>',</span>
<span class="comment">;;    `<span class="constant important">hc-highlight-hard-hyphens</span>' (Emacs 23+),</span>
<span class="comment">;;    `<span class="constant important">hc-highlight-other-chars</span>', `<span class="constant important">hc-highlight-hard-spaces</span>',</span>
<span class="comment">;;    `<span class="constant important">hc-highlight-tabs</span>', `<span class="constant important">hc-highlight-trailing-whitespace</span>',</span>
<span class="comment">;;    `<span class="constant important">hc-other-chars-defcustom-spec</span>', `<span class="constant important">hc-other-chars-description</span>',</span>
<span class="comment">;;    `<span class="constant important">hc-other-chars-font-lock-spec</span>', `<span class="constant important">hc-other-chars-matcher</span>'.</span>
<span class="comment">;;</span>
<span class="comment">;; Internal variables defined here<span class="builtin">:</span></span>
<span class="comment">;;</span>
<span class="comment">;;    `<span class="constant important">hc-highlight-hard-hyphens-p</span>', `<span class="constant important">hc-highlight-hard-spaces-p</span>',</span>
<span class="comment">;;    `<span class="constant important">hc-highlight-tabs-p</span>', `<span class="constant important">hc-highlight-trailing-whitespace-p</span>',</span>
<span class="comment">;;    `<span class="constant important">hc--other-chars-last-match-data</span>',</span>
<span class="comment">;;    `<span class="constant important">hc--saved-nobreak-char-display</span>'.</span>
<span class="comment">;;</span>
<span class="comment">;;</span>
<span class="comment">;; History<span class="builtin">:</span></span>
<span class="comment">;;</span>
<span class="comment">;; Peter Steiner, &lt;unistein@isbe.ch&gt;, wrote `hilite-trail.el', which</span>
<span class="comment">;; included some whitespace character-highlighting commands.  Since</span>
<span class="comment">;; 2000 I have extended those and added other character-highlighting</span>
<span class="comment">;; functions, in `show-wspace.el'.  I eventually (2012) renamed</span>
<span class="comment">;; `show-wspace.el' to `highlight-chars.el'.  Highlighting whitespace</span>
<span class="comment">;; and other easily confused characters remains an important use case,</span>
<span class="comment">;; however.</span>
<span class="comment">;;</span>
<span class="comment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>
<span class="comment">;;</span>
<span class="comment">;;; Change Log<span class="builtin">:</span></span>
<span class="comment">;;</span>
<span class="comment">;; 2012/11/18 dadams</span>
<span class="comment">;;     hc-other-chars(-NOT): Added <span class="builtin">:set</span> to reset the match-data cache.</span>
<span class="comment">;;     hc-other-chars-matcher: Allow nil values for options hc-other-chars(-NOT)<span class="builtin">:</span></span>
<span class="comment">;;       Use fake match-data if hc-chars-other is empty.  Set match-data from</span>
<span class="comment">;;       hc-other-chars search if hc-other-chars-NOT is empty.  Reset match-data cache,</span>
<span class="comment">;;       hc--other-chars-last-match-data, if hc-chars-other search fails.</span>
<span class="comment">;;     Added autoload cookies for hc-other-chars(-NOT).  Removed cookie from a defvar.</span>
<span class="comment">;; 2012/11/17 dadams</span>
<span class="comment">;;     hc-other-chars-matcher: Corrected for empty chars-NOT, i.e. regexp-out = \\(\\).</span>
<span class="comment">;; 2012/11/16 dadams</span>
<span class="comment">;;     Renamed this library from show-wspace.el to highlight-chars.el.</span>
<span class="comment">;;     Added: hc-other-chars-NOT, hc-other-chars-description, hc-other-chars-matcher,</span>
<span class="comment">;;            hc--other-chars-last-match-data.</span>
<span class="comment">;;     Renamed: Prefix change: ws- to hc-.</span>
<span class="comment">;;              Show-Whitespace to Highlight-Characters (<span class="keyword">defgroup</span><span class="type"></span>).</span>
<span class="comment">;;     hc-toggle-highlight-other-chars<span class="builtin">:</span></span>
<span class="comment">;;       Use hc-other-chars-description.  Account for hc-other-chars-NOT.  Added arg FACE.</span>
<span class="comment">;;     , hc-highlight-chars: Use hc-other-chars-description.</span>
<span class="comment">;;     hc-other-chars-font-lock-spec<span class="builtin">:</span></span>
<span class="comment">;;       Added optional arg CHARS-NOT.  Handle it.  Use hc-other-chars-matcher.</span>
<span class="comment">;;     All calls to hc-other-chars-font-lock-spec: Pass a value for arg  CHARS-NOT.</span>
<span class="comment">;; 2012/11/15 dadams</span>
<span class="comment">;;    ws-other-chars-font-lock-spec<span class="builtin">:</span></span>
<span class="comment">;;      Use one font-lcck spec for all, instead of one for each.</span>
<span class="comment">;;      Removed +'s.</span>
<span class="comment">;; 2012/11/13 dadams</span>
<span class="comment">;;     ws-highlight-hard-hyphens-p, ws--saved-nobreak-char-display<span class="builtin">:</span></span>
<span class="comment">;;       Define for all versions, so can use in tests.</span>
<span class="comment">;;     ws(-dont)-highlight-(hard-spaces|trailing-whitespace)<span class="builtin">:</span></span>
<span class="comment">;;       Handle \u00a0 and \240 separately for diff versions.</span>
<span class="comment">;;     ws-highlight-(hard-(hyphens|spaces)|trailing-whitespace)<span class="builtin">:</span></span>
<span class="comment">;;       Set nobreak-char-display to nil always.</span>
<span class="comment">;;     ws-dont-highlight-(hard-(hyphens|spaces)|trailing-whitespace)<span class="builtin">:</span></span>
<span class="comment">;;       Reset nobreak-char-display only if not needed to be nil otherwise.</span>
<span class="comment">;;     ws(-dont)-highlight-other-chars: Do not set/reset nobreak-char-display.</span>
<span class="comment">;;     Everywhere: mention \u00a0, not just \240.</span>
<span class="comment">;; 2012/07/29 dadams</span>
<span class="comment">;;     ws-other-chars-defcustom-spec, ws-highlight-chars, ws-other-chars-font-lock-spec,</span>
<span class="comment">;;       ws-toggle-highlight-other-chars<span class="builtin">:</span></span>
<span class="comment">;;         Handle charsets too now.</span>
<span class="comment">;;     ws-other-chars-font-lock-spec: Use regexp-opt-charset for range, for Emacs 22+.</span>
<span class="comment">;; 2012/07/28 dadams</span>
<span class="comment">;;     Added: ws-highlight-chars, ws-other-chars-font-lock-override.</span>
<span class="comment">;;     ws(-dont)-highlight-other-chars, ws-other-chars-font-lock-spec<span class="builtin">:</span></span>
<span class="comment">;;       Added optional args CHARS and FACE.</span>
<span class="comment">;;     ws-other-chars-font-lock-spec: Use ws-other-chars-font-lock-override.</span>
<span class="comment">;; 2012/07/26 dadams</span>
<span class="comment">;;     Changed prefix from show-ws- to just ws-.  Removed suffix -show-ws from toggle-*.</span>
<span class="comment">;;     Added: *-hard-hyphen*, *-other(s)*, ws--saved*.  Renamed *-show* to *-highlight*.</span>
<span class="comment">;;     Use 'APPEND with font-lock-add-keywords, so not overridden by other font-locking.</span>
<span class="comment">;;     Added note to hard-space functions and vars about Emacs bug #12054.</span>
<span class="comment">;;     Factored out font-lock <span class="builtin">:group</span> to the defgroup.</span>
<span class="comment">;;     Added optional MSGP arg for commands - no msg otherwise.</span>
<span class="comment">;; 2011/01/04 dadams</span>
<span class="comment">;;     Added autoload cookies for defgroup and defface.</span>
<span class="comment">;; 2009/06/25 dadams</span>
<span class="comment">;;     show-ws-dont-*: Should be no-op's for Emacs 20, 21.</span>
<span class="comment">;; 2009/06/17 dadams</span>
<span class="comment">;;     Added: show-ws-dont-highlight-*.</span>
<span class="comment">;;     show-ws-toggle-show-*: Remove the font-lock keywords. Needed for Emacs 22+.</span>
<span class="comment">;; 2007/09/25 dadams</span>
<span class="comment">;;     Renamed to use prefix show-ws-.  Thx to Cyril Brulebois.</span>
<span class="comment">;; 2006/11/11 dadams</span>
<span class="comment">;;     Corrected doc strings.  Clarified: hard space is non-breaking space, ?\240.</span>
<span class="comment">;;     Included hard space in highlight-trailing-whitespace.</span>
<span class="comment">;; 2006/04/06 dadams</span>
<span class="comment">;;     highlight-*: Use font-lock-add-keywords.  Thanks to Karl Chen.</span>
<span class="comment">;; 2006/02/20 dadams</span>
<span class="comment">;;     Mentioned in Commentary how to use non-interactively.</span>
<span class="comment">;; 2006/01/07 dadams</span>
<span class="comment">;;     Added <span class="builtin">:link</span> for sending bug report.</span>
<span class="comment">;; 2006/01/06 dadams</span>
<span class="comment">;;     Added defgroup and use it.</span>
<span class="comment">;; 2005/12/30 dadams</span>
<span class="comment">;;     Removed require of def-face-const.el.</span>
<span class="comment">;;     Renamed faces, without <span class="string">"-face"</span>.</span>
<span class="comment">;; 2005/01/25 dadams</span>
<span class="comment">;;     Removed ###autoload for defvars.</span>
<span class="comment">;; 2004/06/10 dadams</span>
<span class="comment">;;     Fixed minor bug in highlight-* functions.</span>
<span class="comment">;;</span>
<span class="comment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>
<span class="comment">;;</span>
<span class="comment">;; This program is free software; you can redistribute it and/or</span>
<span class="comment">;; modify it under the terms of the GNU General Public License as</span>
<span class="comment">;; published by the Free Software Foundation; either version 3, or</span>
<span class="comment">;; (at your option) any later version.</span>
<span class="comment">;;</span>
<span class="comment">;; This program is distributed in the hope that it will be useful,</span>
<span class="comment">;; but WITHOUT ANY WARRANTY; without even the implied warranty of</span>
<span class="comment">;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU</span>
<span class="comment">;; General Public License for more details.</span>
<span class="comment">;;</span>
<span class="comment">;; You should have received a copy of the GNU General Public License</span>
<span class="comment">;; along with this program; see the file COPYING.  If not, write to</span>
<span class="comment">;; the Free Software Foundation, Inc., 51 Franklin Street, Fifth</span>
<span class="comment">;; Floor, Boston, MA 02110-1301, USA.</span>
<span class="comment">;;</span>
<span class="comment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>
<span class="comment">;;</span>
<span class="comment">;;; Code<span class="builtin">:</span></span>

<span class="comment">;;;;;;;;;;;;;;;;;;;;;;;;;</span>


<span class="comment">;; Quiet the byte compiler.</span>

(<span class="keyword">defvar</span> <span class="variable">nobreak-char-display</span>)

<span class="comment">;;;;;;;;;;;;;;;;;;;;;;;;;</span>

<span class="comment">;;;###<span class="warning">autoload</span></span>
(<span class="keyword">defgroup</span> <span class="type">Highlight-Characters</span> nil
  <span class="string">"Highlight specified sets of characters, possibly including whitespace."</span>
  <span class="builtin">:prefix</span> <span class="string">"hc-"</span>
  <span class="builtin">:group</span> 'convenience <span class="builtin">:group</span> 'matching <span class="builtin">:group</span> 'font-lock
  <span class="builtin">:link</span> `(url-link <span class="builtin">:tag</span> <span class="string">"Send Bug Report"</span>
          ,(concat <span class="string">"mailto:"</span> <span class="string">"drew.adams"</span> <span class="string">"@"</span> <span class="string">"oracle"</span> <span class="string">".com?subject=\
highlight-chars.el bug: \
<span class="type">&amp;body=Describe</span> bug here, starting with `emacs -q'.  \
Don't forget to mention your Emacs and library versions."</span>))
  <span class="builtin">:link</span> '(url-link <span class="builtin">:tag</span> <span class="string">"Other Libraries by Drew"</span>
          <span class="string">"http<span class="builtin">://www</span>.emacswiki.org/DrewsElispLibraries"</span>)
  <span class="builtin">:link</span> '(url-link <span class="builtin">:tag</span> <span class="string">"Download"</span>
          <span class="string">"http<span class="builtin">://www</span>.emacswiki.org/highlight-chars.el"</span>)
  <span class="builtin">:link</span> '(url-link <span class="builtin">:tag</span> <span class="string">"Description"</span>
          <span class="string">"http<span class="builtin">://www</span>.emacswiki.org/ShowWhiteSpace#HighlightChars"</span>)
  <span class="builtin">:link</span> '(emacs-commentary-link <span class="builtin">:tag</span> <span class="string">"Commentary"</span> <span class="string">"highlight-chars"</span>)
  )

<span class="comment">;;;###<span class="warning">autoload</span></span>
(<span class="keyword">defface</span> <span class="variable">hc-tab</span> '((t (<span class="builtin">:background</span> <span class="string">"LemonChiffon"</span>)))
  <span class="string">"*Face for highlighting tab characters (`<span class="constant important">C-i</span>') in Font-Lock mode."</span>
  <span class="builtin">:group</span> 'Highlight-Characters <span class="builtin">:group</span> 'faces)

<span class="comment">;;;###<span class="warning">autoload</span></span>
(<span class="keyword">defface</span> <span class="variable">hc-trailing-whitespace</span> '((t (<span class="builtin">:background</span> <span class="string">"Gold"</span>)))
  <span class="string">"*Face for highlighting whitespace at line ends in Font-Lock mode.
This includes tab, space, and hard (non-breaking) space characters."</span>
  <span class="builtin">:group</span> 'Highlight-Characters <span class="builtin">:group</span> 'faces)

<span class="comment">;;;###<span class="warning">autoload</span></span>
(<span class="keyword">defface</span> <span class="variable">hc-hard-space</span> '((t (<span class="builtin">:background</span> <span class="string">"Aquamarine"</span>)))
  <span class="string">"*Face for highlighting non-breaking spaces (`?\u00a0')in Font-Lock mode.
\(This is also ?\240.)"</span>
  <span class="builtin">:group</span> 'Highlight-Characters <span class="builtin">:group</span> 'faces)

(<span class="keyword cl">when</span> (&gt; emacs-major-version 22)
  (<span class="keyword">defface</span> <span class="variable">hc-hard-hyphen</span> '((t (<span class="builtin">:background</span> <span class="string">"PaleGreen"</span>)))
    <span class="string">"*Face for highlighting non-breaking hyphens (`?\u2011')in Font-Lock mode."</span>
    <span class="builtin">:group</span> 'Highlight-Characters <span class="builtin">:group</span> 'faces))

<span class="comment">;;;###<span class="warning">autoload</span></span>
(<span class="keyword">defface</span> <span class="variable">hc-other-char</span> '((t (<span class="builtin">:background</span> <span class="string">"HotPink"</span>)))
  <span class="string">"*Face for highlighting chars in `<span class="constant important">hc-other-chars</span>' in Font-Lock mode."</span>
  <span class="builtin">:group</span> 'Highlight-Characters <span class="builtin">:group</span> 'faces)

(<span class="keyword">defun</span> <span class="function">hc-other-chars-defcustom-spec</span> ()
  <span class="string">"Custom <span class="builtin">:type</span> spec for `<span class="constant important">hc-other-chars</span>' and `<span class="constant important">hc-other-chars-NOT</span>'."</span>
  (<span class="keyword elisp">if</span> (&gt; emacs-major-version 21)
      `(repeat
        (choice
         (string <span class="builtin">:tag</span> <span class="string">"Characters (string)"</span>)
         (choice <span class="builtin">:tag</span> <span class="string">"Character set"</span> ,@(mapcar (<span class="keyword elisp">lambda</span> (cset) `(const ,cset))
                                                (<span class="keyword elisp">if</span> (fboundp 'charset-priority-list)
                                                    (charset-priority-list)
                                                  charset-list)))
         (cons   <span class="builtin">:tag</span> <span class="string">"Character range"</span> (character <span class="builtin">:tag</span> <span class="string">"From"</span>) (character <span class="builtin">:tag</span> <span class="string">"To"</span>))
         (choice <span class="builtin">:tag</span> <span class="string">"Character class"</span>
          (const   <span class="builtin">:tag</span> <span class="string">"ASCII char\t[<span class="builtin">:ascii:</span>]"</span>                        [<span class="builtin">:ascii:</span>])
          (const   <span class="builtin">:tag</span> <span class="string">"Non-ASCII char\t[<span class="builtin">:nonascii:</span>]"</span>                 [<span class="builtin">:nonascii:</span>])
          (const   <span class="builtin">:tag</span> <span class="string">"Word char\t[<span class="builtin">:word:</span>]"</span>                          [<span class="builtin">:word:</span>])
          (const   <span class="builtin">:tag</span> <span class="string">"Letter or digit\t[<span class="builtin">:alnum:</span>]"</span>                   [<span class="builtin">:alnum:</span>])
          (const   <span class="builtin">:tag</span> <span class="string">"Letter\t[<span class="builtin">:alpha:</span>]"</span>                            [<span class="builtin">:alpha:</span>])
          (const   <span class="builtin">:tag</span> <span class="string">"Lowercase letter\t[<span class="builtin">:lower:</span>]"</span>                  [<span class="builtin">:lower:</span>])
          (const   <span class="builtin">:tag</span> <span class="string">"Uppercase letter\t[<span class="builtin">:upper:</span>]"</span>                  [<span class="builtin">:upper:</span>])
          (const   <span class="builtin">:tag</span> <span class="string">"Digit\t[<span class="builtin">:digit:</span>]"</span>                             [<span class="builtin">:digit:</span>])
          (const   <span class="builtin">:tag</span> <span class="string">"Hex digit\t[<span class="builtin">:xdigit:</span>]"</span>                        [<span class="builtin">:xdigit:</span>])
          (const   <span class="builtin">:tag</span> <span class="string">"Punctuation char (non-word char)\t[<span class="builtin">:punct:</span>]"</span>  [<span class="builtin">:punct:</span>])
          (const   <span class="builtin">:tag</span> <span class="string">"Space or tab char\t[<span class="builtin">:blank:</span>]"</span>                 [<span class="builtin">:blank:</span>])
          (const   <span class="builtin">:tag</span> <span class="string">"Whitespace char\t[<span class="builtin">:space:</span>]"</span>                   [<span class="builtin">:space:</span>])
          (const   <span class="builtin">:tag</span> <span class="string">"Control char\t[<span class="builtin">:cntrl:</span>]"</span>                      [<span class="builtin">:cntrl:</span>])
          (const   <span class="builtin">:tag</span> <span class="string">"Not control or delete char\t[<span class="builtin">:print:</span>]"</span>        [<span class="builtin">:print:</span>])
          (const   <span class="builtin">:tag</span> <span class="string">"Not control, space or delete char\t[<span class="builtin">:graph:</span>]"</span> [<span class="builtin">:graph:</span>])
          (const   <span class="builtin">:tag</span> <span class="string">"Multibyte char\t[<span class="builtin">:multibyte:</span>]"</span>                [<span class="builtin">:multibyte:</span>])
          (const   <span class="builtin">:tag</span> <span class="string">"Unibyte char\t[<span class="builtin">:unibyte:</span>]"</span>                    [<span class="builtin">:unibyte:</span>]))))
    '(repeat
      (choice
       (string <span class="builtin">:tag</span> <span class="string">"Characters (string)"</span>)
       (cons <span class="builtin">:tag</span> <span class="string">"Character range"</span> (character <span class="builtin">:tag</span> <span class="string">"From"</span>) (character <span class="builtin">:tag</span> <span class="string">"To"</span>))))))

<span class="comment">;;;###<span class="warning">autoload</span></span>
(<span class="keyword">defcustom</span> <span class="variable">hc-other-chars</span> ()
  <span class="string">"*Characters to highlight using face `<span class="constant important">hc-other-char</span>'.
The characters are highlighted unless they are excluded by option
`<span class="constant important">hc-other-chars-NOT</span>'.

A nil value means highlight *all* characters (except those excluded by
`<span class="constant important">hc-other-chars-NOT</span>').

If non-nil, the value is a list of entries, each of which can be any
of these:
 * a string of individual characters
 * a character range, represented as a cons (FROM . TO),
   where FROM and TO are both included
 * a character class, such as [<span class="builtin">:nonascii:</span>]
 * a character set, such as `iso-8859-1' or `<span class="constant important">lao</span>'

The last two alternatives are available only for Emacs 22 and later.

For the first alternative, remember that you can insert any character
into the string using `<span class="constant important">C-q</span>', and (for Emacs 23 and later) you can
insert any Unicode character using `C-x 8 RET'.

For Emacs 20, the first alternative is not well supported: Do not use
chars that are special within a regexp character alternative (i.e.,
\[...]).  In Emacs 20, the string you specify is simply wrapped with
\[...], which is not correct for all chars."</span>
  <span class="builtin">:set</span> (<span class="keyword elisp">lambda</span> (sym defs)
         (custom-set-default sym defs)
         (setq hc--saved-nobreak-char-display  nil)) <span class="comment">; Reset cached match-data.</span>
  <span class="builtin">:type</span> (hc-other-chars-defcustom-spec) <span class="builtin">:group</span> 'Highlight-Characters)

<span class="comment">;;;###<span class="warning">autoload</span></span>
(<span class="keyword">defcustom</span> <span class="variable">hc-other-chars-NOT</span> ()
  <span class="string">"*Chars to exclude from highlighting with face `<span class="constant important">hc-other-char</span>'.
The possible option values are the same as for `<span class="constant important">hc-other-char</span>'."</span>
  <span class="builtin">:set</span> (<span class="keyword elisp">lambda</span> (sym defs)
         (custom-set-default sym defs)
         (setq hc--saved-nobreak-char-display  nil)) <span class="comment">; Reset cached match-data.</span>
  <span class="builtin">:type</span> (hc-other-chars-defcustom-spec) <span class="builtin">:group</span> 'Highlight-Characters)

<span class="comment">;;;###<span class="warning">autoload</span></span>
(<span class="keyword">defcustom</span> <span class="variable">hc-other-chars-font-lock-override</span> 'append
  <span class="string">"*How highlighting for other chars interacts with existing highlighting.
The values correspond to the values for an OVERRIDE spec in
`<span class="constant important">font-lock-keywords</span>'.  See (elisp) `Search-based Fontification'.

This affects commands `<span class="constant important">hc-toggle-highlight-other-chars</span>' and
 `<span class="constant important">hc-highlight-chars</span>', and functions `<span class="constant important">hc-highlight-other-chars</span>' and
 `<span class="constant important">hc-dont-highlight-other-chars</span>'."</span>
  <span class="builtin">:type</span> '(choice
          (const <span class="builtin">:tag</span> <span class="string">"Do not override existing highlighting (`<span class="constant important">keep</span>')"</span> keep)
          (const <span class="builtin">:tag</span> <span class="string">"Merge after existing highlighting (`<span class="constant important">append</span>')"</span>   append)
          (const <span class="builtin">:tag</span> <span class="string">"Merge before existing highlighting (`<span class="constant important">prepend</span>')"</span> prepend)
          (const <span class="builtin">:tag</span> <span class="string">"Replace (override) existing highlighting"</span>       t))
  <span class="builtin">:group</span> 'Highlight-Characters)

(<span class="keyword">defvar</span> <span class="variable">hc-highlight-tabs-p</span> nil
  <span class="string">"Non-nil means font-lock mode highlights TAB characters (`<span class="constant important">C-i</span>')."</span>)

(<span class="keyword">defvar</span> <span class="variable">hc-highlight-trailing-whitespace-p</span> nil
  <span class="string">"Non-nil means font-lock mode highlights whitespace at line ends.
This includes tab, space, and hard (non-breaking) space characters."</span>)

(<span class="keyword">defvar</span> <span class="variable">hc-highlight-hard-spaces-p</span> nil
  <span class="string">"Non-nil means font-lock mode highlights non-breaking spaces (`?\u00a0').
\(This is also ?\240.)"</span>)

(<span class="keyword">defvar</span> <span class="variable">hc-highlight-hard-hyphens-p</span> nil
  <span class="string">"Non-nil means font-lock mode highlights non-breaking hyphens (`?\u2011')."</span>)

(<span class="keyword">defvar</span> <span class="variable">hc-highlight-other-chars-p</span> nil
  <span class="string">"Non-nil means font-lock mode highlights the chars in `<span class="constant important">hc-other-chars</span>'."</span>)

(<span class="keyword">defvar</span> <span class="variable">hc--other-chars-last-match-data</span> nil
  <span class="string">"Last successful match data for `<span class="constant important">hc-other-chars</span>'.
Used to restore match data after matching a character to exclude."</span>)

(<span class="keyword">defvar</span> <span class="variable">hc--saved-nobreak-char-display</span> (and (boundp 'nobreak-char-display)
                                            nobreak-char-display)
  <span class="string">"Saved value of `<span class="constant important">nobreak-char-display</span>', so that it can be restored."</span>)

<span class="comment">;;;###<span class="warning">autoload</span></span>
(<span class="keyword">defalias</span> '<span class="function">toggle-highlight-tabs</span> 'hc-toggle-highlight-tabs)
<span class="comment">;;;###<span class="warning">autoload</span></span>
(<span class="keyword">defun</span> <span class="function">hc-toggle-highlight-tabs</span> (<span class="type">&amp;optional</span> msgp)
  <span class="string">"Toggle highlighting of TABs, using face `<span class="constant important">hc-tab</span>'."</span>
  (interactive <span class="string">"p"</span>)
  (setq hc-highlight-tabs-p  (not hc-highlight-tabs-p))
  (<span class="keyword elisp">if</span> hc-highlight-tabs-p
      (add-hook 'font-lock-mode-hook 'hc-highlight-tabs)
    (remove-hook 'font-lock-mode-hook 'hc-highlight-tabs)
    (hc-dont-highlight-tabs))
  (font-lock-mode) (font-lock-mode)
  (<span class="keyword cl">when</span> msgp
    (message <span class="string">"TAB highlighting is now %s"</span> (<span class="keyword elisp">if</span> hc-highlight-tabs-p <span class="string">"ON"</span> <span class="string">"OFF"</span>))))

<span class="comment">;;;###<span class="warning">autoload</span></span>
(<span class="keyword">defalias</span> '<span class="function">toggle-highlight-hard-spaces</span> 'hc-toggle-highlight-hard-spaces)
<span class="comment">;;;###<span class="warning">autoload</span></span>
(<span class="keyword">defun</span> <span class="function">hc-toggle-highlight-hard-spaces</span> (<span class="type">&amp;optional</span> msgp)
  <span class="string">"Toggle highlighting of non-breaking space characters (`?\u00a0').
\(This is also ?\240.)
Uses face `<span class="constant important">hc-hard-space</span>'."</span>
  (interactive <span class="string">"p"</span>)
  (setq hc-highlight-hard-spaces-p  (not hc-highlight-hard-spaces-p))
  (<span class="keyword elisp">cond</span> (hc-highlight-hard-spaces-p
         (add-hook 'font-lock-mode-hook 'hc-highlight-hard-spaces))
        (t
         (remove-hook 'font-lock-mode-hook 'hc-highlight-hard-spaces)
         (hc-dont-highlight-hard-spaces)))
  (font-lock-mode) (font-lock-mode)
  (<span class="keyword cl">when</span> msgp (message <span class="string">"Hard (non-breaking) space highlighting is now %s"</span>
                      (<span class="keyword elisp">if</span> hc-highlight-hard-spaces-p <span class="string">"ON"</span> <span class="string">"OFF"</span>))))

(<span class="keyword cl">when</span> (&gt; emacs-major-version 22)
  (<span class="keyword">defalias</span> '<span class="function">toggle-highlight-hard-hyphens</span> 'hc-toggle-highlight-hard-hyphens)
  (<span class="keyword">defun</span> <span class="function">hc-toggle-highlight-hard-hyphens</span> (<span class="type">&amp;optional</span> msgp)
    <span class="string">"Toggle highlighting of non-breaking hyphen characters (`?\u2011').
Uses face `<span class="constant important">hc-hyphen-space</span>'."</span>
    (interactive <span class="string">"p"</span>)
    (setq hc-highlight-hard-hyphens-p  (not hc-highlight-hard-hyphens-p))
    (<span class="keyword elisp">cond</span> (hc-highlight-hard-hyphens-p
           (add-hook 'font-lock-mode-hook 'hc-highlight-hard-hyphens))
          (t
           (remove-hook 'font-lock-mode-hook 'hc-highlight-hard-hyphens)
           (hc-dont-highlight-hard-hyphens)))
    (font-lock-mode) (font-lock-mode)
    (<span class="keyword cl">when</span> msgp (message <span class="string">"Hard (non-breaking) hyphen highlighting is now %s"</span>
                        (<span class="keyword elisp">if</span> hc-highlight-hard-hyphens-p <span class="string">"ON"</span> <span class="string">"OFF"</span>)))))

<span class="comment">;;;###<span class="warning">autoload</span></span>
(<span class="keyword">defun</span> <span class="function">hc-highlight-chars</span> (chars face <span class="type">&amp;optional</span> offp msgp)
  <span class="string">"Read a string of CHARS, read a FACE name, then highlight the CHARS.
With a prefix arg, unhighlight the CHARS.

As an alternative to being a string of characters, CHARS can be any of
the following (<span class="keyword cl">the</span> last two are only for Emacs 22+):

* A cons (C1 . C2), where C1 and C2 are characters, that is, integers,
  which you can represent using character notation.  This represents
  the range of characters from C1 through C2.

  For example, you would enter `(?a . ?g)' to mean the characters from
  `<span class="constant important">a</span>' through `<span class="constant important">g</span>', inclusive.  Note that you enter the parentheses and
  the dot, and you can use character read syntax (e.g., `<span class="constant important">?a</span>' for `<span class="constant important">a</span>').

* A character class, such as `[<span class="builtin">:digit:</span>]'.  This matches all characters
  in the class.  You must type the brackets and colons (`<span class="constant important"><span class="builtin">:</span></span>').  (This
  possibility is available only for Emacs 22 and later.)

* A character set, such as `iso-8859-1' or `<span class="constant important">lao</span>'.  This matches all
  characters in the set.

If you mistype CHARS in one of the above representations, then what
you type is interpreted as just a string of the characters to
highlight.  For example, if you mean to type `[<span class="builtin">:digit:</span>]' but you
instead type `[<span class="builtin">:digit</span>]' (no second colon), then the characters
highlighted are [, :, d, g, i, t, and ]."</span>
  (interactive
   (<span class="keyword elisp">let</span>* ((prompt  (format <span class="string">"Chars to %shighlight: "</span> (<span class="keyword elisp">if</span> current-prefix-arg <span class="string">"UN"</span> <span class="string">""</span>)))
          (chrs    (read-string prompt))
          (chrs    (<span class="keyword elisp">progn</span> (<span class="keyword elisp">while</span> (string= <span class="string">""</span> chrs)
                            (setq chrs  (read-string (concat (substring prompt 0 -2)
                                                             <span class="string">" (not empty): "</span>))))
                          chrs))
          (fac     (read-face-name <span class="string">"Face"</span>)))
     (<span class="keyword cl">when</span> (string= <span class="string">""</span> fac)  (setq fac  'hc-other-chars))
     (list (<span class="keyword elisp">let</span> ((cs  (<span class="keyword elisp">condition-case</span> nil  (read chrs)  (<span class="warning">error</span> nil))))
             (<span class="keyword elisp">cond</span> ((and (fboundp 'charsetp)  (charsetp cs)) <span class="comment">; Charset</span>
                    (list cs))
                   ((and (consp cs)     <span class="comment">; Char range: (ch1 . ch2)</span>
                         (<span class="keyword elisp">if</span> (fboundp 'characterp) (characterp (car cs)) (integerp (car cs)))
                         (<span class="keyword elisp">if</span> (fboundp 'characterp) (characterp (cdr cs)) (integerp (cdr cs))))
                    (list cs))
                   ((and (&gt; emacs-major-version 21) <span class="comment">; Char class</span>
                         (vectorp cs)  (= 1 (length cs))  (keywordp (aref cs 0))
                         (<span class="keyword elisp">let</span> ((name  (symbol-name (aref cs 0))))
                           (eq ?: (aref name (1- (length name))))))
                    (list cs))
                   (t (list chrs))))    <span class="comment">; Separate chars</span>
           fac
           current-prefix-arg
           t)))
  (<span class="keyword elisp">if</span> (not offp)
      (add-hook 'font-lock-mode-hook
                `(<span class="keyword elisp">lambda</span> () (hc-highlight-other-chars ',chars nil ',face))
                'APPEND)
    (remove-hook 'font-lock-mode-hook
                 `(<span class="keyword elisp">lambda</span> () (hc-highlight-other-chars ',chars nil ',face)))
    (hc-dont-highlight-other-chars chars nil face))
  (font-lock-mode) (font-lock-mode)
  (<span class="keyword cl">when</span> msgp
    (message <span class="string">"Highlighting of %s with face `<span class="constant important">%s</span>' is now %s"</span>
             (mapconcat #'hc-other-chars-description chars <span class="string">", "</span>)
             (<span class="keyword elisp">if</span> (fboundp 'propertize)
                 (propertize (symbol-name face) 'face face)
               face)
             (<span class="keyword elisp">if</span> offp <span class="string">"OFF"</span> <span class="string">"ON"</span>))))

<span class="comment">;;;###<span class="warning">autoload</span></span>
(<span class="keyword">defalias</span> '<span class="function">toggle-highlight-other-chars</span> 'hc-toggle-highlight-other-chars)
<span class="comment">;;;###<span class="warning">autoload</span></span>
(<span class="keyword">defun</span> <span class="function">hc-toggle-highlight-other-chars</span> (<span class="type">&amp;optional</span> face msgp)
  <span class="string">"Toggle highlighting chars in `<span class="constant important">hc-other-chars</span>'
By default, face `<span class="constant important">hc-other-char</span>' is used.
With a prefix arg you are prompted for the face to use."</span>
  (interactive
   (<span class="keyword elisp">progn</span> (<span class="keyword cl">unless</span> hc-other-chars (<span class="warning">error</span> <span class="string">"No chars in `<span class="constant important">hc-other-chars</span>' to highlight"</span>))
          (<span class="keyword elisp">let</span> ((fac  (and current-prefix-arg  (read-face-name <span class="string">"Face"</span>))))
            (<span class="keyword cl">when</span> (and fac  (string= <span class="string">""</span> fac))  (setq fac  'hc-other-chars))
            (list fac t))))
  (<span class="keyword cl">when</span> (and (not hc-other-chars)  msgp)
    (<span class="warning">error</span> <span class="string">"No chars in `<span class="constant important">hc-other-chars</span>' to highlight"</span>))
  (setq hc-highlight-other-chars-p  (not hc-highlight-other-chars-p))
  (<span class="keyword elisp">cond</span> (hc-highlight-other-chars-p
         (add-hook
          'font-lock-mode-hook
          (<span class="keyword elisp">if</span> face
              `(<span class="keyword elisp">lambda</span> () (hc-highlight-other-chars hc-other-chars hc-other-chars-NOT ',face))
            'hc-highlight-other-chars)))
        (t
         (remove-hook
          'font-lock-mode-hook
          (<span class="keyword elisp">if</span> face
              `(<span class="keyword elisp">lambda</span> () (hc-highlight-other-chars hc-other-chars hc-other-chars-NOT ',face))
            'hc-highlight-other-chars))
         (<span class="keyword elisp">if</span> face
             (hc-dont-highlight-other-chars hc-other-chars hc-other-chars-NOT face)
           (hc-dont-highlight-other-chars))))
  (font-lock-mode) (font-lock-mode)
  (<span class="keyword cl">when</span> msgp
    (message <span class="string">"Highlighting of %s%s%s is now %s"</span>
             (mapconcat #'hc-other-chars-description hc-other-chars <span class="string">", "</span>)
             (<span class="keyword elisp">if</span> hc-other-chars-NOT
                 (format <span class="string">" (EXCEPT %s)"</span> (mapconcat #'hc-other-chars-description
                                                   hc-other-chars-NOT
                                                   <span class="string">", "</span>))
               <span class="string">""</span>)
             (<span class="keyword elisp">if</span> face
                 (format <span class="string">" in face `<span class="constant important">%s</span>'"</span> (<span class="keyword elisp">if</span> (fboundp 'propertize)
                                             (propertize (symbol-name face) 'face face)
                                           face))
               <span class="string">""</span>)
             (<span class="keyword elisp">if</span> hc-highlight-other-chars-p <span class="string">"ON"</span> <span class="string">"OFF"</span>))))

(<span class="keyword">defun</span> <span class="function">hc-other-chars-description</span> (chars <span class="type">&amp;optional</span> face)
  <span class="string">"Return a desription of CHARS."</span>
  (<span class="keyword elisp">cond</span> ((and (fboundp 'charsetp)  (charsetp chars)) <span class="comment">; Charset</span>
         (format <span class="string">"charset `<span class="constant important">%s</span>'"</span> chars))
        ((and (consp chars)             <span class="comment">; Char range: (ch1 . ch2)</span>
              (<span class="keyword elisp">if</span> (fboundp 'characterp) (characterp (car chars)) (integerp (car chars)))
              (<span class="keyword elisp">if</span> (fboundp 'characterp) (characterp (cdr chars)) (integerp (cdr chars))))
         (<span class="keyword elisp">if</span> (and face  (fboundp 'propertize))
             (format <span class="string">"%s to %s"</span>
                     (propertize (string (car chars)) 'face face)
                     (propertize (string (cdr chars)) 'face face))
           (format <span class="string">"%c to %c"</span> (car chars) (cdr chars))))
        ((vectorp chars)                <span class="comment">; Char class</span>
         (format <span class="string">"%s"</span> chars))
        ((stringp chars)                <span class="comment">; Separate chars</span>
         (mapconcat (<span class="keyword elisp">if</span> (and face  (fboundp 'propertize))
                        (<span class="keyword elisp">lambda</span> (chr) (propertize (string chr) 'face face))
                      #'string)
                    chars
                    <span class="string">", "</span>))))

<span class="comment">;;;###<span class="warning">autoload</span></span>
(<span class="keyword">defalias</span> '<span class="function">toggle-highlight-trailing-whitespace</span>
    'hc-toggle-highlight-trailing-whitespace)
<span class="comment">;;;###<span class="warning">autoload</span></span>
(<span class="keyword">defun</span> <span class="function">hc-toggle-highlight-trailing-whitespace</span> (<span class="type">&amp;optional</span> msgp)
  <span class="string">"Toggle highlighting of trailing whitespace.
This includes tab, space, and hard (non-breaking) space characters.
Uses face `<span class="constant important">hc-trailing-whitespace</span>'."</span>
  (interactive <span class="string">"p"</span>)
  (setq hc-highlight-trailing-whitespace-p  (not hc-highlight-trailing-whitespace-p))
  (<span class="keyword elisp">if</span> hc-highlight-trailing-whitespace-p
      (add-hook 'font-lock-mode-hook 'hc-highlight-trailing-whitespace)
    (remove-hook 'font-lock-mode-hook 'hc-highlight-trailing-whitespace)
    (hc-dont-highlight-trailing-whitespace))
  (font-lock-mode) (font-lock-mode)
  (<span class="keyword cl">when</span> msgp (message <span class="string">"Trailing whitespace highlighting is now %s"</span>
                      (<span class="keyword elisp">if</span> hc-highlight-trailing-whitespace-p <span class="string">"ON"</span> <span class="string">"OFF"</span>))))

(<span class="keyword">defun</span> <span class="function">hc-highlight-tabs</span> ()
  <span class="string">"Highlight tab characters (`<span class="constant important">C-i</span>')."</span>
  (font-lock-add-keywords nil '((<span class="string">"[\t]+"</span> (0 'hc-tab t))) 'APPEND))

<span class="comment">;; These are no-ops for Emacs 20, 21<span class="builtin">:</span></span>
<span class="comment">;; `<span class="constant important">font-lock-remove-keywords</span>' is not defined, and we don't need to use it.</span>
(<span class="keyword">defun</span> <span class="function">hc-dont-highlight-tabs</span> ()
  <span class="string">"Do not highlight tab characters (`<span class="constant important">C-i</span>')."</span>
  (<span class="keyword cl">when</span> (fboundp 'font-lock-remove-keywords)
    (font-lock-remove-keywords nil '((<span class="string">"[\t]+"</span> (0 'hc-tab t))))))

(<span class="keyword">defun</span> <span class="function">hc-highlight-hard-spaces</span> ()
  <span class="string">"Highlight hard (non-breaking) space characters (`?\u00a0').
\(This is also ?\240.)
This also sets `<span class="constant important">nobreak-char-display</span>' to nil, to turn off its
low-level, vanilla highlighting."</span>
  (<span class="keyword cl">when</span> (boundp 'nobreak-char-display) (setq nobreak-char-display  nil))
  (<span class="keyword elisp">if</span> (&gt; emacs-major-version 22)
      (font-lock-add-keywords nil '((<span class="string">"[\u00a0]+"</span> (0 'hc-hard-space t))) 'APPEND)
    (font-lock-add-keywords nil '((<span class="string">"[\240]+"</span> (0 'hc-hard-space t))) 'APPEND)))

(<span class="keyword">defun</span> <span class="function">hc-dont-highlight-hard-spaces</span> ()
  <span class="string">"Do not highlight hard (non-breaking) space characters (`?\u00a0').
\(This is also ?\240.)
If no other `<span class="constant important">hc-*</span>' highlighting of hard spaces or hard hyphens is in
effect, this also restores `<span class="constant important">nobreak-char-display</span>' to its original
value."</span>
  (<span class="keyword cl">unless</span> (or hc-highlight-trailing-whitespace-p  hc-highlight-hard-hyphens-p)
    (setq nobreak-char-display  hc--saved-nobreak-char-display))
  (<span class="keyword cl">when</span> (fboundp 'font-lock-remove-keywords)
    (<span class="keyword elisp">if</span> (&gt; emacs-major-version 22)
        (font-lock-remove-keywords nil '((<span class="string">"[\u00a0]+"</span> (0 'hc-hard-space t))))
      (font-lock-remove-keywords nil '((<span class="string">"[\240]+"</span> (0 'hc-hard-space t)))))))

(<span class="keyword cl">when</span> (&gt; emacs-major-version 22)
  (<span class="keyword">defun</span> <span class="function">hc-highlight-hard-hyphens</span> ()
    <span class="string">"Highlight hard (non-breaking) hyphen characters (`?\u2011').
This also sets `<span class="constant important">nobreak-char-display</span>' to nil, to turn off its
low-level, vanilla highlighting."</span>
    (<span class="keyword cl">when</span> (boundp 'nobreak-char-display) (setq nobreak-char-display  nil))
    (font-lock-add-keywords nil '((<span class="string">"[\u2011]+"</span> (0 'hc-hard-hyphen t))) 'APPEND)))

(<span class="keyword cl">when</span> (&gt; emacs-major-version 22)
  (<span class="keyword">defun</span> <span class="function">hc-dont-highlight-hard-hyphens</span> ()
    <span class="string">"Stop highlighting hard (non-breaking) hyphen characters (`?\u2011').
If no other `<span class="constant important">hc-*</span>' highlighting of hard spaces or hard hyphens is in
effect, this also restores `<span class="constant important">nobreak-char-display</span>' to its original
value."</span>
    (<span class="keyword cl">unless</span> (or hc-highlight-trailing-whitespace-p  hc-highlight-hard-spaces-p)
      (setq nobreak-char-display  hc--saved-nobreak-char-display))
    (<span class="keyword cl">when</span> (fboundp 'font-lock-remove-keywords)
      (font-lock-remove-keywords nil '((<span class="string">"[\u2011]+"</span> (0 'hc-hard-hyphen t)))))))

(<span class="keyword">defun</span> <span class="function">hc-highlight-trailing-whitespace</span> ()
  <span class="string">"Highlight whitespace characters at line ends.
This includes tab, space, and hard (non-breaking) space characters.
This also sets `<span class="constant important">nobreak-char-display</span>' to nil, to turn off the
low-level, vanilla highlighting of hard spaces."</span>
  (<span class="keyword cl">when</span> (boundp 'nobreak-char-display) (setq nobreak-char-display  nil))
  (<span class="keyword elisp">if</span> (&gt; emacs-major-version 22)
      (font-lock-add-keywords
       nil '((<span class="string">"[\u00a0\040\t]+$"</span> (0 'hc-trailing-whitespace t))) 'APPEND)
    (font-lock-add-keywords
     nil '((<span class="string">"[\240\040\t]+$"</span> (0 'hc-trailing-whitespace t))) 'APPEND)))

(<span class="keyword">defun</span> <span class="function">hc-dont-highlight-trailing-whitespace</span> ()
  <span class="string">"Do not highlight whitespace characters at line ends.
See also `<span class="constant important">hc-highlight-trailing-whitespace</span>'.
If no other `<span class="constant important">hc-*</span>' highlighting of hard spaces or hard hyphens is in
effect, this also restores `<span class="constant important">nobreak-char-display</span>' to its original
value."</span>
  (<span class="keyword cl">unless</span> (or hc-highlight-hard-spaces-p  hc-highlight-hard-hyphens-p)
    (setq nobreak-char-display  hc--saved-nobreak-char-display))
  (<span class="keyword cl">when</span> (fboundp 'font-lock-remove-keywords)
    (<span class="keyword elisp">if</span> (&gt; emacs-major-version 22)
        (font-lock-remove-keywords
         nil '((<span class="string">"[\u00a0\040\t]+$"</span> (0 'hc-trailing-whitespace t))))
      (font-lock-remove-keywords
       nil '((<span class="string">"[\240\040\t]+$"</span> (0 'hc-trailing-whitespace t)))))))

(<span class="keyword">defun</span> <span class="function">hc-highlight-other-chars</span> (<span class="type">&amp;optional</span> chars chars-NOT face)
  <span class="string">"Highlight CHARS using FACE.
CHARS and CHARS-NOT are lists of character specifications acceptable
as a value of `<span class="constant important">hc-other-chars</span>' or `<span class="constant important">hc-other-chars-NOT</span>'.
CHARS defaults to the value of `<span class="constant important">hc-other-chars</span>'.
CHARS-NOT defaults to the value of `<span class="constant important">hc-other-chars-NOT</span>'.
FACE defaults to face `<span class="constant important">hc-other-char</span>'."</span>
  (font-lock-add-keywords
   nil (hc-other-chars-font-lock-spec chars chars-NOT face) 'APPEND))

(<span class="keyword">defun</span> <span class="function">hc-dont-highlight-other-chars</span> (<span class="type">&amp;optional</span> chars chars-NOT face)
  <span class="string">"Do not highlight CHARS using FACE.  That is, unhighlight any such.
CHARS, CHARS-NOT, and FACE are as for `<span class="constant important">hc-highlight-other-chars</span>'."</span>
  (<span class="keyword cl">when</span> (fboundp 'font-lock-remove-keywords)
    (font-lock-remove-keywords
     nil (hc-other-chars-font-lock-spec chars chars-NOT face))))

(<span class="keyword">defun</span> <span class="function">hc-other-chars-font-lock-spec</span> (<span class="type">&amp;optional</span> chars chars-NOT face)
  <span class="string">"Font-lock spec used by `<span class="constant important">hc-highlight-other-chars</span>'.
CHARS, CHARS-NOT, and FACE are as for `<span class="constant important">hc-highlight-other-chars</span>'."</span>
  (setq face         (or face  'hc-other-char)
        chars        (or chars  hc-other-chars)
        chars-NOT    (or chars-NOT  hc-other-chars-NOT))
  (<span class="keyword elisp">let</span> ((regexp-in  (format
                     <span class="string">"\\(%s\\)"</span>
                     (mapconcat
                      #'identity
                      (mapcar (<span class="keyword elisp">lambda</span> (chrs)
                                (<span class="keyword elisp">cond</span> ((and (consp chrs) <span class="comment">; Char range: (ch1 . ch2)</span>
                                            (<span class="keyword elisp">if</span> (fboundp 'characterp)
                                                (characterp (car chrs))
                                              (integerp (car chrs)))
                                            (<span class="keyword elisp">if</span> (fboundp 'characterp)
                                                (characterp (cdr chrs))
                                              (integerp (cdr chrs))))
                                       (<span class="keyword elisp">let</span> ((chr   (car chrs))
                                             (last  (cdr chrs)))
                                         (<span class="keyword elisp">if</span> (&gt; emacs-major-version 20)
                                             (<span class="keyword elisp">let</span> ((chs  ()))
                                               (<span class="keyword elisp">while</span> (&lt;= chr last)
                                                 (push chr chs)
                                                 (setq chr  (1+ chr)))
                                               (regexp-opt-charset (nreverse chs)))
                                           (<span class="keyword elisp">let</span> ((class  <span class="string">"["</span>))
                                             (<span class="keyword elisp">while</span> (&lt;= chr last)
                                               (setq class  (concat class (string chr))
                                                     chr    (1+ chr)))
                                             (concat class <span class="string">"]"</span>)))))
                                      ((and (fboundp 'charsetp)  (charsetp chrs)) <span class="comment">; Charset</span>
                                       (<span class="keyword elisp">let</span> ((chs  ()))
                                         (map-charset-chars
                                          (<span class="keyword elisp">lambda</span> (range ARG)
                                            (<span class="keyword elisp">let</span> ((chr   (car range))
                                                  (last  (cdr range)))
                                              (<span class="keyword elisp">while</span> (&lt;= chr last)
                                                (push chr chs)
                                                (setq chr  (1+ chr)))))
                                          chrs)
                                         (regexp-opt-charset (nreverse chs))))
                                      ((vectorp chrs) <span class="comment">; Char class</span>
                                       (concat <span class="string">"["</span> (format <span class="string">"%s"</span> chrs) <span class="string">"]"</span>))
                                      ((stringp chrs) <span class="comment">; Separate chars</span>
                                       (<span class="keyword elisp">if</span> (&gt; emacs-major-version 20)
                                           (regexp-opt-charset (append chrs ()))
                                         <span class="comment">;; Emacs 20 `<span class="constant important">regexp-opt-charset</span>' does not work.</span>
                                         <span class="comment">;; Fake it.</span>
                                         (concat <span class="string">"["</span> chrs <span class="string">"]"</span>)))))
                              chars)
                      <span class="string">"\\|"</span>)))
        (regexp-out  (format
                      <span class="string">"\\(%s\\)"</span>
                      (mapconcat
                       #'identity
                       (mapcar (<span class="keyword elisp">lambda</span> (chrs)
                                 (<span class="keyword elisp">cond</span> ((and (consp chrs) <span class="comment">; Char range: (ch1 . ch2)</span>
                                             (<span class="keyword elisp">if</span> (fboundp 'characterp)
                                                 (characterp (car chrs))
                                               (integerp (car chrs)))
                                             (<span class="keyword elisp">if</span> (fboundp 'characterp)
                                                 (characterp (cdr chrs))
                                               (integerp (cdr chrs))))
                                        (<span class="keyword elisp">let</span> ((chr   (car chrs))
                                              (last  (cdr chrs)))
                                          (<span class="keyword elisp">if</span> (&gt; emacs-major-version 20)
                                              (<span class="keyword elisp">let</span> ((chs  ()))
                                                (<span class="keyword elisp">while</span> (&lt;= chr last)
                                                  (push chr chs)
                                                  (setq chr  (1+ chr)))
                                                (regexp-opt-charset (nreverse chs)))
                                            (<span class="keyword elisp">let</span> ((class  <span class="string">"["</span>))
                                              (<span class="keyword elisp">while</span> (&lt;= chr last)
                                                (setq class  (concat class (string chr))
                                                      chr    (1+ chr)))
                                              (concat class <span class="string">"]"</span>)))))
                                       ((and (fboundp 'charsetp)  (charsetp chrs)) <span class="comment">;Charset</span>
                                        (<span class="keyword elisp">let</span> ((chs  ()))
                                          (map-charset-chars
                                           (<span class="keyword elisp">lambda</span> (range ARG)
                                             (<span class="keyword elisp">let</span> ((chr   (car range))
                                                   (last  (cdr range)))
                                               (<span class="keyword elisp">while</span> (&lt;= chr last)
                                                 (push chr chs)
                                                 (setq chr  (1+ chr)))))
                                           chrs)
                                          (regexp-opt-charset (nreverse chs))))
                                       ((vectorp chrs) <span class="comment">; Char class</span>
                                        (concat <span class="string">"["</span> (format <span class="string">"%s"</span> chrs) <span class="string">"]"</span>))
                                       ((stringp chrs) <span class="comment">; Separate chars</span>
                                        (<span class="keyword elisp">if</span> (&gt; emacs-major-version 20)
                                            (regexp-opt-charset (append chrs ()))
                                          <span class="comment">;; Emacs 20 `<span class="constant important">regexp-opt-charset</span>' does not work.</span>
                                          <span class="comment">;; Fake it.</span>
                                          (concat <span class="string">"["</span> chrs <span class="string">"]"</span>)))))
                               chars-NOT)
                       <span class="string">"\\|"</span>))))
    `((,(hc-other-chars-matcher regexp-in regexp-out)
        (0 ',face ,hc-other-chars-font-lock-override)))))

(<span class="keyword">defun</span> <span class="function">hc-other-chars-matcher</span> (regexp-in regexp-out)
  <span class="string">"Return a font-lock matcher function for `<span class="constant important">hc-other-chars-font-lock-spec</span>'.
REGEXP-IN is a regexp for matching the CHARS arg, that is, for chars
 to be included.
REGEXP-OUT is a regexp for matching the CHARS-NOT arg, that is, for
 chars to be excluded."</span>
  `(<span class="keyword elisp">lambda</span> (bound)
    (<span class="keyword elisp">let</span> ((in     nil)
          (mdata  (or hc--other-chars-last-match-data  (match-data))))
      (setq in  (<span class="keyword elisp">if</span> (string= <span class="string">"\\(\\)"</span> ,regexp-in) <span class="comment">; No CHARS, but maybe CHARS-NOT</span>
                    (<span class="keyword elisp">progn</span> (forward-char)
                           (set-match-data <span class="comment">; Fake it - put match data around the char.</span>
                            (list (copy-marker (1- (point))) (copy-marker (point))
                                  (copy-marker (1- (point))) (copy-marker (point))))
                           (point))
                  (re-search-forward ,regexp-in bound t)))
      (<span class="keyword cl">unless</span> in (setq hc--other-chars-last-match-data  nil)) <span class="comment">; Search failed, so reset.</span>
      (and in  (<span class="keyword elisp">progn</span>
                 (<span class="keyword elisp">if</span> (string= <span class="string">"\\(\\)"</span> ,regexp-out) <span class="comment">; No chars to exclude.</span>
                     (setq hc--other-chars-last-match-data  (match-data))
                   (<span class="keyword elisp">if</span> (<span class="keyword elisp">save-excursion</span>
                         (<span class="keyword elisp">save-match-data</span> (backward-char 1) (looking-at ,regexp-out)))
                       (set-match-data mdata)
                     (setq hc--other-chars-last-match-data  (match-data))))
                 (goto-char in))))))

<span class="comment">;;;;;;;;;;;;;;;;;;;;;;;</span>

(<span class="keyword">provide</span> '<span class="constant">highlight-chars</span>)

<span class="comment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>
<span class="comment">;;; highlight-chars.el ends here</span></pre></div><div class="wrapper close"></div></div><div class="footer"><hr /><span class="gotobar bar"><a class="local" href="http://www.emacswiki.org/emacs/SiteMap">SiteMap</a> <a class="local" href="http://www.emacswiki.org/emacs/Search">Search</a> <a class="local" href="http://www.emacswiki.org/emacs/ElispArea">ElispArea</a> <a class="local" href="http://www.emacswiki.org/emacs/HowTo">HowTo</a> <a class="local" href="http://www.emacswiki.org/emacs/Glossary">Glossary</a> <a class="local" href="http://www.emacswiki.org/emacs/RecentChanges">RecentChanges</a> <a class="local" href="http://www.emacswiki.org/emacs/News">News</a> <a class="local" href="http://www.emacswiki.org/emacs/Problems">Problems</a> <a class="local" href="http://www.emacswiki.org/emacs/Suggestions">Suggestions</a> </span><span class="translation bar"><br />  <a class="translation new" rel="nofollow" href="http://www.emacswiki.org/emacs?action=translate;id=highlight-chars.el;missing=de_es_fr_it_ja_ko_pt_ru_se_zh">Add Translation</a></span><span class="edit bar"><br /> <a class="comment local edit" accesskey="c" href="http://www.emacswiki.org/emacs/Comments_on_highlight-chars.el">Talk</a> <a class="password" rel="nofollow" href="http://www.emacswiki.org/emacs?action=password">This page is read-only</a> <a class="history" rel="nofollow" href="http://www.emacswiki.org/emacs?action=history;id=highlight-chars.el">View other revisions</a> <a class="admin" rel="nofollow" href="http://www.emacswiki.org/emacs?action=admin;id=highlight-chars.el">Administration</a></span><span class="time"><br /> Last edited 2013-09-08 19:27 UTC by <a class="author" title="from c-71-202-147-44.hsd1.ca.comcast.net" href="http://www.emacswiki.org/emacs/DrewAdams">DrewAdams</a> <a class="diff" rel="nofollow" href="http://www.emacswiki.org/emacs?action=browse;diff=2;id=highlight-chars.el">(diff)</a></span><form method="get" action="http://www.emacswiki.org/cgi-bin/emacs" enctype="multipart/form-data" accept-charset="utf-8" class="search">
<p><label for="search">Search:</label> <input type="text" name="search"  size="20" accesskey="f" id="search" /> <label for="searchlang">Language:</label> <input type="text" name="lang"  size="10" id="searchlang" /> <input type="submit" name="dosearch" value="Go!" /></p></form><div style="float:right; margin-left:1ex;">
<!-- Creative Commons License -->
<a class="licence" href="http://creativecommons.org/licenses/GPL/2.0/"><img alt="CC-GNU GPL" style="border:none" src="/pics/cc-GPL-a.png" /></a>
<!-- /Creative Commons License -->
</div>

<!--
<rdf:RDF xmlns="http://web.resource.org/cc/"
 xmlns:dc="http://purl.org/dc/elements/1.1/"
 xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<Work rdf:about="">
   <license rdf:resource="http://creativecommons.org/licenses/GPL/2.0/" />
  <dc:type rdf:resource="http://purl.org/dc/dcmitype/Software" />
</Work>

<License rdf:about="http://creativecommons.org/licenses/GPL/2.0/">
   <permits rdf:resource="http://web.resource.org/cc/Reproduction" />
   <permits rdf:resource="http://web.resource.org/cc/Distribution" />
   <requires rdf:resource="http://web.resource.org/cc/Notice" />
   <permits rdf:resource="http://web.resource.org/cc/DerivativeWorks" />
   <requires rdf:resource="http://web.resource.org/cc/ShareAlike" />
   <requires rdf:resource="http://web.resource.org/cc/SourceCode" />
</License>
</rdf:RDF>
-->

<p class="legal">
This work is licensed to you under version 2 of the
<a href="http://www.gnu.org/">GNU</a> <a href="/GPL">General Public License</a>.
Alternatively, you may choose to receive this work under any other
license that grants the right to use, copy, modify, and/or distribute
the work, as long as that license imposes the restriction that
derivative works have to grant the same rights and impose the same
restriction. For example, you may choose to receive this work under
the
<a href="http://www.gnu.org/">GNU</a>
<a href="/FDL">Free Documentation License</a>, the
<a href="http://creativecommons.org/">CreativeCommons</a>
<a href="http://creativecommons.org/licenses/sa/1.0/">ShareAlike</a>
License, the XEmacs manual license, or
<a href="/OLD">similar licenses</a>.
</p>
</div>
</body>
</html>
