Return-Path: <winiston@futuraautomation.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3AD02E00BD0; Mon, 25 Jan 2016 01:28:04 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HTML_MESSAGE,RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [209.85.220.48 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0001]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-pa0-f48.google.com (mail-pa0-f48.google.com
	[209.85.220.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CB2A8E00B44
	for <meta-ti@yoctoproject.org>; Mon, 25 Jan 2016 01:28:02 -0800 (PST)
Received: by mail-pa0-f48.google.com with SMTP id uo6so79740806pac.1
	for <meta-ti@yoctoproject.org>; Mon, 25 Jan 2016 01:28:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=futuraautomation-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:from:to:subject:date:mime-version:content-type
	:importance:disposition-notification-to;
	bh=M4IFFgGf9j1zwvEMcwuZV3k3OYzJqkyWZzg9Xph8wo0=;
	b=iWLwgQaV1TBYw/08eZ+lh+tHeSsqNSUAQ/cgYLvRPoiylCnJKOrjGwyrh/VuqWGdLV
	q+oYPeheHx8O4roCMnz0m7QtUSBLeDudmXXT2NZP/XcKOU19EBWonj3vqlmhWIIhmT1L
	gTvqqtgtcz5jgVMHZLa/KCJ0+Fw1T2CZaJljYQ1ZOxbb0aA35IKEkB0A4HMqBjAibd0H
	dZ1zDgwDst6uZTX3LcytWLJU57+K6Y8YhMj3YtaT7oZM0iYAfK5wliTn2dWNG0j/mz0s
	cgN6qCHAH2fgnm0AJEL5VZIagWUpnFc+Eojts9w2EMxTdoWu7KfmzBUkPXP3j/fkOneK
	Zxfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:from:to:subject:date:mime-version
	:content-type:importance:disposition-notification-to;
	bh=M4IFFgGf9j1zwvEMcwuZV3k3OYzJqkyWZzg9Xph8wo0=;
	b=BaUa8t8eb0bUn/379rg3Ue5kiaKIQrbR9oXQdPxmnz36MNSR6WLN2QL8Uwn+KP/h/C
	wccGQBxPC1t3UiHPiCxKMlsxQZQw4CYh1jIfqnFDmwwxbLbdDSTJCnO8YF30XtwYiXv5
	mSdiIx8xQNIVB/4LuOhg2HYJkHAAj0Mu512LVtV/fFNXXG40PE4SMUSfqz1E2AkgbMqD
	Z0HI30Ic7cmkqSfklP3be47bM7ovkykX3f7LI++2q7+5QdueTBxDAi75gNpFgMUO50GV
	KvygPo+D6sfQYsQtVRZ8OKjiwJpc4LQg5P0ziHh8lsE/lOiHbLNfEg080YJyqReN5dUI
	EM9w==
X-Gm-Message-State: AG10YOR6V4Jgx+gMjsAVjv/2KugJg8Dm4ptAemXvpOq53/wj7OLuDVRAC+Cey8XF0xJkuw==
X-Received: by 10.67.6.1 with SMTP id cq1mr24149805pad.78.1453714081581;
	Mon, 25 Jan 2016 01:28:01 -0800 (PST)
Received: from RD3 ([59.99.236.185]) by smtp.gmail.com with ESMTPSA id
	tp6sm15134646pab.25.2016.01.25.01.27.58
	for <meta-ti@yoctoproject.org>
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 25 Jan 2016 01:28:00 -0800 (PST)
Message-ID: <7A144FD2E22B42C29D1455BA473BACE1@RD3>
From: <winiston@futuraautomation.com>
To: "yocto texas" <meta-ti@yoctoproject.org>
Date: Mon, 25 Jan 2016 15:02:18 +0530
MIME-Version: 1.0
X-Priority: 1
X-MSMail-Priority: High
Importance: High
X-Mailer: Microsoft Windows Live Mail 15.4.3555.308
X-MimeOLE: Produced By Microsoft MimeOLE V15.4.3555.308
Subject: Build Error for AM437x-evm
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
X-List-Received-Date: Mon, 25 Jan 2016 09:28:04 -0000
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_004C_01D15781.62448370"

------=_NextPart_000_004C_01D15781.62448370
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Dear ,

I built default yocto image for qemux86 processor using poky. I used the =
bitbake core-image-minimal command to build the image. It has been built =
successfully.=20
Now I made the following changes to build for AM437x evm.

1. Edited   ~/poky/build/conf/bblayers.conf   file as follows

BBFILES ?=3D =E2=80=9C=E2=80=9D
BBLAYERS =3D =E2=80=9C \
/home/winiston/poky/meta \
/home/winiston/poky/meta-yocto \
/home/winiston/poky/meta-ti \

Note :  meta-ti  resides in the poky folder.

2.Edited  ~/poky/build/conf/local.conf  file. The MACHINE variable  =
changed from MACHINE ??=3D =E2=80=9Cqemux86=E2=80=9D  to  MACHINE ??=3D =
"am437x-evm"

After making above two changes, I executed bitbake core-image-minimal =
command from terminal window. It gives the following error

ERROR: ParseError at =
/home/winiston/poky/meta-ti/recipes-graphics/drm/libdrm_2.4.41.bb:1: =
Could not include required file recipes-graphics/drm/libdrm.inc

Summary: There was 1 ERROR message shown, returning a non-zero exit =
code.
winiston@winiston-VirtualBox:~/poky/build$=20

What could be the reason of this error? How do I solve this error?

Regards,
Winiston.P
Futura Automation Pvt Ltd.

Ph :91-80-28375290 / 28375295
Fax :91-80-28375291

------=_NextPart_000_004C_01D15781.62448370
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<HTML><HEAD></HEAD>
<BODY dir=3Dltr>
<DIV dir=3Dltr>
<DIV style=3D"FONT-SIZE: 12pt; FONT-FAMILY: 'Calibri'; COLOR: #000000">
<DIV>Dear ,</DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3D"Times New Roman">I built default yocto image for =
qemux86=20
processor using poky. I used the <FONT color=3D#0000ff>bitbake=20
core-image-minimal</FONT> command to build the image. It has been built=20
successfully. </FONT></DIV>
<DIV><FONT face=3D"Times New Roman">Now I made the following changes to =
build for=20
AM437x evm.</FONT></DIV>
<DIV><FONT face=3D"Times New Roman"></FONT>&nbsp;</DIV>
<DIV><FONT face=3D"Times New Roman">1. Edited&nbsp;&nbsp; <FONT=20
color=3D#0000ff>~/poky/build/conf/bblayers.conf</FONT>&nbsp;&nbsp; file =
as=20
follows</FONT></DIV>
<DIV><FONT face=3D"Times New Roman"></FONT>&nbsp;</DIV>
<DIV>BBFILES ?=3D =E2=80=9C=E2=80=9D</DIV>
<DIV>BBLAYERS =3D =E2=80=9C \</DIV>
<DIV>/home/winiston/poky/meta \</DIV>
<DIV>/home/winiston/poky/meta-yocto \</DIV>
<DIV><FONT color=3D#0000ff>/home/winiston/poky/meta-ti \</FONT></DIV>
<DIV><FONT face=3D"Times New Roman"></FONT>&nbsp;</DIV>
<DIV><FONT face=3D"Times New Roman">Note :&nbsp; <FONT=20
color=3D#0000ff>meta-ti</FONT>&nbsp; resides in the poky =
folder.</FONT></DIV>
<DIV><FONT face=3D"Times New Roman"></FONT>&nbsp;</DIV>
<DIV><FONT face=3D"Times New Roman">2.Edited </FONT>&nbsp;<FONT=20
color=3D#0000ff>~/poky/build/conf/local.conf&nbsp; </FONT>file. The =
MACHINE=20
variable&nbsp; changed from <FONT color=3D#0000ff>MACHINE ??=3D=20
=E2=80=9Cqemux86=E2=80=9D</FONT>&nbsp; to&nbsp; <FONT =
color=3D#0000ff>MACHINE ??=3D=20
"am437x-evm"</FONT></DIV><FONT face=3D"Times New Roman"></FONT>
<DIV><BR>After making above two changes, I executed <FONT=20
face=3D"Times New Roman"><FONT color=3D#0000ff>bitbake =
core-image-minimal</FONT>=20
command from terminal window. It gives the following error</FONT></DIV>
<DIV><FONT face=3D"Times New Roman"></FONT>&nbsp;</DIV>
<DIV><STRONG><FONT color=3D#0000ff>ERROR: ParseError at=20
/home/winiston/poky/meta-ti/recipes-graphics/drm/libdrm_2.4.41.bb:1: =
Could not=20
include required file =
recipes-graphics/drm/libdrm.inc</FONT></STRONG></DIV>
<DIV><STRONG><FONT color=3D#0000ff></FONT></STRONG>&nbsp;</DIV>
<DIV><STRONG><FONT color=3D#0000ff>Summary: There was 1 ERROR message =
shown,=20
returning a non-zero exit code.</FONT></STRONG></DIV>
<DIV><STRONG><FONT color=3D#0000ff><A=20
href=3D"mailto:winiston@winiston-VirtualBox:~/poky/build$">winiston@winis=
ton-VirtualBox:~/poky/build$</A></FONT></STRONG>=20
</DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT color=3D#ff0000>What could be the reason of this error? How =
do I solve=20
this error?</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV=20
style=3D"FONT-SIZE: 12pt; FONT-FAMILY: 'Calibri'; COLOR: =
#000000">Regards,<BR>Winiston.P<BR>Futura=20
Automation Pvt Ltd.<BR><BR>Ph :91-80-28375290 / 28375295<BR>Fax=20
:91-80-28375291<BR></DIV></DIV></DIV></BODY></HTML>

------=_NextPart_000_004C_01D15781.62448370--
