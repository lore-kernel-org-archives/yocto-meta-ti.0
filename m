Return-Path: <skmaillist@gmail.com>
Received: from mail-oa0-f44.google.com (mail-oa0-f44.google.com
	[209.85.219.44])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 25CA7E017BB
	for <meta-ti@yoctoproject.org>; Thu, 31 Oct 2013 00:02:08 -0700 (PDT)
Received: by mail-oa0-f44.google.com with SMTP id l20so2659526oag.17
	for <meta-ti@yoctoproject.org>; Thu, 31 Oct 2013 00:02:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=/9z8imyyVbr1zrvI7s/x6pmcDUZWpm+0lVovanujiZI=;
	b=capU9eCV3dgV7KRhZzXXhlqS4vB4u8soHWVqfVIsyRlcbgso2iqQAAL03cGjYsv/UY
	Rn9zMLMZqYMLEa6YPyj+vW17a/cADBVEg+bfqRMD678qDIKGBRLD8ghUqcaxZhO/Vp/H
	BWA0PH9ti1udF5FUDCA5mWgX5N0BhHkQMe1b9Lt1PdBavxytWH4e4z5BVMNXKWcLq+D1
	mEJxxidTe/pTNZxQmheJ6N97ZIp4AVJHoY5LfgRrfeFPsBGkKTuT8AkWozUEtPTrNra9
	LYqC9iOSc/KEa6BOO4Buf1l3By2oUN/ceIwIJnpN3CUDrxBdZrf4kQK/HuF+iueSXdbC
	gFDQ==
MIME-Version: 1.0
X-Received: by 10.60.70.134 with SMTP id m6mr1473013oeu.14.1383202927928; Thu,
	31 Oct 2013 00:02:07 -0700 (PDT)
Received: by 10.76.114.52 with HTTP; Thu, 31 Oct 2013 00:02:07 -0700 (PDT)
Date: Thu, 31 Oct 2013 15:02:07 +0800
Message-ID: <CAEhSjjtXtwx_Tbi6=_S38h1V5OAvPvShAWA6ehgdUN0htPcFjA@mail.gmail.com>
From: Kai <skmaillist@gmail.com>
To: meta-ti@yoctoproject.org
Subject: Compile kernel with 4.8 toolchain
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
X-List-Received-Date: Thu, 31 Oct 2013 07:02:11 -0000
Content-Type: multipart/alternative; boundary=001a1133458e2beae204ea040794

--001a1133458e2beae204ea040794
Content-Type: text/plain; charset=ISO-8859-1

Hi,

I am trying to compile linux-ti-glsdk kenel with Linaro 4.8 cross compile
toolchain, but it cannot boot on OMAP5432 EVM board, no any log from serial
port, 4.7 version toolchain is OK. Who has been succeeded with building
glsdk kernel with 4.8 Linaro toolchain?

Thanks,
Kai

--001a1133458e2beae204ea040794
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>I am trying to compile linux-ti-gls=
dk kenel with Linaro 4.8 cross compile toolchain, but it cannot boot on OMA=
P5432 EVM board, no any log from serial port, 4.7 version toolchain is OK. =
Who has been succeeded with building glsdk kernel with 4.8 Linaro toolchain=
?</div>
<div><br></div><div>Thanks,</div><div>Kai</div></div>

--001a1133458e2beae204ea040794--
