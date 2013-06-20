Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-wg0-f45.google.com (mail-wg0-f45.google.com [74.125.82.45])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 05C91E01400
	for <meta-ti@yoctoproject.org>; Wed, 19 Jun 2013 19:38:30 -0700 (PDT)
Received: by mail-wg0-f45.google.com with SMTP id j13so5067946wgh.0
	for <meta-ti@yoctoproject.org>; Wed, 19 Jun 2013 19:38:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=K046PiNcOJGHkDViItbxmcAQWsL96h9404dVTPJF+0A=;
	b=Klleo6KcpO43NvpTRzB+Vx+HGWMblXtOp8cBdrFmI2TU5J2K2iVw+ZANU3/pnPmCvg
	tXnLDYPQ/na7efj4ATJr12SFeDd3bQp3YGr0HWFnFCV+0TEWhSS7ufndyFliCmuJsJ+t
	1N7YMwKisCGsTd48G+8VrU5ffeVJuGLm7Kwyu4QWxlU77iO+4zzgtu16Diq7igdqhRXF
	9pfEVDVpiQnvLV7YjsBXVzgBMjEHt8S8wM+vxskLPkB+nQ6O362dPAhTujOKxZ+GjZZa
	OLW1SzNY4UqMLq3+BkMzEeAgF5/vPTKSUqLe2SgHZh/TTu/qCt1Z6ELC54Nf56WW4wvl
	1fxA==
X-Received: by 10.180.73.113 with SMTP id k17mr10612512wiv.17.1371695908823;
	Wed, 19 Jun 2013 19:38:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.180.83.1 with HTTP; Wed, 19 Jun 2013 19:38:08 -0700 (PDT)
In-Reply-To: <321768C95D21724485BCE784F1BE98473EB52D53@DBDE04.ent.ti.com>
References: <CAP71WjxuKtkyMbb_pReEXepMKxnNyM9PmwoRc26D+gEL7b87jQ@mail.gmail.com>
	<321768C95D21724485BCE784F1BE98473EB52D53@DBDE04.ent.ti.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Wed, 19 Jun 2013 22:38:08 -0400
Message-ID: <CAP71WjztrzWx6K-MNG4RQfeu0V6F45M0_0j5WP0zZjt9s9i17A@mail.gmail.com>
To: "Sundareson, Prabindh" <prabu@ti.com>
X-Gm-Message-State: ALoCoQkUXQp5JeWMqo7R+zpAHZ23Eo8lQDe8TzGD5XrZgRb2EFE1U7jiFN8Sflz1vAX6WpFye4SM
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: meta-ti + meta-qt5
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
X-List-Received-Date: Thu, 20 Jun 2013 02:38:33 -0000
Content-Type: multipart/alternative; boundary=f46d043749cd62bb0204df8cd7f2

--f46d043749cd62bb0204df8cd7f2
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 19, 2013 at 10:09 PM, Sundareson, Prabindh <prabu@ti.com> wrote=
:

> Are you asking about the status in general (ie, outside of the yocto
> infrastructure) ? In general, eglfs,kms has been proven working for more
> than a year now.****
>
> ** **
>
> Within meta-ti, eglfs should work if the display driver is available (fb
> or drm). The only reason I stopped at =93minimal=94 on Beaglebone was bec=
ause
> the =93display=94 driver part was not integrated at that time on Beaglebo=
ne (in
> meta-ti) and hence OpenGL ES driver couldn=92t be installed.****
>
> **
>

well, thanks for the quick answer. yes, i meant within OE, using meta-qt5.
it's good to know that it's working outside of it, though.

do you have instructions (conf files + scripts) to run Qt5 + eglfs (and
kms) as platform driver?

thanks

--f46d043749cd62bb0204df8cd7f2
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Wed, Jun 19, 2013 at 10:09 PM, Sundareson, Prabindh <span dir=3D"ltr">&l=
t;<a href=3D"mailto:prabu@ti.com" target=3D"_blank">prabu@ti.com</a>&gt;</s=
pan> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><p class=3D"MsoNormal"><span style=3D"font-s=
ize:11.0pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;;color:#1f=
497d">Are you asking about the status in general (ie, outside of the yocto =
infrastructure) ? In general, eglfs,kms has been proven working for more th=
an a year now.<u></u><u></u></span></p>


<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1f497d"><u></u>=A0<u></u></span><=
/p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1f497d">Within meta-ti, eglfs sho=
uld work if the display driver is available (fb or drm). The only reason I =
stopped at =93minimal=94 on Beaglebone was because the =93display=94
 driver part was not integrated at that time on Beaglebone (in meta-ti) and=
 hence OpenGL ES driver couldn=92t be installed.<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1f497d"><u></u>=A0</span></p></bl=
ockquote></div><br>well, thanks for the quick answer. yes, i meant within O=
E, using meta-qt5. it&#39;s good to know that it&#39;s working outside of i=
t, though.</div>

<div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra" style>do yo=
u have instructions (conf files + scripts) to run Qt5 + eglfs (and kms) as =
platform driver?</div><div class=3D"gmail_extra" style><br></div><div class=
=3D"gmail_extra" style>

thanks</div><div class=3D"gmail_extra" style><br></div></div>

--f46d043749cd62bb0204df8cd7f2--
