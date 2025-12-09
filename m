Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D692D3B9B5
	for <webhook@archiver.kernel.org>; Tue,  9 Dec 2025 23:53:48 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2111.1765324425116323153
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 09 Dec 2025 15:53:45 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 90DA140C50;
	Tue,  9 Dec 2025 23:53:44 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yPcAKOav_v76; Tue,  9 Dec 2025 23:53:44 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 611CE406B5;
	Tue,  9 Dec 2025 23:53:42 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 15537175EDA; Tue,  9 Dec 2025 18:53:42 -0500 (EST)
Date: Tue, 9 Dec 2025 18:53:42 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: afd@ti.com
Cc: Ryan Eatmon <reatmon@ti.com>, meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][master][PATCH 1/2] meta-ti/all: Make DRA7xx support
 a subset of AM57xx support
Message-ID: <20251209235342.GP11121@denix.org>
References: <20251203203211.1113327-1-afd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251203203211.1113327-1-afd@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 09 Dec 2025 23:53:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19344

On Wed, Dec 03, 2025 at 02:32:10PM -0600, Andrew Davis via lists.yoctoproject.org wrote:
> As AM57xx already defined both "dra7xx" and "am57xx" as SOC_FAMILY the
> AM57xx was effectively a superset MACHINE. Although not all features of
> AM57xx are needed for DRA7xx, make DRA7xx-EVM use the AM57xx definition.
> This allows us to still support DRA7xx as the only differences that
> impact device function are the selection of U-Boot defconfig, DTBs, and
> OPTEE, all handled by the MACHINE conf file which is left unchanged.
> 
> Signed-off-by: Andrew Davis <afd@ti.com>

Reviewed-by: Denys Dmytriyenko <denys@konsulko.com>


