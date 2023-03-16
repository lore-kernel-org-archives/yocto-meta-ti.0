Return-Path: <danny@sizethreestudios.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30BB1C6FD19
	for <webhook@archiver.kernel.org>; Thu, 16 Mar 2023 16:11:38 +0000 (UTC)
Received: from a11-80.smtp-out.amazonses.com (a11-80.smtp-out.amazonses.com [54.240.11.80])
 by mx.groups.io with SMTP id smtpd.web10.16490.1678983089520100431
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 16 Mar 2023 09:11:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sizethreestudios.com header.s=hncifp7bcoz4v46j3w6bdwu2f6yqecfu header.b=UlCKCq0G;
 spf=pass (domain: amazonses.com, ip: 54.240.11.80, mailfrom: 01000186eb30c93b-a7c4db25-4de8-4324-a052-ad225c14fdc9-000000@amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hncifp7bcoz4v46j3w6bdwu2f6yqecfu; d=sizethreestudios.com;
	t=1678983088;
	h=Subject:From:To:Date:Mime-Version:Content-Type:References:Message-Id;
	bh=GWiY8dUwuHHKVhOBYvqxCmCJA9BPD9T3KKUO6u7Uyfc=;
	b=UlCKCq0GbXOlpCP3tbYmcyqvDEgIES5SL3sX4lkY+8W8otYxnkX1v58uf4yQrhXh
	0hHkTmLrccPLZ83s7CosrlfKKcs2n5xPgzYFdKFnVjYWq4ELIeuhfWVIvsCmsR6NGBc
	9ZSRzQrsXjG4gqulPnQu7yPiaYuD+aMm1Zcnj0a9Is4wT4JWM9n2SPvGV5Ba/AT1bNo
	QcbLd3jRxK4zuNiCyvrlQ2dLThETHXsSErKlteHTLgLZcaxzU2szpG3zVhRPugYaqon
	r808FlqoGLy817AA4MLXz1x407FnFqhQaiay+ebE3QGHdoFFtrO1UwkVDYGWpatnYWz
	n1tqDTF9+A==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=224i4yxa5dv7c2xz3womw6peuasteono; d=amazonses.com; t=1678983088;
	h=Subject:From:To:Date:Mime-Version:Content-Type:References:Message-Id:Feedback-ID;
	bh=GWiY8dUwuHHKVhOBYvqxCmCJA9BPD9T3KKUO6u7Uyfc=;
	b=WAwIyMz/aUxZAHjN0qVv8Bg1fC/jrZGJToHNF2mF6hbx6Pw4Lb922+wijIOniAt3
	p+Vp4xY5kbkyBaJ2XmdAvPXhbPa7H4Rp8BIOuO7lePL/yf7OKx1cALkO1hbiFQxQdEp
	rDet40LAd+kEV4lPtb/bR6Qq2q+JyQgLoJlIvsaM=
Subject: [kirkstone] mesa compilation failures when setting
 PREFERRED_PROVIDER for virtual/gpudriver = "ti-sgx-ddk-km"
From: danny@sizethreestudios.com
To: =?UTF-8?Q?meta-ti=40lists=2Eyoctoproject=2Eorg?=
  <meta-ti@lists.yoctoproject.org>
Date: Thu, 16 Mar 2023 16:11:28 +0000
Mime-Version: 1.0
Content-Type: multipart/alternative; 
 boundary="=_L-P42yrKfX509w6kwryTwMzOwzlcxEtM7OWRicZv+aA-qC0d"
References: <mail.64133faf.3771.17352b0439bf0805@storage.wm.amazon.com>
X-Priority: 3 (Normal)
X-Mailer: Amazon WorkMail
Thread-Index: AQHZWB7h9R9dMrikQFKZwgLrO+5FQw==
Thread-Topic: [kirkstone] mesa compilation failures when setting
 PREFERRED_PROVIDER for virtual/gpudriver = "ti-sgx-ddk-km"
X-Wm-Sent-Timestamp: 1678983087
Message-ID: <01000186eb30c93b-a7c4db25-4de8-4324-a052-ad225c14fdc9-000000@email.amazonses.com>
Feedback-ID: 1.us-east-1.LF00NED762KFuBsfzrtoqw+Brn/qlF9OYdxWukAhsl8=:AmazonSES
X-SES-Outgoing: 2023.03.16-54.240.11.80
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 16 Mar 2023 16:11:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15988

This is a multi-part message in MIME format. Your mail reader does not
understand MIME message format.
--=_L-P42yrKfX509w6kwryTwMzOwzlcxEtM7OWRicZv+aA-qC0d
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi all! I am trying to make sure my opengl-backed GUI application is leve=
raging the most optimal graphics drivers on the beaglebone black device a=
nd am running into yocto build failures.

=C2=A0
Based on what I can tell from the changes in 56be461=C2=A0(https://git.yo=
ctoproject.org/meta-ti/commit/meta-ti-bsp/recipes-graphics/libgles/ti-sgx=
-ddk-um_1.17.4948957.bb=3Fh=3Dkirkstone&id=3D56be4618abdde45649f0f92d383d=
5f44e5ec6efb), <https://git.yoctoproject.org/meta-ti/commit/meta-ti-bsp/r=
ecipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb=3Fh=3Dkirkstone&amp=
;id=3D56be4618abdde45649f0f92d383d5f44e5ec6efb),> =C2=A0I should be able =
to have mesa compiled using the drivers provided from the `ti-sgx-ddk-km`=
 recipe by setting my preferred provider for the `virtual/gpudriver` as s=
uch:

=C2=A0
```

PREFERRED_PROVIDER_virtual/gpudriver =3D "ti-sgx-ddk-km"

```

=C2=A0
I'm not sure if this is the correct way to go about what I am trying to d=
o, or if it is even necessary to ensure my application is using the=C2=A0=
best hardware it can (which is ultimately the goal). Either way, with the=
 variable mentioned above set to `ti-sgx-ddk-km`, the mesa.do_compile ste=
p fails with what I believe are linker errors. This is an example of what=
 I am seeing in my logs:

=C2=A0
```

/<my-path-to-yocto>/tmp/work/beaglebone-poky-linux-gnueabi/mesa/2_22.0.3+=
pvr-r0/recipe-sysroot-native/usr/bin/arm-poky-linux-gnueabi/../../libexec=
/arm-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/11.3.0/ld: src/gallium=
/frontends/sgx/libsgx.a.p/pvrdri.c.o: in function `PVRDRIReleaseBuffer':
=

2023-03-15T19:19:43.7831698Z | /usr/src/debug/mesa/2_22.0.3+pvr-r0/build/=
=2E./git/src/gallium/frontends/sgx/pvrdri.c:1055: undefined reference to =
`PVRDRIBufferDestroy'
2023-03-15T19:19:43.7832402Z | /<my-path-to-yocto>/tmp/work/beaglebone-po=
ky-linux-gnueabi/mesa/2_22.0.3+pvr-r0/recipe-sysroot-native/usr/bin/arm-p=
oky-linux-gnueabi/../../libexec/arm-poky-linux-gnueabi/gcc/arm-poky-linux=
-gnueabi/11.3.0/ld: src/gallium/frontends/sgx/libsgx.a.p/pvrdri.c.o: in f=
unction `PVRDRIAllocateBuffer':
2023-03-15T19:19:43.7833062Z | /usr/src/debug/mesa/2_22.0.3+pvr-r0/build/=
=2E./git/src/gallium/frontends/sgx/pvrdri.c:1027: undefined reference to =
`PVRDRIBufferCreate'
2023-03-15T19:19:43.7833813Z | /<my-path-to-yocto>/tmp/work/beaglebone-po=
ky-linux-gnueabi/mesa/2_22.0.3+pvr-r0/recipe-sysroot-native/usr/bin/arm-p=
oky-linux-gnueabi/../../libexec/arm-poky-linux-gnueabi/gcc/arm-poky-linux=
-gnueabi/11.3.0/ld: /usr/src/debug/mesa/2_22.0.3+pvr-r0/build/../git/src/=
gallium/frontends/sgx/pvrdri.c:1037: undefined reference to `PVRDRIBuffer=
GetName'

