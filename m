Return-Path: <kbaker@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C03DBE00C62; Thu, 10 Sep 2015 08:30:13 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (kbaker[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.223.180 listed in list.dnswl.org]
Received: from mail-io0-f180.google.com (mail-io0-f180.google.com
	[209.85.223.180])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4F263E00AE0
	for <meta-ti@yoctoproject.org>; Thu, 10 Sep 2015 08:30:10 -0700 (PDT)
Received: by iofb144 with SMTP id b144so65308203iof.1
	for <meta-ti@yoctoproject.org>; Thu, 10 Sep 2015 08:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to:content-type;
	bh=E9o3OwCfISlMGpy3bbD8lAJGy3aYJcG0nkNLv6+5PZ4=;
	b=VI9GYEro/Mcv/CETFJ9yVz9YkqfJTDoQaV7NupxqF5dtwlXywAjfmnRoOw/Zid2cNn
	rhKq2x/c1KtVhPmTXLqVT+iVCXbhEgAc7xggJ/1P2mqTqivrev5AeSS3WC27VSfmpxSc
	d+Q7ark8zhBX3HhuVbgia04OdP0G/hmhsR+ArE4GLXfcF+OiHc3AAys0HcMJS0RNuyIJ
	zN5jLVIuckStKtQHV2HNbjZ2X+l8cOSxL1thfiRpmyHRTeo5LyklgdnA952ziGmA617k
	Ktt0TqK34IbX8VbRjR0bEEPCO9JGLNLMl9/kkANxlDbv5KptpvizIdjDvZI9Crv8Yxks
	t8Yw==
X-Received: by 10.107.136.87 with SMTP id k84mr61063459iod.26.1441899009535;
	Thu, 10 Sep 2015 08:30:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.64.176.161 with HTTP; Thu, 10 Sep 2015 08:29:50 -0700 (PDT)
From: Kevin Baker <kbaker@gmail.com>
Message-ID: <CA+NaiT9raNghAp4Gjd2SyUXq7CVRakybeDjVKXxA1WuZ_1=PBQ@mail.gmail.com>
To: meta-ti@yoctoproject.org, denys@ti.com
X-Mailman-Approved-At: Fri, 23 Dec 2016 15:51:53 -0800
Subject: Xorg driver in powervr-drivers omap3-sgx-modules?
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
Date: Thu, 10 Sep 2015 15:30:13 -0000
X-Original-Date: Thu, 10 Sep 2015 10:29:50 -0500
X-List-Received-Date: Thu, 10 Sep 2015 15:30:13 -0000
Content-Type: multipart/alternative; boundary=001a113ec5fe43f469051f6646b1

--001a113ec5fe43f469051f6646b1
Content-Type: text/plain; charset=UTF-8

Hi,

I noticed the Xorg drivers weren't building with
omap3-sgx-modules_5.01.01.02.bb. I tried adding the flag SUPPORT_XORG = 1
in a bbappend, but get a compile error when building.

Is there another way that the drivers are supposed to be built? Or is the
SUPPORT_XORG flag not supported?

We are using an am335x with sgx530, kernel 3.14.

Thanks,
Kevin

--001a113ec5fe43f469051f6646b1
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>Hi,<br><br></div>I noticed the <span class=3D"">=
Xorg</span> drivers weren&#39;t building with <a href=3D"http://omap3-sgx-m=
odules_5.01.01.02.bb">omap3-sgx-modules_5.01.01.02.bb</a>. I tried adding t=
he flag <span class=3D"">SUPPORT_XORG</span> =3D 1 in a bbappend, but get a=
 compile error when building.<br><br></div><div>Is there another way that t=
he drivers are supposed to be built? Or is the <span class=3D"">SUPPORT_XOR=
G</span> flag not supported?<br><br>We are using an am335x with sgx530, ker=
nel 3.14.<br><br></div><div>Thanks,<br></div>Kevin</div>

--001a113ec5fe43f469051f6646b1--
