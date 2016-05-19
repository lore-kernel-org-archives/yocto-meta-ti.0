Return-Path: <kamaji@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E25C4E00D9B; Thu, 19 May 2016 16:41:24 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_LOW, URI_HEX autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (kamaji[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.213.67 listed in list.dnswl.org]
	*  1.1 URI_HEX URI: URI hostname has long hexadecimal sequence
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-vk0-f67.google.com (mail-vk0-f67.google.com
	[209.85.213.67])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B5728E0094C
	for <meta-ti@yoctoproject.org>; Thu, 19 May 2016 16:41:20 -0700 (PDT)
Received: by mail-vk0-f67.google.com with SMTP id y2so6132156vka.0
	for <meta-ti@yoctoproject.org>; Thu, 19 May 2016 16:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to;
	bh=8jNNKvCtjeyd5HazZ0G0Ft2WIl1fHFi/k15MU0eSgv4=;
	b=eV0LiuJdNGo7ImXlFQDmEXjYIdm9410rgWyyVB9wK5jfZCejzAb7RPxKTLNQpEGqS+
	1PcQIX4mDhzZyoHnXi2A5CCScGRZYNkVfHuZ+p7Z4zuP+RwKOF9ZDEs5HnPL/0KeU/qu
	a58CcS3Gwtu3fLnVaf+ISqZkGMOzDcbyll+nqeo0+1NOBAMO25UDfSL7d4L6nfO6e/2t
	x1mApFO2Qq5lrwD72l+OL/xyzJnrAfgoLk525/JEbelqGItPGklUWWt/vRZXCCLFmJeH
	xH754l+gBn0ZU8uK2dDS9117VUWXJhgSsffHMVi66By8TiWdt247cN8FdibGqzYPwhyp
	r6Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=8jNNKvCtjeyd5HazZ0G0Ft2WIl1fHFi/k15MU0eSgv4=;
	b=amIoi3XyAvqO4zgkcEASDhZYoqo+1RI9G8uJH+NyyPy8vRjmy6qPZ00V+j1v4plkfp
	XAIkVQWO1fh5CizuDHKFHRJ1G3dV8MGE1RJJiggtrR621JbQbcbyNtMTgA0In1I+cHa3
	9/jfNnurHmkmNFWntQZacbUGtn9rud5HXhD137vaYA1irMGZWs5AiHzJPg/clJEyn7XK
	m8skxM7fLLjogy6dC8YGnadzGRkioOMZjxmWvwiQGJmBufxfaAhnT5d0Wp1IKCwyQlHm
	ZpK/moHDs8wQaD2Os4M24XgVKddIutTaBK1wEjcvBI6HHpeb8chCp19EkvN7bAN1FElJ
	8iMQ==
X-Gm-Message-State: AOPr4FVupTFc5f53UMkq/1xTnHFCx/lCVYNcB5w/w5Gg5Vx3eD7HopBl24qPATDmJRwztvfjWVDkY55dNGNieA==
X-Received: by 10.176.5.201 with SMTP id e67mr9489uae.81.1463701279530; Thu,
	19 May 2016 16:41:19 -0700 (PDT)
MIME-Version: 1.0
From: Keith Kyzivat <kamaji@gmail.com>
Date: Thu, 19 May 2016 23:41:10 +0000
Message-ID: <CAH5ySac1VscW4vszpXbj4zw5vDZhCovVyxtnLKn59k=8JjVp5Q@mail.gmail.com>
To: meta-ti@yoctoproject.org
Subject: Rename of omap5-sgx-ddk-um-linux to ti-sgx-ddk-um not complete?
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
X-List-Received-Date: Thu, 19 May 2016 23:41:25 -0000
Content-Type: multipart/alternative; boundary=94eb2c123970d2e81105333a82ba

--94eb2c123970d2e81105333a82ba
Content-Type: text/plain; charset=UTF-8

Hi folks,

I've been trying to get a beagleboard krogoth build working with working
OpenGLES2 DRI drivers in place, and have been failing.

I did find out that drivers changed name from libgles-omap3 to
ti-sgx-ddk-um - but specifying ti-sgx-ddk-um as my
PREFERRED_PROVIDER_virtual/libgles2 fails hard --
 -- Nothing RPROVIDES 'ti-sgx-ddk-um'

Digging through commits, I found commit c70102c671 -
renaming omap5-sgx-ddk-um-linux to ti-sgx-ddk-um.

The problem seems to be that these are renamed, but the package names have
not changed -- recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb
includes:

PROVIDES += "virtual/egl virtual/libgles1 virtual/libgles2
omap5-sgx-ddk-um-linux"

Shouldn't this be the following?
PROVIDES += "virtual/egl virtual/libgles1 virtual/libgles2 ti-sgx-ddk-um"

And also RPROVIDES, RREPLACES, RCONFLICTS and associated -dev, -dbg
packages?

Apologies if I'm asking this wrong - I'm pretty new to Yocto/OE and still
figuring it all out.

~Keith Kyzivat

--94eb2c123970d2e81105333a82ba
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi folks,<div><br></div><div>I&#39;ve been trying to get a=
 beagleboard krogoth build working with working OpenGLES2 DRI drivers in pl=
ace, and have been failing.</div><div><br></div><div>I did find out that dr=
ivers changed name from libgles-omap3 to ti-sgx-ddk-um - but specifying=C2=
=A0ti-sgx-ddk-um as my PREFERRED_PROVIDER_virtual/libgles2 fails hard --</d=
iv><div>=C2=A0-- Nothing RPROVIDES &#39;ti-sgx-ddk-um&#39;</div><div><br></=
div><div>Digging through commits, I found commit c70102c671 - renaming=C2=
=A0omap5-sgx-ddk-um-linux to=C2=A0ti-sgx-ddk-um.</div><div><br></div><div>T=
he problem seems to be that these are renamed, but the package names have n=
ot changed --=C2=A0recipes-graphics/libgles/<a href=3D"http://ti-sgx-ddk-um=
_1.14.3699939.bb">ti-sgx-ddk-um_1.14.3699939.bb</a> includes:</div><div><br=
></div><div>PROVIDES +=3D &quot;virtual/egl virtual/libgles1 virtual/libgle=
s2 omap5-sgx-ddk-um-linux&quot;<br></div><div><br></div><div>Shouldn&#39;t =
this be the following?</div><div>PROVIDES +=3D &quot;virtual/egl virtual/li=
bgles1 virtual/libgles2 ti-sgx-ddk-um&quot;</div><div><br></div><div>And al=
so=C2=A0RPROVIDES, RREPLACES, RCONFLICTS and associated -dev, -dbg packages=
?</div><div><br></div><div>Apologies if I&#39;m asking this wrong - I&#39;m=
 pretty new to Yocto/OE and still figuring it all out.</div><div><br></div>=
<div>~Keith Kyzivat</div></div>

--94eb2c123970d2e81105333a82ba--
