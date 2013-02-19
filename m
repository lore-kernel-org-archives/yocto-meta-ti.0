Return-Path: <exosyst@gmail.com>
Received: from mail-gg0-f181.google.com (mail-gg0-f181.google.com
	[209.85.161.181]) (using TLSv1 with cipher RC4-SHA (128/128 bits))
	(No client certificate requested)
	by yocto-www.yoctoproject.org (Postfix) with ESMTPS id 8EBD0E006F5
	for <meta-ti@yoctoproject.org>; Tue, 19 Feb 2013 07:05:13 -0800 (PST)
Received: by mail-gg0-f181.google.com with SMTP id e5so796100ggh.40
	for <meta-ti@yoctoproject.org>; Tue, 19 Feb 2013 07:05:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:mime-version:sender:from:date:x-google-sender-auth
	:message-id:subject:to:content-type;
	bh=/GtO1zFbb5eWr+SexokFJ3EP44HLqtX6UWyqKNtp5XQ=;
	b=EM5B8k5rskJ0bys89GhjjtCdBWXTYuyl2uCjnBT0ceLLtguYhY17Ba3VIxMGTR2VCP
	Tdgcy3WdvqaSb4lHl/bAHguW+32BnOMMrcZk+IKBb2Rpvm7HiK02FYKzBLIGHb3dVTVu
	oO1OIOnVPVZ4E9eVEGLwzvNRKXpx48FN4tJqbD1+kQsGcNM/fLjgT4UWUeUu8Ds3tmuh
	Rz7bXMGKs6NhItpXJMOegVtC+nsM8ABItHVOc59KDhrzQ89OBwzzQROgx1YhgmXmQpvx
	oAhyb7XYNqBw6Fn9lVCLQGIixQ/SnNREzj+HpZxibS20G6699f+p+8LQ9I+mSv6iZYMu
	ViOg==
X-Received: by 10.101.138.33 with SMTP id q33mr8678789ann.9.1361286312414;
	Tue, 19 Feb 2013 07:05:12 -0800 (PST)
MIME-Version: 1.0
Sender: exosyst@gmail.com
Received: by 10.101.187.2 with HTTP; Tue, 19 Feb 2013 07:04:52 -0800 (PST)
From: Nick G <exosyst+metaTI@gmail.com>
Date: Tue, 19 Feb 2013 15:04:52 +0000
X-Google-Sender-Auth: tUyUy2NeXqjUzXjjZqt3MzlM_kQ
Message-ID: <CAN-pQASFihdOs3W9L1i-t3niFNUWZv9t_iqyGdj0sRsRMMGAsw@mail.gmail.com>
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: U-Boot misconfiguration
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
X-List-Received-Date: Tue, 19 Feb 2013 15:05:13 -0000
Content-Type: multipart/alternative; boundary=0016e68ee34816ced004d6152b6c

--0016e68ee34816ced004d6152b6c
Content-Type: text/plain; charset=ISO-8859-1

Hey guys,

I mentioned this in IRC yesterday but thought it was worth making it better
known including the workaround.

Checking out the danny branch for both poky and meta-ti and setting the
MACHINE to beaglebone fails to build a suitable version of uboot when
performing a bitbake -k core-image-minimal

The error output is:
make: *** No rule to make target `am335x_evm_config'.  Stop.
make: *** [am335x_evm_config] Error 1

If you navigate to the build directory you can see that it tries to build
u-boot-v2011.06 which I understand has no support for the am335x. The
earliest supported build being 2011.09.

To get around this you can add:
PREFERRED_VERSION_u-boot = "2011.09+git"

to your local.conf.

Is there an official bugtracker to file against this and a better way to
add the fix/workaround to the danny layer?

Regards,
Nick

--0016e68ee34816ced004d6152b6c
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div><div><div><div>Hey guys,<br><br>I mentioned=
 this in IRC yesterday but thought it was worth making it better known incl=
uding the workaround.<br><br></div>Checking out the danny branch for both p=
oky and meta-ti and setting the MACHINE to beaglebone fails to build a suit=
able version of uboot when performing a bitbake -k core-image-minimal<br>

<br>The error output is:<br>make: *** No rule to make target `am335x_evm_co=
nfig&#39;.=A0 Stop.<br>make: *** [am335x_evm_config] Error 1<br><br></div>I=
f you navigate to the build directory you can see that it tries to build=A0=
 u-boot-v2011.06 which I understand has no support for the am335x. The earl=
iest supported build being 2011.09.<br>

<br></div>To get around this you can add:<br>PREFERRED_VERSION_u-boot =3D &=
quot;2011.09+git&quot;<br><br></div>to your local.conf.<br><br></div>Is the=
re an official bugtracker to file against this and a better way to add the =
fix/workaround to the danny layer?<br>

<br></div>Regards,<br>Nick<br></div>

--0016e68ee34816ced004d6152b6c--
