Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C15FC3DA4A
	for <webhook@archiver.kernel.org>; Thu,  8 Aug 2024 17:17:59 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.65589.1723137470895730441
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 08 Aug 2024 10:17:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=gdEjL0G2;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: afd@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 478HHkmJ091912;
	Thu, 8 Aug 2024 12:17:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1723137466;
	bh=tPxbmAfVWh5iyfDPjXJ2m+lcEWwvpttRiiHKyHU4FU0=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=gdEjL0G2ItXtJV26k5I949upmlRU/MBhzS2MqMdBowJm3lMR4Z+yk4ZDyt/zvs0Aj
	 9LEcHjEMKUxrPwILx+UhDbliDdUU8qAv75Xiw0uz3ySGzjymtpj05KkldnTZLBq782
	 mukQu9gB1N/fybGt7hj0gx5SehQthsmFDrYQYdV8=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 478HHkh5028478
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 8 Aug 2024 12:17:46 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 8
 Aug 2024 12:17:45 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 8 Aug 2024 12:17:45 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 478HHjPA006716;
	Thu, 8 Aug 2024 12:17:45 -0500
Message-ID: <56b01c2b-80f2-46b0-b3bd-794591c69177@ti.com>
Date: Thu, 8 Aug 2024 12:17:45 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti] [master][RFC PATCH] openmp-rtos: deprecate
To: Denys Dmytriyenko <denis@denix.org>, <meta-ti@lists.yoctoproject.org>
CC: Denys Dmytriyenko <denys@konsulko.com>
References: <20240805043654.172479-1-denis@denix.org>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20240805043654.172479-1-denis@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 08 Aug 2024 17:17:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17929

On 8/4/24 11:36 PM, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@konsulko.com>
> 
> Remove openmp-rtos component as deprecated and not maintained.
> 
> This used to provide OpenMP DSP runtime components for legacy devices.
> 

With all the OpenCL stuff gone from meta-arago, dsplib/mathlib/imglib/swtools
can also be dropped. On the side, dspdce-fw and ipumm-fw should be updated
to be shipped as binaries, same as we do with all other sysbios/ti-rtos firmware.
Then we could also drop out all the remaining sysbios/xdc bits.

Andrew

> Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
> ---
>   .../recipes-ti/openmp-rtos/openmp-rtos_git.bb | 62 -------------------
>   1 file changed, 62 deletions(-)
>   delete mode 100644 meta-ti-extras/recipes-ti/openmp-rtos/openmp-rtos_git.bb
> 
> diff --git a/meta-ti-extras/recipes-ti/openmp-rtos/openmp-rtos_git.bb b/meta-ti-extras/recipes-ti/openmp-rtos/openmp-rtos_git.bb
> deleted file mode 100644
> index aa4bc6cd..00000000
> --- a/meta-ti-extras/recipes-ti/openmp-rtos/openmp-rtos_git.bb
> +++ /dev/null
> @@ -1,62 +0,0 @@
> -DESCRIPTION = "TI OpenMP RTOS"
> -HOMEPAGE = "git://git.ti.com/git/openmp/ti-openmp-dsp-runtime.git"
> -LICENSE = "BSD-3-Clause"
> -
> -require recipes-ti/includes/ti-paths.inc
> -
> -inherit features_check
> -
> -REQUIRED_MACHINE_FEATURES = "dsp"
> -REQUIRED_DISTRO_FEATURES = "openmp"
> -
> -PV = "2_06_03_00"
> -PR = "r0"
> -
> -OPENMP_RTOS_GIT_URI = "git://git.ti.com/git/openmp/ti-openmp-dsp-runtime.git"
> -OPENMP_RTOS_GIT_PROTOCOL = "https"
> -OPENMP_RTOS_GIT_BRANCH = "master"
> -
> -BRANCH = "${OPENMP_RTOS_GIT_BRANCH}"
> -SRC_URI = "${OPENMP_RTOS_GIT_URI};protocol=${OPENMP_RTOS_GIT_PROTOCOL};branch=${BRANCH}"
> -
> -SRCREV = "c090eb664d9815a36ead0e14f31e102590680fb8"
> -
> -LIC_FILES_CHKSUM = "file://docs/license/omp_manifest_template.html;md5=61a6972303c0447b7c056195d7ebafee"
> -
> -DEPENDS = "common-csl-ip-rtos doxygen-native libulm ti-xdctools-native ti-ipc-rtos ti-sysbios ti-cgt6x-native zip-native"
> -
> -COMPATIBLE_MACHINE = "omap-a15"
> -PACKAGE_ARCH = "${MACHINE_ARCH}"
> -
> -S = "${WORKDIR}/git"
> -export IPC_DIR = "${IPC_INSTALL_DIR}"
> -export XDC_DIR = "${XDC_INSTALL_DIR}"
> -export BIOS_DIR = "${SYSBIOS_INSTALL_DIR}"
> -export ULM_DIR ="${STAGING_DIR_TARGET}/usr/share/ti/ulm"
> -export C6636_PDK_DIR ="${PDK_INSTALL_DIR}"
> -export AM572_PDK_DIR ="${PDK_INSTALL_DIR}"
> -export XDCCGROOT = "${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x"
> -
> -export BUILD_AM572 = "0"
> -
> -BUILD_AM572:omap-a15 = "1"
> -
> -RELEASE_TARGET = ""
> -RELEASE_TARGET:omap-a15 = "am57xx"
> -
> -do_compile() {
> -    make -f utils/product/Makefile .zipfile
> -}
> -
> -do_install() {
> -    install -d ${D}${OMP_INSTALL_DIR_RECIPE}
> -    cp -r ${S}/exports/openmp_dsp_${RELEASE_TARGET}_*/. -d  ${D}${OMP_INSTALL_DIR_RECIPE}
> -}
> -
> -ALLOW_EMPTY:${PN} = "1"
> -
> -FILES:${PN}-dev += " \
> -    ${OMP_INSTALL_DIR_RECIPE}/ \
> -"
> -
> -INSANE_SKIP:${PN}-dev = "arch"
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#17923): https://lists.yoctoproject.org/g/meta-ti/message/17923
> Mute This Topic: https://lists.yoctoproject.org/mt/107727040/3619733
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [afd@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

