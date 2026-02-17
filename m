Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC5FFE9A033
	for <webhook@archiver.kernel.org>; Tue, 17 Feb 2026 18:25:28 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19034.1771352722674432537
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 17 Feb 2026 10:25:23 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id DCAF640B05;
	Tue, 17 Feb 2026 18:25:21 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 317Q0oL1ISbP; Tue, 17 Feb 2026 18:25:21 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 9E023407DA;
	Tue, 17 Feb 2026 18:25:18 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id CF0E31789E9; Tue, 17 Feb 2026 13:25:17 -0500 (EST)
Date: Tue, 17 Feb 2026 13:25:17 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: afd@ti.com
Cc: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
	meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][master][PATCH 2/3] ipumm-fw: Use prebuilt firmware
 from ti-linux-firmware repo
Message-ID: <20260217182517.GO11121@denix.org>
References: <20260217180339.128793-1-afd@ti.com>
 <20260217180339.128793-2-afd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260217180339.128793-2-afd@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 17 Feb 2026 18:25:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19535

On Tue, Feb 17, 2026 at 12:03:38PM -0600, Andrew Davis via lists.yoctoproject.org wrote:
> Use a prebuilt version of this firmware from ti-linux-firmware. This
> removes the need to build this locally.
> 
> Signed-off-by: Andrew Davis <afd@ti.com>
> ---
>  .../recipes-bsp/ipumm-fw/ipumm-fw_git.bb      | 55 ++-----------------
>  1 file changed, 6 insertions(+), 49 deletions(-)
> 
> diff --git a/meta-ti-extras/recipes-bsp/ipumm-fw/ipumm-fw_git.bb b/meta-ti-extras/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
> index 246255e3..c1fac30d 100644
> --- a/meta-ti-extras/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
> +++ b/meta-ti-extras/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
> @@ -1,7 +1,7 @@
>  SUMMARY = "Firmware for IPU to suppor Accelerated MM decode and encode"
>  LICENSE = "TI-TSPA"
>  
> -LIC_FILES_CHKSUM = "file://Texas_Instruments_ipumm_Manifest.pdf;md5=5cc572579f07af266ab57fc17d762c7f"
> +LIC_FILES_CHKSUM = "file://${THISDIR}/../../licenses/TI-TFL;md5=a1b59cb7ba626b9dbbcbf00f3fbc438a"
>  
>  COMPATIBLE_MACHINE = "am57xx"
>  
> @@ -9,64 +9,21 @@ inherit features_check
>  
>  REQUIRED_MACHINE_FEATURES = "mmip"
>  
> -SRC_URI = "git://git.ti.com/git/ivimm/ipumm.git;protocol=https;branch=master"
> -
> -SRCREV = "df4c50aecc9aad7ab3eb1ca9ebacfe473fcad7c5"
> +require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
>  
>  PV = "3.00.15.00"

Aren't PVs for prebuilt FWs now being set centrally in the ti-linux-fw.inc?


> -PR = "r7"
> -
> -require recipes-ti/includes/ti-paths.inc
> +PR = "r8"
>  
>  inherit update-alternatives
>  
> -DEPENDS = "ti-xdctools-native ti-sysbios ti-codec-engine ti-framework-components ti-xdais ti-cgt-arm-native ti-ipc-rtos"
> -
> -export HWVERSION = "ES10"
> -export BIOSTOOLSROOT = "${STAGING_DIR_TARGET}/usr/share/ti"
> -
> -export XDCVERSION = "ti-xdctools-tree"
> -export BIOSVERSION = "ti-sysbios-tree"
> -export IPCVERSION = "ti-ipc-tree"
> -export CEVERSION = "ti-codec-engine-tree"
> -export FCVERSION = "ti-framework-components-tree"
> -export XDAISVERSION = "ti-xdais-tree"
> -
> -export TMS470CGTOOLPATH = "${M4_TOOLCHAIN_INSTALL_DIR}"
> -export IPCSRC = "${STAGING_DIR_TARGET}/usr/share/ti/ti-ipc-tree"
> -
> -EXTRA_OEMAKE += "XDCDIST_TREE=${STAGING_DIR_NATIVE}/usr/share/ti/${XDCVERSION}"
> -
> -do_configure() {
> -    oe_runmake unconfig
> -    oe_runmake vayu_smp_config
> -}
> -
> -do_compile() {
> -    oe_runmake
> -}
> -
>  TARGET = "dra7-ipu2-fw.xem4"
> -TARGET_MAP = "platform/ti/dce/baseimage/package/cfg/out/ipu/release/ipu.xem4.map"
>  
>  do_install() {
> -    install -d ${D}${nonarch_base_libdir}/firmware
> -    install -m 0644 ${S}/${TARGET} ${D}${nonarch_base_libdir}/firmware/${TARGET}.${BPN}
> -    install -m 0644 ${S}/${TARGET_MAP} ${D}${nonarch_base_libdir}/firmware/${TARGET}.map
> +    install -d ${D}${nonarch_base_libdir}/firmware/ti-ce-fw
> +    install -m 0644 ${S}/ti-ce-fw/${TARGET} ${D}${nonarch_base_libdir}/firmware/ti-ce-fw/${TARGET}
>  }
>  
>  ALTERNATIVE:${PN} = "dra7-ipu2-fw.xem4"
>  ALTERNATIVE_LINK_NAME[dra7-ipu2-fw.xem4] = "${nonarch_base_libdir}/firmware/${TARGET}"
> -ALTERNATIVE_TARGET[dra7-ipu2-fw.xem4] = "${nonarch_base_libdir}/firmware/${TARGET}.${BPN}"
> +ALTERNATIVE_TARGET[dra7-ipu2-fw.xem4] = "${nonarch_base_libdir}/firmware/ti-ce-fw/${TARGET}"
>  ALTERNATIVE_PRIORITY = "20"
> -
> -FILES:${PN} += "${nonarch_base_libdir}/firmware/*"
> -
> -# Disable the "buildpaths" check while we figure out how we are
> -# going to address this issue.
> -#
> -# The ti-cgt-arm compiler is a custom TI compiler.  It does not
> -# currently support reproducible builds and is provided via a
> -# binary blob download that we cannot patch in the recipe to address
> -# the issue.
> -INSANE_SKIP:${PN} += "buildpaths"
> -- 
> 2.39.2

