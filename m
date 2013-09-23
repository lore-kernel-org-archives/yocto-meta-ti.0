Return-Path: <leonid.iziumtsev@globallogic.com>
Received: from exprod5og109.obsmtp.com (exprod5og109.obsmtp.com [64.18.0.188])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 34707E015FA
	for <meta-ti@yoctoproject.org>; Mon, 23 Sep 2013 03:15:13 -0700 (PDT)
Received: from mail-lb0-f171.google.com ([209.85.217.171]) (using TLSv1) by
	exprod5ob109.postini.com ([64.18.4.12]) with SMTP
	ID DSNKUkAUsH8fWdPZATNunbZ0b/0C0qWiGI9y@postini.com;
	Mon, 23 Sep 2013 03:15:16 PDT
Received: by mail-lb0-f171.google.com with SMTP id u14so2511734lbd.16
	for <meta-ti@yoctoproject.org>; Mon, 23 Sep 2013 03:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=globallogic.com; s=google;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=sEUwU9NLI3XhCmrbth/pkfHSK5h3S7YwHtfKzXb8IHY=;
	b=KlqrwjWWyyHDhBAldSRRxyy8rJ3PQZdTpYrQKY437D9d910A/5vkseQPofyEyfWMPH
	WrzRy708V8BsbEg5mOpg7L2soFClWsGzIHonhLxa6jU36nJMNffW7ztUO7qTkvf+8aCj
	zf1pUlk57WYZD8ApjKRbVXEeATFiU5v7MJGLk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=sEUwU9NLI3XhCmrbth/pkfHSK5h3S7YwHtfKzXb8IHY=;
	b=Lb8BPGnkWqkriAbOWCdWEmtr77oj9SBa0GIEdukZjXt4pZLb3ErbBxefVeDKiu1Lxa
	fAI9q7Rpep3lbjfXZiRb3QiI6Yz2rShouXvypIsikMwFWZtoWWQ0Hyg4E0rUrKReSVFI
	+VKrvvQBCeEdn3IBF65ATaPz+HKLIl0bQYTPlFRqn28FKFOXVTa7H5w1GFHoMZjSAlcN
	iTLLC68Lc7jOM1qs38Z7Ugo5GbivH/V3OtR5OdKJ/nvjT7vsL17/xHb2QSk1UntsEAVp
	ifVWGen4/RSDClGILk2oSoFdkKygZHWLixIAIREWfR/y8K7usIjom02jt9owb4/34GNF
	zo9A==
X-Gm-Message-State: ALoCoQkfRp0LLSTHw/RhSHHqygyApJygDFsrVZtYjsNoMWbgZPTyCPD8KOX8Xp2/BZo1un61haU0BAcF6yu+5SznbTPEvFzZMTIfoF0gFVtofnkQ/OpPIS5AdfbMLj1VvoAPhKvJipBAt5+diVOW+ug2HOt5Vu7RlFh58cMocUTTdAKRV1M//GQ=
X-Received: by 10.112.181.100 with SMTP id dv4mr1146633lbc.34.1379931311516;
	Mon, 23 Sep 2013 03:15:11 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.112.181.100 with SMTP id dv4mr1146614lbc.34.1379931311232;
	Mon, 23 Sep 2013 03:15:11 -0700 (PDT)
Received: by 10.114.177.136 with HTTP; Mon, 23 Sep 2013 03:15:11 -0700 (PDT)
In-Reply-To: <CAAtecJGYGsuMf807WCQ4c4Qt6LaE=39gEMXeKE_Z64eYZv4KXg@mail.gmail.com>
References: <CAAtecJGYGsuMf807WCQ4c4Qt6LaE=39gEMXeKE_Z64eYZv4KXg@mail.gmail.com>
Date: Mon, 23 Sep 2013 13:15:11 +0300
Message-ID: <CAAtecJHF87AjpXtDQo0U5n_ah28SJF__m1xcqHbvFOLqvOaDcw@mail.gmail.com>
From: Leonid Iziumtsev <leonid.iziumtsev@globallogic.com>
To: meta-ti@yoctoproject.org
Subject: omap5: 3d graphics hardware acceleration build
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Mon, 23 Sep 2013 10:15:17 -0000
Content-Type: multipart/alternative; boundary=001a11c36cde9edf2304e70a4b62

--001a11c36cde9edf2304e70a4b62
Content-Type: text/plain; charset=ISO-8859-1

Hi all,

Pardon me if this list is not the right place to ask the questions and if
so, please poing me to the right one.

I'm developer in Panasonic Inc. Currently working with OAMP5 (pandaboard
uevm) I'm trying to get build with 3D graphics hardware acceleration using
DirectFB (no X support recurred). In future hopefully going run some Qt
based UI.
In search I came across "meta-ti" layer.

I'm new in yocto based build system so don't
completely understand: is it what I was looking for? Will it allow me to
get build with proper graphic support?

Regards,
Leonid
 <http://www.globallogic.com/email_disclaimer.txt>

--001a11c36cde9edf2304e70a4b62
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi all,<br><div class=3D"gmail_quote"><div dir=3D"ltr"><di=
v><div><div><font size=3D"-1"><br>Pardon me if this list is not the right p=
lace to ask the questions and if so, please poing me to the right one.<br><=
br>I&#39;m developer in Panasonic Inc. Currently working with OAMP5 (pandab=
oard uevm) I&#39;m trying to get build with 3D graphics hardware accelerati=
on using DirectFB (no X support recurred). In future hopefully going run so=
me Qt based UI.<br>

In search I came across &quot;meta-ti&quot; layer. <br></font></div><font s=
ize=3D"-1"><br></font><font size=3D"-1">I&#39;m new in yocto based build sy=
stem so don&#39;t<br>completely understand: is it what I was looking for? W=
ill it allow me to get build with proper graphic support?</font><br>

<br></div><div>Regards,<br></div><div>Leonid<br></div><div><div><font size=
=3D"-1"><span style=3D"vertical-align:baseline;font-variant:normal;font-sty=
le:normal;font-size:11px;background-color:transparent;text-decoration:none;=
font-family:Arial;font-weight:normal"></span></font>
</div></div></div></div>
</div><font size=3D"-1"><a href=3D"http://www.globallogic.com/email_disclai=
mer.txt" target=3D"_blank"><span style=3D"font-size:11px;font-family:Arial;=
color:#1155cc;background-color:transparent;font-weight:normal;font-style:no=
rmal;font-variant:normal;text-decoration:underline;vertical-align:baseline"=
></span></a><span style=3D"vertical-align:baseline;font-variant:normal;font=
-style:normal;font-size:11px;background-color:transparent;text-decoration:n=
one;font-family:Arial;font-weight:normal"></span></font>
</div>

--001a11c36cde9edf2304e70a4b62--
