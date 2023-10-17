Return-Path: <res.sapp@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10A18CDB465
	for <webhook@archiver.kernel.org>; Tue, 17 Oct 2023 02:21:45 +0000 (UTC)
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
 by mx.groups.io with SMTP id smtpd.web10.199017.1697509297613147171
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 16 Oct 2023 19:21:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KqqJze/v;
 spf=pass (domain: gmail.com, ip: 209.85.210.41, mailfrom: res.sapp@gmail.com)
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-6c7ce16ddfaso3609640a34.3
        for <meta-ti@lists.yoctoproject.org>; Mon, 16 Oct 2023 19:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697509297; x=1698114097; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UcToXYBoYVba4A+3flTojoGNPdZRWJxoF4tDsyABaDg=;
        b=KqqJze/vOdvhEz4rO4hqWwKnAoXikroH9vFdfFS7WsO8XmPOyYSmJ4MSVL0ylTBZYP
         3/UUcbeBGOZlu5c8uH3M7AqQy4mowohLYRajCKh2NrCIipUkJxRUKZNHx9q+dahYskvL
         tR+ZztIISG0D1XJirGhF4a8vJ5/PdfGOcBHfQ45qsmfHmP2+AkDnOULwH1Np5gM8OAIp
         Y3mlswZP5VxO7wWRkfYPDsTJwfywWJr49BGILDKniXbqQIFtRGFdrhHERRPjHYYjukaW
         PqUIbobmM7cnjsf6YNOANoz4SoCfg6FQD6iEPKWUT8nd3LHpc37uY7X/4ku76au/DHBc
         EotA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697509297; x=1698114097;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UcToXYBoYVba4A+3flTojoGNPdZRWJxoF4tDsyABaDg=;
        b=qIXf7Ahc509bRklPqBmz2b4AOdXDZSuEpitgeZHaY38PJfzoiYIN160rVB3NiMHbzy
         ETbN9PqfHgUF3m4p620EpEto/IYN+z2MZ5N/oAsdc/Pca8XW5zgw8Zi2Q7AH89YOPUvQ
         AljKsG4dFHg66WFhZOK2wN49jgtjBIbWjc7fOJr+Bg4sdFgamFZLcyAu4pnMWVPl7kkc
         H/v7tsbKvRuK74FgGAB3mJeevS1D1qRTsk7ihM526lkRPZ0T1uqwjS5F78f1OdUS3GKO
         8BvIrjSaYv89QIIYwiFk9h6f5U/6lJ4UBa/LwjOMTrR4l5AIYMF+F/q5V4ev4Z1qtpuK
         iwpg==
X-Gm-Message-State: AOJu0Yyda6E56+IiO/aub4MDttub9Pde9Oi/B3vXggj8q6DYSCe/yy9z
	XXAeTvQ5oKvTmIVAH8Mdk1KaoiQKdFk=
X-Google-Smtp-Source: AGHT+IE8VmcIv7zNh+B52+BqIKlpHaaA+shtjiOKAqw42rwi6wnIiHBPyeH005zNKn/akX07wyMHRQ==
X-Received: by 2002:a05:6871:a288:b0:1e9:9a22:feb with SMTP id vv8-20020a056871a28800b001e99a220febmr869719oab.42.1697509296681;
        Mon, 16 Oct 2023 19:21:36 -0700 (PDT)
Received: from ?IPV6:2600:1700:eec4:a85f::3? ([2600:1700:eec4:a85f::3])
        by smtp.gmail.com with ESMTPSA id dx45-20020a05687076ad00b001d4d8efa7f9sm97249oab.4.2023.10.16.19.21.36
        for <meta-ti@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Oct 2023 19:21:36 -0700 (PDT)
Message-ID: <feefdf90-687d-4e5e-ad2c-2c714ecc3b61@gmail.com>
Date: Mon, 16 Oct 2023 21:21:35 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][kirkstone][PATCHv2 1/3] ti-sgx-ddk-*: version bump to
 support kirkstone
To: meta-ti@lists.yoctoproject.org
References: <20231017002958.1762487-1-rs@ti.com>
 <20231017002958.1762487-2-rs@ti.com>
Content-Language: en-US, en-US-large
From: Res Sapp <res.sapp@gmail.com>
In-Reply-To: <20231017002958.1762487-2-rs@ti.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 17 Oct 2023 02:21:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17126

