Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ea0-f176.google.com (mail-ea0-f176.google.com
	[209.85.215.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BB545E012F0
	for <meta-ti@yoctoproject.org>; Mon,  8 Oct 2012 06:04:55 -0700 (PDT)
Received: by mail-ea0-f176.google.com with SMTP id n12so194646eaa.35
	for <meta-ti@yoctoproject.org>; Mon, 08 Oct 2012 06:04:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=Cb5IEaYEOWdN8Aw8w284+9fchL1olBg4uEeScnasuuM=;
	b=VJaRdz3nxHOSuFR63a+MBYqZngxz/IQ0txIPKTVR9JhkJq6WsliwkW0b1nF0Li8lCr
	cq5s/gES2SiIZrOoYmsiQQRKDxez9ps1O42cQhcTtQ/LGf9aS/CdcIHpUzxGXK4DLxnt
	G+y6GfeDcdJaw/sZ2hqJzKSwobLQAXLBO1OZAZsCF8fgYm4YFfR/o6QexVhOGLbKokDr
	uuHckwTStRZfu50VxrxQgPmcJnPp7wYBVfAADvVfqrPJi6BU60d1si3mQRVTJVemA0k5
	AGRWCM3OuQI9qKFWZyfALkPCRP7wke7NzfqHCC2A4J1KY5NrzqMe83VTUlUZE0Fzio7r
	8Nrg==
Received: by 10.14.209.129 with SMTP id s1mr22497344eeo.24.1349701492134;
	Mon, 08 Oct 2012 06:04:52 -0700 (PDT)
Received: from [172.20.0.10] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id g5sm29613999eem.4.2012.10.08.06.04.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 08 Oct 2012 06:04:50 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.1 \(1498\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <7D46E86EC0A8354091174257B2FED1015924C958@DLEE12.ent.ti.com>
Date: Mon, 8 Oct 2012 15:04:49 +0200
Message-Id: <6838BCB1-04AB-43B5-BB2C-7202FBCE4C24@dominion.thruhere.net>
References: <1349465262-20206-1-git-send-email-fcooper@ti.com>
	<D3A5DC96-05D7-4F45-8580-827F0084EE47@dominion.thruhere.net>
	<7D46E86EC0A8354091174257B2FED1015924C958@DLEE12.ent.ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>
X-Mailer: Apple Mail (2.1498)
X-Gm-Message-State: ALoCoQkfuL2xQ2MK8bSDdvho6rs7SKUWAT+kyAma4HGpxsGvYfGneLgmoITv8xuM6g/7qneMG9UA
Cc: "Reizer, Eyal" <eyalr@ti.com>,
	"meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>,
	"Algranati, EYAL" <eyalal@ti.com>
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
X-List-Received-Date: Mon, 08 Oct 2012 13:04:56 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 8 okt. 2012, om 14:09 heeft "Maupin, Chase" <chase.maupin@ti.com> het =
volgende geschreven:

> Looping in wireless team who can answer that question.
>=20
> However, I don't see tis as blocking the acceptance of this recipe but =
more of feedback on the driver implementation.  Do you see a reason to =
block the recipe?

I see tons of reasons to block this recipe: duplicate DEPENDS, duplicate =
PACKAGE_ARCH, wrong ordering of variables, inconsistent whitespace, =
overriding EXTRA_OEMAKE instead of appending it, introducing another =
dependency on meta-oe. And that's even without the issue I raised =
earlier: why do it different from mainline? It looks like this is an =
'opkg install unbreak-bluetooth' type of thing and you can't even tell =
me *why*.

Do I need to go on?

>=20
>> -----Original Message-----
>> From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
>> bounces@yoctoproject.org] On Behalf Of Koen Kooi
>> Sent: Saturday, October 06, 2012 2:43 AM
>> To: Franklin S. Cooper Jr
>> Cc: meta-ti@yoctoproject.org
>> Subject: Re: [meta-ti] [PATCH] bt-enable: Add bt-enable recipe
>>=20
>> Why isn't this using the standard kim platformdata in the kernel?
>> That also gives you a nice rfkill interface. That's how all the
>> wl127x boards in mainline do it.
>>=20
>> Op 5 okt. 2012, om 21:27 heeft Franklin S. Cooper Jr
>> <fcooperjr27@gmail.com> het volgende geschreven:
>>=20
>>> * Port bt-enable recipe from arago.
>>> * Bt-enable is used to enable the BT module on the TI wl12xx
>>> Wi-Fi + Bluetooth module.
>>>=20
>>> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
>>> ---
>>> Version 2 changes:
>>> Loosen up COMPATIBLE_MACHINE restriction. Using generic SOC
>> family when
>>> possible.
>>>=20
>>> ...kefile-Update-makefile-to-work-well-in-OE.patch |   78
>> ++++++++++++++++++++
>>> recipes-bsp/bt-enable/bt-enable_1.0.bb             |   41
>> ++++++++++
>>> 2 files changed, 119 insertions(+), 0 deletions(-)
>>> create mode 100644 recipes-bsp/bt-enable/bt-enable/0001-
>> Makefile-Update-makefile-to-work-well-in-OE.patch
>>> create mode 100644 recipes-bsp/bt-enable/bt-enable_1.0.bb
>>>=20
>>> diff --git a/recipes-bsp/bt-enable/bt-enable/0001-Makefile-
>> Update-makefile-to-work-well-in-OE.patch b/recipes-bsp/bt-
>> enable/bt-enable/0001-Makefile-Update-makefile-to-work-well-in-
>> OE.patch
>>> new file mode 100644
>>> index 0000000..7e6756c
>>> --- /dev/null
>>> +++ b/recipes-bsp/bt-enable/bt-enable/0001-Makefile-Update-
>> makefile-to-work-well-in-OE.patch
>>> @@ -0,0 +1,78 @@
>>> +=46rom a400ac3d83023a66a356d056899d6b380cb30473 Mon Sep 17
>> 00:00:00 2001
>>> +From: Chase Maupin <Chase.Maupin@ti.com>
>>> +Date: Wed, 7 Mar 2012 10:51:43 -0600
>>> +Subject: [PATCH] Makefile: Update makefile to work with OE
>>> +
>>> +* Updated the makefile to with OE
>>> +* Use the kernel install target for installing the module
>>> +
>>> +Upstream-Status: Pending
>>> +    * will be in next release
>>> +
>>> +Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
>>> +---
>>> + Makefile |   45 ++++++++++++++++++++++++++++++++++++++++-----
>>> + 1 files changed, 40 insertions(+), 5 deletions(-)
>>> +
>>> +diff --git a/Makefile b/Makefile
>>> +index ebbcd11..b17d33e 100755
>>> +--- a/Makefile
>>> ++++ b/Makefile
>>> +@@ -7,15 +7,50 @@ else
>>> +   EXTRA_CFLAGS +=3D -O2
>>> + endif
>>> +
>>> ++-include ../../../Rules.make
>>> ++
>>> ++# If KERNEL_DIR is not set then use the default in Rules.make
>>> ++KERNEL_DIR ?=3D ${LINUXKERNEL_INSTALL_DIR}
>>> ++DEST_DIR ?=3D ${DESTDIR}
>>> ++
>>> ++PLATFORM ?=3D "unknown"
>>> ++MACHINE_NAME ?=3D "unknown"
>>> ++
>>> ++# Use the PLATFORM value from the Rules.make if it was
>> sourced
>>> ++ifeq ($(PLATFORM), am335x-evm)
>>> ++    MACHINE_NAME :=3D "am335x"
>>> ++endif
>>> ++ifeq ($(PLATFORM), am180x-evm)
>>> ++    MACHINE_NAME :=3D "am1808"
>>> ++endif
>>> ++ifeq ($(PLATFORM), da850-omapl138-evm)
>>> ++    MACHINE_NAME :=3D "am1808"
>>> ++endif
>>> ++ifeq ($(PLATFORM), am37x-evm)
>>> ++    MACHINE_NAME :=3D "omap3evm"
>>> ++endif
>>> ++
>>> ++# If CROSS_COMPILE is not set by Rules.make then set a sane
>> default
>>> ++CROSS_COMPILE ?=3D arm-arago-linux-gnueabi-
>>> ++export CROSS_COMPILE
>>> ++
>>> ++# set the INSTALL_MOD_DIR so that the executables won't be
>> placed in extra
>>> ++INSTALL_MOD_DIR =3D kernel/drivers/bt_enable
>>> ++export INSTALL_MOD_DIR
>>> ++
>>> + obj-m :=3D gpio_en.o
>>> +
>>> ++MAKE_ENV =3D ARCH=3Darm
>>> ++
>>> + PWD :=3D $(shell pwd)
>>> + all:
>>> +-	pwd
>>> +-	@echo EXTRA_CFLAGS =3D $(EXTRA_CFLAGS)
>>> +-	$(MAKE) CROSS_COMPILE=3D$(CROSS_COMPILE) ARCH=3D$(ARCH)
>> EXTRA_CFLAGS=3D"$(EXTRA_CFLAGS)" -C $(KERNEL_DIR) M=3D$(PWD) modules
>>> ++	@cp -f gpio_en_${MACHINE_NAME}.c gpio_en.c
>>> ++	$(MAKE) EXTRA_CFLAGS=3D"$(EXTRA_CFLAGS)" -C $(KERNEL_DIR)
>> $(MAKE_ENV) \
>>> ++    M=3D$(PWD) modules
>>> ++
>>> + install:
>>> +-	install -d
>> ${DEST_DIR}${BASE_LIB_DIR}/modules/${KRNL_VER}/kernel/drivers/bt_
>> enable
>>> +-	install -m 0755 ./gpio_en.ko
>> ${DEST_DIR}${BASE_LIB_DIR}/modules/${KRNL_VER}/kernel/drivers/bt_
>> enable
>>> ++	$(MAKE) EXTRA_CFLAGS=3D"$(EXTRA_CFLAGS)" -C $(KERNEL_DIR)
>> $(MAKE_ENV) \
>>> ++    M=3D$(PWD) INSTALL_MOD_PATH=3D"${DEST_DIR}" modules_install
>>> ++
>>> + clean:
>>> +	rm -rf *.o *~ core .depend .*.cmd *.ko *.mod.c
>> .tmp_versions *.symvers
>>> +--
>>> +1.7.0.4
>>> diff --git a/recipes-bsp/bt-enable/bt-enable_1.0.bb b/recipes-
>> bsp/bt-enable/bt-enable_1.0.bb
>>> new file mode 100644
>>> index 0000000..b6f1ee7
>>> --- /dev/null
>>> +++ b/recipes-bsp/bt-enable/bt-enable_1.0.bb
>>> @@ -0,0 +1,41 @@
>>> +DESCRIPTION =3D "BT GPIO Enable"
>>> +LICENSE =3D "BSD"
>>> +COMPATIBLE_MACHINE =3D "omap3|omapl138|da850-omapl138-evm|ti33x"
>>> +LIC_FILES_CHKSUM =3D
>> "file://gpio_en_am1808.c;beginline=3D1;endline=3D34;md5=3Dfe94639d8f61c=

>> 867d1bc4bf61473d3cd \
>>> +
>> file://gpio_en_am335x.c;beginline=3D1;endline=3D34;md5=3Dfe94639d8f61c8=

>> 67d1bc4bf61473d3cd \
>>> +
>> file://gpio_en_omap3evm.c;beginline=3D1;endline=3D34;md5=3Dfe94639d8f61=

>> c867d1bc4bf61473d3cd \
>>> +"
>>> +
>>> +DEPENDS =3D "virtual/kernel"
>>> +
>>> +PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>>> +
>>> +PACKAGE_STRIP =3D "no"
>>> +
>>> +inherit module
>>> +
>>> +MACHINE_KERNEL_PR_append =3D "a"
>>> +PR =3D "r0+gitr${SRCREV}"
>>> +
>>> +SRCREV =3D "97c4600ff7d39f1cc6079939248cd9ed15100db4"
>>> +
>>> +SRC_URI =3D "git://github.com/TI-ECS/bt_enable.git;protocol=3Dgit
>> \
>>> +           file://0001-Makefile-Update-makefile-to-work-well-
>> in-OE.patch \
>>> +          "
>>> +
>>> +PLATFORM =3D "unknown"
>>> +PLATFORM_ti33x =3D "am335x-evm"
>>> +PLATFORM_omap3 =3D "am37x-evm"
>>> +PLATFORM_omapl138 =3D "am180x-evm"
>>> +PLATFORM_da850-omapl138-evm =3D "am180x-evm"
>>> +
>>> +S =3D "${WORKDIR}/git"
>>> +
>>> +EXTRA_OEMAKE =3D " \
>>> +	KERNEL_DIR=3D${STAGING_KERNEL_DIR} \
>>> +    PLATFORM=3D${PLATFORM} \
>>> +"
>>> +
>>> +do_install () {
>>> +	oe_runmake 'DEST_DIR=3D${D}' install
>>> +}
>>> --
>>> 1.7.0.4
>>>=20
>>> _______________________________________________
>>> meta-ti mailing list
>>> meta-ti@yoctoproject.org
>>> https://lists.yoctoproject.org/listinfo/meta-ti
>>=20
>> _______________________________________________
>> meta-ti mailing list
>> meta-ti@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-ti