```

=C2=A0
The full(-ish, I might be missing some) list of these missing functions i=
s:
=C2=A0
-=C2=A0PVREGLDrawableDestroy
-=C2=A0PVREGLDrawableCreate

-=C2=A0PVRDRIPixFmtGetBlockSize

-=C2=A0PVRDRIEGLMarkRendersurfaceInvalid

-=C2=A0PVREGLDrawableRecreate

-=C2=A0PVRDRIBufferDestroy

-=C2=A0PVRDRIGetAPIFunc

-=C2=A0PVRDRIEGLGetLibHandle

-=C2=A0PVRDRIDepthStencilBitArraySize

-=C2=A0PVRDRIMSAABitArraySize

-=C2=A0PVRDRIDepthBitsArray

-=C2=A0PVRDRIEGLImageCreate

-=C2=A0PVRDRIMesaFormatSupported

-=C2=A0PVRDRIMaxPBufferWidth

-=C2=A0PVRDRIMaxPBufferHeight

-=C2=A0PVRDRIBufferCreateFromNames

-=C2=A0PVRDRIEGLImageCreateFromBuffer

-=C2=A0PVRDRIEGLFlushBuffers

-=C2=A0PVRDRIBufferCreate

-=C2=A0PVRDRICreateDrawableImpl

-=C2=A0PVRDRIMakeCurrentGC

-=C2=A0PVRDRIGetDeviceTypeFromFd

-=C2=A0PVRDRIEGLImageGetAttribs

-=C2=A0PVRDRI2ReleaseTexImage

=C2=A0
I'm a bit out of my element here, but it looks like I might be missing so=
me dynamically linked library=C2=A0that provides functions like=C2=A0PVRD=
RIBufferGetName=C2=A0which gallium depends on=3F It seems likely I am mis=
sing a recipe or configuration value, but I'm not sure where to look.

=C2=A0
Any help here would be appreciated. I'd be happy to provide more logs and=
/or configuration information as necessary.

=C2=A0
Thanks!

- Danny


--=_L-P42yrKfX509w6kwryTwMzOwzlcxEtM7OWRicZv+aA-qC0d
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML><html>
<head>
<meta name=3D"Generator" content=3D"Amazon WorkMail v3.1.1469.0">
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">=

<title>[kirkstone] mesa compilation failures when setting PREFERRED_PROVI=
DER for virtual/gpudriver =3D &quot;ti-sgx-ddk-km&quot;</title>
</head>
<body>
<html><head></head><body><p style=3D"margin: 0px; font-family: Arial, Tah=
oma, Helvetica, sans-serif; font-size: small;">Hi all! I am trying to mak=
e sure my opengl-backed GUI application is leveraging the most optimal gr=
aphics drivers on the beaglebone black device and am running into yocto b=
uild failures.</p><p style=3D"margin: 0px; font-family: Arial, Tahoma, He=
lvetica, sans-serif; font-size: small;">&nbsp;</p><p style=3D"margin: 0px=
; font-family: Arial, Tahoma, Helvetica, sans-serif; font-size: small;">B=
ased on what I can tell from the changes in 56be461&nbsp;(<a href=3D"http=
s://git.yoctoproject.org/meta-ti/commit/meta-ti-bsp/recipes-graphics/libg=
les/ti-sgx-ddk-um_1.17.4948957.bb=3Fh=3Dkirkstone&amp;id=3D56be4618abdde4=
5649f0f92d383d5f44e5ec6efb)," _src=3D"https://git.yoctoproject.org/meta-t=
i/commit/meta-ti-bsp/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.=
bb=3Fh=3Dkirkstone&amp;id=3D56be4618abdde45649f0f92d383d5f44e5ec6efb),">h=
ttps://git.yoctoproject.org/meta-ti/commit/meta-ti-bsp/recipes-graphics/l=
ibgles/ti-sgx-ddk-um_1.17.4948957.bb=3Fh=3Dkirkstone&amp;id=3D56be4618abd=
de45649f0f92d383d5f44e5ec6efb),</a>&nbsp;I should be able to have mesa co=
mpiled using the drivers provided from the `<font face=3D"Courier New, Co=
urier, monospace">ti-sgx-ddk-km</font>` recipe by setting my preferred pr=
ovider for the `virtual/gpudriver` as such:</p><p style=3D"margin: 0px; f=
ont-family: Arial, Tahoma, Helvetica, sans-serif; font-size: small;">&nbs=
p;</p><p style=3D"margin: 0px; font-family: Arial, Tahoma, Helvetica, san=
s-serif; font-size: small;">```</p><p style=3D"margin: 0px; font-family: =
Arial, Tahoma, Helvetica, sans-serif; font-size: small;"><font face=3D"Co=
urier New, Courier, monospace">PREFERRED_PROVIDER_virtual/gpudriver =3D "=
ti-sgx-ddk-km"</font></p><p style=3D"margin: 0px; font-family: Arial, Tah=
oma, Helvetica, sans-serif; font-size: small;">```</p><p style=3D"margin:=
 0px; font-family: Arial, Tahoma, Helvetica, sans-serif; font-size: small=