On 10/16/23 19:29, Randolph Sapp via lists.yoctoproject.org wrote:
> From: Randolph Sapp <rs@ti.com>
> 
> Bump ti-sgx-ddk-um and ti-sgx-ddk-km to the new branch for Kirkstone and
> mesa independent builds. This also sets up SGX to use the latest mesa
> revision rogue uses.
> 
> Changelog:
> 
>   - IMG Support has officially ended. This repo will not be getting
>     regular updates after this unless things are really broken.
>   - The Mesa patches which were previously being relicensed internally
>     were opened and combined with the unofficial rogue efforts on
>     freedesktop.
>   - Toolchains were upgraded and multiple warnings and issues were
>     addressed. Hardware recoveries work now, but there are still some
>     longstanding issues with SGX that remain to be addressed if further
>     resources are set aside for that.
>   - We moved to an lws-generic build target to avoid rebuilding external
>     components. As such, these external components must be patched as
>     needed. Libdrm is an example of this and the required patches can be
>     found in meta-ti.
> 
> Known bugs:
> 
>   - Buffer allocations under Weston may misbehave
>   - GLSL macro redefinitions will cause errors regardless of whether or
>     not they are identical
> 
> Signed-off-by: Randolph Sapp <rs@ti.com>
> ---
>   .../ti-img-rogue-driver_23.1.6404501.bb       |  2 +-
>   .../ti-sgx-ddk-km_1.17.4948957.bb             | 27 +++++-----
>   .../ti-sgx-ddk-um/pvrsrvkm.rules              |  1 -
>   .../ti-sgx-ddk-um_1.17.4948957.bb             | 53 +++++++------------
>   4 files changed, 33 insertions(+), 50 deletions(-)
>   delete mode 100644 meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-sgx-ddk-um/pvrsrvkm.rules
> 
> diff --git a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.1.6404501.bb b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.1.6404501.bb
> index 10f3b727..a708f237 100644
> --- a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.1.6404501.bb
> +++ b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.1.6404501.bb
> @@ -22,7 +22,7 @@ SRC_URI = "git://git.ti.com/git/graphics/ti-img-rogue-driver.git;protocol=https;
>   
>   S = "${WORKDIR}/git"
>   
> -SRCREV = "c0adc3c36f4a0b2f590abfe0609b03096d58c648"
> +SRCREV = "2cb2c9609b7740cb2c348e669a96f26e1cc858da"
>   
>   TARGET_PRODUCT:j721e = "j721e_linux"
>   TARGET_PRODUCT:j721s2 = "j721s2_linux"

Rats. Wrong driver. v3 to fix this.

