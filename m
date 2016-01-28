Return-Path: <winiston@futuraautomation.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7FC61E00928; Wed, 27 Jan 2016 22:17:26 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HTML_MESSAGE,RCVD_IN_DNSWL_LOW,WEIRD_PORT autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [209.85.220.53 listed in list.dnswl.org]
	*  0.0 WEIRD_PORT URI: Uses non-standard port number for HTTP
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-pa0-f53.google.com (mail-pa0-f53.google.com
	[209.85.220.53])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 481D4E008EE
	for <meta-ti@yoctoproject.org>; Wed, 27 Jan 2016 22:17:22 -0800 (PST)
Received: by mail-pa0-f53.google.com with SMTP id cy9so17833009pac.0
	for <meta-ti@yoctoproject.org>; Wed, 27 Jan 2016 22:17:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=futuraautomation-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:from:to:cc:references:in-reply-to:subject:date
	:mime-version:content-type:importance;
	bh=GHxT8wIiMH08QwMwECcrP6s6wgEN0f9Bm4gJf2Zhteo=;
	b=NHjhCPKwQA6j1RxYsI1Se+el0srBU7iSnullyMlmo97ovxiqR08yNlWPBR0HKLv28h
	cgc4e/ruLr4wVJvzePQieSbkORvZGTSU9jo9YqydL+5Hq00ylE71OcpudZzzmkYwyhgb
	oNWNDJgC2ih2lMVvQW+FE66CrsDVOwzdA2RR8hKH1NzEE2zpGxsIDINQLi8PQnueCzb8
	6V3Zudh+WvS2Ug+PVpfZoOWIlkHAtJHul4SCr4q8BSbv+aHRORjnkglnMzGdz4E9rjn/
	B+5hJddOSjH2rHGWzwROkB43jFlEqv8zYA3Ln1dExY1b0pjU5i/YYVH2pX0TBTYKa1UL
	EEzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:from:to:cc:references:in-reply-to
	:subject:date:mime-version:content-type:importance;
	bh=GHxT8wIiMH08QwMwECcrP6s6wgEN0f9Bm4gJf2Zhteo=;
	b=IMEXBYmLWkFicg0ThxPQFUdbJgpMCex5MqXR8E0iBfukClbdd6yvgVB4ztv5rxSd95
	ADPO91ZNUvfpQMgliL0NFUndJPZKQpA+HMNybpyvKH7Qq0BN/1P7Tl3M58W+qm7MFPw8
	0Cs0577EE2n2dGaJ7HpahQdpz45dRFFv7yBf0u2d1uKSkNEs8qOnQOKniX07Z8/nA8bO
	gQDp9OaxfxuUuN3C4uk2YiGRLknAPscxYuSm3/PWHN5PZfb9MLtYiS+v2/kxwZtTPc7X
	1kdsnrhEDheZsG8D660llAmPATuUnw0i7Jt6Dj0ptuC6E83PgMDvzBnNJlKSm9R2RpH/
	wvlQ==
X-Gm-Message-State: AG10YOQVmz6sqtUIiTkwKSJIuvHgrl8Wz44SJNX6rJKsE64F7/JHbn05wp7A9kSAWxvVKQ==
X-Received: by 10.66.197.131 with SMTP id iu3mr2029587pac.57.1453961842408;
	Wed, 27 Jan 2016 22:17:22 -0800 (PST)
Received: from RD3 ([59.99.236.185]) by smtp.gmail.com with ESMTPSA id
	f12sm13186477pat.20.2016.01.27.22.17.19
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 27 Jan 2016 22:17:21 -0800 (PST)
Message-ID: <28AA3DBF5F3343948A98AC47A80A2AA7@RD3>
From: <winiston@futuraautomation.com>
To: "Khem Raj" <raj.khem@gmail.com>
References: <7A144FD2E22B42C29D1455BA473BACE1@RD3>
	<CAMKF1spT+uLPxQJvRFjjTxtXN4crg34a4cQw=Q8TJ9iYLLZHCg@mail.gmail.com>
