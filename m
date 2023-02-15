Return-Path: <danny@sizethreestudios.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82577C61DA4
	for <webhook@archiver.kernel.org>; Wed, 15 Feb 2023 01:47:33 +0000 (UTC)
Received: from a48-178.smtp-out.amazonses.com (a48-178.smtp-out.amazonses.com [54.240.48.178])
 by mx.groups.io with SMTP id smtpd.web11.5957.1676425651303743495
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 14 Feb 2023 17:47:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sizethreestudios.com header.s=hncifp7bcoz4v46j3w6bdwu2f6yqecfu header.b=hLkV4B8a;
 spf=pass (domain: amazonses.com, ip: 54.240.48.178, mailfrom: 0100018652c15fea-6d00d854-5d78-4d2d-a61f-a22844dd9a1e-000000@amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hncifp7bcoz4v46j3w6bdwu2f6yqecfu; d=sizethreestudios.com;
	t=1676425650;
	h=Subject:From:To:Date:Mime-Version:Content-Type:In-Reply-To:References:Message-Id;
	bh=Nie9COjfoMlf6uEBisdUemW5zC7apS0QZSDp2MADuaw=;
	b=hLkV4B8abyhOVKpAS4NA/JzhIyyO2e3jm58Ft/AOR6CbU1BMlyFy8ZXt/XCXZROm
	mo/PyRn8FAvVJ2sVao2RucFhgXl3h9rg55IC6+doRo8+xne1kC+7ObSGRBOp/khJaHK
	BAwhPKoYViryHqHE7uKoZlgyR0dVLUhWwv+d0VgDv7V21oh97mF1AfgOSD9etQfXqkI
	XhVo+0ixEEtVV8Ui1d9P81nZ/8gE2gt2eZbVtXW2IBP2sKGjyB28+MlzT5B1RULueuc
	XCfV9EuxUT5SgYf4daEBSw6hoN51Q8CSJS5fnerXdxZZzm/elXa9lugcspgz8y1SsbF
	HduRzrpdAA==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=6gbrjpgwjskckoa6a5zn6fwqkn67xbtw; d=amazonses.com; t=1676425650;
	h=Subject:From:To:Date:Mime-Version:Content-Type:In-Reply-To:References:Message-Id:Feedback-ID;
	bh=Nie9COjfoMlf6uEBisdUemW5zC7apS0QZSDp2MADuaw=;
	b=SprDKnbrsOi4mBtM05Vm9lES3Z6UAotRhsEd8QMIJ9rbHEn91g/sf382lIXCdhtD
	p4NXv9oaSGY1OPfD2zIFpnCJKAex7z28Qyy7jp258qDEemurfinJiLYaHBpze/TzShx
	RGDcJ46MgfptqRADDHl8LMDff2OGIr6lWzLcmnsw=
Subject: RE: [meta-ti] [kirkstone] beaglebone black usb not detected
From: danny@sizethreestudios.com
To: =?UTF-8?Q?Philip_Balister?= <philip@balister.org>, 
 =?UTF-8?Q?meta-ti=40lists=2Eyoctoproject=2Eorg?=
  <meta-ti@lists.yoctoproject.org>
Date: Wed, 15 Feb 2023 01:47:30 +0000
Mime-Version: 1.0
Content-Type: multipart/alternative; 
 boundary="=_NC3Xg7RLNW2BUpmx81B2Ura79fu5v4q7VEffLgXjGCDLCvo9"
In-Reply-To: <9ec8378c-8663-5ce7-8c0a-295966a2989e@balister.org>
References: <mail.63ec2436.2c80.7be571f74c4d27a6@storage.wm.amazon.com> 
 <01000186526d7a6f-3205a832-0f36-4d03-9a6d-f4ae47c51575-000000@email.amazonses.com> 
 <9ec8378c-8663-5ce7-8c0a-295966a2989e@balister.org> 
 <mail.63ec39b1.254d.5becbdd27f925cfe@storage.wm.amazon.com>
X-Priority: 3 (Normal)
X-Mailer: Amazon WorkMail
Thread-Index: AQHZQNMxkS3gAVPIRVe9IfJzWtLq3wADDa8S
Thread-Topic: [meta-ti] [kirkstone] beaglebone black usb not detected
X-Wm-Sent-Timestamp: 1676425649
Message-ID: <0100018652c15fea-6d00d854-5d78-4d2d-a61f-a22844dd9a1e-000000@email.amazonses.com>
Feedback-ID: 1.us-east-1.LF00NED762KFuBsfzrtoqw+Brn/qlF9OYdxWukAhsl8=:AmazonSES
X-SES-Outgoing: 2023.02.15-54.240.48.178
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 15 Feb 2023 01:47:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15848

This is a multi-part message in MIME format. Your mail reader does not
understand MIME message format.
--=_NC3Xg7RLNW2BUpmx81B2Ura79fu5v4q7VEffLgXjGCDLCvo9
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

This solved my issue, thank you very much!

=C2=A0
For posterity, specifically I added `kernel-modules` to the list of packa=
ges in my image's `.bb` file `IMAGE_INSTALL`, e.g:

```

IMAGE_INSTALL:append =3D " \

=C2=A0 ... others \

=C2=A0 kernel-modules \

"

```

-----Original message-----
From: Philip Balister
Sent: Tuesday, February 14 2023, 7:19 pm
To: danny; meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti] [kirkstone] beaglebone black usb not detected
=C2=A0
Try brute adding all modules to the image by adding the kernel-modules=20=

