Return-Path: <winiston@futuraautomation.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 699B7E00C5B; Thu, 11 Feb 2016 22:56:29 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HTML_MESSAGE,RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [209.85.220.41 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-pa0-f41.google.com (mail-pa0-f41.google.com
	[209.85.220.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C0EA7E00C55
	for <meta-ti@yoctoproject.org>; Thu, 11 Feb 2016 22:56:26 -0800 (PST)
Received: by mail-pa0-f41.google.com with SMTP id fl4so30309297pad.0
	for <meta-ti@yoctoproject.org>; Thu, 11 Feb 2016 22:56:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=futuraautomation-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:from:to:subject:date:mime-version:content-type
	:importance:disposition-notification-to;
	bh=pZMKEWLux9N1vkUXurGEK4wNUVtPfCdpAwIfwih9zrs=;
	b=h0Q5h0kbeDrKogYfA/p4/v32A71QaIGExLiMg5hbGFmvazp7AErLrxo3B2LO0g0OpU
	m+PAQgExsHNpnatIGkqNC086mOUmG/nAZ/hRO4SHjO3rbAtSHCxD5/uO28dTHvesb+zj
	BFbnWUQ9ntrTDHnAUU1XBt83KA9GlaYL2A+UB0DMbIcXJ/Rks4v7BMeJxZHc+uQrThWH
	2FPSaOchzZiiRVtl4l4VgLTI4Cw1JTq9crRbvA2wC/Gl8YPoU2R51cGrqVGOAFgglxOL
	e2WDPJjGcbkJPle4Mr8/TApYK2d9bkakAENb6smEN6QeAZe3h02Vvv5q2SvXqN4a6Eex
	7R4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:from:to:subject:date:mime-version
	:content-type:importance:disposition-notification-to;
	bh=pZMKEWLux9N1vkUXurGEK4wNUVtPfCdpAwIfwih9zrs=;
	b=bVm42xViKTHwJm5yjr69QukY5kET/NU+43pIybXqLvngJLP3LgNDK0Dzzq53877mNN
	ANyP+hdvmZSVGIjSMYeJbxBHagiX3ZiKkH7KJnneVLx6NEpxzS8XNlXqaKgCiqid1bAM
	kB4FnYRVsfwU8b8mIx9sfjtVUGh1UpfblqofLlof+X1j9MpGKNVUGOrMhaMVFxVbonF4
	cSyJR3yS50ji5ywIx+g8O/g1N02gTWB64xk0TWaXdYU7OsYr19StQiGWU7k/ggudoYxx
	ErXDR747bmCYq9FvQPGqHwU1JtikfB+4pzh8zS4D/RO9WOQcztzIDqqPTRjacvw45VG2
	Ks1w==
X-Gm-Message-State: AG10YORzc4QGl0qXDrzy9QwHWB5ay1aOJbuoLce7T9AwHdrGRkSks6KI46+nc8DCEmxkWw==
X-Received: by 10.66.242.17 with SMTP id wm17mr72140886pac.155.1455260186668; 
	Thu, 11 Feb 2016 22:56:26 -0800 (PST)
Received: from RD3 ([59.99.236.185]) by smtp.gmail.com with ESMTPSA id
	y15sm16706279pfi.16.2016.02.11.22.56.23
	for <meta-ti@yoctoproject.org>
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 11 Feb 2016 22:56:25 -0800 (PST)
Message-ID: <1B502FD981DC415FB61D0EBCF9D523C0@RD3>
From: <winiston@futuraautomation.com>
To: "yocto texas" <meta-ti@yoctoproject.org>
Date: Fri, 12 Feb 2016 12:30:24 +0530
MIME-Version: 1.0
X-Priority: 1
X-MSMail-Priority: High
Importance: High
X-Mailer: Microsoft Windows Live Mail 15.4.3555.308
X-MimeOLE: Produced By Microsoft MimeOLE V15.4.3555.308
Subject: USB mouse is not working in AM437x-evm
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
X-List-Received-Date: Fri, 12 Feb 2016 06:56:29 -0000
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0011_01D16591.255A4030"

------=_NextPart_000_0011_01D16591.255A4030
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Dear,

Thanks for your great support. I got the following error when creating =
the qt4e-demo-image.

* winiston@futuraautomation.com <winiston@futuraautomation.com> [160128=20
10:00]:
> -Wstrict-prototypes -Wno-format-security -fno-builtin -ffreestanding  =
-Os
> -fno-stack-protector -fno-delete-null-pointer-checks -g -fstack-usage
> -Wno-format-nonliteral -Werror=3Ddate-time -D__ARM__ =
-Wa,-mimplicit-it=3Dalways
> -mthumb -mthumb-interwork -mabi=3Daapcs-linux -mword-relocations
> -mno-unaligned-access -ffunction-sections -fdata-sections -fno-common
> -ffixed-r9 -msoft-float -pipe -march=3Darmv7-a    =
-D"KBUILD_STR(s)=3D#s"
> -D"KBUILD_BASENAME=3DKBUILD_STR(xhci_omap)"
> -D"KBUILD_MODNAME=3DKBUILD_STR(xhci_omap)" -c -o=20
> drivers/usb/host/xhci-omap.o
> drivers/usb/host/xhci-omap.c
> | drivers/usb/host/xhci-omap.c:34:5: error: 'board_usb_init' aliased =
to
> external symbol '__board_usb_init'
> |  int board_usb_init(int index, enum usb_init_type init)


I have solved this issue from the below patch of issue. please go =
through the below web link.

http://lists.denx.de/pipermail/u-boot/2015-October/229099.html

After the above change, qt4e-demo-image is successfully created. Now usb =
mouse is not working in the qt4e-demo-image. =20
How do I solve this problem?
I wanted to add X11 feature also. How do I add X11  feature to my image?

Note: Host system : Ubuntu 14.04
           Target system : AM437x-evm

Thanks in advance...

Regards,
Winiston.P
Futura Automation Pvt Ltd.

Ph :91-80-28375290 / 28375295
Fax :91-80-28375291

------=_NextPart_000_0011_01D16591.255A4030
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<HTML><HEAD></HEAD>
<BODY dir=3Dltr>
<DIV dir=3Dltr>
<DIV style=3D"FONT-SIZE: 12pt; FONT-FAMILY: 'Calibri'; COLOR: #000000">
<DIV>Dear,</DIV>
<DIV>&nbsp;</DIV>
<DIV>Thanks for your great support. I got the following error when =
creating the=20
qt4e-demo-image.</DIV>
<DIV>&nbsp;</DIV>
<DIV>* winiston@futuraautomation.com =
&lt;winiston@futuraautomation.com&gt;=20
[160128 </DIV>
<DIV>10:00]:</DIV>
<DIV>&gt; -Wstrict-prototypes -Wno-format-security -fno-builtin=20
-ffreestanding&nbsp; -Os</DIV>
<DIV>&gt; -fno-stack-protector -fno-delete-null-pointer-checks -g=20
-fstack-usage</DIV>
<DIV>&gt; -Wno-format-nonliteral -Werror=3Ddate-time -D__ARM__=20
-Wa,-mimplicit-it=3Dalways</DIV>
<DIV>&gt; -mthumb -mthumb-interwork -mabi=3Daapcs-linux =
-mword-relocations</DIV>
<DIV>&gt; -mno-unaligned-access -ffunction-sections -fdata-sections=20
-fno-common</DIV>
<DIV>&gt; -ffixed-r9 -msoft-float -pipe =
-march=3Darmv7-a&nbsp;&nbsp;&nbsp;=20
-D"KBUILD_STR(s)=3D#s"</DIV>
<DIV>&gt; -D"KBUILD_BASENAME=3DKBUILD_STR(xhci_omap)"</DIV>
<DIV>&gt; -D"KBUILD_MODNAME=3DKBUILD_STR(xhci_omap)" -c -o </DIV>
<DIV>&gt; drivers/usb/host/xhci-omap.o</DIV>
<DIV>&gt; drivers/usb/host/xhci-omap.c</DIV>
<DIV>&gt; | drivers/usb/host/xhci-omap.c:34:5: error: 'board_usb_init' =
aliased=20
to</DIV>
<DIV>&gt; external symbol '__board_usb_init'</DIV>
<DIV>&gt; |&nbsp; int board_usb_init(int index, enum usb_init_type =
init)</DIV>
<DIV><FONT style=3D"size: +0"></FONT>&nbsp;</DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT color=3D#0000ff>I have solved this issue from the below patch =
of issue.=20
please go through the below web link.</FONT></DIV>
<DIV><FONT style=3D"size: +0"></FONT><FONT =
color=3D#0000ff></FONT>&nbsp;</DIV>
<DIV><FONT=20
color=3D#0000ff>http://lists.denx.de/pipermail/u-boot/2015-October/229099=
.html</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT color=3D#0000ff>After the above change, qt4e-demo-image is =
successfully=20
created. Now usb mouse is not working in the qt4e-demo-image.&nbsp;=20
</FONT></DIV>
<DIV><FONT color=3D#0000ff>How do I solve this problem?</FONT></DIV>
<DIV><FONT color=3D#0000ff>I wanted to add X11 feature also. How do I =
add=20
X11&nbsp; feature to my image?</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT color=3D#ff0000>Note: Host system : Ubuntu 14.04</FONT></DIV>
<DIV><FONT=20
color=3D#ff0000>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;=20
Target system : AM437x-evm</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV>Thanks in advance...</DIV>
<DIV>&nbsp;</DIV>
<DIV=20
style=3D"FONT-SIZE: 12pt; FONT-FAMILY: 'Calibri'; COLOR: =
#000000">Regards,<BR>Winiston.P<BR>Futura=20
Automation Pvt Ltd.<BR><BR>Ph :91-80-28375290 / 28375295<BR>Fax=20
:91-80-28375291<BR></DIV></DIV></DIV></BODY></HTML>

------=_NextPart_000_0011_01D16591.255A4030--
