Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.web09.7683.1637645594092999273
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 22 Nov 2021 21:33:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=K9p4s3HL;
 spf=pass (domain: gmail.com, ip: 209.85.222.177, mailfrom: vivien.didelot@gmail.com)
Received: by mail-qk1-f177.google.com with SMTP id m192so16288688qke.2
        for <meta-ti@lists.yoctoproject.org>; Mon, 22 Nov 2021 21:33:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:message-id:from:to:cc:subject:in-reply-to:references
         :mime-version:content-disposition:content-transfer-encoding;
        bh=tixbdcjDrYQ+SAOskm9qb30kfdzpOpeZQLID0EjG32I=;
        b=K9p4s3HLNoC1rpPuZ6jsQh87vq+VjQOygAVfHXE+o3zluckQqDso+WpRhb5G1rMnHJ
         oXUD7RPzaAzeMJxIJfZkbflJYTD2G5ZfKhtHEETCFDgeG3V/VvDTD5khLhAj2L2LrN1R
         /tucD8P2IaHsthTOkK2P53UXKBKLck2yLQB9cBqONhunydb5WuanvAlN85shJTMdyQMR
         F8a+wl6IWY2OuLyAwpGk7I2cotdQ1nclb4ghtGLFMFEOI4MmraVX4Y1E5DJkMnpTCiMa
         fASojzjbftHY3mV4wSJKW4hwwS4Y/Fms0SyM32kidoocT69CRAmY+IbCR/lCxsR0SoGD
         hYHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:from:to:cc:subject:in-reply-to
         :references:mime-version:content-disposition
         :content-transfer-encoding;
        bh=tixbdcjDrYQ+SAOskm9qb30kfdzpOpeZQLID0EjG32I=;
        b=3mk2FCGFaQlWB4ecVTvR4ZvZ6TGRfUtbCI+fDwHmNrBu6VM3cM5Nv4Y1EB8FW6VM0P
         I9OdCCMN3DSDT4J3m0+yh3GQmFm4c/hwNb93pgWsOs3YIcvJESJm+4DmLsWJvf2pgibs
         6hIhTd+ynabSYIOza4WtYRlmpJfnaGVx6Iw4BuajmhjC3XL6NUHLOPdvaWu1Qvt5og2c
         yDAVB1fBrylOaUodWnjn89ws4JtOosrOuKaFGrNKZ5L+XzKALNdeSk7Jv+/0eOqSIGfJ
         IwcQlsc1hXrMaQZt/jzVXDkAA12+HDfmW3ueWULm2c6rTkZKkh7+3NvqpnxI8yzIv9x8
         LWhQ==
X-Gm-Message-State: AOAM530Ol9DUOhWUodjbybkP1587vfkkaA3YewaHruRGCcpEnF8Sx7Zx
	//silQ4IqkRPqWGyuEVwBIQ=
X-Google-Smtp-Source: ABdhPJxK99W881zkYqKPtXWEO70/xSmLoU5ugQtZwZ7n4LV4vlnT+lpaKUo089XCRKJ2GiuURwYvrQ==
X-Received: by 2002:a05:620a:ccd:: with SMTP id b13mr2217503qkj.484.1637645593099;
        Mon, 22 Nov 2021 21:33:13 -0800 (PST)
Return-Path: <vivien.didelot@gmail.com>
Received: from localhost (bras-base-mtrlpq2848w-grc-41-70-53-240-121.dsl.bell.ca. [70.53.240.121])
        by smtp.gmail.com with ESMTPSA id s22sm6203601qko.88.2021.11.22.21.33.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Nov 2021 21:33:12 -0800 (PST)
Date: Tue, 23 Nov 2021 00:33:12 -0500
Message-ID: <20211123003312.GB3223181@t480s.localdomain>
From: "Vivien Didelot" <vivien.didelot@gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: meta-ti@lists.yoctoproject.org, Denys Dmytriyenko <denys@konsulko.com>,
 Praneeth Bajjuri <praneeth@ti.com>, Vivien Didelot <vdidelot@pbsc.com>
