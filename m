Return-Path: <kbaker@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 85B3EE00DE2; Mon, 31 Aug 2015 13:00:22 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (kbaker[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.223.169 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-io0-f169.google.com (mail-io0-f169.google.com
	[209.85.223.169])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 91590E00CF6
	for <meta-ti@yoctoproject.org>; Mon, 31 Aug 2015 13:00:18 -0700 (PDT)
Received: by iods203 with SMTP id s203so171268165iod.0
	for <meta-ti@yoctoproject.org>; Mon, 31 Aug 2015 13:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to:content-type;
	bh=zTUdFBBa3/zJP/oA9YcFYyCCB0+Hg01rIhi6kZbwYZ8=;
	b=nq47SFTTWYDOV3pVBYlmoyxVPy9nVeLcKsTUaVoFfJLYYT/sqDPTIrd+s5BS9ux5yO
	AXVltbOdtI11XHof8LKqI58oX9NtJQ+srPjMeUTg8XPUuxqllZNn00pC3YOJ8C9HEb2D
	mV3Oe6IjhMtMkclV0xmw7KtGUdBTEbN/iVOUy1C87ete63MhONZZgQXvHBfzH6x3V4bK
	ZKOcg0ZYlXDFi1czRfB1chav2C+ckS+Vc4F5QD1Y1V3Lh88XxuJ0x2b4x4Af+Um8NQhi
	bb8lWefOcOuLOueQlzSytEr/PUM3+ZX+fV51RY8VAi5pLWGsiah9dzn0+JU6pHrDuefB
	eHFA==
X-Received: by 10.107.9.24 with SMTP id j24mr24867082ioi.26.1441051218094;
	Mon, 31 Aug 2015 13:00:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.64.173.195 with HTTP; Mon, 31 Aug 2015 12:59:58 -0700 (PDT)
From: Kevin Baker <kbaker@gmail.com>
Message-ID: <CA+NaiT_=wXG=bT6VEsJgib7OHkSHvA40M2Jsc9GAgeK7Tm0Zkw@mail.gmail.com>
To: meta-ti@yoctoproject.org
X-Mailman-Approved-At: Fri, 23 Dec 2016 15:51:53 -0800
Subject: SUPPORT_XORG in powervr-drivers omap3-sgx-modules?
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
Date: Mon, 31 Aug 2015 20:00:22 -0000
X-Original-Date: Mon, 31 Aug 2015 14:59:58 -0500
X-List-Received-Date: Mon, 31 Aug 2015 20:00:22 -0000
Content-Type: multipart/alternative; boundary=001a113f9836f53339051ea0e1cf

--001a113f9836f53339051ea0e1cf
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

--001a113f9836f53339051ea0e1cf
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>Hi,<br><br></div>I noticed the Xorg drivers were=
n&#39;t building with <a href=3D"http://omap3-sgx-modules_5.01.01.02.bb">om=
ap3-sgx-modules_5.01.01.02.bb</a>. I tried adding the flag SUPPORT_XORG =3D=
 1 in a bbappend, but get a compile error when building.<br><br></div><div>=
Is there another way that the drivers are supposed to be built? Or is the S=
UPPORT_XORG flag not supported?<br><br>We are using an am335x with sgx530, =
kernel 3.14.<br><br></div><div>Thanks,<br></div><div>Kevin<br></div></div>

--001a113f9836f53339051ea0e1cf--