In-Reply-To: <CAMKF1spT+uLPxQJvRFjjTxtXN4crg34a4cQw=Q8TJ9iYLLZHCg@mail.gmail.com>
Date: Thu, 28 Jan 2016 11:51:35 +0530
MIME-Version: 1.0
X-Priority: 1
X-MSMail-Priority: High
Importance: High
X-Mailer: Microsoft Windows Live Mail 15.4.3555.308
X-MimeOLE: Produced By Microsoft MimeOLE V15.4.3555.308
Cc: yocto texas <meta-ti@yoctoproject.org>
Subject: Re: Build Error for AM437x-evm
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
X-List-Received-Date: Thu, 28 Jan 2016 06:17:26 -0000
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0092_01D159C2.3D1D6880"

------=_NextPart_000_0092_01D159C2.3D1D6880
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Dear,

I have cloned recent  meta-ti package. Now it started building the image =
and it spits out the following error.

winiston@winiston-VirtualBox:~/poky/build$ bitbake core-image-minimal
Loading cache: 100% |#########################| ETA:  00:00:00
Loaded 1497 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION        =3D "1.28.0"
BUILD_SYS         =3D "i686-linux"
NATIVELSBSTRING   =3D "Ubuntu-14.04"
TARGET_SYS        =3D "arm-poky-linux-gnueabi"
MACHINE           =3D "am437x-evm"
DISTRO            =3D "poky"
DISTRO_VERSION    =3D "2.0.1"
TUNE_FEATURES     =3D "arm armv7a vfp thumb neon callconvention-hard =
cortexa9"
TARGET_FPU        =3D "vfp-neon"
meta             =20
meta-yocto        =3D "jethro:b9ad87b18fd7a664b8d5e385ffb09496c679036c"
meta-ti           =3D "master:963c35fc490a733a533c0c30471f9974eed451d6"

NOTE: Preparing RunQueue
NOTE: Executing SetScene Tasks
NOTE: Executing RunQueue Tasks
ERROR: oe_runmake failed
ERROR: Function failed: do_compile (log file is located at =
/home/winiston/poky/build/tmp/work/am437x_evm-poky-linux-gnueabi/u-boot-t=
i-staging/2015.07+gitAUTOINC+2b4b6fb691-r16/temp/log.do_compile.18321)
ERROR: Logfile of failure stored in: =
/home/winiston/poky/build/tmp/work/am437x_evm-poky-linux-gnueabi/u-boot-t=
i-staging/2015.07+gitAUTOINC+2b4b6fb691-r16/temp/log.do_compile.18321
Log data follows:
Huge log data resides here.... at the end of log data, it is showing the =
error as follows,

| make[1]: *** [drivers/usb/host/xhci-omap.o] Error 1
| make: *** [drivers/usb/host] Error 2
| WARNING: exit code 1 from a shell command.
| ERROR: oe_runmake failed
| ERROR: Function failed: do_compile (log file is located at =
/home/winiston/poky/build/tmp/work/am437x_evm-poky-linux-gnueabi/u-boot-t=
i-staging/2015.07+gitAUTOINC+2b4b6fb691-r16/temp/log.do_compile.18321)
ERROR: Task 73 =
(/home/winiston/meta-ti/recipes-bsp/u-boot/u-boot-ti-staging_2015.07.bb, =
do_compile) failed with exit code '1'
NOTE: Tasks Summary: Attempted 1910 tasks of which 1909 didn't need to =
be rerun and 1 failed.
No currently running tasks (1909 of 2045)

Summary: 1 task failed:
  =
/home/winiston/meta-ti/recipes-bsp/u-boot/u-boot-ti-staging_2015.07.bb, =
do_compile
Summary: There were 2 ERROR messages shown, returning a non-zero exit =
code.
winiston@winiston-VirtualBox:~/poky/build$=20

What could be the problem? Please provide the solution

Thanks in advance...

Regards,
Winiston.P
Futura Automation Pvt Ltd.