package to the image. I had to this for my X15. And yes I need a less=20
=

brute force solution, but this should give you an idea where the issue is=
=2E

Philip



On 2/14/23 19:15, Danny Hadley via lists.yoctoproject.org wrote:
> Hi folks! I am working on a Yocto build pipeline for a project targetin=
g=20
> the Beaglebone Black device and have been having some trouble getting=20=

> the kernel to detect USB devices attached to the USB port. I have a=20
=

> suspicion this is somehow related to an incorrect configuration on my=20=

> end related to what kernel modules are loaded, but this is is a=20
> relatively new field of development for me and am at a bit of a loss. I=
=20
> have been able to confirm that the physical usb port itself is=20
> functioning properly by printing the `usb tree` from a u-boot prompt,=20=

> where I am able to see some user-friendly information about the vendor=20=

> and product printed out.
>=20
>=20
> I haven't included much beyond what is provided out of the box by the=20=

> kirkstone branches of meta-ti, poky, meta-rauc, meta-oe, and meta-arm=20=

> layers; the majority of my build so far has been changes to `u-boot` to=
=20
> help facilitate A/B update through rauc.
>=20
> I've uploaded the output of some of what I believe are the best places=20=

> to help figure out what might be the problem to this gist:
>=20
> https://gist.github.com/dadleyy/d47b9254a92285a4ab1472749e21d303=20
> <https://gist.github.com/dadleyy/d47b9254a92285a4ab1472749e21d303>
>=20
> The output there includes specific versions of the layers I have pulled=
=20
> in, as well as the log output of the kernel boot, and the log output of=
=20
> an interactive session in u-boot where I inspect the usb device tree.
>=20
> It looks like this thread -=20
> https://www.yoctoproject.org/pipermail/meta-ti/2018-September/011316.ht=
ml <https://www.yoctoproject.org/pipermail/meta-ti/2018-September/011316.=
html>=C2=A0 - might be related to this issue but I wasn't exactly sure ho=
w to go about adding modules. I have tried creating a `linux-ti-staging_%=
=2Ebbappend` file with the following contents:
>=20
> ```
> FILESEXTRAPATHS:append :=3D "${THISDIR}/files:"
> SRC_URI +=3D " \
>  =C2=A0=C2=A0=C2=A0 file://local_extra_config.cfg \
> "
> KERNEL_CONFIG_FRAGMENTS +=3D " ${WORKDIR}/local_extra_config.cfg"
>=20
> ```
>=20
> where the `local_extra_config.cfg` file contains:
>=20
> ```
>=20
> CONFIG_USB=3Dy
> CONFIG_USB_STORAGE=3Dy
> CONFIG_USB_MASS_STORAGE=3Dy
> CONFIG_USB_ANNOUNCE_NEW_DEVICES=3Dy
> CONFIG_USB_OTG=3Dy
> CONFIG_USB_XHCI_HCD=3Dy
> CONFIG_USB_EHCI_HCD=3Dy
> CONFIG_USB_OHCI_HCD=3Dy
> CONFIG_USB_SERIAL=3Dy
> CONFIG_USB_SERIAL_CP210X=3Dy
> CONFIG_USB_SERIAL_FTDI_SIO=3Dy
> CONFIG_USB_SERIAL_PL2303=3Dy
> CONFIG_USB_SERIAL_OPTION=3Dy
> CONFIG_USB_GADGET=3Dy
> CONFIG_USB_ETH=3Dy
> CONFIG_USB_G_NCM=3Dy
> CONFIG_USB_GADGETFS=3Dy
> CONFIG_USB_FUNCTIONFS=3Dy
> CONFIG_USB_FUNCTIONFS_ETH=3Dy
> CONFIG_USB_FUNCTIONFS_RNDIS=3Dy
> CONFIG_USB_FUNCTIONFS_GENERIC=3Dy
> CONFIG_USB_MASS_STORAGE=3Dy
> CONFIG_USB_G_SERIAL=3Dy
> CONFIG_USB_MIDI_GADGET=3Dy
> CONFIG_USB_G_PRINTER=3Dy
> CONFIG_USB_CDC_COMPOSITE=3Dy
> CONFIG_USB_G_ACM_MS=3Dy
> CONFIG_USB_G_MULTI=3Dy
> CONFIG_USB_G_MULTI_CDC=3Dy
> CONFIG_USB_G_HID=3Dy
> CONFIG_USB_G_DBGP=3Dy
> CONFIG_USB_G_WEBCAM=3Dy
>=20
> ```
>=20
> But this did not solve my problem.
>=20
> I would be happy to provide any additional information!
>=20
> Thank you!
>=20
> - Danny
>=20
>=20
>=20
>=20
>=20

