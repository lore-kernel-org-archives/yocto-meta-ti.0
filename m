Return-Path: <rstreif@linuxfoundation.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BB33DE007BA; Sun, 31 Aug 2014 07:48:12 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HTML_MESSAGE,RCVD_IN_DNSWL_LOW autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [209.85.223.177 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-ie0-f177.google.com (mail-ie0-f177.google.com
	[209.85.223.177])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0BF4DE00572
	for <meta-ti@yoctoproject.org>; Sun, 31 Aug 2014 07:48:10 -0700 (PDT)
Received: by mail-ie0-f177.google.com with SMTP id tp5so4988695ieb.36
	for <meta-ti@yoctoproject.org>; Sun, 31 Aug 2014 07:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=VghoGznnAwAZjlOUrERtikO6jsDTNVwQ4/6zJ0FQlyw=;
	b=AkVKC5Z6U7EW8fqA9pK01rKt40VdUD45IM2t2IORzsC9eNAI5H3C9i9YmUcAjUFSm+
	PVCHmhcqDLJZJxj2wuLiRPGZO9frbGpNG+yid+mnSgZll2PiL2xAbx1AVrqDbGqdk51k
	fkAtVU+yDBxu8K5j0TYN78B8EnZEKal+cYMLs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:date:message-id:subject:from:to
	:content-type;
	bh=VghoGznnAwAZjlOUrERtikO6jsDTNVwQ4/6zJ0FQlyw=;
	b=ITukdNAPRELecdjYaDPyFyfw5clP3xUzcBkIWsMVKd/0vqVF/Uu3HCHuIoHu6HpkXq
	YyT1ruPoJVCfgZcuvms61iB0cx8AZGaF55MY37JPLFSu1bwrmdjRltxtKKs5MgC8QmU3
	3G/esxZNOYBjoYkttfpn2FMtBYdQBmC2Fy1ogkI/Dbm/Q1HgUHtBLeE/R4exJrzD2PJl
	MOtxNMDvwaFQVBrfh5t7tXNK9PIZwhdNx+xx4FcLjMku/NQNl5Eqow0TJoFnvxHOcaYU
	HoQdNCRAfkCos12Vn6+EkTYmapLYoIcp7PMkF9VZUwtnpZ0lBILdvkh9sZU/FRDF4PpN
	z95w==
X-Gm-Message-State: ALoCoQnNQShBr7N68zhTfeBIr0RN8wGKZCpUj0xwDMh5UN1epDosdcHqL8Ww3KA0qbkLL6Ljx7Lx
MIME-Version: 1.0
X-Received: by 10.50.13.106 with SMTP id g10mr16123904igc.45.1409496489801;
	Sun, 31 Aug 2014 07:48:09 -0700 (PDT)
Received: by 10.107.149.73 with HTTP; Sun, 31 Aug 2014 07:48:09 -0700 (PDT)
Date: Sun, 31 Aug 2014 07:48:09 -0700
Message-ID: <CA+gsK-okuyjWuEp+3bm6++ojWrDfaCPwXtXEOswu7Xikxg8jfA@mail.gmail.com>
From: Rudolf Streif <rstreif@linuxfoundation.org>
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: BeagleBoard C4 with USB
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
X-List-Received-Date: Sun, 31 Aug 2014 14:48:12 -0000
Content-Type: multipart/alternative; boundary=089e013c69ce96743a0501edf944

--089e013c69ce96743a0501edf944
Content-Type: text/plain; charset=UTF-8

I have a BeagleBoard C4 laying around that I want to use for a project that
has USB devices connected to it. I built a core-image-base with YP from
master and meta-ti from master with this configuration:

Build Configuration:
BB_VERSION        = "1.23.1"
BUILD_SYS         = "x86_64-linux"
NATIVELSBSTRING   = "Fedora-18"
TARGET_SYS        = "arm-poky-linux-gnueabi"
MACHINE           = "beagleboard"
DISTRO            = "poky"
DISTRO_VERSION    = "1.6+snapshot-20140831"
TUNE_FEATURES     = "arm armv7a vfp thumb neon callconvention-hard cortexa8"
TARGET_FPU        = "vfp-neon"
meta
meta-yocto
meta-yocto-bsp    = "master:c16795477ea7e2159b5d3808268912b572887e2d"
meta-ti           = "master:d2c40099cd219493e4a6d9a6218f88f1b9f3f8fb"
meta-oe           = "master:1513d0e31f609ffcde9a116a50bfb0360b9e7ecf"

It builds fine. I am installing u-boot, kernel and the device tree on the
SSD card.

I use this u-boot script to boot the board:

setenv bootcmd 'mmc init; fatload mmc 0:1 0x80300000 uImage; fatload mmc
0:1 0x815f0000 beagle.dtb; bootm 0x80300000 - 0x815f0000'
setenv bootargs 'console=tty0 console=ttyO2,115200n8 root=/dev/mmcblk0p2
rootwait rootfstype=ext3 ro'
boot

In the above beagle.dtb =  uImage--3.14.8-r0-omap3-beagle-<date>.dtb which
I assumed to be the correct one for the C4 because the other dtb created
has xM explicitly in its name.

The system boots fine but USB is not working. None of the typical USB host
controller initialization is in the dmesg output and lsusb responds with
'unable to initialize libsub: -99'.

I am not sure if I am doing anything wrong or if there is an actual issue.
Help appreciated.

Cheers,
Rudi

--089e013c69ce96743a0501edf944
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div><font face=3D"garamond, serif"><span=
 style=3D"border-collapse:collapse;color:rgb(102,102,102);font-family:arial=
,sans-serif;font-size:13px">I have a BeagleBoard C4 laying around that I wa=
nt to use for a project that has USB devices connected to it. I built a cor=
e-image-base with YP from master and meta-ti from master with this configur=
ation:</span></font></div>
<div><font face=3D"garamond, serif"><span style=3D"border-collapse:collapse=
;color:rgb(102,102,102);font-family:arial,sans-serif;font-size:13px"><br></=
span></font></div><div><span style=3D"border-collapse:collapse"><div style>=
<font color=3D"#666666" face=3D"arial, sans-serif">Build Configuration:</fo=
nt></div>
<div style><font color=3D"#666666" face=3D"arial, sans-serif">BB_VERSION =
=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;1.23.1&quot;</font></div><div style><f=
ont color=3D"#666666" face=3D"arial, sans-serif">BUILD_SYS =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =3D &quot;x86_64-linux&quot;</font></div>
<div style><font color=3D"#666666" face=3D"arial, sans-serif">NATIVELSBSTRI=
NG =C2=A0 =3D &quot;Fedora-18&quot;</font></div><div style><font color=3D"#=
666666" face=3D"arial, sans-serif">TARGET_SYS =C2=A0 =C2=A0 =C2=A0 =C2=A0=
=3D &quot;arm-poky-linux-gnueabi&quot;</font></div>
<div style><font color=3D"#666666" face=3D"arial, sans-serif">MACHINE =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;beagleboard&quot;</font></div><di=
v style><font color=3D"#666666" face=3D"arial, sans-serif">DISTRO =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;poky&quot;</font></div>
<div style><font color=3D"#666666" face=3D"arial, sans-serif">DISTRO_VERSIO=
N =C2=A0 =C2=A0=3D &quot;1.6+snapshot-20140831&quot;</font></div><div style=
><font color=3D"#666666" face=3D"arial, sans-serif">TUNE_FEATURES =C2=A0 =
=C2=A0 =3D &quot;arm armv7a vfp thumb neon callconvention-hard cortexa8&quo=
t;</font></div>
<div style><font color=3D"#666666" face=3D"arial, sans-serif">TARGET_FPU =
=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;vfp-neon&quot;</font></div><div style>=
<font color=3D"#666666" face=3D"arial, sans-serif">meta =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0</font></div><div style><font color=3D"#6666=
66" face=3D"arial, sans-serif">meta-yocto =C2=A0 =C2=A0 =C2=A0 =C2=A0</font=
></div>
<div style><font color=3D"#666666" face=3D"arial, sans-serif">meta-yocto-bs=
p =C2=A0 =C2=A0=3D &quot;master:c16795477ea7e2159b5d3808268912b572887e2d&qu=
ot;</font></div><div style><font color=3D"#666666" face=3D"arial, sans-seri=
f">meta-ti =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;master:d2c40099cd21=
9493e4a6d9a6218f88f1b9f3f8fb&quot;</font></div>
<div style><font color=3D"#666666" face=3D"arial, sans-serif">meta-oe =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;master:1513d0e31f609ffcde9a116a50=
bfb0360b9e7ecf&quot;</font></div><div style=3D"color:rgb(102,102,102);font-=
family:arial,sans-serif;font-size:13px">
<br></div><div style=3D"color:rgb(102,102,102);font-family:arial,sans-serif=
;font-size:13px">It builds fine. I am installing u-boot, kernel and the dev=
ice tree on the SSD card.</div><div style=3D"color:rgb(102,102,102);font-fa=
mily:arial,sans-serif;font-size:13px">
<br></div><div style=3D"color:rgb(102,102,102);font-family:arial,sans-serif=
;font-size:13px">I use this u-boot script to boot the board:</div><div styl=
e=3D"color:rgb(102,102,102);font-family:arial,sans-serif;font-size:13px"><b=
r>
</div><div style><div style=3D"color:rgb(102,102,102);font-family:arial,san=
s-serif;font-size:13px">setenv bootcmd &#39;mmc init; fatload mmc 0:1 0x803=
00000 uImage; fatload mmc 0:1 0x815f0000 beagle.dtb; bootm 0x80300000 - 0x8=
15f0000&#39;</div>
<div style=3D"color:rgb(102,102,102);font-family:arial,sans-serif;font-size=
:13px">setenv bootargs &#39;console=3Dtty0 console=3DttyO2,115200n8 root=3D=
/dev/mmcblk0p2 rootwait rootfstype=3Dext3 ro&#39;</div><div style=3D"color:=
rgb(102,102,102);font-family:arial,sans-serif;font-size:13px">
boot</div><div style=3D"color:rgb(102,102,102);font-family:arial,sans-serif=
;font-size:13px"><br></div><div style><font color=3D"#666666" face=3D"arial=
, sans-serif">In the above beagle.dtb =3D=C2=A0</font><span style=3D"color:=
rgb(102,102,102);font-family:arial,sans-serif;font-size:13px">=C2=A0</span>=
<font color=3D"#666666" face=3D"arial, sans-serif">uImage--3.14.8-r0-omap3-=
beagle-&lt;date&gt;.dtb which I assumed to be the correct one for the C4 be=
cause the other dtb created has xM explicitly in its name.</font></div>
<div style><font color=3D"#666666" face=3D"arial, sans-serif"><br></font></=
div><div style><font color=3D"#666666" face=3D"arial, sans-serif">The syste=
m boots fine but USB is not working. None of the typical USB host controlle=
r initialization is in the dmesg output and lsusb responds with &#39;unable=
 to initialize libsub: -99&#39;.</font></div>
<div style><font color=3D"#666666" face=3D"arial, sans-serif"><br></font></=
div><div style><font color=3D"#666666" face=3D"arial, sans-serif">I am not =
sure if I am doing anything wrong or if there is an actual issue. Help appr=
eciated.</font></div>
<div style><font color=3D"#666666" face=3D"arial, sans-serif"><br></font></=
div><div style><font color=3D"#666666" face=3D"arial, sans-serif">Cheers,</=
font></div><div style><font color=3D"#666666" face=3D"arial, sans-serif">Ru=
di</font></div>
<div style=3D"color:rgb(102,102,102);font-family:arial,sans-serif;font-size=
:13px"><br></div></div></span></div></div>
</div>

--089e013c69ce96743a0501edf944--
