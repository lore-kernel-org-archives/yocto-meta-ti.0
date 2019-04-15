Return-Path: <pahansson73@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0554CE00C46; Mon, 15 Apr 2019 01:26:24 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE, WEIRD_PORT autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (pahansson73[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.210.44 listed in list.dnswl.org]
	*  0.0 WEIRD_PORT URI: Uses non-standard port number for HTTP
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com
	[209.85.210.44])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 26CB9E00C43
	for <meta-ti@yoctoproject.org>; Mon, 15 Apr 2019 01:26:22 -0700 (PDT)
Received: by mail-ot1-f44.google.com with SMTP id e80so13690737ote.5
	for <meta-ti@yoctoproject.org>; Mon, 15 Apr 2019 01:26:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=r30Z+ASdE3gyzbFfTB83Yj0kv9qNy19YGwxWjLLhXc4=;
	b=ec7tQvV4+qYZtSCW3Pr0VnKChIz0OwQKYr4DZjpk1HxMlPf/GFur28I9ViUx2eHi+u
	7HRqVpCV70Smwt5z8m6GS277wHPyh+T4DHzId5p1PVB596dUJ+gdhKb9FS8RF1uD4AnZ
	PaCf7kOdMlZ7Z7qEYFmo64yq0sYKc4cNnYO3jwbjHwxYL9duyyTs1kMT9RXKYuc+tSWQ
	lAQBef/jEtLYHU2sb4nwzlX3vcRw8U5Fz1UPcJnxBwBFa/F+PEixDm2VfOYeWHDLfNy/
	Hme7eVD3oM7sW3g8Vjjknnkp8CvDyCKrVZOy6S8wFPS67hOaVxWXWfk0c6G2X6BLvBKb
	QK5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=r30Z+ASdE3gyzbFfTB83Yj0kv9qNy19YGwxWjLLhXc4=;
	b=mxH+P92C40K0tc2xcnJ65itSSlHKT+IBrahX2teTX7uiTIAFIMcXyRZuAucaQqjtwV
	NjkJBnkk+tq80B1xf55EoA9wV/eAjogQC2Dvnz7Vt+tSLSMiOXmWugS/ABq7cTcfUIJN
	JHADSTVG4ERZkplCZ7TYZRuCu5+GpRU5jRI+xBdoLe1b8Z65sGxWQkf7nR9VN7Yvwxln
	5892STvbJTbYFZ4Sz8R77LPuBa0y2+7bzDFbT8nY42yZy560XT0FZduw3OsHcp/tR3Sc
	TCi0WAz+VBy61klYLh3bQAr7rz/A79FYPFcn7Omr9/w4m/TJ75Ug03XeL2Opm5G5+r5X
	h1Tg==
X-Gm-Message-State: APjAAAVU8Sbeok11D6metESnJyngo7xV1ekhP8GX6lVGmHCS2mcLIM7m
	1MKerE/a612mgfUNSYOh3tWguAy2bDiYdJnpZmzZdLmD
X-Google-Smtp-Source: APXvYqyPjm98l8rRGTjqmYay2SNmVs/AhbVJEA6MX6/iaPqa0kH+6Xgp4CVAsHk3K3QvVYA4ryht+wcBQ/DhsYRVzfw=
X-Received: by 2002:a05:6830:20cd:: with SMTP id
	z13mr46778781otq.168.1555316782203; 
	Mon, 15 Apr 2019 01:26:22 -0700 (PDT)
MIME-Version: 1.0
From: Andreas Hansson <pahansson73@gmail.com>
Date: Mon, 15 Apr 2019 11:25:44 +0200
Message-ID: <CABtUruFr4cKiujy=d+y-v-0zqXyzDeKX67QObQEzNU33VSW8yg@mail.gmail.com>
To: meta-ti@yoctoproject.org
Subject: [thud] ti-sgx-ddk-km do not build in thud
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
X-List-Received-Date: Mon, 15 Apr 2019 08:26:24 -0000
Content-Type: multipart/alternative; boundary="00000000000051071505868d68a2"

--00000000000051071505868d68a2
Content-Type: text/plain; charset="UTF-8"

Hi

when compiling the recipe ti-sgx-ddk-km with using the thud branch in
meta-ti(and poky) I get this error:

 ../config/compiler.mk:176:
******************************************************
| ../config/compiler.mk:176: Compiler target 'arm-poky-linux-gnueabi' not
recognised
| ../config/compiler.mk:176: (missing ../config/compilers/
arm-poky-linux-gnueabi.mk file)
| ../config/compiler.mk:176:
******************************************************
| ../config/compiler.mk:176: *** Compiler 'arm-poky-linux-gnueabi' not
recognised.  Stop.

If I examine the source of ti-sgx-ddk-km I can see that there are a number
of makefiles in the .../config/compilers/ directory, apparently one for
each compiler name, but none for arm-poky-linux-gnueabi.

This is the content

.../eurasia_km/eurasiacon/build/linux2/config/compilers# ls -la
total 28
drwxr-xr-x 2 1000 1000 4096 Apr 15 08:33 .
drwxr-xr-x 3 1000 1000 4096 Apr 15 08:33 ..
-rw-r--r-- 1 1000 1000  316 Apr 15 08:33 aarch64-linux-gnu.mk
-rw-r--r-- 1 1000 1000  144 Apr 15 08:33 arm-linux-gnueabihf.mk
-rw-r--r-- 1 1000 1000   59 Apr 15 08:33 i386-linux-gnu.mk
-rw-r--r-- 1 1000 1000   71 Apr 15 08:33 mips-mti-linux-gnu.mk
-rw-r--r-- 1 1000 1000 1237 Apr 15 08:33 x86_64-linux-gnu.mk