;">&nbsp;</p><p style=3D"margin: 0px; font-family: Arial, Tahoma, Helveti=
ca, sans-serif; font-size: small;">I'm not sure if this is the correct wa=
y to go about what I am trying to do, or if it is even necessary to ensur=
e my application is using the&nbsp;best hardware it can (which is ultimat=
ely the goal). Either way, with the variable mentioned above set to `<fon=
t face=3D"Courier New, Courier, monospace">ti-sgx-ddk-km`</font>, the <fo=
nt face=3D"Courier New, Courier, monospace">mesa.do_compile </font>step f=
ails with what I believe are linker errors. This is an example of what I =
am seeing in my logs:</p><p style=3D"margin: 0px; font-family: Arial, Tah=
oma, Helvetica, sans-serif; font-size: small;">&nbsp;</p><p style=3D"marg=
in: 0px; font-family: Arial, Tahoma, Helvetica, sans-serif; font-size: sm=
all;">```</p><p style=3D"margin: 0px; font-family: Arial, Tahoma, Helveti=
ca, sans-serif; font-size: small;"><font face=3D"Courier New, Courier, mo=
nospace">/&lt;my-path-to-yocto&gt;/tmp/work/beaglebone-poky-linux-gnueabi=
/mesa/2_22.0.3+pvr-r0/recipe-sysroot-native/usr/bin/arm-poky-linux-gnueab=
i/../../libexec/arm-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/11.3.0/=
ld: src/gallium/frontends/sgx/libsgx.a.p/pvrdri.c.o: in function `PVRDRIR=
eleaseBuffer':<br>2023-03-15T19:19:43.7831698Z | /usr/src/debug/mesa/2_22=
=2E0.3+pvr-r0/build/../git/src/gallium/frontends/sgx/pvrdri.c:1055: undef=
ined reference to `PVRDRIBufferDestroy'<br>2023-03-15T19:19:43.7832402Z |=
 /&lt;my-path-to-yocto&gt;/tmp/work/beaglebone-poky-linux-gnueabi/mesa/2_=