Ph :91-80-28375290 / 28375295
Fax :91-80-28375291


From: Khem Raj=20
Sent: Monday, January 25, 2016 11:09 PM
To: winiston@futuraautomation.com=20
Cc: yocto texas=20
Subject: Re: [meta-ti] Build Error for AM437x-evm

Always post your build configuration that bit bake spits out at the very =
beginning of build

On Jan 25, 2016 1:28 AM, <winiston@futuraautomation.com> wrote:

  Dear ,

  I built default yocto image for qemux86 processor using poky. I used =
the bitbake core-image-minimal command to build the image. It has been =
built successfully.=20
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


  --
  _______________________________________________
  meta-ti mailing list
  meta-ti@yoctoproject.org
  https://lists.yoctoproject.org/listinfo/meta-ti


------=_NextPart_000_0092_01D159C2.3D1D6880
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<HTML><HEAD></HEAD>
<BODY dir=3Dltr>
<DIV dir=3Dltr>
<DIV style=3D"FONT-SIZE: 12pt; FONT-FAMILY: 'Calibri'; COLOR: #000000">
<DIV>Dear,</DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT color=3D#0000ff>I have cloned recent&nbsp; meta-ti package. =
Now it=20
started building the image and it spits out the following =
error.</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV>winiston@winiston-VirtualBox:~/poky/build$ bitbake =
core-image-minimal</DIV>
<DIV>Loading cache: 100% |#########################| ETA:&nbsp; =
00:00:00</DIV>
<DIV>Loaded 1497 entries from dependency cache.</DIV>
<DIV>NOTE: Resolving any missing task queue dependencies</DIV>
<DIV>&nbsp;</DIV>
<DIV>Build Configuration:</DIV>
<DIV>BB_VERSION&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D =
"1.28.0"</DIV>
<DIV>BUILD_SYS&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D=20
"i686-linux"</DIV>
<DIV>NATIVELSBSTRING&nbsp;&nbsp; =3D "Ubuntu-14.04"</DIV>
<DIV>TARGET_SYS&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D=20
"arm-poky-linux-gnueabi"</DIV>
<DIV>MACHINE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
=3D=20
"am437x-evm"</DIV>
<DIV>DISTRO&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; =3D=20
"poky"</DIV>
<DIV>DISTRO_VERSION&nbsp;&nbsp;&nbsp; =3D "2.0.1"</DIV>
<DIV>TUNE_FEATURES&nbsp;&nbsp;&nbsp;&nbsp; =3D "arm armv7a vfp thumb =
neon=20
callconvention-hard cortexa9"</DIV>
<DIV>TARGET_FPU&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D =
"vfp-neon"</DIV>
<DIV>meta&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;=20
</DIV>
<DIV>meta-yocto&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D=20
"jethro:b9ad87b18fd7a664b8d5e385ffb09496c679036c"</DIV>
<DIV>meta-ti&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
=3D=20
"master:963c35fc490a733a533c0c30471f9974eed451d6"</DIV>
<DIV>&nbsp;</DIV>
<DIV>NOTE: Preparing RunQueue</DIV>
<DIV>NOTE: Executing SetScene Tasks</DIV>
<DIV>NOTE: Executing RunQueue Tasks</DIV>
<DIV><FONT color=3D#0000ff>ERROR:</FONT> oe_runmake failed</DIV>
<DIV><FONT color=3D#0000ff>ERROR:</FONT> Function failed: do_compile =
(log file is=20
located at=20
/home/winiston/poky/build/tmp/work/am437x_evm-poky-linux-gnueabi/u-boot-t=
i-staging/2015.07+gitAUTOINC+2b4b6fb691-r16/temp/log.do_compile.18321)</D=
IV>
<DIV><FONT color=3D#0000ff>ERROR:</FONT> Logfile of failure stored in:=20
/home/winiston/poky/build/tmp/work/am437x_evm-poky-linux-gnueabi/u-boot-t=
i-staging/2015.07+gitAUTOINC+2b4b6fb691-r16/temp/log.do_compile.18321</DI=
V>
<DIV>Log data follows:</DIV>
<DIV><FONT color=3D#0000ff>Huge log data resides here.... at the end of =
log data,=20
it is showing the error as follows,</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV>| make[1]: *** [drivers/usb/host/xhci-omap.o] Error 1</DIV>
<DIV>| make: *** [drivers/usb/host] Error 2</DIV>
<DIV>| WARNING: exit code 1 from a shell command.</DIV>
<DIV>| ERROR: oe_runmake failed</DIV>
<DIV>| ERROR: Function failed: do_compile (log file is located at=20
/home/winiston/poky/build/tmp/work/am437x_evm-poky-linux-gnueabi/u-boot-t=
i-staging/2015.07+gitAUTOINC+2b4b6fb691-r16/temp/log.do_compile.18321)</D=
IV>
<DIV>ERROR: Task 73=20
(/home/winiston/meta-ti/recipes-bsp/u-boot/u-boot-ti-staging_2015.07.bb, =

do_compile) failed with exit code '1'</DIV>
<DIV>NOTE: Tasks Summary: Attempted 1910 tasks of which 1909 didn't need =
to be=20
rerun and 1 failed.</DIV>
<DIV>No currently running tasks (1909 of 2045)</DIV>
<DIV>&nbsp;</DIV>
<DIV>Summary: 1 task failed:</DIV>
<DIV>&nbsp;=20
/home/winiston/meta-ti/recipes-bsp/u-boot/u-boot-ti-staging_2015.07.bb,=20
do_compile</DIV>
<DIV>Summary: There were 2 ERROR messages shown, returning a non-zero =
exit=20
code.</DIV>
<DIV>winiston@winiston-VirtualBox:~/poky/build$ </DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT color=3D#0000ff>What could be the problem? Please provide the =