If I copy the file arm-linux-gnueabihf.mk to arm-poky-linux-gnueabi.mk
everything compiles fine.

I have tried this in meta-ti
version: 51ea3a467a688b51f2e033657c77aa55f4452ed3

Build Configuration:
BB_VERSION           = "1.40.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "beaglebone"
DISTRO               = "poky"
DISTRO_VERSION       = "2.6.2"
TUNE_FEATURES        = "arm armv7a vfp thumb neon callconvention-hard"
TARGET_FPU           = "hard"
meta-ti              = "HEAD:51ea3a467a688b51f2e033657c77aa55f4452ed3"
meta
meta-poky            = "HEAD:a192fff25b10fc29543edaef8555f3b15ef8234f"
...



BR
Andreas Hansson

--00000000000051071505868d68a2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div di=
r=3D"ltr">Hi<div><br></div><div>when compiling the recipe ti-sgx-ddk-km wit=
h using the thud branch in meta-ti(and poky) I get this error:</div><div><b=
r></div><div><div>=C2=A0../config/<a href=3D"http://compiler.mk:176">compil=
er.mk:176</a>: ******************************************************</div>=
<div>| ../config/<a href=3D"http://compiler.mk:176">compiler.mk:176</a>: Co=
mpiler target &#39;arm-poky-linux-gnueabi&#39; not recognised</div><div>| .=
./config/<a href=3D"http://compiler.mk:176">compiler.mk:176</a>: (missing .=
./config/compilers/<a href=3D"http://arm-poky-linux-gnueabi.mk">arm-poky-li=
nux-gnueabi.mk</a> file)</div><div>| ../config/<a href=3D"http://compiler.m=
k:176">compiler.mk:176</a>: ***********************************************=
*******</div><div>| ../config/<a href=3D"http://compiler.mk:176">compiler.m=
k:176</a>: *** Compiler &#39;arm-poky-linux-gnueabi&#39; not recognised.=C2=
=A0 Stop.</div></div><div><br></div><div>If I examine the source of ti-sgx-=
ddk-km I can see that there are a number of makefiles in the .../config/com=
pilers/ directory, apparently one for each compiler name, but none for arm-=
poky-linux-gnueabi.=C2=A0</div><div><br></div><div>This is the content=C2=
=A0</div><div><br></div><div><div>.../eurasia_km/eurasiacon/build/linux2/co=
nfig/compilers# ls -la</div><div>total 28</div><div>drwxr-xr-x 2 1000 1000 =
4096 Apr 15 08:33 .</div><div>drwxr-xr-x 3 1000 1000 4096 Apr 15 08:33 ..</=
div><div>-rw-r--r-- 1 1000 1000=C2=A0 316 Apr 15 08:33 <a href=3D"http://aa=
rch64-linux-gnu.mk">aarch64-linux-gnu.mk</a></div><div>-rw-r--r-- 1 1000 10=
00=C2=A0 144 Apr 15 08:33 <a href=3D"http://arm-linux-gnueabihf.mk">arm-lin=
ux-gnueabihf.mk</a></div><div>-rw-r--r-- 1 1000 1000=C2=A0 =C2=A059 Apr 15 =
08:33 <a href=3D"http://i386-linux-gnu.mk">i386-linux-gnu.mk</a></div><div>=
-rw-r--r-- 1 1000 1000=C2=A0 =C2=A071 Apr 15 08:33 <a href=3D"http://mips-m=
ti-linux-gnu.mk">mips-mti-linux-gnu.mk</a></div><div>-rw-r--r-- 1 1000 1000=
 1237 Apr 15 08:33 <a href=3D"http://x86_64-linux-gnu.mk">x86_64-linux-gnu.=
mk</a></div></div><div><br></div><div><br></div><div>If I copy the file <a =
href=3D"http://arm-linux-gnueabihf.mk">arm-linux-gnueabihf.mk</a> to <a hre=
f=3D"http://arm-poky-linux-gnueabi.mk">arm-poky-linux-gnueabi.mk</a> everyt=
hing compiles fine.=C2=A0</div><div><br></div><div>I have tried this in met=
a-ti version:=C2=A051ea3a467a688b51f2e033657c77aa55f4452ed3</div><div><br><=
/div><div><div>Build Configuration:</div><div>BB_VERSION=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;1.40.0&quot;</div><div>BUILD_SYS=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;x86_64-linux&quot;</div><div>N=
ATIVELSBSTRING=C2=A0 =C2=A0 =C2=A0 =3D &quot;universal&quot;</div><div>TARG=
ET_SYS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;arm-poky-linux-gnu=
eabi&quot;</div><div>MACHINE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =3D &quot;beaglebone&quot;</div><div>DISTRO=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;poky&quot;</div><div>DISTRO_VERSION=C2=
=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;2.6.2&quot;</div><div>TUNE_FEATURES=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =3D &quot;arm armv7a vfp thumb neon callconvention-ha=
rd&quot;</div><div>TARGET_FPU=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &=
quot;hard&quot;</div><div>meta-ti=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =3D &quot;HEAD:51ea3a467a688b51f2e033657c77aa55f4452ed3&quot;</div><=
div>meta=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0</div=
><div>meta-poky=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;HEAD:a19=
2fff25b10fc29543edaef8555f3b15ef8234f&quot;</div><div>...<br></div></div><d=
iv><br></div><div><br></div><div><br></div><div>BR</div><div>Andreas Hansso=
n</div></div></div></div></div></div>

--00000000000051071505868d68a2--