-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#15847): https://lists.yoctoproject.org/g/meta-ti/mess=
age/15847
Mute This Topic: https://lists.yoctoproject.org/mt/96973628/7473053
Group Owner: meta-ti+owner@lists.yoctoproject.org
Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [danny@sizeth=
reestudios.com]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-




--=_NC3Xg7RLNW2BUpmx81B2Ura79fu5v4q7VEffLgXjGCDLCvo9
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML><html>
<head>
<meta name=3D"Generator" content=3D"Amazon WorkMail v3.1.1408.0">
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">=

<title>RE: [meta-ti] [kirkstone] beaglebone black usb not detected</title=
>
</head>
<body>
<html><head></head><body><p style=3D"font-family: Arial, Tahoma, Helvetic=
a, sans-serif; font-size: small; margin: 0px;">This solved my issue, than=
k you very much!</p><p style=3D"font-family: Arial, Tahoma, Helvetica, sa=
ns-serif; font-size: small; margin: 0px;">&nbsp;</p><p style=3D"font-fami=
ly: Arial, Tahoma, Helvetica, sans-serif; font-size: small; margin: 0px;"=
>For posterity, specifically I added `kernel-modules` to the list of pack=
ages in my image's `.bb` file `IMAGE_INSTALL`, e.g:<br><br>```</p><p styl=
e=3D"font-family: Arial, Tahoma, Helvetica, sans-serif; font-size: small;=
 margin: 0px;">IMAGE_INSTALL:append =3D " \</p><p style=3D"font-family: A=
rial, Tahoma, Helvetica, sans-serif; font-size: small; margin: 0px;">&nbs=
p; ... others \</p><p style=3D"font-family: Arial, Tahoma, Helvetica, san=
s-serif; font-size: small; margin: 0px;">&nbsp; kernel-modules \</p><p st=
yle=3D"font-family: Arial, Tahoma, Helvetica, sans-serif; font-size: smal=
l; margin: 0px;">"</p><p style=3D"font-family: Arial, Tahoma, Helvetica, =
sans-serif; font-size: small; margin: 0px;">```</p><blockquote style=3D"b=
order-left: 2px solid rgb(176, 176, 183); margin-left: 5px; margin-right:=
 0px; padding-left: 5px;">-----Original message-----<br><strong>From:</st=
