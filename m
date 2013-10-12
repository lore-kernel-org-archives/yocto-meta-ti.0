Return-Path: <bmentink@gmail.com>
Received: from mail-ie0-f174.google.com (mail-ie0-f174.google.com
	[209.85.223.174])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8DD0FE01373
	for <meta-ti@yoctoproject.org>; Sat, 12 Oct 2013 14:14:17 -0700 (PDT)
Received: by mail-ie0-f174.google.com with SMTP id qd12so5633173ieb.5
	for <meta-ti@yoctoproject.org>; Sat, 12 Oct 2013 14:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=Z8GZ+JGirU+BliOHcb8KCtzRhEue52nsyKxfBscmvks=;
	b=ThKaeiiICaQnzrqrXMZ+W8tbybG+ULsTEdI8Q0XZgrS3HNtCOsdSDUN1FAZSOnD442
	ZwQxwdTF+FeOlWm5IlPW8O164GlXSr+A79ftmhxnQ/QVSP5MkHX9/bj9hzTU/p0G6CQM
	wNzL/eNV6ora7YsK8MCCk4bW2ZepcYh+xZ+c+YwW69qReJuacHBUoTrCbgwzxF12+p5J
	HKQrlKW3p5DGfC5iRyBp5MrFnpPRkHAjOz94KLyjHQ/xcaFLUKAzFkfQtATlOTwadqFZ
	4DQnEaaLOmjCSroBE6IRiRvxtMC6VpXxel5sOJySNCNfOpe/+zAz/GgiEX0xodW7vh2p
	KxOw==
MIME-Version: 1.0
X-Received: by 10.50.115.100 with SMTP id jn4mr7669549igb.9.1381612456408;
	Sat, 12 Oct 2013 14:14:16 -0700 (PDT)
Received: by 10.43.83.9 with HTTP; Sat, 12 Oct 2013 14:14:16 -0700 (PDT)
In-Reply-To: <CALEed8Zi5wEX53+Fx4G0hXUpPwFX-feSbt+Vyu1CAvVUMDuV2A@mail.gmail.com>
References: <CALEed8Zi5wEX53+Fx4G0hXUpPwFX-feSbt+Vyu1CAvVUMDuV2A@mail.gmail.com>
Date: Sun, 13 Oct 2013 10:14:16 +1300
Message-ID: <CALEed8aSvq53twM3bm1QsyBA8xMWMJXi0=eLnuzd_YWMUckdeQ@mail.gmail.com>
From: Bernard Mentink <bmentink@gmail.com>
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: Loading CAN modules on boot
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
X-List-Received-Date: Sat, 12 Oct 2013 21:14:18 -0000
Content-Type: multipart/alternative; boundary=089e0116057caf872704e891b730

--089e0116057caf872704e891b730
Content-Type: text/plain; charset=ISO-8859-1

Hi All,

I am having trouble getting can modules loaded on boot on my Beaglebone
Black.

I can get the can device to show if I load the following modules in this
order:

can-dev.ko
c_can.ko
c_can_platform.ko  and

can.ko
can_raw.ko

I do not know how to get these modules loaded at boot.

I tried re-configuring my kernel to have them built-in, but that did not
work.
I placed a defconfig file in my layer with the changes but it does not seem
to get picked up as it should according to the yocto docs. The .config on
the build directory is still the old one.

Any idea's?

Thanks,
Bernie


On Fri, Oct 11, 2013 at 9:42 AM, Bernard Mentink <bmentink@gmail.com> wrote:

> Hi All,
>
> I am having trouble getting can modules loaded on boot on my Beaglebone
> Black.
>
> I can get the can device to show if I load the following modules in this
> order:
>
> can-dev.ko
> c_can.ko
> c_can_platform.ko  and
>
> can.ko
> can_raw.ko
>
> I do not know how to get these modules loaded at boot.
>
> I tried re-configuring my kernel to have them built-in, but that did not
> work.
> I placed a defconfig file in my layer with the changes but it does not
> seem to get picked up as it should according to the yocto docs. The .config
> on the build directory is still the old one.
>
> Any idea's?
>
> Thanks,
> Bernie
>

