Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-oa0-f47.google.com (mail-oa0-f47.google.com
	[209.85.219.47])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1BA69E006E9
	for <meta-ti@yoctoproject.org>; Thu, 20 Jun 2013 21:50:56 -0700 (PDT)
Received: by mail-oa0-f47.google.com with SMTP id m1so8787165oag.6
	for <meta-ti@yoctoproject.org>; Thu, 20 Jun 2013 21:50:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=Q6O0BtDwFvGRPC3wo7JXuRTP8Jzt690tNk8hhFGeUDI=;
	b=JJAvkogEcNpmNSlS64QGSFARWaNuA2iAFL98aGA9+m5yQLIJgR4kZ3xv9Nf+p+dw3m
	Ejvj8LUNqd390S/aTvzhlioWn6LqCW7hQsjItNFl/EKZgL0rg0cQriDIWc0BP/6S6f7+
	B7Eu7LmQ9Rpji0YpAXNEIyshHPGNzXpZ5fL5qC2SkYPf+vRMBfCim1z+Yo91royiFPt4
	ZONx6FoAzUheAJjWFTfMSqJwCiEsKY8A9GuZzwdJgDNBMly1rkUnMP6V8IbtGeZGnxi4
	P+xXYOc4O6uUVLy6uLtw6fTZ1doaZmzu6viGFDCypbTnlSrJIuJ+rYM3QIm81gzcUIwZ
	2eSg==
X-Received: by 10.60.68.13 with SMTP id r13mr5876313oet.71.1371790256114; Thu,
	20 Jun 2013 21:50:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.76.27.165 with HTTP; Thu, 20 Jun 2013 21:50:36 -0700 (PDT)
In-Reply-To: <321768C95D21724485BCE784F1BE98473EB53340@DBDE04.ent.ti.com>
References: <CAP71WjxuKtkyMbb_pReEXepMKxnNyM9PmwoRc26D+gEL7b87jQ@mail.gmail.com>
	<321768C95D21724485BCE784F1BE98473EB52D53@DBDE04.ent.ti.com>
	<CAP71WjztrzWx6K-MNG4RQfeu0V6F45M0_0j5WP0zZjt9s9i17A@mail.gmail.com>
	<321768C95D21724485BCE784F1BE98473EB53158@DBDE04.ent.ti.com>
	<CAP71WjzqEVcxwpwvMc9V-106b2Qyq5uc-x2erf_B7AZXeBQ2Zw@mail.gmail.com>
	<321768C95D21724485BCE784F1BE98473EB53242@DBDE04.ent.ti.com>
	<CAP71WjwHYuFPa2ieAh+WbPMnYNt2AC5rx8GP-+7U2Q-RwoOBYQ@mail.gmail.com>
	<20130620045521.GR13356@edge>
	<321768C95D21724485BCE784F1BE98473EB53340@DBDE04.ent.ti.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Fri, 21 Jun 2013 00:50:36 -0400
Message-ID: <CAP71Wjx3cAmqn1=wBAPZFbT7ARw_ha0hx=WDsp9e+QaiJcQagA@mail.gmail.com>
To: "Sundareson, Prabindh" <prabu@ti.com>
X-Gm-Message-State: ALoCoQnsUgnTnA8cy5126PsFHtlpTFaziJtEuavsEB4Dn79rThuIIoAwl+cw32ikXgIsOm+uixhp
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
X-List-Received-Date: Fri, 21 Jun 2013 04:50:59 -0000
Content-Type: multipart/alternative; boundary=001a11331a76ec243e04dfa2ceb3

--001a11331a76ec243e04dfa2ceb3
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Jun 20, 2013 at 1:03 AM, Sundareson, Prabindh <prabu@ti.com> wrote:

> I have validated libgles-omap3 on the AMSDK 5.07 build configuration (that
> does not have X11 enabled), so what you faced may be a different issue on
> the libgles front.
>
> I would wait for the verbose log from Nicolas for the qt5 issue he faced,
>

so, my issue was related to mesa in fact !

you can read that thread if you are interested:
http://lists.openembedded.org/pipermail/openembedded-core/2013-June/080205.html

basically, i was building for qemuarm, so with mesa, and it's mesa that
doesn't work fine if X11 is not in DISTRO.

thanks anyways for all the support/discussion.

--001a11331a76ec243e04dfa2ceb3
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Thu, Jun 20, 2013 at 1:03 AM, Sundareson, Prabindh <span dir=3D"ltr">&lt=
;<a href=3D"mailto:prabu@ti.com" target=3D"_blank">prabu@ti.com</a>&gt;</sp=
an> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex"><div id=3D":16d" style=3D"overflow:hidden">I have validate=
d libgles-omap3 on the AMSDK 5.07 build configuration (that does not have X=
11 enabled), so what you faced may be a different issue on the libgles fron=
t.<br>


<br>
I would wait for the verbose log from Nicolas for the qt5 issue he faced,</=
div></blockquote></div><br>so, my issue was related to mesa in fact !</div>=
<div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra" style>you c=
an read that thread if you are interested:=A0<a href=3D"http://lists.openem=
bedded.org/pipermail/openembedded-core/2013-June/080205.html">http://lists.=
openembedded.org/pipermail/openembedded-core/2013-June/080205.html</a></div=
>

<div class=3D"gmail_extra" style><br></div><div class=3D"gmail_extra" style=
>basically, i was building for qemuarm, so with mesa, and it&#39;s mesa tha=
t doesn&#39;t work fine if X11 is not in DISTRO.</div><div class=3D"gmail_e=
xtra" style>

<br></div><div class=3D"gmail_extra" style>thanks anyways for all the suppo=
rt/discussion.</div><div class=3D"gmail_extra" style><br></div><div class=
=3D"gmail_extra" style><br></div></div>

--001a11331a76ec243e04dfa2ceb3--