rong> Philip Balister<br><strong>Sent:</strong> Tuesday, February 14 2023=
, 7:19 pm<br><strong>To:</strong> danny; meta-ti@lists.yoctoproject.org<b=
r><strong>Subject:</strong> Re: [meta-ti] [kirkstone] beaglebone black us=
b not detected<br>&nbsp;<pre style=3D"white-space: pre-wrap;">Try brute a=
dding all modules to the image by adding the kernel-modules=20
package to the image. I had to this for my X15. And yes I need a less=20
brute force solution, but this should give you an idea where the issue is=
=2E

Philip



On 2/14/23 19:15, Danny Hadley via lists.yoctoproject.org wrote:
&gt; Hi folks! I am working on a Yocto build pipeline for a project targe=
ting=20
&gt; the Beaglebone Black device and have been having some trouble gettin=
g=20
&gt; the kernel to detect USB devices attached to the USB port. I have a=20=

&gt; suspicion this is somehow related to an incorrect configuration on m=
y=20
&gt; end related to what kernel modules are loaded, but this is is a=20
&gt; relatively new field of development for me and am at a bit of a loss=
=2E I=20
&gt; have been able to confirm that the physical usb port itself is=20
&gt; functioning properly by printing the `usb tree` from a u-boot prompt=
,=20
&gt; where I am able to see some user-friendly information about the vend=
or=20
&gt; and product printed out.
&gt;=20
&gt;=20
&gt; I haven't included much beyond what is provided out of the box by th=
e=20
&gt; kirkstone branches of meta-ti, poky, meta-rauc, meta-oe, and meta-ar=
m=20
&gt; layers; the majority of my build so far has been changes to `u-boot`=
 to=20
&gt; help facilitate A/B update through rauc.
&gt;=20
&gt; I've uploaded the output of some of what I believe are the best plac=
es=20
&gt; to help figure out what might be the problem to this gist:
&gt;=20
&gt; <a title=3D"This external link opens in a new window" href=3D"https:=
//gist.github.com/dadleyy/d47b9254a92285a4ab1472749e21d303">https://gist.=
github.com/dadleyy/d47b9254a92285a4ab1472749e21d303</a>=20
&gt; &lt;<a title=3D"This external link opens in a new window" href=3D"ht=
tps://gist.github.com/dadleyy/d47b9254a92285a4ab1472749e21d303">https://g=
ist.github.com/dadleyy/d47b9254a92285a4ab1472749e21d303</a>&gt;
&gt;=20
&gt; The output there includes specific versions of the layers I have pul=
led=20
&gt; in, as well as the log output of the kernel boot, and the log output=
 of=20
&gt; an interactive session in u-boot where I inspect the usb device tree=
=2E
&gt;=20
&gt; It looks like this thread -=20
&gt; <a title=3D"This external link opens in a new window" href=3D"https:=
//www.yoctoproject.org/pipermail/meta-ti/2018-September/011316.html">http=
s://www.yoctoproject.org/pipermail/meta-ti/2018-September/011316.html</a>=
 &lt;<a title=3D"This external link opens in a new window" href=3D"https:=