> ---
>  meta-ti-bsp/classes/ti-secdev.bbclass                        | 1 -
>  meta-ti-bsp/conf/machine/dra7xx-evm.conf                     | 2 +-
>  meta-ti-bsp/conf/machine/include/am57xx.inc                  | 1 -
>  meta-ti-bsp/conf/machine/include/dra7xx.inc                  | 4 ----
>  meta-ti-bsp/recipes-bsp/goodix-fw/goodix-fw_git.bb           | 2 +-
>  meta-ti-bsp/recipes-bsp/vis-fw/vis_01.50.07.15.bb            | 2 +-
>  meta-ti-bsp/recipes-bsp/vpdma-fw/vpdma-fw_03-2012.bb         | 2 +-
>  meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc | 4 ++--
>  meta-ti-bsp/recipes-ti/ipc/ti-ipc-common.inc                 | 2 +-
>  meta-ti-bsp/recipes-ti/ipc/ti-ipc_git.bb                     | 4 ++--
>  meta-ti-extras/recipes-bsp/ipumm-fw/ipumm-fw_git.bb          | 2 +-
>  11 files changed, 10 insertions(+), 16 deletions(-)
>  delete mode 100644 meta-ti-bsp/conf/machine/include/dra7xx.inc
> 
> diff --git a/meta-ti-bsp/classes/ti-secdev.bbclass b/meta-ti-bsp/classes/ti-secdev.bbclass
> index b3d70e5c..226e154d 100644
> --- a/meta-ti-bsp/classes/ti-secdev.bbclass
> +++ b/meta-ti-bsp/classes/ti-secdev.bbclass
> @@ -15,7 +15,6 @@ TI_SECURE_DEV_PKG:k3r5 = "${@ d.getVar('TI_SECURE_DEV_PKG_K3') or d.getVar('TI_K
>  TI_SECURE_DEV_PKG:ti33x = "${TI_SECURE_DEV_PKG_CAT}/am3x"
>  TI_SECURE_DEV_PKG:ti43x = "${TI_SECURE_DEV_PKG_CAT}/am4x"
>  TI_SECURE_DEV_PKG:am57xx = "${TI_SECURE_DEV_PKG_AUTO}/am5x"
> -TI_SECURE_DEV_PKG:dra7xx = "${TI_SECURE_DEV_PKG_AUTO}/dra7"
>  
>  # The SECDEV scripts may need their own location provided through the environment
>  export TI_SECURE_DEV_PKG
> diff --git a/meta-ti-bsp/conf/machine/dra7xx-evm.conf b/meta-ti-bsp/conf/machine/dra7xx-evm.conf
> index f9a3dd0b..237f27b9 100644
> --- a/meta-ti-bsp/conf/machine/dra7xx-evm.conf
> +++ b/meta-ti-bsp/conf/machine/dra7xx-evm.conf
> @@ -2,7 +2,7 @@
>  #@NAME: DRA7xx EVM
>  #@DESCRIPTION: Machine configuration for the TI DRA7xx EVM
>  
> -require conf/machine/include/dra7xx.inc
> +require conf/machine/include/am57xx.inc
>  
>  MACHINE_FEATURES += "touchscreen"
>  
> diff --git a/meta-ti-bsp/conf/machine/include/am57xx.inc b/meta-ti-bsp/conf/machine/include/am57xx.inc
> index 85290924..c7c8029f 100644
> --- a/meta-ti-bsp/conf/machine/include/am57xx.inc
> +++ b/meta-ti-bsp/conf/machine/include/am57xx.inc
> @@ -1,5 +1,4 @@
>  require conf/machine/include/omap-a15.inc
> -SOC_FAMILY:append = ":dra7xx"
>  SOC_FAMILY:append = ":am57xx"
>  
>  MACHINE_FEATURES += "pci"
> diff --git a/meta-ti-bsp/conf/machine/include/dra7xx.inc b/meta-ti-bsp/conf/machine/include/dra7xx.inc
> deleted file mode 100644
> index a02421d9..00000000
> --- a/meta-ti-bsp/conf/machine/include/dra7xx.inc
> +++ /dev/null
> @@ -1,4 +0,0 @@
> -require conf/machine/include/omap-a15.inc
> -SOC_FAMILY:append = ":dra7xx"
> -
> -MACHINE_FEATURES += "pci"
> diff --git a/meta-ti-bsp/recipes-bsp/goodix-fw/goodix-fw_git.bb b/meta-ti-bsp/recipes-bsp/goodix-fw/goodix-fw_git.bb
> index c43afb5b..11d877a6 100644
> --- a/meta-ti-bsp/recipes-bsp/goodix-fw/goodix-fw_git.bb
> +++ b/meta-ti-bsp/recipes-bsp/goodix-fw/goodix-fw_git.bb
> @@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Spectrum-GT9271;md5=2a6de6be7af1fe46370c684da
>  PV = "${GOODIX_FW_VERSION}"
>  PR = "${INC_PR}.0"
>  
> -COMPATIBLE_MACHINE = "dra7xx"
> +COMPATIBLE_MACHINE = "am57xx"
>  
>  ORIGIN = "DRA71x-RevA-GT9271_SpecDig_Config.bin"
>  TARGET = "goodix_9271_cfg.bin"
> diff --git a/meta-ti-bsp/recipes-bsp/vis-fw/vis_01.50.07.15.bb b/meta-ti-bsp/recipes-bsp/vis-fw/vis_01.50.07.15.bb
> index ba320f5f..1b1cff6b 100644
> --- a/meta-ti-bsp/recipes-bsp/vis-fw/vis_01.50.07.15.bb
> +++ b/meta-ti-bsp/recipes-bsp/vis-fw/vis_01.50.07.15.bb
> @@ -2,7 +2,7 @@ SUMMARY = "Radio Application Firmware"
>  LICENSE = "TI-TSPA"
>  LIC_FILES_CHKSUM = "file://${S}/J6_VIS_DEMO_LINUX_BINARY_01.50.07.15-Manifest.html;md5=a59aa54b9470f555cf086b91dca0afa3"
>  
> -COMPATIBLE_MACHINE = "dra7xx"
> +COMPATIBLE_MACHINE = "am57xx"
>  
>  PR = "r1"
>  
> diff --git a/meta-ti-bsp/recipes-bsp/vpdma-fw/vpdma-fw_03-2012.bb b/meta-ti-bsp/recipes-bsp/vpdma-fw/vpdma-fw_03-2012.bb
> index f147b234..4c2ea375 100644
> --- a/meta-ti-bsp/recipes-bsp/vpdma-fw/vpdma-fw_03-2012.bb
> +++ b/meta-ti-bsp/recipes-bsp/vpdma-fw/vpdma-fw_03-2012.bb
> @@ -3,7 +3,7 @@ SUMMARY = "VPDMA firmware for Video Input Port and Video Processing Engine"
>  LICENSE = "TI-TSPA"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=fd463c9500441ed91d07a0331baa635c"
>  
> -COMPATIBLE_MACHINE = "dra7xx"
> +COMPATIBLE_MACHINE = "am57xx"
>  
>  SRC_URI = "http://downloads.ti.com/dsps/dsps_public_sw/glsdk/vpdma-fw/03-2012/exports/vpdma-fw_03-2012.tar.gz;protocol=http;name=dra7xx-evm"
>  SRC_URI[dra7xx-evm.md5sum] = "80176df1350c21d9efa90171789c546e"
> diff --git a/meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc b/meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc
> index 61a74a06..83d0d128 100644
> --- a/meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc
> +++ b/meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc
> @@ -41,7 +41,7 @@ do_compile:append:ti43x() {
>      optee_sign_legacyhs
>  }
>  
> -do_compile:append:dra7xx() {
> +do_compile:append:am57xx() {
>      optee_sign_legacyhs
>  }
>  
> @@ -62,7 +62,7 @@ do_deploy:append:ti43x() {
>      optee_deploy_legacyhs
>  }
>  
> -do_deploy:append:dra7xx() {
> +do_deploy:append:am57xx() {
>      optee_deploy_legacyhs
>  }
>  
> diff --git a/meta-ti-bsp/recipes-ti/ipc/ti-ipc-common.inc b/meta-ti-bsp/recipes-ti/ipc/ti-ipc-common.inc
> index da7e4733..7006a9b6 100644
> --- a/meta-ti-bsp/recipes-ti/ipc/ti-ipc-common.inc
> +++ b/meta-ti-bsp/recipes-ti/ipc/ti-ipc-common.inc
> @@ -6,7 +6,7 @@ COMPATIBLE_HOST ?= "null"
>  COMPATIBLE_HOST:ti-soc = ".*-linux"
>  
>  PLATFORM = "UNKNOWN"
> -PLATFORM:dra7xx = "DRA7XX"
> +PLATFORM:am57xx = "DRA7XX"
>  PLATFORM:omapl138 = "OMAPL138"
>  
>  ALT_PLATFORM:am57xx = "AM572X AM571X"
> diff --git a/meta-ti-bsp/recipes-ti/ipc/ti-ipc_git.bb b/meta-ti-bsp/recipes-ti/ipc/ti-ipc_git.bb
> index 539a83f9..3e4be816 100644
> --- a/meta-ti-bsp/recipes-ti/ipc/ti-ipc_git.bb
> +++ b/meta-ti-bsp/recipes-ti/ipc/ti-ipc_git.bb
> @@ -22,7 +22,7 @@ SRC_URI += "file://tiipclad-daemon.sh \
>  CFLAGS += "-I${UNPACKDIR} -fdebug-prefix-map=${UNPACKDIR}=${TARGET_DBGSRC_DIR}"
>  
>  DAEMON = "UNKNOWN"
> -DAEMON:dra7xx = "lad_dra7xx"
> +DAEMON:am57xx = "lad_dra7xx"
>  DAEMON:omapl138 = "lad_omapl138"
>  
>  inherit autotools-brokensep pkgconfig update-rc.d systemd
> @@ -55,7 +55,7 @@ do_install:append() {
>      install -c -m 755 ${UNPACKDIR}/tiipclad-daemon.sh ${D}${sysconfdir}/init.d/${INITSCRIPT_NAME}
>  }
>  
> -do_install:append:dra7xx() {
> +do_install:append:am57xx() {
>      install -d ${D}${sysconfdir}/modprobe.d/
>      install -c -m 644 ${UNPACKDIR}/omap_remoteproc.conf ${D}${sysconfdir}/modprobe.d/
>  }
> diff --git a/meta-ti-extras/recipes-bsp/ipumm-fw/ipumm-fw_git.bb b/meta-ti-extras/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
> index bfdf1ac5..bca91df8 100644
> --- a/meta-ti-extras/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
> +++ b/meta-ti-extras/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
> @@ -3,7 +3,7 @@ LICENSE = "TI-TSPA"
>  
>  LIC_FILES_CHKSUM = "file://Texas_Instruments_ipumm_Manifest.pdf;md5=5cc572579f07af266ab57fc17d762c7f"
>  
> -COMPATIBLE_MACHINE = "dra7xx"
> +COMPATIBLE_MACHINE = "am57xx"
>  
>  inherit features_check
>  
> -- 
> 2.39.2

