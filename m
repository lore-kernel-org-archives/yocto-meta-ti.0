Return-Path: <munoz0raul@gmail.com>
Received: from mail-ie0-f172.google.com (mail-ie0-f172.google.com
	[209.85.223.172])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 526DBE006C2;
	Wed, 16 Jan 2013 16:57:46 -0800 (PST)
Received: by mail-ie0-f172.google.com with SMTP id c13so3882912ieb.31
	for <multiple recipients>; Wed, 16 Jan 2013 16:57:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:date:message-id:subject:from:to
	:content-type; bh=uHvUHRao9IjKHRx3t8CxvYsOTAVcPCHaIp7wcwuphLU=;
	b=LxgQrpVfNInm6e3lEXHh61C/VZ5xbmcO7sTr5ZHslgRP3h+q17SiptzYbJrRd7rFt0
	OWwUvVnASEjt8V1stsxlngoEwe96IjrVYYf6BRwT5p5jg47HGnM+i+CFAJX//Z/S6Eiv
	ds1R/p/llQURnMxtpIGmjDBt9vigQ6Xbm7OfUlrhg4cY0PYvi39Ht7uydSLMwjZ9BHRk
	PPzB9E2UVaBWMJbd63Ma17QROe1BRgVljJo/ccJLuRy1BrxXnMCgfYnaQ0IpzvK/is2U
	UIzQF86m9/0NO606HlW4KQbWIydR8i+uyctoCX4WPTelpQ/TcoComB/zdWGoEWlrEYns
	B7Vw==
MIME-Version: 1.0
X-Received: by 10.50.237.5 with SMTP id uy5mr2402722igc.12.1358384265632; Wed,
	16 Jan 2013 16:57:45 -0800 (PST)
Received: by 10.64.147.40 with HTTP; Wed, 16 Jan 2013 16:57:45 -0800 (PST)
Date: Wed, 16 Jan 2013 22:57:45 -0200
Message-ID: <CANmVirhH1y_FJW5hx6KXMdEvAbx8Jm9UVJB6mZLhFxV3t900VA@mail.gmail.com>
From: Raul Rosetto Munoz <munoz0raul@gmail.com>
To: "yocto@yoctoproject.org" <yocto@yoctoproject.org>, 
	"meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: core-image-sato for beagleboard problem
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
X-List-Received-Date: Thu, 17 Jan 2013 00:57:46 -0000
Content-Type: multipart/alternative; boundary=f46d044787fb9f1a8104d3717bfe

--f46d044787fb9f1a8104d3717bfe
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello all,

I created a simple core-image-minimal for beagleboard using meta-ti, poky
and meta-oe in danny version.

For the core-image-minimal all work fine but for the core-image-sato I get
this error:

arm-poky-linux-gnueabi-libtool: link: `gtktreeview.lo' is not a valid
libtool object
make[4]: *** [libgtk-x11-2.0.la] Error 1
make[4]: Leaving directory
`/home/prjs/video0001/linux-beagle/linux-beagleboard/tmp/work/armv7a-vfp-ne=
on-poky-linux-gnueabi/gtk+-2.24.8-r7/gtk+-2.24.8/gtk'
make[3]: *** [all-recursive] Error 1
make[3]: Leaving directory
`/home/prjs/video0001/linux-beagle/linux-beagleboard/tmp/work/armv7a-vfp-ne=
on-poky-linux-gnueabi/gtk+-2.24.8-r7/gtk+-2.24.8/gtk'
make[2]: *** [all] Error 2
make[2]: Leaving directory
`/home/prjs/video0001/linux-beagle/linux-beagleboard/tmp/work/armv7a-vfp-ne=
on-poky-linux-gnueabi/gtk+-2.24.8-r7/gtk+-2.24.8/gtk'
make[1]: *** [all-recursive] Error 1
make[1]: Leaving directory
`/home/prjs/video0001/linux-beagle/linux-beagleboard/tmp/work/armv7a-vfp-ne=
on-poky-linux-gnueabi/gtk+-2.24.8-r7/gtk+-2.24.8'
make: *** [all] Error 2
ERROR: oe_runmake failed
ERROR: Function failed: do_compile (see
/home/prjs/video0001/linux-beagle/linux-beagleboard/tmp/work/armv7a-vfp-neo=
n-poky-linux-gnueabi/gtk+-2.24.8-r7/temp/log.do_compile.17652
for further information)


Some one can Help me?

Thanks

--=20
*Raul Rosetto Mu=F1oz*

--f46d044787fb9f1a8104d3717bfe
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello all,<div><br></div><div>I created a simple core-imag=
e-minimal for beagleboard using meta-ti, poky and meta-oe in danny version.=
</div><div><br></div><div>For the core-image-minimal all work fine but for =
the core-image-sato I get this error:</div>
<div><br></div><div><div><font face=3D"courier new, monospace">arm-poky-lin=
ux-gnueabi-libtool: link: `gtktreeview.lo&#39; is not a valid libtool objec=
t</font></div><div><font face=3D"courier new, monospace">make[4]: *** [<a h=
ref=3D"http://libgtk-x11-2.0.la">libgtk-x11-2.0.la</a>] Error 1</font></div=
>
<div><font face=3D"courier new, monospace">make[4]: Leaving directory `/hom=
e/prjs/video0001/linux-beagle/linux-beagleboard/tmp/work/armv7a-vfp-neon-po=
ky-linux-gnueabi/gtk+-2.24.8-r7/gtk+-2.24.8/gtk&#39;</font></div><div><font=
 face=3D"courier new, monospace">make[3]: *** [all-recursive] Error 1</font=
></div>
<div><font face=3D"courier new, monospace">make[3]: Leaving directory `/hom=
e/prjs/video0001/linux-beagle/linux-beagleboard/tmp/work/armv7a-vfp-neon-po=
ky-linux-gnueabi/gtk+-2.24.8-r7/gtk+-2.24.8/gtk&#39;</font></div><div><font=
 face=3D"courier new, monospace">make[2]: *** [all] Error 2</font></div>
<div><font face=3D"courier new, monospace">make[2]: Leaving directory `/hom=
e/prjs/video0001/linux-beagle/linux-beagleboard/tmp/work/armv7a-vfp-neon-po=
ky-linux-gnueabi/gtk+-2.24.8-r7/gtk+-2.24.8/gtk&#39;</font></div><div><font=
 face=3D"courier new, monospace">make[1]: *** [all-recursive] Error 1</font=
></div>
<div><font face=3D"courier new, monospace">make[1]: Leaving directory `/hom=
e/prjs/video0001/linux-beagle/linux-beagleboard/tmp/work/armv7a-vfp-neon-po=
ky-linux-gnueabi/gtk+-2.24.8-r7/gtk+-2.24.8&#39;</font></div><div><font fac=
e=3D"courier new, monospace">make: *** [all] Error 2</font></div>
<div><font face=3D"courier new, monospace">ERROR: oe_runmake failed</font><=
/div><div><font face=3D"courier new, monospace">ERROR: Function failed: do_=
compile (see /home/prjs/video0001/linux-beagle/linux-beagleboard/tmp/work/a=
rmv7a-vfp-neon-poky-linux-gnueabi/gtk+-2.24.8-r7/temp/log.do_compile.17652 =
for further information)</font></div>
<div><br></div><div><br></div><div style>Some one can Help me?</div><div st=
yle><br></div><div style>Thanks</div><div><br></div>-- <br><b>Raul Rosetto =
Mu=F1oz</b>
</div></div>

--f46d044787fb9f1a8104d3717bfe--