22.0.3+pvr-r0/recipe-sysroot-native/usr/bin/arm-poky-linux-gnueabi/../../=
libexec/arm-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/11.3.0/ld: src/=
gallium/frontends/sgx/libsgx.a.p/pvrdri.c.o: in function `PVRDRIAllocateB=
uffer':<br>2023-03-15T19:19:43.7833062Z | /usr/src/debug/mesa/2_22.0.3+pv=
r-r0/build/../git/src/gallium/frontends/sgx/pvrdri.c:1027: undefined refe=
rence to `PVRDRIBufferCreate'<br>2023-03-15T19:19:43.7833813Z | /&lt;my-p=
ath-to-yocto&gt;/tmp/work/beaglebone-poky-linux-gnueabi/mesa/2_22.0.3+pvr=
-r0/recipe-sysroot-native/usr/bin/arm-poky-linux-gnueabi/../../libexec/ar=
m-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/11.3.0/ld: /usr/src/debug=
/mesa/2_22.0.3+pvr-r0/build/../git/src/gallium/frontends/sgx/pvrdri.c:103=
7: undefined reference to `PVRDRIBufferGetName'</font></p><p style=3D"mar=
gin: 0px; font-family: Arial, Tahoma, Helvetica, sans-serif; font-size: s=
mall;">```</p><p style=3D"margin: 0px; font-family: Arial, Tahoma, Helvet=
ica, sans-serif; font-size: small;">&nbsp;</p><p style=3D"margin: 0px; fo=
nt-family: Arial, Tahoma, Helvetica, sans-serif; font-size: small;">The f=
ull(-ish, I might be missing some) list of these missing functions is:<br=
>&nbsp;</p><p style=3D"margin: 0px; font-family: Arial, Tahoma, Helvetica=
, sans-serif; font-size: small;"><font face=3D"Courier New, Courier, mono=
space">-&nbsp;PVREGLDrawableDestroy<br>-&nbsp;PVREGLDrawableCreate</font>=
</p><p style=3D"margin: 0px; font-family: Arial, Tahoma, Helvetica, sans-=
serif; font-size: small;"><font face=3D"Courier New, Courier, monospace">=
-&nbsp;PVRDRIPixFmtGetBlockSize</font></p><p style=3D"margin: 0px; font-f=
amily: Arial, Tahoma, Helvetica, sans-serif; font-size: small;"><font fac=
e=3D"Courier New, Courier, monospace">-&nbsp;PVRDRIEGLMarkRendersurfaceIn=
valid</font></p><p style=3D"margin: 0px; font-family: Arial, Tahoma, Helv=
etica, sans-serif; font-size: small;"><font face=3D"Courier New, Courier,=
 monospace">-&nbsp;PVREGLDrawableRecreate</font></p><p style=3D"margin: 0=
px; font-family: Arial, Tahoma, Helvetica, sans-serif; font-size: small;"=
><font face=3D"Courier New, Courier, monospace">-&nbsp;PVRDRIBufferDestro=
y</font></p><p style=3D"margin: 0px; font-family: Arial, Tahoma, Helvetic=
a, sans-serif; font-size: small;"><font face=3D"Courier New, Courier, mon=
ospace">-&nbsp;PVRDRIGetAPIFunc</font></p><p style=3D"margin: 0px; font-f=
amily: Arial, Tahoma, Helvetica, sans-serif; font-size: small;"><font fac=
e=3D"Courier New, Courier, monospace">-&nbsp;PVRDRIEGLGetLibHandle</font>=
</p><p style=3D"margin: 0px; font-family: Arial, Tahoma, Helvetica, sans-=
serif; font-size: small;"><font face=3D"Courier New, Courier, monospace">=
-&nbsp;PVRDRIDepthStencilBitArraySize</font></p><p style=3D"margin: 0px; =
font-family: Arial, Tahoma, Helvetica, sans-serif; font-size: small;"><fo=
nt face=3D"Courier New, Courier, monospace">-&nbsp;PVRDRIMSAABitArraySize=
</font></p><p style=3D"margin: 0px; font-family: Arial, Tahoma, Helvetica=
, sans-serif; font-size: small;"><font face=3D"Courier New, Courier, mono=
space">-&nbsp;PVRDRIDepthBitsArray</font></p><p style=3D"margin: 0px; fon=
t-family: Arial, Tahoma, Helvetica, sans-serif; font-size: small;"><font =
face=3D"Courier New, Courier, monospace">-&nbsp;PVRDRIEGLImageCreate</fon=
t></p><p style=3D"margin: 0px; font-family: Arial, Tahoma, Helvetica, san=
s-serif; font-size: small;"><font face=3D"Courier New, Courier, monospace=
">-&nbsp;PVRDRIMesaFormatSupported</font></p><p style=3D"margin: 0px; fon=
t-family: Arial, Tahoma, Helvetica, sans-serif; font-size: small;"><font =
face=3D"Courier New, Courier, monospace">-&nbsp;PVRDRIMaxPBufferWidth</fo=
nt></p><p style=3D"margin: 0px; font-family: Arial, Tahoma, Helvetica, sa=
ns-serif; font-size: small;"><font face=3D"Courier New, Courier, monospac=
e">-&nbsp;PVRDRIMaxPBufferHeight</font></p><p style=3D"margin: 0px; font-=
family: Arial, Tahoma, Helvetica, sans-serif; font-size: small;"><font fa=
ce=3D"Courier New, Courier, monospace">-&nbsp;PVRDRIBufferCreateFromNames=
</font></p><p style=3D"margin: 0px; font-family: Arial, Tahoma, Helvetica=
, sans-serif; font-size: small;"><font face=3D"Courier New, Courier, mono=
space">-&nbsp;PVRDRIEGLImageCreateFromBuffer</font></p><p style=3D"margin=
: 0px; font-family: Arial, Tahoma, Helvetica, sans-serif; font-size: smal=
l;"><font face=3D"Courier New, Courier, monospace">-&nbsp;PVRDRIEGLFlushB=
uffers</font></p><p style=3D"margin: 0px; font-family: Arial, Tahoma, Hel=
vetica, sans-serif; font-size: small;"><font face=3D"Courier New, Courier=
, monospace">-&nbsp;PVRDRIBufferCreate</font></p><p style=3D"margin: 0px;=
 font-family: Arial, Tahoma, Helvetica, sans-serif; font-size: small;"><f=
