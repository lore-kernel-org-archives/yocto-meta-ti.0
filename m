Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9F040E0027E
	for <meta-ti@yoctoproject.org>; Mon,  8 Oct 2012 13:08:01 -0700 (PDT)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id q98K7vaZ023237;
	Mon, 8 Oct 2012 15:07:57 -0500
Received: from DLEE74.ent.ti.com (dlee74.ent.ti.com [157.170.170.8])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q98K7vOu022537;
	Mon, 8 Oct 2012 15:07:57 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE74.ent.ti.com
	(157.170.170.8) with Microsoft SMTP Server id 14.1.323.3;
	Mon, 8 Oct 2012 15:07:56 -0500
Received: from localhost ([158.218.102.158])	by dlelxv22.itg.ti.com
	(8.13.8/8.13.8) with ESMTP id q98K7ujP014177;
	Mon, 8 Oct 2012 15:07:56 -0500
Date: Mon, 8 Oct 2012 16:07:55 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>
Message-ID: <20121008200754.GA12233@edge>
References: <1349465262-20206-1-git-send-email-fcooper@ti.com>
	<D3A5DC96-05D7-4F45-8580-827F0084EE47@dominion.thruhere.net>
	<7D46E86EC0A8354091174257B2FED1015924C958@DLEE12.ent.ti.com>
	<6838BCB1-04AB-43B5-BB2C-7202FBCE4C24@dominion.thruhere.net>
	<7D46E86EC0A8354091174257B2FED1015924CD5D@DLEE12.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <7D46E86EC0A8354091174257B2FED1015924CD5D@DLEE12.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>, "Reizer,
	Eyal" <eyalr@ti.com>, "Algranati, EYAL" <eyalal@ti.com>
Subject: Re: [PATCH] bt-enable: Add bt-enable recipe
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
X-List-Received-Date: Mon, 08 Oct 2012 20:08:01 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Oct 08, 2012 at 01:31:26PM +0000, Maupin, Chase wrote:
> > -----Original Message-----
> > From: Koen Kooi [mailto:koen@dominion.thruhere.net]
> > Sent: Monday, October 08, 2012 8:05 AM
> > To: Maupin, Chase
> > Cc: Franklin S. Cooper Jr; Reizer, Eyal; Algranati, EYAL; meta-
> > ti@yoctoproject.org
> > Subject: Re: [meta-ti] [PATCH] bt-enable: Add bt-enable recipe
> > 
> > 
> > Op 8 okt. 2012, om 14:09 heeft "Maupin, Chase"
> > <chase.maupin@ti.com> het volgende geschreven:
> > 
> > > Looping in wireless team who can answer that question.
> > >
> > > However, I don't see tis as blocking the acceptance of this
> > recipe but more of feedback on the driver implementation.  Do you
> > see a reason to block the recipe?
> > 
> > I see tons of reasons to block this recipe: duplicate DEPENDS,
> > duplicate PACKAGE_ARCH, wrong ordering of variables, inconsistent
> > whitespace, overriding EXTRA_OEMAKE instead of appending it,
> > introducing another dependency on meta-oe. And that's even
> > without the issue I raised earlier: why do it different from
> > mainline? It looks like this is an 'opkg install unbreak-
> > bluetooth' type of thing and you can't even tell me *why*.
> 
> I looped in the driver maintainers to tell you *why*, so please give them a 
> chance to respond.
> 
> As for the other feedback, thank you.  I'm sure Franklin will find these 
> specifics helpful for correcting his recipe.
> 
> But my initial statement stands.  The structure of the driver should not be 
> what blocks this recipe.  Feedback to the driver owner is useful and 
> appreciated so don't think I'm saying we should ignore that.  Let's focus on 
> the recipe here and let the driver owner have a chance to address issues you 
> see with their driver.
> 
> > Do I need to go on?
> 
> If you have more useful feedback then please do.  Perhaps some specifics on 
> "wrong ordering of variables" and the new "dependency on meta-oe" would be 
> useful.  I see that PLATFORM could possibly be done differently (and should 
> not have both omapl138 and da850-omapl138-evm defined), but I'm afraid I 
> don't see the meta-oe dependency.  Any help you can give here would be 
> appreciated.

