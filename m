Return-Path: <bmentink@gmail.com>
Received: from mail-ie0-f179.google.com (mail-ie0-f179.google.com
	[209.85.223.179])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EA22CE016E3
	for <meta-ti@yoctoproject.org>; Mon,  4 Nov 2013 13:44:09 -0800 (PST)
Received: by mail-ie0-f179.google.com with SMTP id aq17so13052219iec.24
	for <meta-ti@yoctoproject.org>; Mon, 04 Nov 2013 13:44:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=FLgwrHXVtASWgqbNGKv7XmJyGGha8jgVAtatPJ0W/o8=;
	b=UP9HR+Usa5k4Ur0RgCN5Fi0PgszoqKr8thJzgqNvZnd73KY8iEkLLMjGOQk2uG0PtY
	nShKmBcdAGdsElW4iFeUZmv6Encp8tlwdcnKsh85l7RHX8ugusVtklgp/kHx+DyPrgBi
	dxSsctj1u9k14x3XEy15QGLgR47HtmqkILAux1qgmxsxCgdKcGmgegXkwDkX2ZKkl66F
	//Z3IS9IFYzw2FsCsKBY55k+NZfyrNNXehkyBX3vm96O4u4XnXX4oEkaxD4JJmmcf4bZ
	M5Hx5QdYL9E+n9Y2e+5mw3aDXQplBlq1q/qj0Sbm8Lc5pGxqAhGq4fNtO9N9YPLcVVqQ
	Dx9w==
MIME-Version: 1.0
X-Received: by 10.42.250.148 with SMTP id mo20mr4871967icb.34.1383601449116;
	Mon, 04 Nov 2013 13:44:09 -0800 (PST)
Received: by 10.43.83.9 with HTTP; Mon, 4 Nov 2013 13:44:09 -0800 (PST)
Date: Tue, 5 Nov 2013 10:44:09 +1300
Message-ID: <CALEed8YYeF-rT6PYb_Js+Ex=QZxHh=FJbuOYUgDTkuCDAmz-vw@mail.gmail.com>
From: Bernard Mentink <bmentink@gmail.com>
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Kernel load issue
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
X-List-Received-Date: Mon, 04 Nov 2013 21:44:12 -0000
Content-Type: multipart/alternative; boundary=20cf300e4e51e2abf404ea60d0d3

--20cf300e4e51e2abf404ea60d0d3
Content-Type: text/plain; charset=ISO-8859-1

Hi Guys,

I am having trouble loading some kernel CAN modules so that they go in my
image.

I have the following lines in my layers .conf file:

MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "kernel-module-can-dev"
MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "kernel-module-c_can"
MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "kernel-module-c_can_platform"
MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "kernel-module-can"
MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "kernel-module-can-raw"
MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "kernel-module-mcp2515"

all the modules end up in the rootfs except c_can and c_can_platform.
All modules are built as modules.

They end up in the deploy/images/modules* tarball, but not in the rootfs ..

Hopefully someone can suggest a solution.

Cheers,
Bernie

--20cf300e4e51e2abf404ea60d0d3
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><span style=3D"font-family:arial,sans-serif;font-size:13px=
">Hi Guys,</span><div style=3D"font-family:arial,sans-serif;font-size:13px"=
><br></div><div style=3D"font-family:arial,sans-serif;font-size:13px">I am =
having trouble loading some kernel CAN modules so that they go in my image.=
</div>
<div style=3D"font-family:arial,sans-serif;font-size:13px"><br></div><div s=
tyle=3D"font-family:arial,sans-serif;font-size:13px">I have the following l=
ines in my layers .conf file:</div><div style=3D"font-family:arial,sans-ser=
if;font-size:13px">
<br></div><div style=3D"font-family:arial,sans-serif;font-size:13px"><div>M=
ACHINE_ESSENTIAL_EXTRA_RRECOMMENDS +=3D &quot;kernel-module-can-dev&quot;</=
div><div>MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS +=3D &quot;kernel-module-c_can=
&quot;</div>
<div>MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS +=3D &quot;kernel-module-c_can_pla=
tform&quot;</div><div>MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS +=3D &quot;kernel=
-module-can&quot;</div><div>MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS +=3D &quot;=
kernel-module-can-raw&quot;</div>
<div>MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS +=3D &quot;kernel-module-mcp2515&q=
uot;</div></div><div style=3D"font-family:arial,sans-serif;font-size:13px">=
<br></div><div style=3D"font-family:arial,sans-serif;font-size:13px">all th=
e modules end up in the rootfs except c_can and c_can_platform.</div>
<div style=3D"font-family:arial,sans-serif;font-size:13px">All modules are =
built as modules.</div><div style=3D"font-family:arial,sans-serif;font-size=
:13px"><br></div><div style=3D"font-family:arial,sans-serif;font-size:13px"=
>They end up in the deploy/images/modules* tarball, but not in the rootfs .=
.</div>
<div style=3D"font-family:arial,sans-serif;font-size:13px"><br></div><div s=
tyle=3D"font-family:arial,sans-serif;font-size:13px">Hopefully someone can =
suggest a solution.</div><div style=3D"font-family:arial,sans-serif;font-si=
ze:13px">
<br></div><div style=3D"font-family:arial,sans-serif;font-size:13px">Cheers=
,</div><div style=3D"font-family:arial,sans-serif;font-size:13px">Bernie</d=
iv></div>

--20cf300e4e51e2abf404ea60d0d3--
