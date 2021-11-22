Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.197.1637605572864690000
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 22 Nov 2021 10:26:13 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id E04A840C30;
	Mon, 22 Nov 2021 18:26:11 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ib2afWFOst_P; Mon, 22 Nov 2021 18:26:11 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id AD59840BA7;
	Mon, 22 Nov 2021 18:26:07 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 759801746D4; Mon, 22 Nov 2021 13:26:07 -0500 (EST)
Date: Mon, 22 Nov 2021 13:26:07 -0500
From: "Denys Dmytriyenko" <denis@denix.org>
To: Vivien Didelot <vivien.didelot@gmail.com>
Cc: meta-ti@lists.yoctoproject.org, Denys Dmytriyenko <denys@konsulko.com>,
	Praneeth Bajjuri <praneeth@ti.com>,
	Vivien Didelot <vdidelot@pbsc.com>
Subject: Re: [meta-ti] [PATCH] ti33x: remove the screen machine feature
Message-ID: <20211122182607.GR18191@denix.org>
References: <20211119201533.2540388-1-vdidelot@pbsc.com>
 <20211120030211.GN18191@denix.org>
 <20211120150005.GB2737481@t480s.localdomain>
MIME-Version: 1.0
In-Reply-To: <20211120150005.GB2737481@t480s.localdomain>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Nov 20, 2021 at 03:00:05PM -0500, Vivien Didelot wrote:
> Hi Denys,
> 
> On Fri, 19 Nov 2021 22:02:11 -0500 "Denys Dmytriyenko" <denis@denix.org> wrote:
> > On Fri, Nov 19, 2021 at 03:15:33PM -0500, Vivien Didelot wrote:
> > > Some distros or image recipes may rely on the presence of the "screen"
> > > machine feature to install graphical front-end applications.
> > > 
> > > The ti33x SoC has an integrated GPU but does not have a screen per-se,
> > > thus having this feature in the SoC configuration may lead to unwanted
> > > packages being built.
> > > 
> > > Comment the 'screen' feature and remove it from MACHINE_FEATURES.
> > 
> > Well, 'screen' also implies not just a built-in LCD, but also external screens 
> > connected over HDMI or DVI. There are even remnant MACHINE_GUI_CLASS variables 
> > set in machine configs for either "bigscreen" or "smallscreen", although that 
> > one is no longer used.
> 
> I understand what you're saying. The confusion comes from the fact that
> some people think about the 'screen' feature as 'the machine has an LCD
> _controller_ and/or graphic output port(s)', while others think of it as
> 'the machine literally has a graphical display'.

It is as simple as whether the machine is headless or not.


> IMHO the 'screen' and 'touchscreen' machine features are a software-agnostic
> way to describe the usage of a physical graphical display on the end product;
> 
> the 'directfb', 'x11' and 'wayland' distro features are a subjective way
> to configure the graphical software stack of choice;
> 
> and finally the 'gpu' machine feature describes the capability of hardware
> accelerated graphical processing.

Well, 'gpu' is not an upstream MACHINE_FEATURE, as BSPs can define additional 
ones for own use. It used to be 'sgx', but with the addition of Rogue RGX 
graphics, got renamed to more generic 'gpu':
https://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/commit/?id=0d9910c1710d9d4b2dd986403824ae05b6289e63

BTW, a display output (screen) can be very different and independent from a 3D 
processing (gpu), hence those are 2 separate features.


> As an example, a distro can configure the Qt stack and tweak images like this:
> 
>     DISTRO_FEATURES:append = " directfb"
>     PACKAGECONFIG_DISTRO:pn-qtbase ?= " \
>         ${@bb.utils.contains('MACHINE_FEATURES', 'gpu', 'eglfs', '', d)} \
>         ${@bb.utils.contains('MACHINE_FEATURES', 'touchscreen', 'libinput tslib', '', d)} \
>         "
>     EXTRA_IMAGE_FEATURES ?= " \
>         ${@bb.utils.contains('MACHINE_FEATURES', 'gpu', 'hwcodecs', '', d)} \
>         ${@bb.utils.contains_any('MACHINE_FEATURES', 'screen touchscreen', 'splash', '', d)} \
>         "
> 
> while a generic image recipe or local conf can tweak packages this:
> 
>     IMAGE_INSTALL:append = " ${@bb.utils.contains_any('MACHINE_FEATURES', 'screen touchscreen', 'qt-kiosk-browser', '', d)}"
> 
> The MACHINE_GUI_CLASS actually shares the same concern, it assumes the
> presence of a built-in screen of subjective size, which is simply wrong
> for machines with an optional graphical display.

MACHINE_GUI_CLASS was used more widely in the past, but these days it only 
affects the size of the logo in kernel boot when linux.inc from meta-oe is 
included, which again is not used in meta-ti:
https://git.openembedded.org/meta-openembedded/tree/meta-oe/recipes-kernel/linux/linux.inc#n19


> > All TI platforms with am335x SoC do have screen outputs, but I do understand 
> > there could be headless platforms from other manufacturers with this SoC. The 
> > correct way would be to not completely remove "screen" MACHINE_FEATURE from 
> > the SoC include file, but rather move it to corresponding machine configs that 
> > use it - am335x-evm, beaglebone, etc.
> 
> I would say that the 'screen' feature definitely doesn't belong to the SoC
> configuration, and it doesn't belong to the machine description neither:
> 
> even though I understand it can be handy for beginners, boards like Rpi
> and BeagleBone can be used headless and thus removing the feature from the
> local configuration to get rid of unwanted configs is likewise cumbersome.
> 
> I think it's the user responsibility to specify MACHINE_FEATURES += "screen"
> in their local configuration to describe the usage of a graphical display,
> especially for machines not shipped with a built-in one.

That's not how it works!

All available MACHINE_FEATURES are defined in machine config files. Think of 
those as capabilities. The list defines what this specific machine is capable 
of, but it's up to you to use it or not.

That's no different from the rest of them, such as:
acpi, alsa, apm, ext2, ext3, vfat, screen, keyboard, touchscreen, pci, pcmcia, 
phone, serial, usbgadget, usbhost, bluetooth, wifi, x86, kernel26...

Note that some of them are really software capabilities, but historically 
were specified in machine configs. And kernel26 has been dropped long ago, 
but is still lingering in places...

A distro config, or an image recipe, or even end user via local.conf can 
decide whether to act on those capabilities or not. E.g. It doesn't matter if 
a machine can support 'alsa' audio if you don't need any audio in your image, 
you simply do not install corresponding packages.

There are 2 very different approaches. 1) When you are building a reference 
distro and try to be very flexible and do a lot of conditionals based on 
capabilities and features. And 2) when you are making a final product for a 
specific platform, where pretty much everything is predetermined and static.

So, if you are making a product, your image recipe should not rely on checking 
available capabilities or features that much, if at all...

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964
