Return-Path: <diego.sueiro@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2C466E00566; Fri, 15 Aug 2014 14:54:17 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (diego.sueiro[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.216.174 listed in list.dnswl.org]
Received: from mail-qc0-f174.google.com (mail-qc0-f174.google.com
	[209.85.216.174])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8397FE0054C
	for <meta-ti@yoctoproject.org>; Fri, 15 Aug 2014 14:54:11 -0700 (PDT)
Received: by mail-qc0-f174.google.com with SMTP id l6so2849629qcy.33
	for <meta-ti@yoctoproject.org>; Fri, 15 Aug 2014 14:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=GsO32xFErk2UVdgaae9nvtiLxoAfXWeKbutffxxeSvM=;
	b=RHGZVcQKztiazduiPxhKaIW9U8BzFCTlo5lmGphG+6SYW5LqSWIMrVmFUtodzp22FZ
	w3YYeBGah0VxOsSJNnOPYuXHREpzK82WwzbnA7k+1J9NM8wYB5OVJ7igS7eKtkauThTh
	+eO7vlUtBXI3FgdJimQjDT13h3AFjIllh59i/eDKDCIgF2AyrwwAFRYj/ki8hOfu9kdP
	oZ8wOdE+DgYlTdALfjGGS0dY/TfSgBVOPsQW/Upp1IMm3qNPjcFFn4pjC+13Z36HLFxn
	vtZjU0ybZ6NeS/Jp+F1IasW83zwb2o1zMesx0BYBSr6XzYi0r6aPfoeKx6qvxIqUHyyh
	t9GQ==
MIME-Version: 1.0
X-Received: by 10.224.97.66 with SMTP id k2mr32153645qan.21.1408139651435;
	Fri, 15 Aug 2014 14:54:11 -0700 (PDT)
Received: by 10.140.85.83 with HTTP; Fri, 15 Aug 2014 14:54:11 -0700 (PDT)
Received: by 10.140.85.83 with HTTP; Fri, 15 Aug 2014 14:54:11 -0700 (PDT)
In-Reply-To: <CAESSzZxi=yuR8uLeMD3b3MQ1jOiqqix4KAQEEyxCXgCv4CVcCg@mail.gmail.com>
References: <1408119254-13052-1-git-send-email-aymeric.dumaz@gmail.com>
	<CAMCfZKE8KR2aS-ME1X694wqfzpegPM8JND9rF22ehoknj1+6=w@mail.gmail.com>
	<CAESSzZxi=yuR8uLeMD3b3MQ1jOiqqix4KAQEEyxCXgCv4CVcCg@mail.gmail.com>
Date: Fri, 15 Aug 2014 18:54:11 -0300
Message-ID: <CAMCfZKGHmsTFkewma40qVpBAmgBm_P6_2K1RRsM4=Z75ooULDg@mail.gmail.com>
From: Diego Sueiro <diego.sueiro@gmail.com>
To: Aymeric Dumaz <aymericdumaz@gmail.com>
Cc: meta-ti mailing list <meta-ti@yoctoproject.org>
Subject: Re: [dora/daisy][PATCH] libgles-omap3-5.01.01.01: add .ver and .list files
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
X-List-Received-Date: Fri, 15 Aug 2014 21:54:17 -0000
Content-Type: multipart/alternative; boundary=001a11c3ef46b7f6da0500b20f80

--001a11c3ef46b7f6da0500b20f80
Content-Type: text/plain; charset=ISO-8859-1

Aymeric,

Thanks for the explanation.

Regards,

--
*dS
Diego Sueiro
sent from mobile.
Em 15/08/2014 19:40, "Aymeric Dumaz" <aymericdumaz@gmail.com> escreveu:

> 2014-08-15 19:01 GMT+02:00 Diego Sueiro <diego.sueiro@gmail.com>:
> > Aymeric,
> >
> Hello Diego,
>
> >
> > On Fri, Aug 15, 2014 at 1:14 PM, Aymeric Dumaz <aymeric.dumaz@gmail.com>
> > wrote:
> >>
> >> When libraries don't have a SONAME in their section, their name aren't
> >> added in
> >> the .list/.ver files generated during do_package.
> >> Other recipes are able to build against them but are not able to find
> them
> >> afterwards, leading to missing dependencies.
> >>
> >> This patch add the files that would be created if the SONAME was
> present.
> >>
> >> Signed-off-by: Aymeric Dumaz <aymeric.dumaz@gmail.com>
> >
> >
> > Just for curiosity.
> > To have libgles-omap3 installed on the image, with Qt5 stuff, I had to
> > explicit add it on the IMAGE_INSTALL. This patch should fix it, is it
> > correct?
> >
> >
> > Regards,
> >
>
> When you add libgles-omap3 on the IMAGE_INSTALL, with the right flags Qt 5
> is
> compiled against it.
> The problem is when you run "bitbake meta-toolchain-qt5", the resulting
> toolchain doesn't have the libgles-omap3 libraries included.
> If you look on the qtbase do_package log, you can see that:
>
> NOTE: Couldn't find shared library provider for libGLESv2.so, used by
> files:
> [...]
>
> This is because for each library, Yocto will add the library name (coming
> from
> the SONAME) to the .list/.ver files of the corresponding package.
> Because for some reason those proprietary libraries don't have a SONAME,
> Yocto
> fails to do so.
>
> This patch is not 100% perfect, because files from others PACKAGES will
> produce
> similar errors, for example:
>
> DEBUG: calculating shlib requirements for libgles-omap3-es5
> NOTE: Couldn't find shared library provider for libIMGegl.so, used by
> files:
> [...]
>
> But at least it permits other packages like qtbase to find the
> libgles-omap3
> dependency, so that it will be included in the sysroot.
> I made patches for oe-core (see [1] and [2]), if this is accepted it will
> be
> possible to handle more gracefully with the ASSUME_SONAME variable.
>
> [1]
> http://lists.openembedded.org/pipermail/openembedded-core/2014-August/095726.html
> [2]
> http://lists.openembedded.org/pipermail/openembedded-core/2014-August/095727.html
>
> > --
> > *dS
> > Diego Sueiro
> >
> > Administrador do Embarcados
> > www.embarcados.com.br
> >
> > /*long live rock 'n roll*/
>

--001a11c3ef46b7f6da0500b20f80
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr">Aymeric,</p>
<p dir=3D"ltr">Thanks for the explanation. </p>
<p dir=3D"ltr">Regards, </p>
<p dir=3D"ltr">--<br>
*dS<br>
Diego Sueiro<br>
sent from mobile. </p>
<div class=3D"gmail_quote">Em 15/08/2014 19:40, &quot;Aymeric Dumaz&quot; &=
lt;<a href=3D"mailto:aymericdumaz@gmail.com">aymericdumaz@gmail.com</a>&gt;=
 escreveu:<br type=3D"attribution"><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
2014-08-15 19:01 GMT+02:00 Diego Sueiro &lt;<a href=3D"mailto:diego.sueiro@=
gmail.com">diego.sueiro@gmail.com</a>&gt;:<br>
&gt; Aymeric,<br>
&gt;<br>
Hello Diego,<br>
<br>
&gt;<br>
&gt; On Fri, Aug 15, 2014 at 1:14 PM, Aymeric Dumaz &lt;<a href=3D"mailto:a=
ymeric.dumaz@gmail.com">aymeric.dumaz@gmail.com</a>&gt;<br>
&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; When libraries don&#39;t have a SONAME in their section, their nam=
e aren&#39;t<br>
&gt;&gt; added in<br>
&gt;&gt; the .list/.ver files generated during do_package.<br>
&gt;&gt; Other recipes are able to build against them but are not able to f=
ind them<br>
&gt;&gt; afterwards, leading to missing dependencies.<br>
&gt;&gt;<br>
&gt;&gt; This patch add the files that would be created if the SONAME was p=
resent.<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Aymeric Dumaz &lt;<a href=3D"mailto:aymeric.dumaz@g=
mail.com">aymeric.dumaz@gmail.com</a>&gt;<br>
&gt;<br>
&gt;<br>
&gt; Just for curiosity.<br>
&gt; To have libgles-omap3 installed on the image, with Qt5 stuff, I had to=
<br>
&gt; explicit add it on the IMAGE_INSTALL. This patch should fix it, is it<=
br>
&gt; correct?<br>
&gt;<br>
&gt;<br>
&gt; Regards,<br>
&gt;<br>
<br>
When you add libgles-omap3 on the IMAGE_INSTALL, with the right flags Qt 5 =
is<br>
compiled against it.<br>
The problem is when you run &quot;bitbake meta-toolchain-qt5&quot;, the res=
ulting<br>
toolchain doesn&#39;t have the libgles-omap3 libraries included.<br>
If you look on the qtbase do_package log, you can see that:<br>
<br>
NOTE: Couldn&#39;t find shared library provider for libGLESv2.so, used by f=
iles:<br>
[...]<br>
<br>
This is because for each library, Yocto will add the library name (coming f=
rom<br>
the SONAME) to the .list/.ver files of the corresponding package.<br>
Because for some reason those proprietary libraries don&#39;t have a SONAME=
, Yocto<br>
fails to do so.<br>
<br>
This patch is not 100% perfect, because files from others PACKAGES will pro=
duce<br>
similar errors, for example:<br>
<br>
DEBUG: calculating shlib requirements for libgles-omap3-es5<br>
NOTE: Couldn&#39;t find shared library provider for libIMGegl.so, used by f=
iles:<br>
[...]<br>
<br>
But at least it permits other packages like qtbase to find the libgles-omap=
3<br>
dependency, so that it will be included in the sysroot.<br>
I made patches for oe-core (see [1] and [2]), if this is accepted it will b=
e<br>
possible to handle more gracefully with the ASSUME_SONAME variable.<br>
<br>
[1] <a href=3D"http://lists.openembedded.org/pipermail/openembedded-core/20=
14-August/095726.html" target=3D"_blank">http://lists.openembedded.org/pipe=
rmail/openembedded-core/2014-August/095726.html</a><br>
[2] <a href=3D"http://lists.openembedded.org/pipermail/openembedded-core/20=
14-August/095727.html" target=3D"_blank">http://lists.openembedded.org/pipe=
rmail/openembedded-core/2014-August/095727.html</a><br>
<br>
&gt; --<br>
&gt; *dS<br>
&gt; Diego Sueiro<br>
&gt;<br>
&gt; Administrador do Embarcados<br>
&gt; <a href=3D"http://www.embarcados.com.br" target=3D"_blank">www.embarca=
dos.com.br</a><br>
&gt;<br>
&gt; /*long live rock &#39;n roll*/<br>
</blockquote></div>

--001a11c3ef46b7f6da0500b20f80--
