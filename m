Return-Path: <jdvdt2@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E5C99E00ACF; Wed,  9 Dec 2015 09:31:27 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (jdvdt2[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.213.51 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-vk0-f51.google.com (mail-vk0-f51.google.com
	[209.85.213.51])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B5498E00404
	for <meta-ti@yoctoproject.org>; Wed,  9 Dec 2015 09:31:21 -0800 (PST)
Received: by vkca188 with SMTP id a188so58260343vkc.0
	for <meta-ti@yoctoproject.org>; Wed, 09 Dec 2015 09:31:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=RAEvf2NenGLWr8ulbWX/44XhPWA2bzcAORmt6QwZKUQ=;
	b=xt95srHMFjqOnrVnmfFbybIajWRmAcTVth1u2ZxjOyOuVcnGmJ48nM2lHZSpPjl8Lc
	E15mjCAo6vuP7ud1MfI139rqDn6ykvovPtIFhvzKxrnoqi2+BPsb/OCtEKLopHbJXkbn
	uiFRf1YMoUYDWYRZpboZffRCU2FEtxTXSq9ILoWvLLsl3uNz7WsQdVpk37vWVvwYGjSl
	fu9EwGQG6QJ8rxlW5OP2QCX7bYjPwhBMbWFjZ1ILM7x1rG7xDyzqhBYZ035OuK4gjRKv
	Rv9WSc4SHnEPkPXEQ1AgPC2CDbe6MXTc1xPQ4QlrvcXe1UhuBLvLDgfcyN7CwfmnhPyb
	DdEQ==
MIME-Version: 1.0
X-Received: by 10.31.54.1 with SMTP id d1mr6252029vka.7.1449682280676; Wed, 09
	Dec 2015 09:31:20 -0800 (PST)
Received: by 10.31.93.69 with HTTP; Wed, 9 Dec 2015 09:31:20 -0800 (PST)
In-Reply-To: <CAAjA2M+wKJ7AFP1yPj8aF2AJVyfZ6bpC9Xqtk3Z9A=0CN9owEg@mail.gmail.com>
References: <CAAjA2M+wKJ7AFP1yPj8aF2AJVyfZ6bpC9Xqtk3Z9A=0CN9owEg@mail.gmail.com>
Date: Wed, 9 Dec 2015 12:31:20 -0500
Message-ID: <CAAjA2M+LpzQ0Dp8Z2ah210auNv0GDFRM70Y_=uyS2Hr7+KC-ew@mail.gmail.com>
From: Joshua Vanderpool <jdvdt2@gmail.com>
To: meta-ti@yoctoproject.org
Subject: Re: u-boot build failure .lds file?
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
X-List-Received-Date: Wed, 09 Dec 2015 17:31:28 -0000
Content-Type: multipart/alternative; boundary=001a11438ada60844705267a753d

--001a11438ada60844705267a753d
Content-Type: text/plain; charset=UTF-8

Can not use // comments in header files. such as my custom board .h

Sorry for the extra messages.

Josh

On Wed, Dec 9, 2015 at 11:55 AM, Joshua Vanderpool <jdvdt2@gmail.com> wrote:

> I finally got my custom board ported from the old method of the borads.cfg
> file.  The missing link was in the /arch/arm/cpu/armv7/omap5/Kconfig needed
> to add my board to get the autotools to get my source/headers.
>
> However the issue I face now is the failure to link I think, have no clue
> where this would come from.
>
>   arm-linux-gnueabihf-ld.bfd   -pie  --gc-sections -Bstatic -Ttext
> 0x80800000 -o u-boot -T u-boot.lds arch/arm/cpu/armv7/start.o --start-group
>  arch/arm/cpu/built-in.o  arch/arm/cpu/armv7/built-in.o
>  arch/arm/lib/built-in.o  board/ti/common/built-in.o
>  board/ti/raymond_gdm/built-in.o  common/built-in.o  disk/built-in.o
>  drivers/built-in.o  drivers/dma/built-in.o  drivers/gpio/built-in.o
>  drivers/i2c/built-in.o  drivers/mmc/built-in.o  drivers/mtd/built-in.o
>  drivers/mtd/onenand/built-in.o  drivers/mtd/spi/built-in.o
>  drivers/net/built-in.o  drivers/net/phy/built-in.o  drivers/pci/built-in.o
>  drivers/power/built-in.o  drivers/power/battery/built-in.o
>  drivers/power/fuel_gauge/built-in.o  drivers/power/mfd/built-in.o
>  drivers/power/pmic/built-in.o  drivers/power/regulator/built-in.o
>  drivers/serial/built-in.o  drivers/spi/built-in.o
>  drivers/usb/dwc3/built-in.o  drivers/usb/emul/built-in.o
>  drivers/usb/eth/built-in.o  drivers/usb/gadget/built-in.o
>  drivers/usb/gadget/udc/built-in.o  drivers/usb/host/built-in.o
>  drivers/usb/musb-new/built-in.o  drivers/usb/musb/built-in.o
>  drivers/usb/phy/built-in.o  drivers/usb/ulpi/built-in.o  fs/built-in.o
>  lib/built-in.o  net/built-in.o  test/built-in.o  test/dm/built-in.o
> --end-group arch/arm/lib/eabi_compat.o  -L
> /home/jvanderpool/gcc-linaro-4.9-2015.05-x86_64_arm-linux-gnueabihf/bin/../lib/gcc/arm-linux-gnueabihf/4.9.3
> -lgcc -Map u-boot.map
> arm-linux-gnueabihf-ld.bfd:u-boot.lds:1: ignoring invalid character `#' in
> expression
> arm-linux-gnueabihf-ld.bfd:u-boot.lds:1: syntax error
> make: *** [u-boot] Error 1
>
> Thanks for any support and your time.
>
> Josh
>

--001a11438ada60844705267a753d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Can not use // comments in header files. such as my custom=
 board .h<div><br></div><div>Sorry for the extra messages.</div><div><br></=
div><div>Josh</div></div><div class=3D"gmail_extra"><br><div class=3D"gmail=
_quote">On Wed, Dec 9, 2015 at 11:55 AM, Joshua Vanderpool <span dir=3D"ltr=
">&lt;<a href=3D"mailto:jdvdt2@gmail.com" target=3D"_blank">jdvdt2@gmail.co=
m</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr">=
I finally got my custom board ported from the old method of the borads.cfg =
file.=C2=A0 The missing link was in the /arch/arm/cpu/armv7/omap5/Kconfig n=
eeded to add my board to get the autotools to get my source/headers.<div><b=
r></div><div>However the issue I face now is the failure to link I think, h=
ave no clue where this would come from.</div><div><br></div><div><div>=C2=
=A0 arm-linux-gnueabihf-ld.bfd =C2=A0 -pie =C2=A0--gc-sections -Bstatic -Tt=
ext 0x80800000 -o u-boot -T u-boot.lds arch/arm/cpu/armv7/start.o --start-g=
roup =C2=A0arch/arm/cpu/built-in.o =C2=A0arch/arm/cpu/armv7/built-in.o =C2=
=A0arch/arm/lib/built-in.o =C2=A0board/ti/common/built-in.o =C2=A0board/ti/=
raymond_gdm/built-in.o =C2=A0common/built-in.o =C2=A0disk/built-in.o =C2=A0=
drivers/built-in.o =C2=A0drivers/dma/built-in.o =C2=A0drivers/gpio/built-in=
.o =C2=A0drivers/i2c/built-in.o =C2=A0drivers/mmc/built-in.o =C2=A0drivers/=
mtd/built-in.o =C2=A0drivers/mtd/onenand/built-in.o =C2=A0drivers/mtd/spi/b=
uilt-in.o =C2=A0drivers/net/built-in.o =C2=A0drivers/net/phy/built-in.o =C2=
=A0drivers/pci/built-in.o =C2=A0drivers/power/built-in.o =C2=A0drivers/powe=
r/battery/built-in.o =C2=A0drivers/power/fuel_gauge/built-in.o =C2=A0driver=
s/power/mfd/built-in.o =C2=A0drivers/power/pmic/built-in.o =C2=A0drivers/po=
wer/regulator/built-in.o =C2=A0drivers/serial/built-in.o =C2=A0drivers/spi/=
built-in.o =C2=A0drivers/usb/dwc3/built-in.o =C2=A0drivers/usb/emul/built-i=
n.o =C2=A0drivers/usb/eth/built-in.o =C2=A0drivers/usb/gadget/built-in.o =
=C2=A0drivers/usb/gadget/udc/built-in.o =C2=A0drivers/usb/host/built-in.o =
=C2=A0drivers/usb/musb-new/built-in.o =C2=A0drivers/usb/musb/built-in.o =C2=
=A0drivers/usb/phy/built-in.o =C2=A0drivers/usb/ulpi/built-in.o =C2=A0fs/bu=
ilt-in.o =C2=A0lib/built-in.o =C2=A0net/built-in.o =C2=A0test/built-in.o =
=C2=A0test/dm/built-in.o --end-group arch/arm/lib/eabi_compat.o =C2=A0-L /h=
ome/jvanderpool/gcc-linaro-4.9-2015.05-x86_64_arm-linux-gnueabihf/bin/../li=
b/gcc/arm-linux-gnueabihf/4.9.3 -lgcc -Map u-boot.map</div><div>arm-linux-g=
nueabihf-ld.bfd:u-boot.lds:1: ignoring invalid character `#&#39; in express=
ion</div><div>arm-linux-gnueabihf-ld.bfd:u-boot.lds:1: syntax error</div><d=
iv>make: *** [u-boot] Error 1</div></div><div><br></div><div><span style=3D=
"font-size:12.8px">Thanks for any support and your time.</span><br></div><d=
iv><br></div><div>Josh</div></div>
</blockquote></div><br></div>

--001a11438ada60844705267a753d--
