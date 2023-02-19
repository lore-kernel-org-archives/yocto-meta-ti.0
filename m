Return-Path: <danny@sizethreestudios.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E08C5C05027
	for <webhook@archiver.kernel.org>; Sun, 19 Feb 2023 23:27:15 +0000 (UTC)
Received: from a11-75.smtp-out.amazonses.com (a11-75.smtp-out.amazonses.com [54.240.11.75])
 by mx.groups.io with SMTP id smtpd.web11.985.1676849229774137316
 for <meta-ti@lists.yoctoproject.org>;
 Sun, 19 Feb 2023 15:27:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sizethreestudios.com header.s=hncifp7bcoz4v46j3w6bdwu2f6yqecfu header.b=N+F+C3yy;
 spf=pass (domain: amazonses.com, ip: 54.240.11.75, mailfrom: 010001866c00aa88-a006fdb2-93c0-408b-99ff-8ec3aac48d40-000000@amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hncifp7bcoz4v46j3w6bdwu2f6yqecfu; d=sizethreestudios.com;
	t=1676849228;
	h=Subject:From:To:Date:Mime-Version:Content-Type:References:Message-Id;
	bh=WbHlbVyVx4dAaauoPVGrXn/8kAtf4tZSYgBFcotbieU=;
	b=N+F+C3yyQlVXmJ8WIPo59rWH+ujBoznNDBlBdMQHxUg89+uz9+lbcNJekLhAMFYd
	7Du5UoiipGGA8mwjwtBsvlm3LB0VwhHMtrqv/qYoAgiXQXk+U5iwPJsVxSdePQ54qdT
	TIeAIO9PpvJhfl9Tag+/o3glucwbTjoE7KhD5kG87tsvW9zEI/GTEsnyYhoCZ8WZ7XV
	2tGAsv9EgbFmKB/2Uy3wJ1eTpxBk+Wr3I51rzrCCdgMfr7KUumDfX38wJitwDgIkz5p
	Z28hYkW/uEqGVAb8YBJyrrp7vdBT+C0JYiUQA2uigocKLZ2kS+ZNXHfO9wtt+D61sOF
	KIUwpRTdrg==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=6gbrjpgwjskckoa6a5zn6fwqkn67xbtw; d=amazonses.com; t=1676849228;
	h=Subject:From:To:Date:Mime-Version:Content-Type:References:Message-Id:Feedback-ID;
	bh=WbHlbVyVx4dAaauoPVGrXn/8kAtf4tZSYgBFcotbieU=;
	b=YN0EroQMSAxPpallGEWo+7vcNHCCDVy+HS6wwwOw3jBEPTACMHIvpQK4RPYt6Pp4
	vuO8kefA5c2v4N1Ly8ZznDr+m7f0NOTEJMkd4h9hWBrrViaVGcywFRKR9NRYOFdoaIF
	U/NcEylycQzPdOdZbnscBOlGH5ojfX6bw570H5Ko=
Subject: [kirkstone] trouble loading device tree overlay (beaglebone black,
 uboot, linux-ti-staging)
From: danny@sizethreestudios.com
To: =?UTF-8?Q?meta-ti=40lists=2Eyoctoproject=2Eorg?=
  <meta-ti@lists.yoctoproject.org>
Date: Sun, 19 Feb 2023 23:27:08 +0000
Mime-Version: 1.0
Content-Type: multipart/alternative; 
 boundary="=_b1HYKL053pP6RySxkcQWcodwlTapPH7Q5u-d3PcgRoNgk6Lp"
References: <mail.63f2b04b.7701.250da99230589a6c@storage.wm.amazon.com>
X-Priority: 3 (Normal)
X-Mailer: Amazon WorkMail
Thread-Index: AQHZRLbdz3yPT2FzRKuUv9/wC1Pm6Q==
Thread-Topic: [kirkstone] trouble loading device tree overlay (beaglebone
 black, uboot, linux-ti-staging)
X-Wm-Sent-Timestamp: 1676849227
Message-ID: <010001866c00aa88-a006fdb2-93c0-408b-99ff-8ec3aac48d40-000000@email.amazonses.com>
Feedback-ID: 1.us-east-1.LF00NED762KFuBsfzrtoqw+Brn/qlF9OYdxWukAhsl8=:AmazonSES
X-SES-Outgoing: 2023.02.19-54.240.11.75
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Sun, 19 Feb 2023 23:27:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15880

This is a multi-part message in MIME format. Your mail reader does not
understand MIME message format.
--=_b1HYKL053pP6RySxkcQWcodwlTapPH7Q5u-d3PcgRoNgk6Lp
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hello - I'd like to start by saying thanks gain to all for the continued =
work on this project!

=C2=A0
I'm reaching out again for help on my beaglebone + yocto project. I feel =
like I am really close to a functional implementation, but I am now stuck=
 on getting my LCD screen to render anything (for reference, I am using o=
ne of these - https://4dsystems.com.au/4dcape-43). My hunch is that I nee=
d to enable the device tree overlay for the cape.

=C2=A0
I've spend a few days poking around, and have a recipe in my yocto projec=
t that compiles the overlay files from this repo - https://github.com/bea=
gleboard/bb.org-overlays. <https://github.com/beagleboard/bb.org-overlays=
=2E> =C2=A0 At this point, I have a bunch of compiled `.dtbo` files both =
being written to the `DEPLOY_DIR_IMAGE` and the boot partition of my wic =
file which is exciting (my guess is I am specifically interested in this =
one - https://github.com/beagleboard/bb.org-overlays/blob/master/src/arm/=
BB-BONE-4D4C-01-00A1.dts) <https://github.com/beagleboard/bb.org-overlays=
/blob/master/src/arm/BB-BONE-4D4C-01-00A1.dts).> .=C2=A0

=C2=A0
The current hurdle I am facing is that when I attempt to apply the overla=
y from my u-boot script - running `fdt apply ...` prints the following er=
ror to the console:

=C2=A0
```

failed on fdt_overlay_apply(): FDT_ERR_BADSTRUCTURE
base fdt does did not have a /__symbols__ node

make sure you've compiled with -@

```

=C2=A0
That error seems pretty clear but I'm still seeing it after subsequently =
adding `KERNEL_DTB_OVERLAY_SUPPORT =3D "1"` to a bbappend file for `linux=
-ti-staging_%`. I have dumped the contents of my fdt file (am335x-bonebla=
ck.dtb) using `fdtdump` and it looks like there is a `__symbols__` entry.=
 This was also the case when manually running `fdt print` from a u-boot p=
rompt and saving the output to a logfile through `screen`.

=C2=A0
I've uploaded the full device tree output from `fdt print` to this gist: =
https://gist.github.com/dadleyy/7926873ab60e9c9b5b5b02cb44e1e70b <https:/=
/gist.github.com/dadleyy/7926873ab60e9c9b5b5b02cb44e1e70b>=20

=C2=A0
I've also been reading the u-boot docs here - https://u-boot.readthedocs.=
io/en/latest/usage/fdt_overlays.html <https://u-boot.readthedocs.io/en/la=
test/usage/fdt_overlays.html>=20

and this blog post from 2018 - https://irq5.io/2018/07/24/boot-time-devic=
e-tree-overlays-with-u-boot/

=C2=A0
My guess is that I am doing something wrong with the length and/or addres=
s of the fdt file or the overlay I am trying to use. I would be happy to =
provide any additional information, and any assistance is really apprecia=
ted!

=C2=A0
Thanks,

- Danny


--=_b1HYKL053pP6RySxkcQWcodwlTapPH7Q5u-d3PcgRoNgk6Lp
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML><html>
<head>
<meta name=3D"Generator" content=3D"Amazon WorkMail v3.1.1408.0">
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">=

<title>[kirkstone] trouble loading device tree overlay (beaglebone black,=
 uboot, linux-ti-staging)</title>
</head>
<body>
<html><head></head><body><p style=3D"margin: 0px; font-family: Arial, Tah=
oma, Helvetica, sans-serif; font-size: small;">Hello - I'd like to start =
by saying thanks gain to all for the continued work on this project!</p><=
p style=3D"margin: 0px; font-family: Arial, Tahoma, Helvetica, sans-serif=
; font-size: small;">&nbsp;</p><p style=3D"margin: 0px; font-family: Aria=
l, Tahoma, Helvetica, sans-serif; font-size: small;">I'm reaching out aga=
in for help on my beaglebone + yocto project. I feel like I am really clo=
se to a functional implementation, but I am now stuck on getting my LCD s=
creen to render anything (for reference, I am using one of these - https:=
//4dsystems.com.au/4dcape-43). My hunch is that I need to enable the devi=
ce tree overlay for the cape.</p><p style=3D"margin: 0px; font-family: Ar=
ial, Tahoma, Helvetica, sans-serif; font-size: small;">&nbsp;</p><p style=
=3D"margin: 0px; font-family: Arial, Tahoma, Helvetica, sans-serif; font-=
size: small;">I've spend a few days poking around, and have a recipe in m=
y yocto project that compiles the overlay files from this repo - <a href=3D=
"https://github.com/beagleboard/bb.org-overlays." _src=3D"https://github.=
com/beagleboard/bb.org-overlays.">https://github.com/beagleboard/bb.org-o=
verlays.</a>&nbsp; At this point, I have a bunch of compiled `.dtbo` file=
s both being written to the `DEPLOY_DIR_IMAGE` and the boot partition of =
my wic file which is exciting (my guess is I am specifically interested i=
n this one - <a href=3D"https://github.com/beagleboard/bb.org-overlays/bl=
ob/master/src/arm/BB-BONE-4D4C-01-00A1.dts)." _src=3D"https://github.com/=
beagleboard/bb.org-overlays/blob/master/src/arm/BB-BONE-4D4C-01-00A1.dts)=
=2E">https://github.com/beagleboard/bb.org-overlays/blob/master/src/arm/B=
B-BONE-4D4C-01-00A1.dts)</a>.&nbsp;</p><p style=3D"margin: 0px; font-fami=
ly: Arial, Tahoma, Helvetica, sans-serif; font-size: small;">&nbsp;</p><p=
 style=3D"margin: 0px; font-family: Arial, Tahoma, Helvetica, sans-serif;=
 font-size: small;">The current hurdle I am facing is that when I attempt=
 to apply the overlay from my u-boot script - running `fdt apply ...` pri=
