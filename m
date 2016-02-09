Return-Path: <winiston@futuraautomation.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8B8C6E00C84; Tue,  9 Feb 2016 01:32:48 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HTML_MESSAGE,RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [209.85.192.171 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-pf0-f171.google.com (mail-pf0-f171.google.com
	[209.85.192.171])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D8AD7E00C59
	for <meta-ti@yoctoproject.org>; Tue,  9 Feb 2016 01:32:44 -0800 (PST)
Received: by mail-pf0-f171.google.com with SMTP id q63so21252916pfb.0
	for <meta-ti@yoctoproject.org>; Tue, 09 Feb 2016 01:32:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=futuraautomation-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:from:to:subject:date:mime-version:content-type
	:importance:disposition-notification-to;
	bh=YAHbfdzW09oEqY29acJH+t8kLCY4Qjg6udCpGj10HO0=;
	b=s7BfEKLQC97saB6HqzVXmJRI8PrK6gZjfsID7bHfAKPEnafwXzaMwZIhxhHOvVYSnm
	dH9XJpj/1yrFi9OE67VN0oNMBbQ7kRv9e2bm44f/c6FYMoz4wY99VeT1VJeGHFCjwocv
	tKv++tHSi4ROF6lFio60WeUl2ueFrXjMJ/gHiYgmRaLvMC16yvuZToYhMO0mwvnxMAxY
	C1rvdcpYsH9GMRoD1iEUuvDvJk0cGZcJ/EKhbEX5Pil2ASWCi1xdrMTufGWJ+SsvFLZR
	xWxaWyaWVAXUSjBgwn704XxkCpuY0vEnahNyXyydtaJ05+aYUX+Iqp4zxyrPbr01Qc47
	C7Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:from:to:subject:date:mime-version
	:content-type:importance:disposition-notification-to;
	bh=YAHbfdzW09oEqY29acJH+t8kLCY4Qjg6udCpGj10HO0=;
	b=eYZHn5cq7jm61zXVne+KWGyWr+Dhql5tW2ljhpqZX1C4YONoet1FHJx1sBmuLK/gIt
	IZlEaT8x24Fl0FhhSJ+4Z/SZETImyzEzEWa3KrGf5mwAO7HFNDRseJvuyj1a2nIBSGq7
	pjmU/xUCvhvqgzzdUDWhWjrgUpGa7Qz4ikaENOd/lcL0fN2qGt9st5DcPTiovLImBUKp
	4XND9cF5g9digDwqj34n83ljR4sIznSaVOnTNpS46Teos8sSDpXqRZ2cM9tPuSnsvGY/
	V4Z24K36LKQojrcXnJq7PjMAFIxFHB2ih8GmQXP+Ca2yUIU10EwX9OI/fHo4lSrVFaCN
	Z1Vg==
X-Gm-Message-State: AG10YOQAqZdAcuE649Yat6V+CrQJGDDngHhZmfmYfS4nW16EDVNQwgHNougn18SjPznzow==
X-Received: by 10.98.13.68 with SMTP id v65mr39892601pfi.150.1455010363954;
	Tue, 09 Feb 2016 01:32:43 -0800 (PST)
Received: from RD3 ([59.99.236.185]) by smtp.gmail.com with ESMTPSA id
	ya4sm49130845pab.22.2016.02.09.01.32.41
	for <meta-ti@yoctoproject.org>
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 09 Feb 2016 01:32:43 -0800 (PST)
Message-ID: <CC4ED3804AE84052A41A430A5FBCB3D1@RD3>
From: <winiston@futuraautomation.com>
To: "yocto texas" <meta-ti@yoctoproject.org>
Date: Tue, 9 Feb 2016 15:06:44 +0530
MIME-Version: 1.0
X-Priority: 1
X-MSMail-Priority: High
Importance: High
X-Mailer: Microsoft Windows Live Mail 15.4.3555.308
X-MimeOLE: Produced By Microsoft MimeOLE V15.4.3555.308
Subject: Problem to build core-image-sato
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
X-List-Received-Date: Tue, 09 Feb 2016 09:32:48 -0000
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_005B_01D1634B.7D673D70"

------=_NextPart_000_005B_01D1634B.7D673D70
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear,

Now I am using yocto  in our project. I am satisfied with yocto build =
system (poky) .=20

Our system configuration :

Host system  : Ubuntu 14.04  (Virtual Machine )
Target system :  am437x-evm

The following errors are spiting out while creating core-image-sato.

winiston@winiston-VirtualBox:~/poky/build$ bitbake =
core-image-satoLoading cache: 100% =
|###########################################| ETA:  00:00:00
Loaded 1497 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies
ERROR: Nothing RPROVIDES 'xf86-input-tslib' (but =
/home/winiston/poky/meta/recipes-graphics/packagegroups/packagegroup-core=
-x11-xserver.bb RDEPENDS on or otherwise requires it)
NOTE: Runtime target 'xf86-input-tslib' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['xf86-input-tslib']
NOTE: Runtime target 'packagegroup-core-x11-xserver' is unbuildable, =
removing...
Missing or unbuildable dependency chain was: =
['packagegroup-core-x11-xserver', 'xf86-input-tslib']
NOTE: Runtime target 'packagegroup-core-x11-base' is unbuildable, =
removing...
Missing or unbuildable dependency chain was: =
['packagegroup-core-x11-base', 'packagegroup-core-x11-xserver', =
'xf86-input-tslib']
ERROR: Required build target 'core-image-sato' has no buildable =
providers.
Missing or unbuildable dependency chain was: ['core-image-sato', =
'packagegroup-core-x11-base', 'packagegroup-core-x11-xserver', =
'xf86-input-tslib']

Summary: There were 2 ERROR messages shown, returning a non-zero exit =
code.

What could be the reason? How do I solve this issues?=20

second clarification is ,

Can I use =E2=80=9CNavit=E2=80=9D software in the core-image-sato image? =
If yes, What is the procedure?

Note: =E2=80=9CNavit=E2=80=9D is the open source navigation software =
build for arm/x86 based project.

Regards,
Winiston.P
Futura Automation Pvt Ltd.

Ph :91-80-28375290 / 28375295
Fax :91-80-28375291

------=_NextPart_000_005B_01D1634B.7D673D70
Content-Type: text/html;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<HTML><HEAD></HEAD>
<BODY dir=3Dltr>
<DIV dir=3Dltr>
<DIV style=3D"FONT-SIZE: 12pt; FONT-FAMILY: 'Calibri'; COLOR: #000000">
<DIV>Dear,</DIV>
<DIV>&nbsp;</DIV>
<DIV>Now I am using yocto&nbsp; in our project. I am satisfied with =
yocto build=20
system (poky) . </DIV>
<DIV>&nbsp;</DIV>
<DIV>Our system configuration :</DIV>
<DIV>&nbsp;</DIV>
<DIV>Host system&nbsp; : Ubuntu 14.04&nbsp; (Virtual Machine )</DIV>
<DIV>Target system :&nbsp; am437x-evm</DIV>
<DIV>&nbsp;</DIV>
<DIV>The following errors are spiting out while creating =
core-image-sato.</DIV>
<DIV>&nbsp;</DIV>
<DIV>winiston@winiston-VirtualBox:~/poky/build$ bitbake =
core-image-satoLoading=20
cache: 100% |###########################################| ETA:&nbsp;=20
00:00:00</DIV>
<DIV>Loaded 1497 entries from dependency cache.</DIV>
<DIV>NOTE: Resolving any missing task queue dependencies</DIV>
<DIV>ERROR: Nothing RPROVIDES 'xf86-input-tslib' (but=20
/home/winiston/poky/meta/recipes-graphics/packagegroups/packagegroup-core=
-x11-xserver.bb=20
RDEPENDS on or otherwise requires it)</DIV>
<DIV>NOTE: Runtime target 'xf86-input-tslib' is unbuildable, =
removing...</DIV>
<DIV>Missing or unbuildable dependency chain was: =
['xf86-input-tslib']</DIV>
<DIV>NOTE: Runtime target 'packagegroup-core-x11-xserver' is =
unbuildable,=20
removing...</DIV>
<DIV>Missing or unbuildable dependency chain was:=20
['packagegroup-core-x11-xserver', 'xf86-input-tslib']</DIV>
<DIV>NOTE: Runtime target 'packagegroup-core-x11-base' is unbuildable,=20
removing...</DIV>
<DIV>Missing or unbuildable dependency chain was: =
['packagegroup-core-x11-base',=20
'packagegroup-core-x11-xserver', 'xf86-input-tslib']</DIV>
<DIV>ERROR: Required build target 'core-image-sato' has no buildable=20
providers.</DIV>
<DIV>Missing or unbuildable dependency chain was: ['core-image-sato',=20
'packagegroup-core-x11-base', 'packagegroup-core-x11-xserver',=20
'xf86-input-tslib']</DIV>
<DIV>&nbsp;</DIV>
<DIV>Summary: There were 2 ERROR messages shown, returning a non-zero =
exit=20
code.</DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT color=3D#0000ff>What could be the reason? How do I solve this =
issues?=20
</FONT></DIV>
<DIV><FONT color=3D#0000ff></FONT>&nbsp;</DIV>
<DIV><FONT color=3D#0000ff>second clarification is ,</FONT></DIV>
<DIV><FONT color=3D#0000ff></FONT>&nbsp;</DIV>
<DIV><FONT color=3D#0000ff>Can I use =E2=80=9CNavit=E2=80=9D software in =
the core-image-sato=20
image? If yes, What is the procedure?</FONT></DIV>
<DIV><FONT color=3D#0000ff></FONT>&nbsp;</DIV>
<DIV><FONT color=3D#0000ff>Note: =E2=80=9CNavit=E2=80=9D is the open =
source navigation software=20
build for arm/x86 based project.</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV=20
style=3D"FONT-SIZE: 12pt; FONT-FAMILY: 'Calibri'; COLOR: =
#000000">Regards,<BR>Winiston.P<BR>Futura=20
Automation Pvt Ltd.<BR><BR>Ph :91-80-28375290 / 28375295<BR>Fax=20
:91-80-28375291<BR></DIV></DIV></DIV></BODY></HTML>

------=_NextPart_000_005B_01D1634B.7D673D70--
