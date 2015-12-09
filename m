Return-Path: <jdvdt2@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 05B0EE00C06; Wed,  9 Dec 2015 08:55:15 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [209.85.213.44 listed in list.dnswl.org]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (jdvdt2[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-vk0-f44.google.com (mail-vk0-f44.google.com
	[209.85.213.44])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CB4DAE00AD8
	for <meta-ti@yoctoproject.org>; Wed,  9 Dec 2015 08:55:11 -0800 (PST)
Received: by vkbs1 with SMTP id s1so56027465vkb.1
	for <meta-ti@yoctoproject.org>; Wed, 09 Dec 2015 08:55:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=3xzvhk5XClw9JyjxNH+wtL8vAkbEHbcJgC+OajbKWu4=;
	b=gUmoAyIHeW41O7sQ84BJMSGhJJbMbI/ZJyQqs/wamjoNu1UpUR7Pp1AkMftcSW5l+d
	uZqPvhESGJCRshHfkvxj4xhvOfRfMc+BGLYR9BqAKHtTKT3Mx97wD1TYR61GrJ5WreNx
	FZE5essBIwdJrrFH48hhjMvGYejOj0wa+g7gEUuDfupt6KMkSi+lEBF/kZxXqWbAe9ae
	PYjE6ASomwJXepWYwvSxb47zovzwejK4/PaaJCO/i7898TQdn2ymCw93NcBTtVdoryKI
	Vw1xnSncikWc//hIUDybAEmGl031pPXztcoMw3v7VdVZc6inU2lFXA2FK7cpsUq8KdZ0
	sKuA==
MIME-Version: 1.0
X-Received: by 10.31.140.199 with SMTP id o190mr5824833vkd.63.1449680110792;
	Wed, 09 Dec 2015 08:55:10 -0800 (PST)
Received: by 10.31.93.69 with HTTP; Wed, 9 Dec 2015 08:55:10 -0800 (PST)
Date: Wed, 9 Dec 2015 11:55:10 -0500
Message-ID: <CAAjA2M+wKJ7AFP1yPj8aF2AJVyfZ6bpC9Xqtk3Z9A=0CN9owEg@mail.gmail.com>
From: Joshua Vanderpool <jdvdt2@gmail.com>
To: meta-ti@yoctoproject.org
Subject: u-boot build failure .lds file?
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
X-List-Received-Date: Wed, 09 Dec 2015 16:55:15 -0000
Content-Type: multipart/alternative; boundary=001a11425b200ae6d0052679f4c3

--001a11425b200ae6d0052679f4c3
Content-Type: text/plain; charset=UTF-8

I finally got my custom board ported from the old method of the borads.cfg
file.  The missing link was in the /arch/arm/cpu/armv7/omap5/Kconfig needed
to add my board to get the autotools to get my source/headers.

However the issue I face now is the failure to link I think, have no clue
where this would come from.

  arm-linux-gnueabihf-ld.bfd   -pie  --gc-sections -Bstatic -Ttext
0x80800000 -o u-boot -T u-boot.lds arch/arm/cpu/armv7/start.o --start-group
 arch/arm/cpu/built-in.o  arch/arm/cpu/armv7/built-in.o
 arch/arm/lib/built-in.o  board/ti/common/built-in.o
 board/ti/raymond_gdm/built-in.o  common/built-in.o  disk/built-in.o
 drivers/built-in.o  drivers/dma/built-in.o  drivers/gpio/built-in.o
 drivers/i2c/built-in.o  drivers/mmc/built-in.o  drivers/mtd/built-in.o
 drivers/mtd/onenand/built-in.o  drivers/mtd/spi/built-in.o
 drivers/net/built-in.o  drivers/net/phy/built-in.o  drivers/pci/built-in.o
 drivers/power/built-in.o  drivers/power/battery/built-in.o
 drivers/power/fuel_gauge/built-in.o  drivers/power/mfd/built-in.o
 drivers/power/pmic/built-in.o  drivers/power/regulator/built-in.o
 drivers/serial/built-in.o  drivers/spi/built-in.o
 drivers/usb/dwc3/built-in.o  drivers/usb/emul/built-in.o
 drivers/usb/eth/built-in.o  drivers/usb/gadget/built-in.o
 drivers/usb/gadget/udc/built-in.o  drivers/usb/host/built-in.o
 drivers/usb/musb-new/built-in.o  drivers/usb/musb/built-in.o
 drivers/usb/phy/built-in.o  drivers/usb/ulpi/built-in.o  fs/built-in.o
 lib/built-in.o  net/built-in.o  test/built-in.o  test/dm/built-in.o
--end-group arch/arm/lib/eabi_compat.o  -L
/home/jvanderpool/gcc-linaro-4.9-2015.05-x86_64_arm-linux-gnueabihf/bin/../lib/gcc/arm-linux-gnueabihf/4.9.3
-lgcc -Map u-boot.map
arm-linux-gnueabihf-ld.bfd:u-boot.lds:1: ignoring invalid character `#' in
expression
arm-linux-gnueabihf-ld.bfd:u-boot.lds:1: syntax error
make: *** [u-boot] Error 1

Thanks for any support and your time.

Josh

--001a11425b200ae6d0052679f4c3
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I finally got my custom board ported from the old method o=
f the borads.cfg file.=C2=A0 The missing link was in the /arch/arm/cpu/armv=
7/omap5/Kconfig needed to add my board to get the autotools to get my sourc=
e/headers.<div><br></div><div>However the issue I face now is the failure t=
o link I think, have no clue where this would come from.</div><div><br></di=
v><div><div>=C2=A0 arm-linux-gnueabihf-ld.bfd =C2=A0 -pie =C2=A0--gc-sectio=
ns -Bstatic -Ttext 0x80800000 -o u-boot -T u-boot.lds arch/arm/cpu/armv7/st=
art.o --start-group =C2=A0arch/arm/cpu/built-in.o =C2=A0arch/arm/cpu/armv7/=
built-in.o =C2=A0arch/arm/lib/built-in.o =C2=A0board/ti/common/built-in.o =
=C2=A0board/ti/raymond_gdm/built-in.o =C2=A0common/built-in.o =C2=A0disk/bu=
ilt-in.o =C2=A0drivers/built-in.o =C2=A0drivers/dma/built-in.o =C2=A0driver=
s/gpio/built-in.o =C2=A0drivers/i2c/built-in.o =C2=A0drivers/mmc/built-in.o=
 =C2=A0drivers/mtd/built-in.o =C2=A0drivers/mtd/onenand/built-in.o =C2=A0dr=
ivers/mtd/spi/built-in.o =C2=A0drivers/net/built-in.o =C2=A0drivers/net/phy=
/built-in.o =C2=A0drivers/pci/built-in.o =C2=A0drivers/power/built-in.o =C2=
=A0drivers/power/battery/built-in.o =C2=A0drivers/power/fuel_gauge/built-in=
.o =C2=A0drivers/power/mfd/built-in.o =C2=A0drivers/power/pmic/built-in.o =
=C2=A0drivers/power/regulator/built-in.o =C2=A0drivers/serial/built-in.o =
=C2=A0drivers/spi/built-in.o =C2=A0drivers/usb/dwc3/built-in.o =C2=A0driver=
s/usb/emul/built-in.o =C2=A0drivers/usb/eth/built-in.o =C2=A0drivers/usb/ga=
dget/built-in.o =C2=A0drivers/usb/gadget/udc/built-in.o =C2=A0drivers/usb/h=
ost/built-in.o =C2=A0drivers/usb/musb-new/built-in.o =C2=A0drivers/usb/musb=
/built-in.o =C2=A0drivers/usb/phy/built-in.o =C2=A0drivers/usb/ulpi/built-i=
n.o =C2=A0fs/built-in.o =C2=A0lib/built-in.o =C2=A0net/built-in.o =C2=A0tes=
t/built-in.o =C2=A0test/dm/built-in.o --end-group arch/arm/lib/eabi_compat.=
o =C2=A0-L /home/jvanderpool/gcc-linaro-4.9-2015.05-x86_64_arm-linux-gnueab=
ihf/bin/../lib/gcc/arm-linux-gnueabihf/4.9.3 -lgcc -Map u-boot.map</div><di=
v>arm-linux-gnueabihf-ld.bfd:u-boot.lds:1: ignoring invalid character `#&#3=
9; in expression</div><div>arm-linux-gnueabihf-ld.bfd:u-boot.lds:1: syntax =
error</div><div>make: *** [u-boot] Error 1</div></div><div><br></div><div><=
span style=3D"font-size:12.8px">Thanks for any support and your time.</span=
><br></div><div><br></div><div>Josh</div></div>

--001a11425b200ae6d0052679f4c3--