ont face=3D"Courier New, Courier, monospace">-&nbsp;PVRDRICreateDrawableI=
mpl</font></p><p style=3D"margin: 0px; font-family: Arial, Tahoma, Helvet=
ica, sans-serif; font-size: small;"><font face=3D"Courier New, Courier, m=
onospace">-&nbsp;PVRDRIMakeCurrentGC</font></p><p style=3D"margin: 0px; f=
ont-family: Arial, Tahoma, Helvetica, sans-serif; font-size: small;"><fon=
t face=3D"Courier New, Courier, monospace">-&nbsp;PVRDRIGetDeviceTypeFrom=
Fd</font></p><p style=3D"margin: 0px; font-family: Arial, Tahoma, Helveti=
ca, sans-serif; font-size: small;"><font face=3D"Courier New, Courier, mo=
nospace">-&nbsp;PVRDRIEGLImageGetAttribs</font></p><p style=3D"margin: 0p=
x; font-family: Arial, Tahoma, Helvetica, sans-serif; font-size: small;">=
<font face=3D"Courier New, Courier, monospace">-&nbsp;PVRDRI2ReleaseTexIm=
age</font></p><p style=3D"margin: 0px; font-family: Arial, Tahoma, Helvet=
ica, sans-serif; font-size: small;">&nbsp;</p><p style=3D"margin: 0px; fo=
nt-family: Arial, Tahoma, Helvetica, sans-serif; font-size: small;">I'm a=
 bit out of my element here, but it looks like I might be missing some dy=
namically linked library&nbsp;that provides functions like&nbsp;<font fac=
e=3D"Courier New, Courier, monospace">PVRDRIBufferGetName</font>&nbsp;whi=
ch gallium depends on=3F It seems likely I am missing a recipe or configu=
ration value, but I'm not sure where to look.</p><p style=3D"margin: 0px;=
 font-family: Arial, Tahoma, Helvetica, sans-serif; font-size: small;">&n=
bsp;</p><p style=3D"margin: 0px; font-family: Arial, Tahoma, Helvetica, s=
ans-serif; font-size: small;">Any help here would be appreciated. I'd be =
happy to provide more logs and/or configuration information as necessary.=
</p><p style=3D"margin: 0px; font-family: Arial, Tahoma, Helvetica, sans-=
serif; font-size: small;">&nbsp;</p><p style=3D"margin: 0px; font-family:=
 Arial, Tahoma, Helvetica, sans-serif; font-size: small;">Thanks!</p><p s=
tyle=3D"margin: 0px; font-family: Arial, Tahoma, Helvetica, sans-serif; f=
ont-size: small;">- Danny</p></body></html>
</body>
</html>
--=_L-P42yrKfX509w6kwryTwMzOwzlcxEtM7OWRicZv+aA-qC0d--