--089e0116057caf872704e891b730
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><span style=3D"font-family:arial,sans-serif;font-size:13px=
">Hi All,</span><div style=3D"font-family:arial,sans-serif;font-size:13px">=
<br></div><div style=3D"font-family:arial,sans-serif;font-size:13px">I am h=
aving trouble getting can modules loaded on boot on my Beaglebone Black.</d=
iv>
<div style=3D"font-family:arial,sans-serif;font-size:13px"><br></div><div s=
tyle=3D"font-family:arial,sans-serif;font-size:13px">I can get the can devi=
ce to show if I load the following modules in this order:</div><div style=
=3D"font-family:arial,sans-serif;font-size:13px">
<br></div><div style=3D"font-family:arial,sans-serif;font-size:13px">can-de=
v.ko</div><div style=3D"font-family:arial,sans-serif;font-size:13px">c_can.=
ko</div><div style=3D"font-family:arial,sans-serif;font-size:13px">c_can_pl=
atform.ko =A0and</div>
<div style=3D"font-family:arial,sans-serif;font-size:13px"><br></div><div s=
tyle=3D"font-family:arial,sans-serif;font-size:13px">can.ko</div><div style=
=3D"font-family:arial,sans-serif;font-size:13px">can_raw.ko</div><div style=
=3D"font-family:arial,sans-serif;font-size:13px">
<br></div><div style=3D"font-family:arial,sans-serif;font-size:13px">I do n=
ot know how to get these modules loaded at boot.</div><div style=3D"font-fa=
mily:arial,sans-serif;font-size:13px"><br></div><div style=3D"font-family:a=
rial,sans-serif;font-size:13px">
I tried re-configuring my kernel to have them built-in, but that did not wo=
rk.</div><div style=3D"font-family:arial,sans-serif;font-size:13px">I place=
d a defconfig file in my layer with the changes but it does not seem to get=
 picked up as it should according to the yocto docs. The .config on the bui=
ld directory is still the old one.</div>
<div style=3D"font-family:arial,sans-serif;font-size:13px"><br></div><div s=
tyle=3D"font-family:arial,sans-serif;font-size:13px">Any idea&#39;s?</div><=
div style=3D"font-family:arial,sans-serif;font-size:13px"><br></div><div st=
yle=3D"font-family:arial,sans-serif;font-size:13px">
Thanks,</div><div style=3D"font-family:arial,sans-serif;font-size:13px">Ber=
nie</div></div><div class=3D"gmail_extra"><br><br><div class=3D"gmail_quote=
">On Fri, Oct 11, 2013 at 9:42 AM, Bernard Mentink <span dir=3D"ltr">&lt;<a=
 href=3D"mailto:bmentink@gmail.com" target=3D"_blank">bmentink@gmail.com</a=
>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div dir=3D"ltr">Hi All,<div><br></div><div>=
I am having trouble getting can modules loaded on boot on my Beaglebone Bla=
ck.</div>
<div><br></div><div>I can get the can device to show if I load the followin=
g modules in this order:</div>
<div><br></div><div>can-dev.ko</div><div>c_can.ko</div><div>c_can_platform.=
ko =A0and</div><div><br></div><div>can.ko</div><div>can_raw.ko</div><div><b=
r></div><div>I do not know how to get these modules loaded at boot.</div>

<div><br></div><div>I tried re-configuring my kernel to have them built-in,=
 but that did not work.</div><div>I placed a defconfig file in my layer wit=
h the changes but it does not seem to get picked up as it should according =
to the yocto docs. The .config on the build directory is still the old one.=
</div>

<div><br></div><div>Any idea&#39;s?</div><div><br></div><div>Thanks,</div><=
div>Bernie</div></div>
</blockquote></div><br></div>

--089e0116057caf872704e891b730--
