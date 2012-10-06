Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ee0-f48.google.com (mail-ee0-f48.google.com [74.125.83.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 77BA6E00293
	for <meta-ti@yoctoproject.org>; Sat,  6 Oct 2012 00:43:27 -0700 (PDT)
Received: by mail-ee0-f48.google.com with SMTP id b45so2084808eek.35
	for <meta-ti@yoctoproject.org>; Sat, 06 Oct 2012 00:43:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=EgYeXS271NX465/YeLK4XlYzOuNGHfR4LThAI2PfaMI=;
	b=kEFg4kj4/WZbZ11KuY2OSDKJa6XYGOJ4U87b2sKzP6E2O3/5Q7weegntv2BYb2XzDn
	fx0hqYpV1GdEyubQtrHOL/m+7VX7JubylZldiBZ33dInGjKqBDR//8AGyyxoUJugpDMT
	3vLz+qZoO0ORg6+2xduhXFAhfKa3hzeomPGgYnNkIF4Hq97GsQFpHYhf36EFqEv4RaXI
	wUEN+e0GolAY6ra4ru/p4Uc2bjAAn2eQ//n6zr4j/CRsK5Yv2s2YYshq2vBW7BmLFr3b
	CT3qMtnGmZtZ7xqaJwuwUuo+M0Dhl9gX2QBFOzJBvW/1yUqwiBrDdSWdyXboJyYyDvUp
	FBXA==
Received: by 10.14.176.66 with SMTP id a42mr16100157eem.1.1349509405997;
	Sat, 06 Oct 2012 00:43:25 -0700 (PDT)
Received: from [172.20.0.10] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id m42sm21806479eep.16.2012.10.06.00.43.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 06 Oct 2012 00:43:24 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.1 \(1498\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1349465262-20206-1-git-send-email-fcooper@ti.com>
Date: Sat, 6 Oct 2012 09:43:21 +0200
Message-Id: <D3A5DC96-05D7-4F45-8580-827F0084EE47@dominion.thruhere.net>
References: <1349465262-20206-1-git-send-email-fcooper@ti.com>
To: Franklin S. Cooper Jr <fcooperjr27@gmail.com>
X-Mailer: Apple Mail (2.1498)
X-Gm-Message-State: ALoCoQnVAf/JfwFpr+rTogjLf/CMViqy+rKlsQOflZwsai2CSpf+MqY/jBA+jqGHqFu5mP2lRFOX
Cc: meta-ti@yoctoproject.org
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
X-List-Received-Date: Sat, 06 Oct 2012 07:43:27 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Why isn't this using the standard kim platformdata in the kernel? That =
also gives you a nice rfkill interface. That's how all the wl127x boards =
in mainline do it.

Op 5 okt. 2012, om 21:27 heeft Franklin S. Cooper Jr =
<fcooperjr27@gmail.com> het volgende geschreven:

> * Port bt-enable recipe from arago.
> * Bt-enable is used to enable the BT module on the TI wl12xx
>  Wi-Fi + Bluetooth module.
>=20
> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> ---
> Version 2 changes:
> Loosen up COMPATIBLE_MACHINE restriction. Using generic SOC family =
when
> possible.
>=20
> ...kefile-Update-makefile-to-work-well-in-OE.patch |   78 =
++++++++++++++++++++
> recipes-bsp/bt-enable/bt-enable_1.0.bb             |   41 ++++++++++
> 2 files changed, 119 insertions(+), 0 deletions(-)
> create mode 100644 =
recipes-bsp/bt-enable/bt-enable/0001-Makefile-Update-makefile-to-work-well=
-in-OE.patch
> create mode 100644 recipes-bsp/bt-enable/bt-enable_1.0.bb
>=20
> diff --git =
a/recipes-bsp/bt-enable/bt-enable/0001-Makefile-Update-makefile-to-work-we=
ll-in-OE.patch =
b/recipes-bsp/bt-enable/bt-enable/0001-Makefile-Update-makefile-to-work-we=
ll-in-OE.patch
> new file mode 100644
> index 0000000..7e6756c
> --- /dev/null
> +++ =
b/recipes-bsp/bt-enable/bt-enable/0001-Makefile-Update-makefile-to-work-we=
ll-in-OE.patch
> @@ -0,0 +1,78 @@
> +=46rom a400ac3d83023a66a356d056899d6b380cb30473 Mon Sep 17 00:00:00 =
2001
> +From: Chase Maupin <Chase.Maupin@ti.com>
> +Date: Wed, 7 Mar 2012 10:51:43 -0600
> +Subject: [PATCH] Makefile: Update makefile to work with OE
> +
> +* Updated the makefile to with OE
> +* Use the kernel install target for installing the module
> +
> +Upstream-Status: Pending
> +    * will be in next release
> +
> +Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> +---
> + Makefile |   45 ++++++++++++++++++++++++++++++++++++++++-----
> + 1 files changed, 40 insertions(+), 5 deletions(-)
> +
> +diff --git a/Makefile b/Makefile
> +index ebbcd11..b17d33e 100755
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -7,15 +7,50 @@ else
> +   EXTRA_CFLAGS +=3D -O2
> + endif
> +
> ++-include ../../../Rules.make
> ++
> ++# If KERNEL_DIR is not set then use the default in Rules.make
> ++KERNEL_DIR ?=3D ${LINUXKERNEL_INSTALL_DIR}
> ++DEST_DIR ?=3D ${DESTDIR}
> ++
> ++PLATFORM ?=3D "unknown"
> ++MACHINE_NAME ?=3D "unknown"
> ++
> ++# Use the PLATFORM value from the Rules.make if it was sourced
> ++ifeq ($(PLATFORM), am335x-evm)
> ++    MACHINE_NAME :=3D "am335x"
> ++endif
> ++ifeq ($(PLATFORM), am180x-evm)
> ++    MACHINE_NAME :=3D "am1808"
> ++endif
> ++ifeq ($(PLATFORM), da850-omapl138-evm)
> ++    MACHINE_NAME :=3D "am1808"
> ++endif
> ++ifeq ($(PLATFORM), am37x-evm)
> ++    MACHINE_NAME :=3D "omap3evm"
> ++endif
> ++
> ++# If CROSS_COMPILE is not set by Rules.make then set a sane default
> ++CROSS_COMPILE ?=3D arm-arago-linux-gnueabi-
> ++export CROSS_COMPILE
> ++
> ++# set the INSTALL_MOD_DIR so that the executables won't be placed in =
extra
> ++INSTALL_MOD_DIR =3D kernel/drivers/bt_enable
> ++export INSTALL_MOD_DIR
> ++
> + obj-m :=3D gpio_en.o
> +
> ++MAKE_ENV =3D ARCH=3Darm
> ++
> + PWD :=3D $(shell pwd)
> + all:
> +-	pwd
> +-	@echo EXTRA_CFLAGS =3D $(EXTRA_CFLAGS)
> +-	$(MAKE) CROSS_COMPILE=3D$(CROSS_COMPILE) ARCH=3D$(ARCH) =
EXTRA_CFLAGS=3D"$(EXTRA_CFLAGS)" -C $(KERNEL_DIR) M=3D$(PWD) modules
> ++	@cp -f gpio_en_${MACHINE_NAME}.c gpio_en.c
> ++	$(MAKE) EXTRA_CFLAGS=3D"$(EXTRA_CFLAGS)" -C $(KERNEL_DIR) =
$(MAKE_ENV) \
> ++    M=3D$(PWD) modules
> ++
> + install:
> +-	install -d =
${DEST_DIR}${BASE_LIB_DIR}/modules/${KRNL_VER}/kernel/drivers/bt_enable
> +-	install -m 0755 ./gpio_en.ko =
${DEST_DIR}${BASE_LIB_DIR}/modules/${KRNL_VER}/kernel/drivers/bt_enable
> ++	$(MAKE) EXTRA_CFLAGS=3D"$(EXTRA_CFLAGS)" -C $(KERNEL_DIR) =
$(MAKE_ENV) \
> ++    M=3D$(PWD) INSTALL_MOD_PATH=3D"${DEST_DIR}" modules_install
> ++
> + clean:
> +	rm -rf *.o *~ core .depend .*.cmd *.ko *.mod.c .tmp_versions =
*.symvers
> +--
> +1.7.0.4
> diff --git a/recipes-bsp/bt-enable/bt-enable_1.0.bb =
b/recipes-bsp/bt-enable/bt-enable_1.0.bb
> new file mode 100644
> index 0000000..b6f1ee7
> --- /dev/null
> +++ b/recipes-bsp/bt-enable/bt-enable_1.0.bb
> @@ -0,0 +1,41 @@
> +DESCRIPTION =3D "BT GPIO Enable"
> +LICENSE =3D "BSD"
> +COMPATIBLE_MACHINE =3D "omap3|omapl138|da850-omapl138-evm|ti33x"
> +LIC_FILES_CHKSUM =3D =
"file://gpio_en_am1808.c;beginline=3D1;endline=3D34;md5=3Dfe94639d8f61c867=
d1bc4bf61473d3cd \
> +                    =
file://gpio_en_am335x.c;beginline=3D1;endline=3D34;md5=3Dfe94639d8f61c867d=
1bc4bf61473d3cd \
> +                    =
file://gpio_en_omap3evm.c;beginline=3D1;endline=3D34;md5=3Dfe94639d8f61c86=
7d1bc4bf61473d3cd \
> +"
> +
> +DEPENDS =3D "virtual/kernel"
> +
> +PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> +
> +PACKAGE_STRIP =3D "no"
> +
> +inherit module
> +
> +MACHINE_KERNEL_PR_append =3D "a"
> +PR =3D "r0+gitr${SRCREV}"
> +
> +SRCREV =3D "97c4600ff7d39f1cc6079939248cd9ed15100db4"
> +
> +SRC_URI =3D "git://github.com/TI-ECS/bt_enable.git;protocol=3Dgit \
> +           =
file://0001-Makefile-Update-makefile-to-work-well-in-OE.patch \
> +          "
> +
> +PLATFORM =3D "unknown"
> +PLATFORM_ti33x =3D "am335x-evm"
> +PLATFORM_omap3 =3D "am37x-evm"
> +PLATFORM_omapl138 =3D "am180x-evm"
> +PLATFORM_da850-omapl138-evm =3D "am180x-evm"
> +
> +S =3D "${WORKDIR}/git"
> +
> +EXTRA_OEMAKE =3D " \
> +	KERNEL_DIR=3D${STAGING_KERNEL_DIR} \
> +    PLATFORM=3D${PLATFORM} \
> +"
> +
> +do_install () {
> +	oe_runmake 'DEST_DIR=3D${D}' install
> +}
> --=20
> 1.7.0.4
>=20
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti


