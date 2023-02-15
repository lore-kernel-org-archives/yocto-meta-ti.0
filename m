Return-Path: <danny@sizethreestudios.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C411C05027
	for <webhook@archiver.kernel.org>; Wed, 15 Feb 2023 00:16:03 +0000 (UTC)
Received: from a48-180.smtp-out.amazonses.com (a48-180.smtp-out.amazonses.com [54.240.48.180])
 by mx.groups.io with SMTP id smtpd.web11.4182.1676420153129482346
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 14 Feb 2023 16:15:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sizethreestudios.com header.s=hncifp7bcoz4v46j3w6bdwu2f6yqecfu header.b=EQOSeegG;
 spf=pass (domain: amazonses.com, ip: 54.240.48.180, mailfrom: 01000186526d7a6f-3205a832-0f36-4d03-9a6d-f4ae47c51575-000000@amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hncifp7bcoz4v46j3w6bdwu2f6yqecfu; d=sizethreestudios.com;
	t=1676420152;
	h=Subject:From:To:Date:Mime-Version:Content-Type:References:Message-Id;
	bh=dm6BvZCfA80tXBQyxP1bSoHVg9yWY2cCaBqry7aRnMI=;
	b=EQOSeegGuD6o0Xj676zfiL6wwVnrp1mqjX/qyoX1IkiwhFyUj0RjYjzsOphxbvJT
	XNoQf5Rqwf308nTVEzUfI7yaYTHUqQXmht5HwEhPPFexnXxvLTR2n0Te0BYKUw0zN79
	Er3HL6y96CNHnXzZNAw97MQ/2iF4uB09ZScWpZRNnmUG6/tWTX7dqwNaz1/j1BPyzXY
	LJvogBxqQucIPQUCp+VnE3yTfeZn6JrsxHFaAtyuk/NST6mAiEZOxPdNJkbb94MhHy2
	I2UavAi/x68JoWEAA/qMKnAiRzRLHlubmzMBSWe31aM7sECEggrxGOkvVHt2Ni78PO8
	+qtrMXoNng==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=6gbrjpgwjskckoa6a5zn6fwqkn67xbtw; d=amazonses.com; t=1676420152;
	h=Subject:From:To:Date:Mime-Version:Content-Type:References:Message-Id:Feedback-ID;
	bh=dm6BvZCfA80tXBQyxP1bSoHVg9yWY2cCaBqry7aRnMI=;
	b=exZlTL8M17NapkZULVhP1x/CblovXGWqusKA0G92t79qk/YBNdMyboOwsvpp3SLy
	Njxbe+pc93TZkBKyfCP834ZdF7FPEg3u9/XcWrVUrJ2VZ+KwRj1dDHd7+s0EgRXXKv7
	b+hEg/DxUHv9fczxkMPQpZ5PWw2wLQOaRLhe0VHs=
Subject: [kirkstone] beaglebone black usb not detected
From: danny@sizethreestudios.com
To: =?UTF-8?Q?meta-ti=40lists=2Eyoctoproject=2Eorg?=
  <meta-ti@lists.yoctoproject.org>
Date: Wed, 15 Feb 2023 00:15:51 +0000
Mime-Version: 1.0
Content-Type: multipart/alternative; 
 boundary="=_Tg2XWklfmbBFr-5ytAbfHXhDepdmyHpnKJSo2bw8fWMU9VcQ"
References: <mail.63ec2436.2c80.7be571f74c4d27a6@storage.wm.amazon.com>
X-Priority: 3 (Normal)
X-Mailer: Amazon WorkMail
Thread-Index: AQHZQNHrMQyJ4Ap8SXOuXuqJQfT1BA==
Thread-Topic: [kirkstone] beaglebone black usb not detected
X-Wm-Sent-Timestamp: 1676420150
Message-ID: <01000186526d7a6f-3205a832-0f36-4d03-9a6d-f4ae47c51575-000000@email.amazonses.com>
Feedback-ID: 1.us-east-1.LF00NED762KFuBsfzrtoqw+Brn/qlF9OYdxWukAhsl8=:AmazonSES
X-SES-Outgoing: 2023.02.15-54.240.48.180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 15 Feb 2023 00:16:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15846

This is a multi-part message in MIME format. Your mail reader does not
understand MIME message format.
--=_Tg2XWklfmbBFr-5ytAbfHXhDepdmyHpnKJSo2bw8fWMU9VcQ
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi folks! I am working on a Yocto build pipeline for a project targeting =
the Beaglebone Black device and have been having some trouble getting the=
 kernel to detect USB devices attached to the USB port. I have a suspicio=
n this is somehow related to an incorrect configuration on my end related=
 to what kernel modules are loaded, but this is is a relatively new field=
 of development for me and am at a bit of a loss. I have been able to con=
firm that the physical usb port itself is functioning properly by printin=
g the `usb tree` from a u-boot prompt, where I am able to see some user-f=
riendly information about the vendor and product printed out.


I haven't included much beyond what is provided out of the box by the kir=
kstone branches of meta-ti, poky, meta-rauc, meta-oe, and meta-arm layers=
; the majority of my build so far has been changes to `u-boot` to help fa=
cilitate A/B update through rauc.

=C2=A0
I've uploaded the output of some of what I believe are the best places to=
 help figure out what might be the problem to this gist:

https://gist.github.com/dadleyy/d47b9254a92285a4ab1472749e21d303

=C2=A0
The output there includes specific versions of the layers I have pulled i=
n, as well as the log output of the kernel boot, and the log output of an=
 interactive session in u-boot where I inspect the usb device tree.

=C2=A0
It looks like this thread - https://www.yoctoproject.org/pipermail/meta-t=
i/2018-September/011316.html <https://www.yoctoproject.org/pipermail/meta=
-ti/2018-September/011316.html> =C2=A0 - might be related to this issue b=
ut I wasn't exactly sure how to go about adding modules. I have tried cre=
ating a `linux-ti-staging_%.bbappend` file with the following contents:

=C2=A0
```
FILESEXTRAPATHS:append :=3D "${THISDIR}/files:"
SRC_URI +=3D " \
=C2=A0=C2=A0=C2=A0 file://local_extra_config.cfg \
"
KERNEL_CONFIG_FRAGMENTS +=3D " ${WORKDIR}/local_extra_config.cfg"

```

=C2=A0
where the `local_extra_config.cfg` file contains:

=C2=A0
```

CONFIG_USB=3Dy
CONFIG_USB_STORAGE=3Dy
CONFIG_USB_MASS_STORAGE=3Dy
CONFIG_USB_ANNOUNCE_NEW_DEVICES=3Dy
CONFIG_USB_OTG=3Dy
CONFIG_USB_XHCI_HCD=3Dy
CONFIG_USB_EHCI_HCD=3Dy
CONFIG_USB_OHCI_HCD=3Dy
CONFIG_USB_SERIAL=3Dy
CONFIG_USB_SERIAL_CP210X=3Dy
CONFIG_USB_SERIAL_FTDI_SIO=3Dy
CONFIG_USB_SERIAL_PL2303=3Dy
CONFIG_USB_SERIAL_OPTION=3Dy
CONFIG_USB_GADGET=3Dy
CONFIG_USB_ETH=3Dy
CONFIG_USB_G_NCM=3Dy
CONFIG_USB_GADGETFS=3Dy
CONFIG_USB_FUNCTIONFS=3Dy
CONFIG_USB_FUNCTIONFS_ETH=3Dy
CONFIG_USB_FUNCTIONFS_RNDIS=3Dy
CONFIG_USB_FUNCTIONFS_GENERIC=3Dy
CONFIG_USB_MASS_STORAGE=3Dy
CONFIG_USB_G_SERIAL=3Dy
CONFIG_USB_MIDI_GADGET=3Dy
CONFIG_USB_G_PRINTER=3Dy
CONFIG_USB_CDC_COMPOSITE=3Dy
CONFIG_USB_G_ACM_MS=3Dy
CONFIG_USB_G_MULTI=3Dy
CONFIG_USB_G_MULTI_CDC=3Dy
CONFIG_USB_G_HID=3Dy
CONFIG_USB_G_DBGP=3Dy
CONFIG_USB_G_WEBCAM=3Dy

```

=C2=A0
But this did not solve my problem.

I would be happy to provide any additional information!

=C2=A0
Thank you!

- Danny


--=_Tg2XWklfmbBFr-5ytAbfHXhDepdmyHpnKJSo2bw8fWMU9VcQ
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML><html>
<head>
<meta name=3D"Generator" content=3D"Amazon WorkMail v3.1.1408.0">
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">=

<title>[kirkstone] beaglebone black usb not detected</title>
</head>
<body>
<html><head></head><body><p style=3D"font-family: Arial, Tahoma, Helvetic=
a, sans-serif; font-size: small; margin: 0px;">Hi folks! I am working on =
a Yocto build pipeline for a project targeting the Beaglebone Black devic=
e and have been having some trouble getting the kernel to detect USB devi=
ces attached to the USB port. I have a suspicion this is somehow related =
to an incorrect configuration on my end related to what kernel modules ar=
e loaded, but this is is a relatively new field of development for me and=
 am at a bit of a loss. I have been able to confirm that the physical usb=
 port itself is functioning properly by printing the `usb tree` from a u-=
boot prompt, where I am able to see some user-friendly information about =
the vendor and product printed out.</p><p style=3D"font-family: Arial, Ta=
homa, Helvetica, sans-serif; font-size: small; margin: 0px;"><br>I haven'=
t included much beyond what is provided out of the box by the kirkstone b=
ranches of meta-ti, poky, meta-rauc, meta-oe, and meta-arm layers; the ma=
jority of my build so far has been changes to `u-boot` to help facilitate=
 A/B update through rauc.</p><p style=3D"font-family: Arial, Tahoma, Helv=
etica, sans-serif; font-size: small; margin: 0px;">&nbsp;</p><p style=3D"=
font-family: Arial, Tahoma, Helvetica, sans-serif; font-size: small; marg=
in: 0px;">I've uploaded the output of some of what I believe are the best=
 places to help figure out what might be the problem to this gist:</p><p =
style=3D"font-family: Arial, Tahoma, Helvetica, sans-serif; font-size: sm=
all; margin: 0px;"><a title=3D"This external link opens in a new window" =
href=3D"https://gist.github.com/dadleyy/d47b9254a92285a4ab1472749e21d303"=
>https://gist.github.com/dadleyy/d47b9254a92285a4ab1472749e21d303</a></p>=
<p style=3D"font-family: Arial, Tahoma, Helvetica, sans-serif; font-size:=
 small; margin: 0px;">&nbsp;</p><p style=3D"font-family: Arial, Tahoma, H=
elvetica, sans-serif; font-size: small; margin: 0px;">The output there in=
cludes specific versions of the layers I have pulled in, as well as the l=
og output of the kernel boot, and the log output of an interactive sessio=
n in u-boot where I inspect the usb device tree.</p><p style=3D"font-fami=
ly: Arial, Tahoma, Helvetica, sans-serif; font-size: small; margin: 0px;"=
>&nbsp;</p><p style=3D"font-family: Arial, Tahoma, Helvetica, sans-serif;=
 font-size: small; margin: 0px;">It looks like this thread - <a href=3D"h=
ttps://www.yoctoproject.org/pipermail/meta-ti/2018-September/011316.html"=
 _src=3D"https://www.yoctoproject.org/pipermail/meta-ti/2018-September/01=
1316.html">https://www.yoctoproject.org/pipermail/meta-ti/2018-September/=
011316.html</a>&nbsp; - might be related to this issue but I wasn't exact=
ly sure how to go about adding modules. I have tried creating a `linux-ti=
-staging_%.bbappend` file with the following contents:</p><p style=3D"fon=
t-family: Arial, Tahoma, Helvetica, sans-serif; font-size: small; margin:=
 0px;">&nbsp;</p><p style=3D"font-family: Arial, Tahoma, Helvetica, sans-=
serif; font-size: small; margin: 0px;">```<br>FILESEXTRAPATHS:append :=3D=
 "${THISDIR}/files:"<br>SRC_URI +=3D " \<br>&nbsp;&nbsp;&nbsp; file://loc=
al_extra_config.cfg \<br>"<br>KERNEL_CONFIG_FRAGMENTS +=3D " ${WORKDIR}/l=
ocal_extra_config.cfg"</p><p style=3D"font-family: Arial, Tahoma, Helveti=
ca, sans-serif; font-size: small; margin: 0px;">```</p><p style=3D"font-f=
amily: Arial, Tahoma, Helvetica, sans-serif; font-size: small; margin: 0p=
x;">&nbsp;</p><p style=3D"font-family: Arial, Tahoma, Helvetica, sans-ser=
if; font-size: small; margin: 0px;">where the `local_extra_config.cfg` fi=
le contains:</p><p style=3D"font-family: Arial, Tahoma, Helvetica, sans-s=
erif; font-size: small; margin: 0px;">&nbsp;</p><p style=3D"font-family: =
Arial, Tahoma, Helvetica, sans-serif; font-size: small; margin: 0px;">```=
</p><p style=3D"font-family: Arial, Tahoma, Helvetica, sans-serif; font-s=
ize: small; margin: 0px;">CONFIG_USB=3Dy<br>CONFIG_USB_STORAGE=3Dy<br>CON=
FIG_USB_MASS_STORAGE=3Dy<br>CONFIG_USB_ANNOUNCE_NEW_DEVICES=3Dy<br>CONFIG=
_USB_OTG=3Dy<br>CONFIG_USB_XHCI_HCD=3Dy<br>CONFIG_USB_EHCI_HCD=3Dy<br>CON=
FIG_USB_OHCI_HCD=3Dy<br>CONFIG_USB_SERIAL=3Dy<br>CONFIG_USB_SERIAL_CP210X=
=3Dy<br>CONFIG_USB_SERIAL_FTDI_SIO=3Dy<br>CONFIG_USB_SERIAL_PL2303=3Dy<br=
>CONFIG_USB_SERIAL_OPTION=3Dy<br>CONFIG_USB_GADGET=3Dy<br>CONFIG_USB_ETH=3D=
y<br>CONFIG_USB_G_NCM=3Dy<br>CONFIG_USB_GADGETFS=3Dy<br>CONFIG_USB_FUNCTI=
ONFS=3Dy<br>CONFIG_USB_FUNCTIONFS_ETH=3Dy<br>CONFIG_USB_FUNCTIONFS_RNDIS=3D=
y<br>CONFIG_USB_FUNCTIONFS_GENERIC=3Dy<br>CONFIG_USB_MASS_STORAGE=3Dy<br>=
CONFIG_USB_G_SERIAL=3Dy<br>CONFIG_USB_MIDI_GADGET=3Dy<br>CONFIG_USB_G_PRI=
NTER=3Dy<br>CONFIG_USB_CDC_COMPOSITE=3Dy<br>CONFIG_USB_G_ACM_MS=3Dy<br>CO=
NFIG_USB_G_MULTI=3Dy<br>CONFIG_USB_G_MULTI_CDC=3Dy<br>CONFIG_USB_G_HID=3D=
y<br>CONFIG_USB_G_DBGP=3Dy<br>CONFIG_USB_G_WEBCAM=3Dy</p><p style=3D"font=
-family: Arial, Tahoma, Helvetica, sans-serif; font-size: small; margin: =
0px;">```</p><p style=3D"font-family: Arial, Tahoma, Helvetica, sans-seri=
f; font-size: small; margin: 0px;">&nbsp;</p><p style=3D"font-family: Ari=
al, Tahoma, Helvetica, sans-serif; font-size: small; margin: 0px;">But th=
is did not solve my problem.<br><br>I would be happy to provide any addit=
ional information!</p><p style=3D"font-family: Arial, Tahoma, Helvetica, =
sans-serif; font-size: small; margin: 0px;">&nbsp;</p><p style=3D"font-fa=
mily: Arial, Tahoma, Helvetica, sans-serif; font-size: small; margin: 0px=
;">Thank you!</p><p style=3D"font-family: Arial, Tahoma, Helvetica, sans-=
serif; font-size: small; margin: 0px;">- Danny</p></body></html>
</body>
</html>
--=_Tg2XWklfmbBFr-5ytAbfHXhDepdmyHpnKJSo2bw8fWMU9VcQ--

