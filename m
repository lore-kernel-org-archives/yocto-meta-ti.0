Return-Path: <munoz0raul@gmail.com>
Received: from mail-ia0-f177.google.com (mail-ia0-f177.google.com
	[209.85.210.177])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 54B3BE006C2
	for <meta-ti@yoctoproject.org>; Tue,  8 Jan 2013 17:38:31 -0800 (PST)
Received: by mail-ia0-f177.google.com with SMTP id h8so376492iaa.8
	for <meta-ti@yoctoproject.org>; Tue, 08 Jan 2013 17:38:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=9Ez8HCxiV8vMZFFgPqPASIaosIyiPHrVATiPI3bHkyw=;
	b=FNuYsWMgcDRGlpYNs/tcr051huoBzYT8M92D1T6ftC1eU9a10WClZfejpkSfxdolVr
	KT/5ApgZNRkoIeTVeZ9YdFG5t2BVRcKZbhdLG2B6BpWD3lw3N23Zf5XPZp/fCK853SYI
	+7PIpzmB3p184MJHmJlx3qxHYtA+zUZROJgM9n6PKwaWBtQaSLBAZ4Ys+k3GTqoj+pSE
	PTatgiqHgGwqSsAiKtzRiJt3u+0WUw/S8rxbg103/Bo1garUcWJKKHk56vYoawFOZuC/
	BEAPc2C6Wy2JbjPnvIs56+9vl0F3XNNNb+ErHlav5/9TviSiKT/NGoWL+jTT4MRt/RCd
	+Jvw==
MIME-Version: 1.0
Received: by 10.42.130.74 with SMTP id u10mr33279098ics.9.1357695510930; Tue,
	08 Jan 2013 17:38:30 -0800 (PST)
Received: by 10.64.147.40 with HTTP; Tue, 8 Jan 2013 17:38:30 -0800 (PST)
Date: Tue, 8 Jan 2013 23:38:30 -0200
Message-ID: <CANmVirii6vJvYyAR-a6wOHjFwoSnpqk5vSipnkXQSU6rZPVmKA@mail.gmail.com>
From: Raul Rosetto Munoz <munoz0raul@gmail.com>
To: meta-ti@yoctoproject.org
Subject: Creating simple linux for beaglebone
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
X-List-Received-Date: Wed, 09 Jan 2013 01:38:31 -0000
Content-Type: multipart/alternative; boundary=90e6ba6e8362a463a804d2d11edf

--90e6ba6e8362a463a804d2d11edf
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello all,

I want to create a simples linux for beaglebone using yocto danny.

I did all the necessary clones:
poky
meta-ti
meta-openembedded

I changed all to danny branch!

After these sets I did the poky source:
source poky/oe-init-build-env beaglebone-linux

Changed the machine to beaglebone

MACHINE ?=3D "beaglebone"

Changed the bblayer to:

BBLAYERS ?=3D " \
  /home/prjs/video0001/linux/poky/meta \
  /home/prjs/video0001/linux/poky/meta-yocto \
  /home/prjs/video0001/linux/poky/meta-yocto-bsp \
  /home/prjs/video0001/linux/meta-ti \
  /home/prjs/video0001/linux/meta-openembedded/meta-oe  \
  "


And finaly when I run bibake core-image-minimal



munoz@munoz:/home/prjs/video0001/linux/linux-bone$ bitbake
core-image-minimal
Loading cache: 100%
|##########################################################################=
########################|
ETA:  00:00:00
Loaded 4 entries from dependency cache.
ERROR: ParseError at
/home/prjs/video0001/linux/meta-ti/recipes-misc/payload/bonescript.bb:5:
Could not inherit file classes/systemd.bbclass
ERROR: This recipe does not have the LICENSE field set (cloud9-gnome-image)
ERROR: Command execution failed: Exited with 1

Summary: There were 3 ERROR messages shown, returning a non-zero exit code.

Some one can Help me??

Thanks for all help

--=20
*Raul Rosetto Mu=F1oz*

--90e6ba6e8362a463a804d2d11edf
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello all,<br></div><div><br></div><div>I want to cre=
ate a simples linux for beaglebone using yocto danny.</div><div><br></div><=
div>I did all the necessary clones:</div><div>poky</div><div>meta-ti</div>
<div>meta-openembedded</div><div><br></div><div>I changed all to danny bran=
ch!</div><div><br></div><div>After these sets I did the poky source:</div><=
div>source poky/oe-init-build-env beaglebone-linux</div><div><br></div>
<div>Changed the machine to beaglebone</div><div><br></div><div><font face=
=3D"courier new, monospace">MACHINE ?=3D &quot;beaglebone&quot;</font></div=
><div><br></div><div>Changed the bblayer to:</div><div><br></div><div><font=
 face=3D"courier new, monospace">BBLAYERS ?=3D &quot; \</font></div>
<div><font face=3D"courier new, monospace">=A0 /home/prjs/video0001/linux/p=
oky/meta \</font></div><div><font face=3D"courier new, monospace">=A0 /home=
/prjs/video0001/linux/poky/meta-yocto \</font></div><div><font face=3D"cour=
ier new, monospace">=A0 /home/prjs/video0001/linux/poky/meta-yocto-bsp \</f=
ont></div>
<div><font face=3D"courier new, monospace">=A0 /home/prjs/video0001/linux/m=
eta-ti \</font></div><div><font face=3D"courier new, monospace">=A0 /home/p=
rjs/video0001/linux/meta-openembedded/meta-oe =A0\</font></div><div><font f=
ace=3D"courier new, monospace">=A0 &quot;</font></div>
<div><br></div><div><br></div><div>And finaly when I run bibake core-image-=
minimal</div><div><br></div><div><br></div><div><br></div><div><font face=
=3D"courier new, monospace">munoz@munoz:/home/prjs/video0001/linux/linux-bo=
ne$ bitbake core-image-minimal</font></div>
<div><font face=3D"courier new, monospace">Loading cache: 100% |###########=
###########################################################################=
############| ETA: =A000:00:00</font></div><div><font face=3D"courier new, =
monospace">Loaded 4 entries from dependency cache.</font></div>
<div><font face=3D"courier new, monospace">ERROR: ParseError at /home/prjs/=
video0001/linux/meta-ti/recipes-misc/payload/<a href=3D"http://bonescript.b=
b:5">bonescript.bb:5</a>: Could not inherit file classes/systemd.bbclass</f=
ont></div>
<div><font face=3D"courier new, monospace">ERROR: This recipe does not have=
 the LICENSE field set (cloud9-gnome-image)</font></div><div><font face=3D"=
courier new, monospace">ERROR: Command execution failed: Exited with 1</fon=
t></div>
<div><font face=3D"courier new, monospace"><br></font></div><div><font face=
=3D"courier new, monospace">Summary: There were 3 ERROR messages shown, ret=
urning a non-zero exit code.</font></div><div><br></div><div>Some one can H=
elp me??</div>
<div><br></div><div>Thanks for all help</div><div><br></div>-- <br><b>Raul =
Rosetto Mu=F1oz</b>
</div>

--90e6ba6e8362a463a804d2d11edf--
