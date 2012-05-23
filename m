Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-gg0-f176.google.com (mail-gg0-f176.google.com
	[209.85.161.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EB8F7E01396
	for <meta-ti@yoctoproject.org>; Wed, 23 May 2012 04:05:03 -0700 (PDT)
Received: by ggnk4 with SMTP id k4so8153257ggn.35
	for <meta-ti@yoctoproject.org>; Wed, 23 May 2012 04:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:cc:content-type;
	bh=SkcYn3zU/ToMZM5lU0pRgX33JJxKzy1SrKrmDpp22jQ=;
	b=qiGMIi2roYEuQo7GBucLU/NYxQMfrlD2Alvn2iGBKCG50XDce2Liu1KkpWrbzEoNot
	Co0sNLgw0rL9Epnl4mVMMWxF3NOe+lA9vjxC9jBI1QFViEnmDVpnpkWEpG0iFUsZCKAv
	o+Vlv60vZaDxbu3ps5gmU48Ec+jRVYiYfGUT7g+sUFtnOomLJOyvABDb3G6diuTSjGHl
	UJ8h3h5FNSTcrISzqIEusK/1L5q0/zLUCgK4GHjmOjNBq602aNwveaRyBFPp2kO+Ui19
	i0oj5ujgsmNLygxezDxE65i/OYnFbZSRDHurUfkIRKnkOcnLZ4OPaBe6+x3t3pGQxaVv
	8Xgg==
MIME-Version: 1.0
Received: by 10.50.88.225 with SMTP id bj1mr12523274igb.42.1337771102535; Wed,
	23 May 2012 04:05:02 -0700 (PDT)
Received: by 10.64.141.72 with HTTP; Wed, 23 May 2012 04:05:02 -0700 (PDT)
Date: Wed, 23 May 2012 13:05:02 +0200
Message-ID: <CALbNGRQPZS-KUuZJO=T7C=yRkoOBTNjwYLJuCw12RV9rb+xStA@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: Discussion of the angstrom distribution development
	<angstrom-distro-devel@linuxtogo.org>
Cc: meta-ti@yoctoproject.org
Subject: USB OTG not working for linux-mainline-3.2 (was [Angstrom-devel] Problem with usbhid kernel module)
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Wed, 23 May 2012 11:05:04 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, May 23, 2012 at 10:16 AM, Gyorgy Kovesdi <kgy@teledigit.eu> wrote:
> Hi,
>
> I have a Beagleboard C4, using it with USB keyboard and mouse.
> Building the current version of Angstrom results a non-functional keyboard and mouse at the first boot.
> After some digging, i found that the kernel module "usbhid" is not compiled in. It is built as a module (m), but
> is not loaded during startup. Some weeks ago, it was compiled in (y) in the default kernel config of Beagle.
>
> This way the only possibility to get it working is to log in using the serial port, and set up manually.
> I think it is related to other Beagle boards (e.g. xM), however, other people reported that it is working. Do they
> use it other way, or do i made something wrong?
>
> Regards
> Gyorgy Kovesdi
>
>
One hint first: to discuss TI-BSP issues you will have more feedback -
hopefully :) - on meta-ti@yoctoproject.org mailing list.

Back to topic: I have trouble getting OTG USB working in host mode and
think that this is the same issue as reported in [1]. Connecting to
USB-host interface everything works as expected - so I don't think is
related to usbhid.
AFAIK non XM Beagleboards only have an OTG port - so Gyorgy falls
victim on that.
I investigated this issue a bit: It seems the reason for this mess is
that the Kconfig names have changed some when between 3.0 and 3.2:

1. In 3.0 there was a constant (CONFIG_)USB_MUSB_HDRC_HCD. This is no
more part of 3.2 KCONFIG but is heavily used in code

grep -r USB_MUSB_HDRC_HCD *
| arch/arm/mach-omap2/omap_phy_internal.c:#ifdef	CONFIG_USB_MUSB_HDRC_HCD
| arch/arm/mach-omap2/usb-musb.c:#elif defined(CONFIG_USB_MUSB_HDRC_HCD)
| arch/blackfin/mach-bf548/boards/ezkit.c:#elif
defined(CONFIG_USB_MUSB_HDRC_HCD)
| arch/blackfin/mach-bf548/boards/cm_bf548.c:#elif
defined(CONFIG_USB_MUSB_HDRC_HCD)
| arch/blackfin/mach-bf527/boards/ad7160eval.c:#elif
defined(CONFIG_USB_MUSB_HDRC_HCD)
| arch/blackfin/mach-bf527/boards/tll6527m.c:#elif
defined(CONFIG_USB_MUSB_HDRC_HCD)
| arch/blackfin/mach-bf527/boards/ezkit.c:#elif
defined(CONFIG_USB_MUSB_HDRC_HCD)
| arch/blackfin/mach-bf527/boards/ezbrd.c:#elif
defined(CONFIG_USB_MUSB_HDRC_HCD)
| arch/blackfin/mach-bf527/boards/cm_bf527.c:#elif
defined(CONFIG_USB_MUSB_HDRC_HCD)

Inside of arch/arm/mach-omap2/usb-musb.c there is

static struct musb_hdrc_platform_data musb_plat = {
#ifdef CONFIG_USB_MUSB_OTG
	.mode		= MUSB_OTG,
#elif defined(CONFIG_USB_MUSB_HDRC_HCD)
	.mode		= MUSB_HOST,
#elif defined(CONFIG_USB_GADGET_MUSB_HDRC)
	.mode		= MUSB_PERIPHERAL,
#endif

So the host mode will never be activated. Strange:
CONFIG_USB_MUSB_HDRC_HCD is still in beagleboard's defconfig but
Kconfig removes it during build (see .config in build dir). Seems
defconfig was handmade..

2. Same for (CONFIG_)USB_GADGET_OMAP. (I think this is unrelated to
host mode but yet another example):

| grep -r USB_GADGET_OMAP *
| arch/arm/mach-omap1/board-h2.c:#ifdef	CONFIG_USB_GADGET_OMAP
| arch/arm/mach-omap1/usb.c:#ifdef	CONFIG_USB_GADGET_OMAP
| arch/arm/mach-omap1/usb.c:#ifdef	CONFIG_USB_GADGET_OMAP
| arch/arm/mach-omap1/board-innovator.c:#ifdef	CONFIG_USB_GADGET_OMAP
| arch/arm/mach-omap1/board-h3.c:#ifdef CONFIG_USB_GADGET_OMAP
| arch/arm/mach-omap1/board-osk.c:#ifdef	CONFIG_USB_GADGET_OMAP
| arch/arm/plat-omap/usb.c:#ifdef	CONFIG_USB_GADGET_OMAP
| arch/arm/plat-omap/include/plat/usb.h:#ifdef	CONFIG_USB_GADGET_OMAP
| arch/arm/mach-omap2/usb-fs.c:#ifdef	CONFIG_USB_GADGET_OMAP
| arch/arm/mach-omap2/board-2430sdp.c:#ifdef  CONFIG_USB_GADGET_OMAP
| drivers/usb/otg/isp1301_omap.c:#elif	!defined(CONFIG_USB_GADGET_OMAP)
USB_GADGET_OMAP is not defined for Kconfig but used in source code

I would like to check this hypotheses but currently don't have time to..

Andreas

