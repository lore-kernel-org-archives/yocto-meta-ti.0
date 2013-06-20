Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-ob0-f173.google.com (mail-ob0-f173.google.com
	[209.85.214.173])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DB78BE0141B
	for <meta-ti@yoctoproject.org>; Wed, 19 Jun 2013 21:46:43 -0700 (PDT)
Received: by mail-ob0-f173.google.com with SMTP id wc20so6866993obb.32
	for <meta-ti@yoctoproject.org>; Wed, 19 Jun 2013 21:46:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=K30b9TB1CrWx26L/5jjbTtNq5hBmwPk5sTYH3XanfN8=;
	b=J0w4HoP1uH5tfOlYDJPYr+5hRhG5klJI2pwCEUY2Sos7hftUtYcod+H8txnKN/Xy9F
	pB/J+vxwGrP7t1sWPgBdg+IXEUpJRJCuAFtRE8iZeK79xMJjx006pJ7mrx3sX0/kRH55
	WoGjbn/8gImTiAGN3BwDq2nKCtnYI/ovLd3MawGKeHvnNfQaAqcVZR561vd0Lb/k+od9
	Mm1ZVEeS0RxGWliwuR/xBDCr99CVHVLFlJ6hbHmowiEU4SepPks6fAGEgH7uD2XiB4Q8
	Ods6byWpIhzM78sy0p5NIzvU8eMuPQNsmw9CMJ9Y9XEY8jwP+tx3Xjeojee2yzmOzFSc
	xfww==
X-Received: by 10.182.98.135 with SMTP id ei7mr755960obb.102.1371703602692;
	Wed, 19 Jun 2013 21:46:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.76.27.165 with HTTP; Wed, 19 Jun 2013 21:46:21 -0700 (PDT)
In-Reply-To: <321768C95D21724485BCE784F1BE98473EB53242@DBDE04.ent.ti.com>
References: <CAP71WjxuKtkyMbb_pReEXepMKxnNyM9PmwoRc26D+gEL7b87jQ@mail.gmail.com>
	<321768C95D21724485BCE784F1BE98473EB52D53@DBDE04.ent.ti.com>
	<CAP71WjztrzWx6K-MNG4RQfeu0V6F45M0_0j5WP0zZjt9s9i17A@mail.gmail.com>
	<321768C95D21724485BCE784F1BE98473EB53158@DBDE04.ent.ti.com>
	<CAP71WjzqEVcxwpwvMc9V-106b2Qyq5uc-x2erf_B7AZXeBQ2Zw@mail.gmail.com>
	<321768C95D21724485BCE784F1BE98473EB53242@DBDE04.ent.ti.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Thu, 20 Jun 2013 00:46:21 -0400
Message-ID: <CAP71WjwHYuFPa2ieAh+WbPMnYNt2AC5rx8GP-+7U2Q-RwoOBYQ@mail.gmail.com>
To: "Sundareson, Prabindh" <prabu@ti.com>
X-Gm-Message-State: ALoCoQnc8QwTUY/4wgf6BWoD7Kt7s3DtNtZF3cIwRRE591OWLVIvgSPwDEW3uTs268VXc+pOYRW3
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
X-List-Received-Date: Thu, 20 Jun 2013 04:46:47 -0000
Content-Type: multipart/alternative; boundary=047d7b2e4970f9dc7104df8ea179

--047d7b2e4970f9dc7104df8ea179
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Jun 20, 2013 at 12:34 AM, Sundareson, Prabindh <prabu@ti.com> wrote:

> The instructions build eglfs as well (without xcb), as in the below patch.
> Just that I cannot test it on platform due to the absence of GLES2 driver.
>  verbose flag in the qt configuration (qt5.inc) would help debug what is
> going wrong.****
>
> ** **
>
>
> https://github.com/prabindh/meta-qt5/commit/c8129fb5057f9254c773f82d2fdbd85d9c56410a
> ****
>
>
yeah, i am using something similar *but* i do not have x11 in
DISTRO_FEATURES, and i suspect you might have it, right? without X11
feature, the x11 -dev packages are pulled/installed, and then the qtbase
configure script will fail to 'check' for EGL.

--047d7b2e4970f9dc7104df8ea179
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Thu, Jun 20, 2013 at 12:34 AM, Sundareson, Prabindh <span dir=3D"ltr">&l=
t;<a href=3D"mailto:prabu@ti.com" target=3D"_blank">prabu@ti.com</a>&gt;</s=
pan> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><p class=3D"MsoNormal"><span style=3D"font-s=
ize:11.0pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;;color:#1f=
497d">The instructions build eglfs as well (without xcb), as in the below p=
atch. Just that I cannot test it on platform due to the absence of GLES2 dr=
iver. =A0verbose
 flag in the qt configuration (qt5.inc) would help debug what is going wron=
g.<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1f497d"><u></u>=A0<u></u></span><=
/p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1f497d"><a href=3D"https://github=
.com/prabindh/meta-qt5/commit/c8129fb5057f9254c773f82d2fdbd85d9c56410a" tar=
get=3D"_blank">https://github.com/prabindh/meta-qt5/commit/c8129fb5057f9254=
c773f82d2fdbd85d9c56410a</a><u></u><u></u></span></p>


<p class=3D"MsoNormal"></p></blockquote></div><br>yeah, i am using somethin=
g similar *but* i do not have x11 in DISTRO_FEATURES, and i suspect you mig=
ht have it, right? without X11 feature, the x11 -dev packages are pulled/in=
stalled, and then the qtbase configure script will fail to &#39;check&#39; =
for EGL.</div>

<div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra"><br></div><=
/div>

--047d7b2e4970f9dc7104df8ea179--
