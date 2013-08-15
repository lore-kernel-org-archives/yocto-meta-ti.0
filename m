Return-Path: <b.hutchman@gmail.com>
Received: from mail-ob0-f172.google.com (mail-ob0-f172.google.com
	[209.85.214.172])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A245DE0043E
	for <meta-ti@yoctoproject.org>; Thu, 15 Aug 2013 08:52:42 -0700 (PDT)
Received: by mail-ob0-f172.google.com with SMTP id er7so1027100obc.31
	for <meta-ti@yoctoproject.org>; Thu, 15 Aug 2013 08:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:cc:content-type;
	bh=cARH0SLCPFXSRgNZop2z9h53xQBaZaWGoZ/f8H7/GL4=;
	b=Pi9Nd9Y5sPgKx3igbCrYzMu9YEmsg3CagPixYYvxVRHzDsizcFHCNaCow3gYO597AD
	spnI9UN6uIicqZOi4GGcoKA2do3MrlA3WFdm+jyqlemeT4j7yx2nvJSyWuyiPFwb+QPd
	T98qlf7pZOFsZNcccR8X/fsJFXzsEn1ZqmrJIt4U8sjhednbRZ8X4fLO5WypWgONDHDw
	Mepgn85YXy/v/sUq8EcMQn2cYuRLJgZVpI8nObz+ByiY6v72fiJha21BKGi6TrKkj92m
	hjGwT9824hd64AsWPqIsmMugqH5fB0BArw8d1TtUc3hV+NVYB/O8QoyjZFKrl+hs+JCx
	tXbA==
MIME-Version: 1.0
X-Received: by 10.182.50.137 with SMTP id c9mr26715725obo.28.1376581961911;
	Thu, 15 Aug 2013 08:52:41 -0700 (PDT)
Received: by 10.60.142.41 with HTTP; Thu, 15 Aug 2013 08:52:41 -0700 (PDT)
Date: Thu, 15 Aug 2013 11:52:41 -0400
Message-ID: <CAFZh4h_683cetV7QjyVgBcsJ9Seooy5wiE8R-fU9L+sqJanU4g@mail.gmail.com>
From: Brian Hutchinson <b.hutchman@gmail.com>
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Stumped. Can't get 2.6.37 TI kernel to boot when built with toolchain from denzil or Linaro gcc-linaro-arm-linux-gnueabihf-4.8-2013.07-1_linux/
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
X-List-Received-Date: Thu, 15 Aug 2013 15:52:47 -0000
Content-Type: multipart/alternative; boundary=089e0158b0acd8162a04e3fe7625

--089e0158b0acd8162a04e3fe7625
Content-Type: text/plain; charset=ISO-8859-1

Hi,

I have a custom TI816x board that uses a modified kernel from the TI PSP.
 Kernel is of the 2.6.37 flavor.  I'm trying to migrate to OE Core
environment and I'm having trouble with getting the kernel to work.

With the toolchain in denzil (gcc version 4.6.4 20120303), kernel will at
least boot but will die with:

Unable to handle kernel NULL pointer dereference at virtual address 00000002
pgd = c0004000
[00000002] *pgd=00000000
Internal error: Oops: 5 [#1]

Any of the more modern toolchains (poky/meta-ti master or Linaro
(gcc-linaro-arm-linux-gnueabihf-4.8-2013.07-1_linux) are used, the kernel
won't even make a peep ... nothing is displayed.

I wouldn't think the version of u-boot would matter but in case it does the
one I'm using is 2010.06 that was modified from one of the TI PSP's for our
custom board.

Anyone know what I have to do to get this kernel to build with newer
toolchains?  It builds fine with the Code Sourcery arm-2009q1-203.

Regards,

Brian

--089e0158b0acd8162a04e3fe7625
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>I have a custom TI816x board that u=
ses a modified kernel from the TI PSP. =A0Kernel is of the 2.6.37 flavor. =
=A0I&#39;m trying to migrate to OE Core environment and I&#39;m having trou=
ble with getting the kernel to work.</div>
<div><br></div><div>With the toolchain in denzil (gcc version 4.6.4 2012030=
3), kernel will at least boot but will die with:</div><div><br></div><div><=
div>Unable to handle kernel NULL pointer dereference at virtual address 000=
00002</div>
<div>pgd =3D c0004000</div><div>[00000002] *pgd=3D00000000</div><div>Intern=
al error: Oops: 5 [#1]</div></div><div><br></div><div>Any of the more moder=
n toolchains (poky/meta-ti master or Linaro (gcc-linaro-arm-linux-gnueabihf=
-4.8-2013.07-1_linux) are used, the kernel won&#39;t even make a peep ... n=
othing is displayed.</div>
<div><br></div><div>I wouldn&#39;t think the version of u-boot would matter=
 but in case it does the one I&#39;m using is 2010.06 that was modified fro=
m one of the TI PSP&#39;s for our custom board.</div><div><br></div><div>
Anyone know what I have to do to get this kernel to build with newer toolch=
ains? =A0It builds fine with the Code Sourcery=A0arm-2009q1-203.</div><div>=
<br></div><div>Regards,</div><div><br></div><div>Brian</div></div>

--089e0158b0acd8162a04e3fe7625--