Subject: Re: [meta-ti] [PATCH] ti33x: remove the screen machine feature
In-Reply-To: <20211123043221.GT18191@denix.org>
References: <20211119201533.2540388-1-vdidelot@pbsc.com>
 <20211120030211.GN18191@denix.org>
 <20211120150005.GB2737481@t480s.localdomain>
 <20211122182607.GR18191@denix.org>
 <20211122231111.GB3215398@t480s.localdomain>
 <20211123043221.GT18191@denix.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Denys,

On Mon, 22 Nov 2021 23:32:21 -0500 "Denys Dmytriyenko" <denis@denix.org> wrote:
> On Mon, Nov 22, 2021 at 11:11:11PM -0500, Vivien Didelot wrote:
> > Hi Denys,
> > 
> > On Mon, 22 Nov 2021 13:26:07 -0500 "Denys Dmytriyenko" <denis@denix.org> wrote:
> > > On Sat, Nov 20, 2021 at 03:00:05PM -0500, Vivien Didelot wrote:
> > > > Hi Denys,
> > > > 
> > > > On Fri, 19 Nov 2021 22:02:11 -0500 "Denys Dmytriyenko" <denis@denix.org> wrote:
> > > > > On Fri, Nov 19, 2021 at 03:15:33PM -0500, Vivien Didelot wrote:
> > > > > > Some distros or image recipes may rely on the presence of the "screen"
> > > > > > machine feature to install graphical front-end applications.
> > > > > > 
> > > > > > The ti33x SoC has an integrated GPU but does not have a screen per-se,
> > > > > > thus having this feature in the SoC configuration may lead to unwanted
> > > > > > packages being built.
> > > > > > 
> > > > > > Comment the 'screen' feature and remove it from MACHINE_FEATURES.
> > > > > 
> > > > > Well, 'screen' also implies not just a built-in LCD, but also external screens 
> > > > > connected over HDMI or DVI. There are even remnant MACHINE_GUI_CLASS variables 
> > > > > set in machine configs for either "bigscreen" or "smallscreen", although that 
> > > > > one is no longer used.
> > > > 
> > > > I understand what you're saying. The confusion comes from the fact that
> > > > some people think about the 'screen' feature as 'the machine has an LCD
> > > > _controller_ and/or graphic output port(s)', while others think of it as
> > > > 'the machine literally has a graphical display'.
> > > 
> > > It is as simple as whether the machine is headless or not.
> > > 
> > > 
> > > > IMHO the 'screen' and 'touchscreen' machine features are a software-agnostic
> > > > way to describe the usage of a physical graphical display on the end product;
> > > > 
> > > > the 'directfb', 'x11' and 'wayland' distro features are a subjective way
> > > > to configure the graphical software stack of choice;
> > > > 
> > > > and finally the 'gpu' machine feature describes the capability of hardware
> > > > accelerated graphical processing.
> > > 
> > > Well, 'gpu' is not an upstream MACHINE_FEATURE, as BSPs can define additional 
> > > ones for own use. It used to be 'sgx', but with the addition of Rogue RGX 
> > > graphics, got renamed to more generic 'gpu':
> > > https://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/commit/?id=0d9910c1710d9d4b2dd986403824ae05b6289e63
> > > 
> > > BTW, a display output (screen) can be very different and independent from a 3D 
> > > processing (gpu), hence those are 2 separate features.
> > > 
> > > 
> > > > As an example, a distro can configure the Qt stack and tweak images like this:
> > > > 
> > > >     DISTRO_FEATURES:append = " directfb"
> > > >     PACKAGECONFIG_DISTRO:pn-qtbase ?= " \
> > > >         ${@bb.utils.contains('MACHINE_FEATURES', 'gpu', 'eglfs', '', d)} \
> > > >         ${@bb.utils.contains('MACHINE_FEATURES', 'touchscreen', 'libinput tslib', '', d)} \
> > > >         "
> > > >     EXTRA_IMAGE_FEATURES ?= " \
> > > >         ${@bb.utils.contains('MACHINE_FEATURES', 'gpu', 'hwcodecs', '', d)} \
> > > >         ${@bb.utils.contains_any('MACHINE_FEATURES', 'screen touchscreen', 'splash', '', d)} \
> > > >         "
> > > > 
> > > > while a generic image recipe or local conf can tweak packages this:
> > > > 
> > > >     IMAGE_INSTALL:append = " ${@bb.utils.contains_any('MACHINE_FEATURES', 'screen touchscreen', 'qt-kiosk-browser', '', d)}"
> > > > 
> > > > The MACHINE_GUI_CLASS actually shares the same concern, it assumes the
> > > > presence of a built-in screen of subjective size, which is simply wrong
> > > > for machines with an optional graphical display.
> > > 
> > > MACHINE_GUI_CLASS was used more widely in the past, but these days it only 
> > > affects the size of the logo in kernel boot when linux.inc from meta-oe is 
> > > included, which again is not used in meta-ti:
> > > https://git.openembedded.org/meta-openembedded/tree/meta-oe/recipes-kernel/linux/linux.inc#n19
> > > 
> > > 
> > > > > All TI platforms with am335x SoC do have screen outputs, but I do understand 
> > > > > there could be headless platforms from other manufacturers with this SoC. The 
> > > > > correct way would be to not completely remove "screen" MACHINE_FEATURE from 
> > > > > the SoC include file, but rather move it to corresponding machine configs that 
> > > > > use it - am335x-evm, beaglebone, etc.
> > > > 
> > > > I would say that the 'screen' feature definitely doesn't belong to the SoC
> > > > configuration, and it doesn't belong to the machine description neither:
> > > > 
> > > > even though I understand it can be handy for beginners, boards like Rpi
> > > > and BeagleBone can be used headless and thus removing the feature from the
> > > > local configuration to get rid of unwanted configs is likewise cumbersome.
> > > > 
> > > > I think it's the user responsibility to specify MACHINE_FEATURES += "screen"
> > > > in their local configuration to describe the usage of a graphical display,
> > > > especially for machines not shipped with a built-in one.
> > > 
> > > That's not how it works!
> > > 
> > > All available MACHINE_FEATURES are defined in machine config files. Think of 
> > > those as capabilities. The list defines what this specific machine is capable 
> > > of, but it's up to you to use it or not.
> > > 
> > > That's no different from the rest of them, such as:
> > > acpi, alsa, apm, ext2, ext3, vfat, screen, keyboard, touchscreen, pci, pcmcia, 
> > > phone, serial, usbgadget, usbhost, bluetooth, wifi, x86, kernel26...
> > > 
> > > Note that some of them are really software capabilities, but historically 
> > > were specified in machine configs. And kernel26 has been dropped long ago, 
> > > but is still lingering in places...
> > > 
> > > A distro config, or an image recipe, or even end user via local.conf can 
> > > decide whether to act on those capabilities or not. E.g. It doesn't matter if 
> > > a machine can support 'alsa' audio if you don't need any audio in your image, 
> > > you simply do not install corresponding packages.
> > > 
> > > There are 2 very different approaches. 1) When you are building a reference 
> > > distro and try to be very flexible and do a lot of conditionals based on 
> > > capabilities and features. And 2) when you are making a final product for a 
> > > specific platform, where pretty much everything is predetermined and static.
> > > 
> > > So, if you are making a product, your image recipe should not rely on checking 
> > > available capabilities or features that much, if at all...
> > 
> > Are you suggesting that one must write MACHINE_FEATURES:remove = "screen"
> > if their machine is headless (which is the case for a stock BeagleBone)?
> 
> Beagles are not headless - most of BeagleBoards and BeagleBones have either 
> HDMI, micro-HDMI, DVI-D or can be outfitted with a corresponding cape.
> 
> I was suggesting to move "screen" MACHINE_FEATURE from a generic SoC config 
> to corresponding machine configs.

Sorry I simply missed part of your previous inline reply...

I am indeed in the scenario matching your approach 1), checking available
features allows to maintain a generic image while skipping optional front-end
components like QtWebEngine on machines used headless.

I'll move the 'screen' feature from the SoC to the machine configurations.


Thanks,

	Vivien