//www.yoctoproject.org/pipermail/meta-ti/2018-September/011316.html">http=
s://www.yoctoproject.org/pipermail/meta-ti/2018-September/011316.html</a>=
&gt;&nbsp; - might be related to this issue but I wasn't exactly sure how=
 to go about adding modules. I have tried creating a `linux-ti-staging_%.=
bbappend` file with the following contents:
&gt;=20
&gt; ```
&gt; FILESEXTRAPATHS:append :=3D "${THISDIR}/files:"
&gt; SRC_URI +=3D " \
&gt;  &nbsp;&nbsp;&nbsp; file://local_extra_config.cfg \
&gt; "
&gt; KERNEL_CONFIG_FRAGMENTS +=3D " ${WORKDIR}/local_extra_config.cfg"
&gt;=20
&gt; ```
&gt;=20
&gt; where the `local_extra_config.cfg` file contains:
&gt;=20
&gt; ```
&gt;=20
&gt; CONFIG_USB=3Dy
&gt; CONFIG_USB_STORAGE=3Dy
&gt; CONFIG_USB_MASS_STORAGE=3Dy
&gt; CONFIG_USB_ANNOUNCE_NEW_DEVICES=3Dy
&gt; CONFIG_USB_OTG=3Dy
&gt; CONFIG_USB_XHCI_HCD=3Dy
&gt; CONFIG_USB_EHCI_HCD=3Dy
&gt; CONFIG_USB_OHCI_HCD=3Dy
&gt; CONFIG_USB_SERIAL=3Dy
&gt; CONFIG_USB_SERIAL_CP210X=3Dy
&gt; CONFIG_USB_SERIAL_FTDI_SIO=3Dy
&gt; CONFIG_USB_SERIAL_PL2303=3Dy
&gt; CONFIG_USB_SERIAL_OPTION=3Dy
&gt; CONFIG_USB_GADGET=3Dy
&gt; CONFIG_USB_ETH=3Dy
&gt; CONFIG_USB_G_NCM=3Dy
&gt; CONFIG_USB_GADGETFS=3Dy
&gt; CONFIG_USB_FUNCTIONFS=3Dy
&gt; CONFIG_USB_FUNCTIONFS_ETH=3Dy
&gt; CONFIG_USB_FUNCTIONFS_RNDIS=3Dy
&gt; CONFIG_USB_FUNCTIONFS_GENERIC=3Dy
&gt; CONFIG_USB_MASS_STORAGE=3Dy
&gt; CONFIG_USB_G_SERIAL=3Dy
&gt; CONFIG_USB_MIDI_GADGET=3Dy
&gt; CONFIG_USB_G_PRINTER=3Dy
&gt; CONFIG_USB_CDC_COMPOSITE=3Dy
&gt; CONFIG_USB_G_ACM_MS=3Dy
&gt; CONFIG_USB_G_MULTI=3Dy
&gt; CONFIG_USB_G_MULTI_CDC=3Dy
&gt; CONFIG_USB_G_HID=3Dy
&gt; CONFIG_USB_G_DBGP=3Dy
&gt; CONFIG_USB_G_WEBCAM=3Dy
&gt;=20
&gt; ```
&gt;=20
&gt; But this did not solve my problem.
&gt;=20
&gt; I would be happy to provide any additional information!
&gt;=20
&gt; Thank you!
&gt;=20
&gt; - Danny
&gt;=20
&gt;=20
&gt;=20
&gt;=20
&gt;=20

-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#15847): <a title=3D"This external link opens in a new=
 window" href=3D"https://lists.yoctoproject.org/g/meta-ti/message/15847">=
https://lists.yoctoproject.org/g/meta-ti/message/15847</a>
Mute This Topic: <a title=3D"This external link opens in a new window" hr=
ef=3D"https://lists.yoctoproject.org/mt/96973628/7473053">https://lists.y=
octoproject.org/mt/96973628/7473053</a>
Group Owner: <a title=3D"This external link opens in a new window" href=3D=
"mailto:meta-ti+owner@lists.yoctoproject.org">meta-ti+owner@lists.yoctopr=
oject.org</a>
Unsubscribe: <a title=3D"This external link opens in a new window" href=3D=
"https://lists.yoctoproject.org/g/meta-ti/unsub">https://lists.yoctoproje=
ct.org/g/meta-ti/unsub</a> [<a title=3D"This external link opens in a new=
 window" href=3D"mailto:danny@sizethreestudios.com">danny@sizethreestudio=
s.com</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</pre></blockquote></body></html>
</body>
</html>
--=_NC3Xg7RLNW2BUpmx81B2Ura79fu5v4q7VEffLgXjGCDLCvo9--

