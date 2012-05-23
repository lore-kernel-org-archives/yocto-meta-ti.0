Return-Path: <gleym-meta-ti@m.gmane.org>
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0FEB2E0030B
	for <meta-ti@yoctoproject.org>; Wed, 23 May 2012 08:30:12 -0700 (PDT)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gleym-meta-ti@m.gmane.org>) id 1SXDVm-00017g-Du
	for meta-ti@yoctoproject.org; Wed, 23 May 2012 17:30:06 +0200
Received: from static-50-52-145-66.lkvl.mn.frontiernet.net ([50.52.145.66])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <meta-ti@yoctoproject.org>; Wed, 23 May 2012 17:30:06 +0200
Received: from ftagius by static-50-52-145-66.lkvl.mn.frontiernet.net with
	local (Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <meta-ti@yoctoproject.org>; Wed, 23 May 2012 17:30:06 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: meta-ti@yoctoproject.org
From: Frank Agius <ftagius@yahoo.com>
Date: Wed, 23 May 2012 09:02:01 -0400
Message-ID: <jpin48$lag$1@dough.gmane.org>
References: <CALbNGRQPZS-KUuZJO=T7C=yRkoOBTNjwYLJuCw12RV9rb+xStA@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: static-50-52-145-66.lkvl.mn.frontiernet.net
User-Agent: Mozilla/5.0 (Windows NT 5.2; WOW64;
	rv:12.0) Gecko/20120428 Thunderbird/12.0.1
In-Reply-To: <CALbNGRQPZS-KUuZJO=T7C=yRkoOBTNjwYLJuCw12RV9rb+xStA@mail.gmail.com>
Cc: angstrom-distro-devel@linuxtogo.org
Subject: Re: USB OTG not working for linux-mainline-3.2 (was [Angstrom-devel] Problem with usbhid kernel module)
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
X-List-Received-Date: Wed, 23 May 2012 15:30:12 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

On 5/23/2012 7:05 AM, Andreas Müller wrote:
> On Wed, May 23, 2012 at 10:16 AM, Gyorgy Kovesdi<kgy@teledigit.eu>  wrote:
>> Hi,
>>
>> I have a Beagleboard C4, using it with USB keyboard and mouse.
>> Building the current version of Angstrom results a non-functional keyboard and mouse at the first boot.
>> After some digging, i found that the kernel module "usbhid" is not compiled in. It is built as a module (m), but
>> is not loaded during startup. Some weeks ago, it was compiled in (y) in the default kernel config of Beagle.
>>
>> This way the only possibility to get it working is to log in using the serial port, and set up manually.
>> I think it is related to other Beagle boards (e.g. xM), however, other people reported that it is working. Do they
>> use it other way, or do i made something wrong?
>>
>> Regards
>> Gyorgy Kovesdi
>>
>>
> One hint first: to discuss TI-BSP issues you will have more feedback -
> hopefully :) - on meta-ti@yoctoproject.org mailing list.
>
> Back to topic: I have trouble getting OTG USB working in host mode and
> think that this is the same issue as reported in [1]. Connecting to
> USB-host interface everything works as expected - so I don't think is
> related to usbhid.
> AFAIK non XM Beagleboards only have an OTG port - so Gyorgy falls
> victim on that.
> I investigated this issue a bit: It seems the reason for this mess is
> that the Kconfig names have changed some when between 3.0 and 3.2:
>
> 1. In 3.0 there was a constant (CONFIG_)USB_MUSB_HDRC_HCD. This is no
> more part of 3.2 KCONFIG but is heavily used in code
>
> grep -r USB_MUSB_HDRC_HCD *
> | arch/arm/mach-omap2/omap_phy_internal.c:#ifdef	CONFIG_USB_MUSB_HDRC_HCD
> | arch/arm/mach-omap2/usb-musb.c:#elif defined(CONFIG_USB_MUSB_HDRC_HCD)
> | arch/blackfin/mach-bf548/boards/ezkit.c:#elif
> defined(CONFIG_USB_MUSB_HDRC_HCD)
> | arch/blackfin/mach-bf548/boards/cm_bf548.c:#elif
> defined(CONFIG_USB_MUSB_HDRC_HCD)
> | arch/blackfin/mach-bf527/boards/ad7160eval.c:#elif
> defined(CONFIG_USB_MUSB_HDRC_HCD)
> | arch/blackfin/mach-bf527/boards/tll6527m.c:#elif
> defined(CONFIG_USB_MUSB_HDRC_HCD)
> | arch/blackfin/mach-bf527/boards/ezkit.c:#elif
> defined(CONFIG_USB_MUSB_HDRC_HCD)
> | arch/blackfin/mach-bf527/boards/ezbrd.c:#elif
> defined(CONFIG_USB_MUSB_HDRC_HCD)
> | arch/blackfin/mach-bf527/boards/cm_bf527.c:#elif
> defined(CONFIG_USB_MUSB_HDRC_HCD)
>
> Inside of arch/arm/mach-omap2/usb-musb.c there is
>
> static struct musb_hdrc_platform_data musb_plat = {
> #ifdef CONFIG_USB_MUSB_OTG
> 	.mode		= MUSB_OTG,
> #elif defined(CONFIG_USB_MUSB_HDRC_HCD)
> 	.mode		= MUSB_HOST,
> #elif defined(CONFIG_USB_GADGET_MUSB_HDRC)
> 	.mode		= MUSB_PERIPHERAL,
> #endif
>
> So the host mode will never be activated. Strange:
> CONFIG_USB_MUSB_HDRC_HCD is still in beagleboard's defconfig but
> Kconfig removes it during build (see .config in build dir). Seems
> defconfig was handmade..
>
> 2. Same for (CONFIG_)USB_GADGET_OMAP. (I think this is unrelated to
> host mode but yet another example):
>
> | grep -r USB_GADGET_OMAP *
> | arch/arm/mach-omap1/board-h2.c:#ifdef	CONFIG_USB_GADGET_OMAP
> | arch/arm/mach-omap1/usb.c:#ifdef	CONFIG_USB_GADGET_OMAP
> | arch/arm/mach-omap1/usb.c:#ifdef	CONFIG_USB_GADGET_OMAP
> | arch/arm/mach-omap1/board-innovator.c:#ifdef	CONFIG_USB_GADGET_OMAP
> | arch/arm/mach-omap1/board-h3.c:#ifdef CONFIG_USB_GADGET_OMAP
> | arch/arm/mach-omap1/board-osk.c:#ifdef	CONFIG_USB_GADGET_OMAP
> | arch/arm/plat-omap/usb.c:#ifdef	CONFIG_USB_GADGET_OMAP
> | arch/arm/plat-omap/include/plat/usb.h:#ifdef	CONFIG_USB_GADGET_OMAP
> | arch/arm/mach-omap2/usb-fs.c:#ifdef	CONFIG_USB_GADGET_OMAP
> | arch/arm/mach-omap2/board-2430sdp.c:#ifdef  CONFIG_USB_GADGET_OMAP
> | drivers/usb/otg/isp1301_omap.c:#elif	!defined(CONFIG_USB_GADGET_OMAP)
> USB_GADGET_OMAP is not defined for Kconfig but used in source code
>
> I would like to check this hypotheses but currently don't have time to..
>

This relates to usb code changes committed July 2011.  As a result of 
these chages a gadget driver must be loaded in order for host mode to be 
activated.  If you load a gadget driver, then host mode should be activated.

frank




