Return-Path: <skmaillist@gmail.com>
Received: from mail-ob0-f171.google.com (mail-ob0-f171.google.com
	[209.85.214.171])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 54881E017D5
	for <meta-ti@yoctoproject.org>; Thu, 31 Oct 2013 23:41:01 -0700 (PDT)
Received: by mail-ob0-f171.google.com with SMTP id wn1so4139678obc.2
	for <meta-ti@yoctoproject.org>; Thu, 31 Oct 2013 23:41:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=ahMo+ghtpp2sjwwJXhpJyYoq5xdGWD7WuFVfwe/UhLw=;
	b=Rob72olvdp5AbeJE1//IcSDG93llPA1dsRoT57szDGhjzaKl7RR2IdS6q0fnSJUs+4
	OET9COd2dZ8QDsrIAIENv4WUgTcNQ4k25NTjeV1qbdp4c38HqslZqs7/EPlisdKf9E1N
	yCJNSUe9sG7Ggg40n9HlPgdmN0z83OpcV/lOTjn+xJSTaqMmu+/a0ZVL6sBJCbkLAQYD
	WuiF9GBNpsHnMDxVJIwk9c3gL5G8mHXPtxCA9VAP18trr0+mAzBkQtN7KFpm7rLqVKZX
	ghXgeYGQxxRj8GZi2/mNK1B3LF6hGtd4Q++zh3wK3J3GK58QSdzkEfmw1xrSralsRlmO
	lPLA==
MIME-Version: 1.0
X-Received: by 10.60.65.227 with SMTP id a3mr1324386oet.13.1383288060507; Thu,
	31 Oct 2013 23:41:00 -0700 (PDT)
Received: by 10.76.114.52 with HTTP; Thu, 31 Oct 2013 23:41:00 -0700 (PDT)
In-Reply-To: <CAMKF1spv2KN5Udchrm-y5fFxHMJnaSw9YrhVERHB0mPN5JPQsA@mail.gmail.com>
References: <CAEhSjjtXtwx_Tbi6=_S38h1V5OAvPvShAWA6ehgdUN0htPcFjA@mail.gmail.com>
	<CAMKF1spv2KN5Udchrm-y5fFxHMJnaSw9YrhVERHB0mPN5JPQsA@mail.gmail.com>
Date: Fri, 1 Nov 2013 14:41:00 +0800
Message-ID: <CAEhSjjvEBT4yuJj9Qy_KO9DM6KBrKPvMBHPHeb7tkbbtx8V6=g@mail.gmail.com>
From: Kai <skmaillist@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: Compile kernel with 4.8 toolchain
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
X-List-Received-Date: Fri, 01 Nov 2013 06:41:02 -0000
Content-Type: multipart/alternative; boundary=001a11c2570077fc4204ea17d924

--001a11c2570077fc4204ea17d924
Content-Type: text/plain; charset=ISO-8859-1

0003-ARM-7668-1-fix-memset-related-crashes-caused-by-rece.patch
0004-ARM-7670-1-fix-the-memset-fix.patch

With the two patches, kernel can boot successfully which compiled with 4.8
toolchain.

Thanks.


On Fri, Nov 1, 2013 at 12:49 AM, Khem Raj <raj.khem@gmail.com> wrote:

> On Thu, Oct 31, 2013 at 12:02 AM, Kai <skmaillist@gmail.com> wrote:
> > I am trying to compile linux-ti-glsdk kenel with Linaro 4.8 cross compile
> > toolchain, but it cannot boot on OMAP5432 EVM board, no any log from
> serial
> > port, 4.7 version toolchain is OK. Who has been succeeded with building
> > glsdk kernel with 4.8 Linaro toolchain?
>
> Try backporting some of the patches that we did for beagleboard
>
>
> https://github.com/koenkooi/meta-beagleboard/commit/87efc663c4f76d3051cecf1e2c3e2bbd461d200b
>

--001a11c2570077fc4204ea17d924
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">0003-ARM-7668-1-fix-memset-related-crashes-caused-by-rece.=
patch<br><div>0004-ARM-7670-1-fix-the-memset-fix.patch<br></div><div><br></=
div><div>With the two patches, kernel can boot successfully which compiled =
with 4.8 toolchain.</div>
<div><br></div><div>Thanks.</div></div><div class=3D"gmail_extra"><br><br><=
div class=3D"gmail_quote">On Fri, Nov 1, 2013 at 12:49 AM, Khem Raj <span d=
ir=3D"ltr">&lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.=
khem@gmail.com</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"HOEnZb"><div class=3D"h5">On T=
hu, Oct 31, 2013 at 12:02 AM, Kai &lt;<a href=3D"mailto:skmaillist@gmail.co=
m">skmaillist@gmail.com</a>&gt; wrote:<br>

&gt; I am trying to compile linux-ti-glsdk kenel with Linaro 4.8 cross comp=
ile<br>
&gt; toolchain, but it cannot boot on OMAP5432 EVM board, no any log from s=
erial<br>
&gt; port, 4.7 version toolchain is OK. Who has been succeeded with buildin=
g<br>
&gt; glsdk kernel with 4.8 Linaro toolchain?<br>
<br>
</div></div>Try backporting some of the patches that we did for beagleboard=
<br>
<br>
<a href=3D"https://github.com/koenkooi/meta-beagleboard/commit/87efc663c4f7=
6d3051cecf1e2c3e2bbd461d200b" target=3D"_blank">https://github.com/koenkooi=
/meta-beagleboard/commit/87efc663c4f76d3051cecf1e2c3e2bbd461d200b</a><br>
</blockquote></div><br></div>

--001a11c2570077fc4204ea17d924--