nts the following error to the console:</p><p style=3D"margin: 0px; font-=
family: Arial, Tahoma, Helvetica, sans-serif; font-size: small;">&nbsp;</=
p><p style=3D"margin: 0px; font-family: Arial, Tahoma, Helvetica, sans-se=
rif; font-size: small;">```</p><table class=3D"highlight tab-size js-file=
-line-container js-code-nav-container js-tagsearch-file"><tbody><tr><td i=
d=3D"file-error-txt-LC1" class=3D"blob-code blob-code-inner js-file-line"=
>failed on fdt_overlay_apply(): FDT_ERR_BADSTRUCTURE</td></tr><tr></tr></=
tbody></table><table class=3D"highlight tab-size js-file-line-container j=
s-code-nav-container js-tagsearch-file"><tbody><tr><td id=3D"file-error-t=
xt-LC2" class=3D"blob-code blob-code-inner js-file-line">base fdt does di=
d not have a /__symbols__ node</td></tr><tr></tr></tbody></table><p style=
=3D"margin: 0px; font-family: Arial, Tahoma, Helvetica, sans-serif; font-=
size: small;">make sure you've compiled with -@</p><p style=3D"margin: 0p=
x; font-family: Arial, Tahoma, Helvetica, sans-serif; font-size: small;">=
```</p><p style=3D"margin: 0px; font-family: Arial, Tahoma, Helvetica, sa=
ns-serif; font-size: small;">&nbsp;</p><p style=3D"margin: 0px; font-fami=
ly: Arial, Tahoma, Helvetica, sans-serif; font-size: small;">That error s=
eems pretty clear but I'm still seeing it after subsequently adding `KERN=
EL_DTB_OVERLAY_SUPPORT =3D "1"` to a bbappend file for `linux-ti-staging_=
%`. I have dumped the contents of my fdt file (am335x-boneblack.dtb) usin=
g `fdtdump` and it looks like there is a `__symbols__` entry. This was al=
so the case when manually running `fdt print` from a u-boot prompt and sa=
ving the output to a logfile through `screen`.</p><p style=3D"margin: 0px=
; font-family: Arial, Tahoma, Helvetica, sans-serif; font-size: small;">&=
nbsp;</p><p style=3D"margin: 0px; font-family: Arial, Tahoma, Helvetica, =
sans-serif; font-size: small;">I've uploaded the full device tree output =
from `fdt print` to this gist: <a href=3D"https://gist.github.com/dadleyy=
/7926873ab60e9c9b5b5b02cb44e1e70b" _src=3D"https://gist.github.com/dadley=
y/7926873ab60e9c9b5b5b02cb44e1e70b">https://gist.github.com/dadleyy/79268=
73ab60e9c9b5b5b02cb44e1e70b</a></p><p style=3D"margin: 0px; font-family: =
Arial, Tahoma, Helvetica, sans-serif; font-size: small;">&nbsp;</p><p sty=
le=3D"margin: 0px; font-family: Arial, Tahoma, Helvetica, sans-serif; fon=
t-size: small;">I've also been reading the u-boot docs here - <a href=3D"=
https://u-boot.readthedocs.io/en/latest/usage/fdt_overlays.html" _src=3D"=
https://u-boot.readthedocs.io/en/latest/usage/fdt_overlays.html">https://=
u-boot.readthedocs.io/en/latest/usage/fdt_overlays.html</a></p><p style=3D=
"margin: 0px; font-family: Arial, Tahoma, Helvetica, sans-serif; font-siz=
e: small;">and this blog post from 2018 - https://irq5.io/2018/07/24/boot=
-time-device-tree-overlays-with-u-boot/</p><p style=3D"margin: 0px; font-=
family: Arial, Tahoma, Helvetica, sans-serif; font-size: small;">&nbsp;</=
p><p style=3D"margin: 0px; font-family: Arial, Tahoma, Helvetica, sans-se=
rif; font-size: small;">My <em>guess</em> is that I am doing something wr=
ong with the length and/or address of the fdt file or the overlay I am tr=
ying to use. I would be happy to provide any additional information, and =
any assistance is really appreciated!</p><p style=3D"margin: 0px; font-fa=
mily: Arial, Tahoma, Helvetica, sans-serif; font-size: small;">&nbsp;</p>=
<p style=3D"margin: 0px; font-family: Arial, Tahoma, Helvetica, sans-seri=
f; font-size: small;">Thanks,</p><p style=3D"margin: 0px; font-family: Ar=
ial, Tahoma, Helvetica, sans-serif; font-size: small;">- Danny</p></body>=
</html>
</body>
</html>
--=_b1HYKL053pP6RySxkcQWcodwlTapPH7Q5u-d3PcgRoNgk6Lp--