solution</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV>Thanks in advance...</DIV>
<DIV>&nbsp;</DIV>
<DIV=20
style=3D"FONT-SIZE: 12pt; FONT-FAMILY: 'Calibri'; COLOR: =
#000000">Regards,<BR>Winiston.P<BR>Futura=20
Automation Pvt Ltd.<BR><BR>Ph :91-80-28375290 / 28375295<BR>Fax=20
:91-80-28375291<BR></DIV>
<DIV=20
style=3D'FONT-SIZE: small; TEXT-DECORATION: none; FONT-FAMILY: =
"Calibri"; FONT-WEIGHT: normal; COLOR: #000000; FONT-STYLE: normal; =
DISPLAY: inline'>
<DIV style=3D"FONT: 10pt tahoma">
<DIV>&nbsp;</DIV>
<DIV style=3D"BACKGROUND: #f5f5f5">
<DIV style=3D"font-color: black"><B>From:</B> <A =
title=3Draj.khem@gmail.com=20
href=3D"mailto:raj.khem@gmail.com">Khem Raj</A> </DIV>
<DIV><B>Sent:</B> Monday, January 25, 2016 11:09 PM</DIV>
<DIV><B>To:</B> <A title=3Dwiniston@futuraautomation.com=20
href=3D"mailto:winiston@futuraautomation.com">winiston@futuraautomation.c=
om</A>=20
</DIV>
<DIV><B>Cc:</B> <A title=3Dmeta-ti@yoctoproject.org=20
href=3D"mailto:meta-ti@yoctoproject.org">yocto texas</A> </DIV>
<DIV><B>Subject:</B> Re: [meta-ti] Build Error for =
AM437x-evm</DIV></DIV></DIV>
<DIV>&nbsp;</DIV></DIV>
<DIV=20
style=3D'FONT-SIZE: small; TEXT-DECORATION: none; FONT-FAMILY: =
"Calibri"; FONT-WEIGHT: normal; COLOR: #000000; FONT-STYLE: normal; =
DISPLAY: inline'>
<P dir=3Dltr>Always post your build configuration that bit bake spits =
out at the=20
very beginning of build</P>
<DIV class=3Dgmail_quote>On Jan 25, 2016 1:28 AM, &lt;<A=20
href=3D"mailto:winiston@futuraautomation.com">winiston@futuraautomation.c=
om</A>&gt;=20
wrote:<BR type=3D"attribution">
<BLOCKQUOTE class=3Dgmail_quote=20
style=3D"PADDING-LEFT: 1ex; MARGIN: 0px 0px 0px 0.8ex; BORDER-LEFT: #ccc =
1px solid">
  <DIV dir=3Dltr>
  <DIV dir=3Dltr>
  <DIV style=3D"FONT-SIZE: 12pt; FONT-FAMILY: 'Calibri'; COLOR: =