Chase,

Franklin already sent the new revision of the patch (although, the last one 
was v2 and the new one is still v2...) with most of the issues fixed.

For the record, here are some specifics you asked:

1. duplicate DEPENDS - module.bbclass already sets it for you
2. duplicate PACKAGE_ARCH - same as above, set in module.bbclass
3. wrong ordering of variables - there are some hard exceptions, but even 
Yocto guys and Richard are not that strict on this matter...
4. inconsistent whitespace - EXTRA_OEMAKE is multi-line, but uses mix of 
spaces and tabs
4a. please note, it is "acceptable" to use tabs for shell-code indentation, 
but not in Python _code_. Also, it is acceptable to use tabs in multi-line 
variables. But please be consistent in using one or another. For simplicity it 
may just be easier to use only spaces...
5. overriding EXTRA_OEMAKE - you might lose framework's default make flags, 
although by default it's just "-e MAKEFLGAS="
6. another dependency on meta-oe - while not obvious, MACHINE_KERNEL_PR is 
really being used by meta-oe:
http://cgit.openembedded.org/meta-openembedded/tree/meta-oe/classes/kernel.bbclass#n24

-- 
Denys


> > >> -----Original Message-----
> > >> From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
> > >> bounces@yoctoproject.org] On Behalf Of Koen Kooi
> > >> Sent: Saturday, October 06, 2012 2:43 AM
> > >> To: Franklin S. Cooper Jr
> > >> Cc: meta-ti@yoctoproject.org
> > >> Subject: Re: [meta-ti] [PATCH] bt-enable: Add bt-enable recipe
> > >>
> > >> Why isn't this using the standard kim platformdata in the
> > kernel?
> > >> That also gives you a nice rfkill interface. That's how all
> > the
> > >> wl127x boards in mainline do it.
> > >>
> > >> Op 5 okt. 2012, om 21:27 heeft Franklin S. Cooper Jr
> > >> <fcooperjr27@gmail.com> het volgende geschreven:
> > >>
> > >>> * Port bt-enable recipe from arago.
> > >>> * Bt-enable is used to enable the BT module on the TI wl12xx
> > >>> Wi-Fi + Bluetooth module.
> > >>>
> > >>> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> > >>> ---
> > >>> Version 2 changes:
> > >>> Loosen up COMPATIBLE_MACHINE restriction. Using generic SOC
> > >> family when
> > >>> possible.
> > >>>
> > >>> ...kefile-Update-makefile-to-work-well-in-OE.patch |   78
> > >> ++++++++++++++++++++
> > >>> recipes-bsp/bt-enable/bt-enable_1.0.bb             |   41
> > >> ++++++++++
> > >>> 2 files changed, 119 insertions(+), 0 deletions(-)
> > >>> create mode 100644 recipes-bsp/bt-enable/bt-enable/0001-
> > >> Makefile-Update-makefile-to-work-well-in-OE.patch
> > >>> create mode 100644 recipes-bsp/bt-enable/bt-enable_1.0.bb
> > >>>
> > >>> diff --git a/recipes-bsp/bt-enable/bt-enable/0001-Makefile-
> > >> Update-makefile-to-work-well-in-OE.patch b/recipes-bsp/bt-
> > >> enable/bt-enable/0001-Makefile-Update-makefile-to-work-well-
> > in-
> > >> OE.patch
> > >>> new file mode 100644
> > >>> index 0000000..7e6756c
> > >>> --- /dev/null
> > >>> +++ b/recipes-bsp/bt-enable/bt-enable/0001-Makefile-Update-
> > >> makefile-to-work-well-in-OE.patch
> > >>> @@ -0,0 +1,78 @@
> > >>> +From a400ac3d83023a66a356d056899d6b380cb30473 Mon Sep 17
> > >> 00:00:00 2001
> > >>> +From: Chase Maupin <Chase.Maupin@ti.com>
> > >>> +Date: Wed, 7 Mar 2012 10:51:43 -0600
> > >>> +Subject: [PATCH] Makefile: Update makefile to work with OE
> > >>> +
> > >>> +* Updated the makefile to with OE
> > >>> +* Use the kernel install target for installing the module
> > >>> +
> > >>> +Upstream-Status: Pending
> > >>> +    * will be in next release
> > >>> +
> > >>> +Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> > >>> +---
> > >>> + Makefile |   45 ++++++++++++++++++++++++++++++++++++++++---
> > --
> > >>> + 1 files changed, 40 insertions(+), 5 deletions(-)
> > >>> +
> > >>> +diff --git a/Makefile b/Makefile
> > >>> +index ebbcd11..b17d33e 100755
> > >>> +--- a/Makefile
> > >>> ++++ b/Makefile
> > >>> +@@ -7,15 +7,50 @@ else
> > >>> +   EXTRA_CFLAGS += -O2
> > >>> + endif
> > >>> +
> > >>> ++-include ../../../Rules.make
> > >>> ++
> > >>> ++# If KERNEL_DIR is not set then use the default in
> > Rules.make
> > >>> ++KERNEL_DIR ?= ${LINUXKERNEL_INSTALL_DIR}
> > >>> ++DEST_DIR ?= ${DESTDIR}
> > >>> ++
> > >>> ++PLATFORM ?= "unknown"
> > >>> ++MACHINE_NAME ?= "unknown"
> > >>> ++
> > >>> ++# Use the PLATFORM value from the Rules.make if it was
> > >> sourced
> > >>> ++ifeq ($(PLATFORM), am335x-evm)
> > >>> ++    MACHINE_NAME := "am335x"
> > >>> ++endif
> > >>> ++ifeq ($(PLATFORM), am180x-evm)
> > >>> ++    MACHINE_NAME := "am1808"
> > >>> ++endif
> > >>> ++ifeq ($(PLATFORM), da850-omapl138-evm)
> > >>> ++    MACHINE_NAME := "am1808"
> > >>> ++endif
> > >>> ++ifeq ($(PLATFORM), am37x-evm)
> > >>> ++    MACHINE_NAME := "omap3evm"
> > >>> ++endif
> > >>> ++
> > >>> ++# If CROSS_COMPILE is not set by Rules.make then set a sane
> > >> default
> > >>> ++CROSS_COMPILE ?= arm-arago-linux-gnueabi-
> > >>> ++export CROSS_COMPILE
> > >>> ++
> > >>> ++# set the INSTALL_MOD_DIR so that the executables won't be
> > >> placed in extra
> > >>> ++INSTALL_MOD_DIR = kernel/drivers/bt_enable
> > >>> ++export INSTALL_MOD_DIR
> > >>> ++
> > >>> + obj-m := gpio_en.o
> > >>> +
> > >>> ++MAKE_ENV = ARCH=arm
> > >>> ++
> > >>> + PWD := $(shell pwd)
> > >>> + all:
> > >>> +-	pwd
> > >>> +-	@echo EXTRA_CFLAGS = $(EXTRA_CFLAGS)
> > >>> +-	$(MAKE) CROSS_COMPILE=$(CROSS_COMPILE) ARCH=$(ARCH)
> > >> EXTRA_CFLAGS="$(EXTRA_CFLAGS)" -C $(KERNEL_DIR) M=$(PWD)
> > modules
> > >>> ++	@cp -f gpio_en_${MACHINE_NAME}.c gpio_en.c
> > >>> ++	$(MAKE) EXTRA_CFLAGS="$(EXTRA_CFLAGS)" -C
> > $(KERNEL_DIR)
> > >> $(MAKE_ENV) \
> > >>> ++    M=$(PWD) modules
> > >>> ++
> > >>> + install:
> > >>> +-	install -d
> > >>
> > ${DEST_DIR}${BASE_LIB_DIR}/modules/${KRNL_VER}/kernel/drivers/bt_
> > >> enable
> > >>> +-	install -m 0755 ./gpio_en.ko
> > >>
> > ${DEST_DIR}${BASE_LIB_DIR}/modules/${KRNL_VER}/kernel/drivers/bt_
> > >> enable
> > >>> ++	$(MAKE) EXTRA_CFLAGS="$(EXTRA_CFLAGS)" -C
> > $(KERNEL_DIR)
> > >> $(MAKE_ENV) \
> > >>> ++    M=$(PWD) INSTALL_MOD_PATH="${DEST_DIR}" modules_install
> > >>> ++
> > >>> + clean:
> > >>> +	rm -rf *.o *~ core .depend .*.cmd *.ko *.mod.c
> > >> .tmp_versions *.symvers
> > >>> +--
> > >>> +1.7.0.4
> > >>> diff --git a/recipes-bsp/bt-enable/bt-enable_1.0.bb
> > b/recipes-
> > >> bsp/bt-enable/bt-enable_1.0.bb
> > >>> new file mode 100644
> > >>> index 0000000..b6f1ee7
> > >>> --- /dev/null
> > >>> +++ b/recipes-bsp/bt-enable/bt-enable_1.0.bb
> > >>> @@ -0,0 +1,41 @@
> > >>> +DESCRIPTION = "BT GPIO Enable"
> > >>> +LICENSE = "BSD"
> > >>> +COMPATIBLE_MACHINE = "omap3|omapl138|da850-omapl138-
> > evm|ti33x"
> > >>> +LIC_FILES_CHKSUM =
> > >>
> > "file://gpio_en_am1808.c;beginline=1;endline=34;md5=fe94639d8f61c
> > >> 867d1bc4bf61473d3cd \
> > >>> +
> > >>
> > file://gpio_en_am335x.c;beginline=1;endline=34;md5=fe94639d8f61c8
> > >> 67d1bc4bf61473d3cd \
> > >>> +
> > >>
> > file://gpio_en_omap3evm.c;beginline=1;endline=34;md5=fe94639d8f61
> > >> c867d1bc4bf61473d3cd \
> > >>> +"
> > >>> +
> > >>> +DEPENDS = "virtual/kernel"
> > >>> +
> > >>> +PACKAGE_ARCH = "${MACHINE_ARCH}"
> > >>> +
> > >>> +PACKAGE_STRIP = "no"
> > >>> +
> > >>> +inherit module
> > >>> +
> > >>> +MACHINE_KERNEL_PR_append = "a"
> > >>> +PR = "r0+gitr${SRCREV}"
> > >>> +
> > >>> +SRCREV = "97c4600ff7d39f1cc6079939248cd9ed15100db4"
> > >>> +
> > >>> +SRC_URI = "git://github.com/TI-
> > ECS/bt_enable.git;protocol=git
> > >> \
> > >>> +           file://0001-Makefile-Update-makefile-to-work-
> > well-
> > >> in-OE.patch \
> > >>> +          "
> > >>> +
> > >>> +PLATFORM = "unknown"
> > >>> +PLATFORM_ti33x = "am335x-evm"
> > >>> +PLATFORM_omap3 = "am37x-evm"
> > >>> +PLATFORM_omapl138 = "am180x-evm"
> > >>> +PLATFORM_da850-omapl138-evm = "am180x-evm"
> > >>> +
> > >>> +S = "${WORKDIR}/git"
> > >>> +
> > >>> +EXTRA_OEMAKE = " \
> > >>> +	KERNEL_DIR=${STAGING_KERNEL_DIR} \
> > >>> +    PLATFORM=${PLATFORM} \
> > >>> +"
> > >>> +
> > >>> +do_install () {
> > >>> +	oe_runmake 'DEST_DIR=${D}' install
> > >>> +}
> > >>> --
> > >>> 1.7.0.4
> > >>>
> > >>> _______________________________________________
> > >>> meta-ti mailing list
> > >>> meta-ti@yoctoproject.org
> > >>> https://lists.yoctoproject.org/listinfo/meta-ti
> > >>
> > >> _______________________________________________
> > >> meta-ti mailing list
> > >> meta-ti@yoctoproject.org
> > >> https://lists.yoctoproject.org/listinfo/meta-ti
> 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

