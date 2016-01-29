Return-Path: <winiston@futuraautomation.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B4C9DE00B9E; Fri, 29 Jan 2016 02:14:53 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HTML_MESSAGE,RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [209.85.220.51 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-pa0-f51.google.com (mail-pa0-f51.google.com
	[209.85.220.51])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8720AE00A92
	for <meta-ti@yoctoproject.org>; Fri, 29 Jan 2016 02:14:50 -0800 (PST)
Received: by mail-pa0-f51.google.com with SMTP id cy9so39352647pac.0
	for <meta-ti@yoctoproject.org>; Fri, 29 Jan 2016 02:14:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=futuraautomation-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:from:to:subject:date:mime-version:content-type
	:importance:disposition-notification-to;
	bh=0vf3VOmYYm9dyXgbBgzWVlwUxIccI28cLi8WCTzIjaY=;
	b=OprUDdf1sz0eSFA+e95/O6DxzJwtufJL9FUDQVh6k2TMlubs1KWfYEDqLXP+zFQZNP
	GzMa8fESx9H/1WJNm+zGvtV0LNAtxTicXL/7laORh5BfC9hI13NaZK2NWf9YSK/qrlds
	1qUrZZ1MKADtcs9EW55SlFCpMaTa4bDGLVRE4duXpJDBDrWItaGhuR0/rgJw1uI6id0B
	UbkDL8bD0He3keiEUb3EGifEmOu3HX99eeIPhaO6Lqv570GVjjyUCYJvny++MakBS/oO
	f5lKskGkRjTdDLtSrPKlUBGOj5yaOayxBAtXkX9tqVB6N/2zefw2iJPqFuqk7469BkoC
	zPTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:from:to:subject:date:mime-version
	:content-type:importance:disposition-notification-to;
	bh=0vf3VOmYYm9dyXgbBgzWVlwUxIccI28cLi8WCTzIjaY=;
	b=hBk+I1L7+8kVcH66lhHOnFBGxb10hj+AIK1cEe29iSsnyWcSM3gp2e1f4c2kJcc9OV
	5g7EyMPNcQkzUXbNWG91JSAOV8Pv+k8ZKZnQuh0t1I+Waw49qJ3aTCLkkiL2LOTwCI1i
	oEzlkXkzAxZ07CFoF2FNvBUQLfCcHvsKjwAmoDyhVYPGirDfDZBc3R2k3lyltvSK1LaN
	cxBTiHWYsQfpLNACsF0zs3Ju6/cWgH3ydla2AggY5NlLGDcj9Hoz65tLDBpu5TnyItg1
	0zg0bygfIBp99hIlEVtdMr1APnSHhIVT1NXNdQ0dPyRuyS8dGJ/BqKCdC6t0nm4ZR4G2
	pxOQ==
X-Gm-Message-State: AG10YORbZkJ4zBuAfvRoiCzfrHUV7wDbEmiKJQa5vHB+DD/NjwWdwKzEr2rCSnJgDAXTpg==
X-Received: by 10.66.102.70 with SMTP id fm6mr12158215pab.80.1454062489791;
	Fri, 29 Jan 2016 02:14:49 -0800 (PST)
Received: from RD3 ([59.99.236.185]) by smtp.gmail.com with ESMTPSA id
	o4sm22373764pfa.85.2016.01.29.02.14.46 for <meta-ti@yoctoproject.org>
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 29 Jan 2016 02:14:48 -0800 (PST)
Message-ID: <32F7239B343B45C78216EBDDA2AC66CA@RD3>
From: <winiston@futuraautomation.com>
To: "yocto texas" <meta-ti@yoctoproject.org>
Date: Fri, 29 Jan 2016 15:49:03 +0530
MIME-Version: 1.0
X-Priority: 1
X-MSMail-Priority: High
Importance: High
X-Mailer: Microsoft Windows Live Mail 15.4.3555.308
X-MimeOLE: Produced By Microsoft MimeOLE V15.4.3555.308
Subject: Error while writing image on sd card
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
X-List-Received-Date: Fri, 29 Jan 2016 10:14:53 -0000
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_00EC_01D15AAC.940ED5D0"

------=_NextPart_000_00EC_01D15AAC.940ED5D0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Dear,

Host system : Ubuntu 14.04
Target system :  AM437x-evm

I tried to write the image on the sd card, It spits out the error.   I =
am=20
using  card reader. In the device tree, card reader detects as /dev/sdb=20
& /dev/sde and  sd card detects as /dev/sde1 , /dev/sde2 & /dev/sde3     =
.=20

Please see the below output for my writing command.

winiston@winiston-VirtualBox:~/poky/build$ sudo=20
$HOME/poky/scripts/contrib/mkefidisk.sh /dev/sde =
\tmp/deploy/images/am437x-evm/core-image-minimal-am437x-evm.tar.bz2 =
/dev/sda
Image details
    image:=20
'tmp/deploy/images/am437x-evm/core-image-minimal-am437x-evm.tar.bz2' ->=20
'core-image-minimal-am437x-evm-20160129065004.rootfs.tar.bz2'
     size: 2180726 bytes
modified: 2016-01-29 12:21:04.000000000 +0530
     type: bzip2 compressed data, block size =3D 900k

Device details
  device: /dev/sde
  vendor: Multiple
   model: Flash Reader
    size: 16088301568 bytes

Prepare EFI image on /dev/sde [y/N]? y

Boot partition size:   20 MB (/dev/sde1)
ROOTFS partition size: 15264 MB (/dev/sde2)
Swap partition size:   804 MB (/dev/sde3)

Partitioning installation media (/dev/sde)
Formatting partitions
Failed to mount=20
tmp/deploy/images/am437x-evm/core-image-minimal-am437x-evm.tar.bz2
Failed to mount rootfs.img
Preparing boot partition
Failed to copy vmlinuz
Failed to copy EFI dir
No EFI bootloader configuration found
winiston@winiston-VirtualBox:~/poky/build$

What could be the problem? How do I burn image on sd card?


Regards,
Winiston.P
Futura Automation Pvt Ltd.

Ph :91-80-28375290 / 28375295
Fax :91-80-28375291

------=_NextPart_000_00EC_01D15AAC.940ED5D0
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<HTML><HEAD></HEAD>
<BODY dir=3Dltr>
<DIV dir=3Dltr>
<DIV style=3D"FONT-SIZE: 12pt; FONT-FAMILY: 'Calibri'; COLOR: #000000">
<DIV><FONT face=3D"Times New Roman">Dear,<BR></FONT></DIV>
<DIV><FONT face=3D"Times New Roman">Host system : Ubuntu =
14.04</FONT></DIV>
<DIV><FONT face=3D"Times New Roman">Target system :&nbsp;=20
AM437x-evm</FONT></DIV><FONT face=3D"Times New Roman">
<DIV><BR>I tried to write the image on the sd card, It spits out the=20
error.&nbsp;&nbsp; I am <BR>using&nbsp; card reader. In the device tree, =
card=20
reader detects as<FONT color=3D#0000ff> /dev/sdb <BR>&amp; =
/dev/sde</FONT>=20
and&nbsp; sd card detects as <FONT color=3D#0000ff>/dev/sde1 , /dev/sde2 =
&amp;=20
/dev/sde3</FONT>&nbsp;&nbsp;&nbsp;&nbsp; . </DIV>
<DIV><BR>Please see the below output for my writing =
command.<BR><BR></FONT><A=20
style=3D'href: =
"mailto:winiston@winiston-VirtualBox:~/poky/build$"'><FONT=20
face=3D"Times New =
Roman">winiston@winiston-VirtualBox:~/poky/build$</FONT></A><FONT=20
face=3D"Times New Roman"> sudo =
<BR>$HOME/poky/scripts/contrib/mkefidisk.sh=20
/dev/sde =
\tmp/deploy/images/am437x-evm/core-image-minimal-am437x-evm.tar.bz2=20
/dev/sda<BR>Image details<BR>&nbsp;&nbsp;&nbsp; image:=20
<BR>'tmp/deploy/images/am437x-evm/core-image-minimal-am437x-evm.tar.bz2' =
-&gt;=20
<BR>'core-image-minimal-am437x-evm-20160129065004.rootfs.tar.bz2'<BR>&nbs=
p;&nbsp;&nbsp;&nbsp;=20
size: 2180726 bytes<BR>modified: 2016-01-29 12:21:04.000000000=20
+0530<BR>&nbsp;&nbsp;&nbsp;&nbsp; type: bzip2 compressed data, block =
size =3D=20
900k<BR><BR>Device details<BR>&nbsp; device: /dev/sde<BR>&nbsp; vendor:=20
Multiple<BR>&nbsp;&nbsp; model: Flash Reader<BR>&nbsp;&nbsp;&nbsp; size: =

16088301568 bytes<BR><BR>Prepare EFI image on /dev/sde [y/N]? =
y<BR><BR>Boot=20
partition size:&nbsp;&nbsp; 20 MB (/dev/sde1)<BR>ROOTFS partition size: =
15264 MB=20
(/dev/sde2)<BR>Swap partition size:&nbsp;&nbsp; 804 MB=20
(/dev/sde3)<BR><BR>Partitioning installation media =
(/dev/sde)<BR>Formatting=20
partitions<BR>Failed to mount=20
<BR>tmp/deploy/images/am437x-evm/core-image-minimal-am437x-evm.tar.bz2<BR=
>Failed=20
to mount rootfs.img<BR>Preparing boot partition<BR>Failed to copy=20
vmlinuz<BR>Failed to copy EFI dir<BR>No EFI bootloader configuration=20
found<BR></FONT><A=20
style=3D'href: =
"mailto:winiston@winiston-VirtualBox:~/poky/build$"'><FONT=20
face=3D"Times New =
Roman">winiston@winiston-VirtualBox:~/poky/build$</FONT></A><BR><BR><FONT=
=20
face=3D"Times New Roman">What could be the problem? How do I burn image =
on sd=20
card?</FONT><BR></DIV>
<DIV>&nbsp;</DIV>
<DIV=20
style=3D"FONT-SIZE: 12pt; FONT-FAMILY: 'Calibri'; COLOR: =
#000000">Regards,<BR>Winiston.P<BR>Futura=20
Automation Pvt Ltd.<BR><BR>Ph :91-80-28375290 / 28375295<BR>Fax=20
:91-80-28375291<BR></DIV></DIV></DIV></BODY></HTML>

------=_NextPart_000_00EC_01D15AAC.940ED5D0--