> diff --git a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
> index bf4fa98a..5914e412 100644
> --- a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
> +++ b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
> @@ -1,7 +1,7 @@
>   DESCRIPTION =  "Kernel drivers for the PowerVR SGX chipset found in the TI SoCs"
>   HOMEPAGE = "https://git.ti.com/graphics/omap5-sgx-ddk-linux"
>   LICENSE = "MIT | GPL-2.0-only"
> -LIC_FILES_CHKSUM = "file://eurasia_km/README;beginline=13;endline=22;md5=74506d9b8e5edbce66c2747c50fcef12"
> +LIC_FILES_CHKSUM = "file://GPL-COPYING;md5=60422928ba677faaa13d6ab5f5baaa1e"
>   
>   inherit module
>   
> @@ -16,33 +16,30 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
>   
>   DEPENDS = "virtual/kernel"
>   
> -BRANCH = "ti-img-sgx/${PV}/k5.10"
> +BRANCH = "${PV}/mesa/k6.1"
>   
>   SRC_URI = "git://git.ti.com/git/graphics/omap5-sgx-ddk-linux.git;protocol=https;branch=${BRANCH}"
>   
>   S = "${WORKDIR}/git"
>   
> -SRCREV = "eda7780bfd5277e16913c9bc0b0e6892b4e79063"
> +SRCREV = "e1bbee4d3f7cfedbce3f78a4ac432096f92b858c"
>   
> -TARGET_PRODUCT:omap-a15 = "jacinto6evm"
> -TARGET_PRODUCT:ti33x = "ti335x"
> -TARGET_PRODUCT:ti43x = "ti437x"
> -TARGET_PRODUCT:am65xx = "ti654x"
> +TARGET_PRODUCT:omap-a15 = "ti572x_linux"
> +TARGET_PRODUCT:ti33x = "ti335x_linux"
> +TARGET_PRODUCT:ti43x = "ti437x_linux"
> +TARGET_PRODUCT:am65xx = "ti654x_linux"
>   PVR_BUILD = "release"
> -PVR_WS = "nulldrmws"
> +PVR_WS = "lws-generic"
>   
> -EXTRA_OEMAKE += 'KERNELDIR="${STAGING_KERNEL_DIR}" BUILD=${PVR_BUILD} TARGET_PRODUCT=${TARGET_PRODUCT} WINDOW_SYSTEM=${PVR_WS}'
> -
> -do_compile:prepend() {
> -    cd ${S}/eurasia_km/eurasiacon/build/linux2/omap_linux
> -}
> +EXTRA_OEMAKE += 'KERNELDIR="${STAGING_KERNEL_DIR}" BUILD=${PVR_BUILD} \
> +WINDOW_SYSTEM=${PVR_WS} PVR_BUILD_DIR=${TARGET_PRODUCT}'
>   
>   do_install() {
> -    make -C ${STAGING_KERNEL_DIR} M=${B}/eurasia_km/eurasiacon/binary_omap_linux_${PVR_WS}_${PVR_BUILD}/target_armhf/kbuild INSTALL_MOD_PATH=${D}${root_prefix} PREFIX=${STAGING_DIR_HOST} modules_install
> +    make -C ${STAGING_KERNEL_DIR} M=${B}/eurasiacon/binary_${TARGET_PRODUCT}_${PVR_WS}_${PVR_BUILD}/target_armhf/kbuild INSTALL_MOD_PATH=${D}${root_prefix} PREFIX=${STAGING_DIR_HOST} modules_install
>   }
>   
>   do_install:am65xx() {
> -    make -C ${STAGING_KERNEL_DIR} M=${B}/eurasia_km/eurasiacon/binary_omap_linux_${PVR_WS}_${PVR_BUILD}/target_aarch64/kbuild INSTALL_MOD_PATH=${D}${root_prefix} PREFIX=${STAGING_DIR_HOST} modules_install
> +    make -C ${STAGING_KERNEL_DIR} M=${B}/eurasiacon/binary_${TARGET_PRODUCT}_${PVR_WS}_${PVR_BUILD}/target_aarch64/kbuild INSTALL_MOD_PATH=${D}${root_prefix} PREFIX=${STAGING_DIR_HOST} modules_install
>   }
>   
>   RRECOMMENDS:${PN} += "ti-sgx-ddk-um"
> diff --git a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-sgx-ddk-um/pvrsrvkm.rules b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-sgx-ddk-um/pvrsrvkm.rules
> deleted file mode 100644
> index e49fd9b8..00000000
> --- a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-sgx-ddk-um/pvrsrvkm.rules
> +++ /dev/null
> @@ -1 +0,0 @@
> -SUBSYSTEM=="platform", ACTION=="bind", ENV{DRIVER}=="pvrsrvkm", RUN+="/usr/bin/pvrsrvctl --start --no-module"
> diff --git a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-sgx-ddk-um_1.17.4948957.bb b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-sgx-ddk-um_1.17.4948957.bb
> index 755cc4f5..d2565318 100644
> --- a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-sgx-ddk-um_1.17.4948957.bb
> +++ b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-sgx-ddk-um_1.17.4948957.bb
> @@ -1,38 +1,35 @@
>   DESCRIPTION = "Userspace libraries for PowerVR SGX chipset on TI SoCs"
>   HOMEPAGE = "https://git.ti.com/graphics/omap5-sgx-ddk-um-linux"
>   LICENSE = "TI-TSPA"
> -LIC_FILES_CHKSUM = "file://TI-Linux-Graphics-DDK-UM-Manifest.doc;md5=b17390502bc89535c86cfbbae961a2a8"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=7232b98c1c58f99e3baa03de5207e76f"
>   
>   PACKAGE_ARCH = "${MACHINE_ARCH}"
>   COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|am65xx"
>   
>   PR = "r38"
>   
> -BRANCH = "ti-img-sgx/kirkstone-mesa/${PV}"
> +BRANCH = "${PV}/mesa/glibc-2.35"
>   
>   SRC_URI = " \
>       git://git.ti.com/git/graphics/omap5-sgx-ddk-um-linux.git;protocol=https;branch=${BRANCH} \
> -    file://pvrsrvkm.rules \
>   "
> -SRCREV = "bbae7217051341f515515ec190e165119102f45a"
> -
> -TARGET_PRODUCT:ti33x = "ti335x"
> -TARGET_PRODUCT:ti43x = "ti437x"
> -TARGET_PRODUCT:omap-a15 = "ti572x"
> -TARGET_PRODUCT:am65xx = "ti654x"
> +SRCREV = "70364424dd496833fad5b243c9e6cc8b077f04ac"
>   
>   INITSCRIPT_NAME = "rc.pvr"
>   INITSCRIPT_PARAMS = "defaults 8"
>   
>   PACKAGECONFIG ??= "udev"
> -PACKAGECONFIG[udev] = ",,,udev"
> +PACKAGECONFIG[udev] = "UDEV=true,,,udev"
> +
> +def use_sysvinit(d):
> +    return d.getVar('VIRTUAL-RUNTIME_init_manager') == 'sysvinit'
>   
> -def use_initscript(d):
> -    sysvinit = bb.utils.contains('DISTRO_FEATURES', 'sysvinit', True, False, d)
> -    udev = bb.utils.contains('PACKAGECONFIG', 'udev', True, False, d)
> -    return sysvinit and not udev
> +inherit ${@oe.utils.ifelse(use_sysvinit(d), 'update-rc.d', '')}
>   
> -inherit ${@oe.utils.ifelse(use_initscript(d), 'update-rc.d', '')}
> +TARGET_PRODUCT:ti33x = "ti335x_linux"
> +TARGET_PRODUCT:ti43x = "ti437x_linux"
> +TARGET_PRODUCT:omap-a15 = "ti572x_linux"
> +TARGET_PRODUCT:am65xx = "ti654x_linux"
>   
>   RDEPENDS:${PN} += "libdrm"
>   
> @@ -40,24 +37,10 @@ RRECOMMENDS:${PN} += "ti-sgx-ddk-km"
>   
>   S = "${WORKDIR}/git"
>   
> -do_install () {
> -    oe_runmake install DESTDIR=${D} TARGET_PRODUCT=${TARGET_PRODUCT}
> -
> -    without_sysvinit=${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'false', 'true', d)}
> -    with_udev=${@bb.utils.contains('PACKAGECONFIG', 'udev', 'true', 'false', d)}
> +EXTRA_OEMAKE += "DESTDIR=${D} TARGET_PRODUCT=${TARGET_PRODUCT} ${PACKAGECONFIG_CONFARGS}"
>   
> -    # Delete initscript if it is not needed or would conflict with the udev rules
> -    if ${@oe.utils.ifelse(use_initscript(d), 'false', 'true')}; then
> -        rm -rf ${D}${sysconfdir}/init.d
> -        rmdir --ignore-fail-on-non-empty ${D}${sysconfdir}
> -    fi
> -
> -    if $with_udev; then
> -        install -m644 -D ${WORKDIR}/pvrsrvkm.rules \
> -            ${D}${nonarch_base_libdir}/udev/rules.d/80-pvrsrvkm.rules
> -    fi
> -
> -    chown -R root:root ${D}
> +do_install() {
> +    oe_runmake install
>   }
>   
>   FILES:${PN} =  "${bindir}/*"
> @@ -66,6 +49,10 @@ FILES:${PN} +=  "${includedir}/*"
>   FILES:${PN} +=  "${sysconfdir}/*"
>   FILES:${PN} +=  "${datadir}/*"
>   FILES:${PN} += "${nonarch_base_libdir}/udev/rules.d"
> +FILES:${PN} += "${nonarch_base_libdir}/systemd/system"
> +
> +# No debug or dev packages for this recipe
> +PACKAGES = "${PN}"
>   
>   INSANE_SKIP:${PN} += "ldflags"
> -INSANE_SKIP:${PN} += "already-stripped"
> +INSANE_SKIP:${PN} += "already-stripped dev-so"
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#17125): https://lists.yoctoproject.org/g/meta-ti/message/17125
> Mute This Topic: https://lists.yoctoproject.org/mt/102009262/7693777
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [res.sapp@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