#000000">
  <DIV>Dear ,</DIV>
  <DIV>&nbsp;</DIV>
  <DIV><FONT face=3D"Times New Roman">I built default yocto image for =
qemux86=20
  processor using poky. I used the <FONT color=3D#0000ff>bitbake=20
  core-image-minimal</FONT> command to build the image. It has been =
built=20
  successfully. </FONT></DIV>
  <DIV><FONT face=3D"Times New Roman">Now I made the following changes =
to build=20
  for AM437x evm.</FONT></DIV>
  <DIV><FONT face=3D"Times New Roman"></FONT>&nbsp;</DIV>
  <DIV><FONT face=3D"Times New Roman">1. Edited&nbsp;&nbsp; <FONT=20
  color=3D#0000ff>~/poky/build/conf/bblayers.conf</FONT>&nbsp;&nbsp; =
file as=20
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
  command from terminal window. It gives the following =
error</FONT></DIV>
  <DIV><FONT face=3D"Times New Roman"></FONT>&nbsp;</DIV>
  <DIV><STRONG><FONT color=3D#0000ff>ERROR: ParseError at=20
  /home/winiston/poky/meta-ti/recipes-graphics/drm/<A=20
  href=3D"http://libdrm_2.4.41.bb:1" =
target=3D_blank>libdrm_2.4.41.bb:1</A>: Could=20
  not include required file=20
recipes-graphics/drm/libdrm.inc</FONT></STRONG></DIV>
  <DIV><STRONG><FONT color=3D#0000ff></FONT></STRONG>&nbsp;</DIV>
  <DIV><STRONG><FONT color=3D#0000ff>Summary: There was 1 ERROR message =
shown,=20
  returning a non-zero exit code.</FONT></STRONG></DIV>
  <DIV><STRONG><FONT color=3D#0000ff><A=20
  href=3D"mailto:winiston@winiston-VirtualBox:~/poky/build$"=20
  =
target=3D_blank>winiston@winiston-VirtualBox:~/poky/build$</A></FONT></ST=
RONG>=20
  </DIV>
  <DIV>&nbsp;</DIV>
  <DIV><FONT color=3D#ff0000>What could be the reason of this error? How =
do I=20
  solve this error?</FONT></DIV>
  <DIV>&nbsp;</DIV>
  <DIV=20
  style=3D"FONT-SIZE: 12pt; FONT-FAMILY: 'Calibri'; COLOR: =
#000000">Regards,<BR>Winiston.P<BR>Futura=20
  Automation Pvt Ltd.<BR><BR>Ph :91-80-28375290 / 28375295<BR>Fax=20
  =
:91-80-28375291<BR></DIV></DIV></DIV></DIV><BR>--<BR>____________________=
___________________________<BR>meta-ti=20
  mailing list<BR><A=20
  =
href=3D"mailto:meta-ti@yoctoproject.org">meta-ti@yoctoproject.org</A><BR>=
<A=20
  href=3D"https://lists.yoctoproject.org/listinfo/meta-ti" =
rel=3Dnoreferrer=20
  =
target=3D_blank>https://lists.yoctoproject.org/listinfo/meta-ti</A><BR><B=
R></BLOCKQUOTE></DIV></DIV></DIV></DIV></BODY></HTML>

------=_NextPart_000_0092_01D159C2.3D1D6880--
