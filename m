Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2187C6FD1D
	for <webhook@archiver.kernel.org>; Fri, 31 Mar 2023 00:04:54 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.42871.1680221087862310287
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 30 Mar 2023 17:04:48 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id BA25040C1E;
	Fri, 31 Mar 2023 00:04:46 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r2YpyIJmZaV9; Fri, 31 Mar 2023 00:04:46 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 87D2340ACD;
	Fri, 31 Mar 2023 00:04:43 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 6F99D1637E5; Thu, 30 Mar 2023 20:04:08 -0400 (EDT)
Date: Thu, 30 Mar 2023 20:04:08 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: Praneeth Bajjuri <praneeth@ti.com>,
	Denys Dmytriyenko <denys@konsulko.com>,
	meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][master/kirkstone][PATCH 1/4] u-boot-ti-staging: Fix
 u-boot configs to match oe-core fitImage
Message-ID: <20230331000408.GA18050@denix.org>
References: <20230330212440.19437-1-reatmon@ti.com>
 <20230330212440.19437-2-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230330212440.19437-2-reatmon@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 31 Mar 2023 00:04:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16269

On Thu, Mar 30, 2023 at 04:24:37PM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
> After moving to the oe-core kernel-fitimage.bbclass we found that the
> dtb names we were searching for did not match.  This was due to the
> KERNEL_DEVICETREE entries including the vendor subdir in the section
> names of the fitImage file.  This patch updates support in 2021 so that
> we can temporarily get to a stable boot point before starting our LTS
> migration and changing a lot of things in the recipes.

I'm assuming this will be merged to 2023.04 and this patch won't be needed in 
meta-ti then?


> Signed-off-by: Ryan Eatmon <reatmon@ti.com>

Acked-by: Denys Dmytriyenko <denys@konsulko.com>


> ---
>  ...e-to-support-oe-core-fitImage-naming.patch | 144 ++++++++++++++++++
>  .../u-boot/u-boot-ti-staging_2021.01.bb       |   8 +-
>  2 files changed, 151 insertions(+), 1 deletion(-)
>  create mode 100644 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging-2021.01/0001-configs-Update-to-support-oe-core-fitImage-naming.patch
> 
> diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging-2021.01/0001-configs-Update-to-support-oe-core-fitImage-naming.patch b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging-2021.01/0001-configs-Update-to-support-oe-core-fitImage-naming.patch
> new file mode 100644
> index 00000000..9a832312
> --- /dev/null
> +++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging-2021.01/0001-configs-Update-to-support-oe-core-fitImage-naming.patch
> @@ -0,0 +1,144 @@
> +From 33c4b7335a39c48507a254505169df59c7a69c75 Mon Sep 17 00:00:00 2001
> +From: Ryan Eatmon <reatmon@ti.com>
> +Date: Thu, 23 Mar 2023 10:29:40 -0500
> +Subject: [PATCH] configs: Update to support oe-core fitImage naming
> +
> +In kirkstone and forward, the values in the fitImage have been
> +standardized to include both conf- and the vender subdir in the name of
> +the dtbs.  This patch updates u-boot to support that.
> +
> +Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> +---
> + include/configs/am62x_evm.h       | 6 +++---
> + include/configs/am64x_evm.h       | 4 ++--
> + include/configs/am65x_evm.h       | 2 +-
> + include/configs/j721e_evm.h       | 8 ++++----
> + include/configs/j721s2_evm.h      | 6 +++---
> + include/configs/j784s4_evm.h      | 6 +++---
> + include/configs/ti_armv7_common.h | 2 +-
> + 7 files changed, 17 insertions(+), 17 deletions(-)
> +
> +diff --git a/include/configs/am62x_evm.h b/include/configs/am62x_evm.h
> +index 97bd7c1fd7..6d957c906b 100644
> +--- a/include/configs/am62x_evm.h
> ++++ b/include/configs/am62x_evm.h
> +@@ -122,11 +122,11 @@
> + #define EXTRA_ENV_AM625_BOARD_SETTINGS					\
> + 	"default_device_tree=" CONFIG_DEFAULT_DEVICE_TREE ".dtb\0"	\
> + 	"findfdt="							\
> +-		"setenv name_fdt ${default_device_tree};"		\
> ++		"setenv name_fdt ti_${default_device_tree};"		\
> + 		"if test $board_name = am62x_skevm; then "		\
> +-			"setenv name_fdt k3-am625-sk.dtb; fi;"		\
> ++			"setenv name_fdt ti_k3-am625-sk.dtb; fi;"		\
> + 		"if test $board_name = am62x_lp_skevm; then "		\
> +-			"setenv name_fdt k3-am62x-lp-sk.dtb; fi;"	\
> ++			"setenv name_fdt ti_k3-am62x-lp-sk.dtb; fi;"	\
> + 		"setenv fdtfile ${name_fdt}\0"				\
> + 	"name_kern=Image\0"						\
> + 	"console=ttyS2,115200n8\0"					\
> +diff --git a/include/configs/am64x_evm.h b/include/configs/am64x_evm.h
> +index 33ba5da31f..d32b488b58 100644
> +--- a/include/configs/am64x_evm.h
> ++++ b/include/configs/am64x_evm.h
> +@@ -107,9 +107,9 @@
> + #define EXTRA_ENV_AM642_BOARD_SETTINGS					\
> + 	"findfdt="							\
> + 		"if test $board_name = am64x_gpevm; then " \
> +-			"setenv fdtfile k3-am642-evm.dtb; fi; " \
> ++			"setenv fdtfile ti_k3-am642-evm.dtb; fi; " \
> + 		"if test $board_name = am64x_skevm; then " \
> +-			"setenv fdtfile k3-am642-sk.dtb; fi;" \
> ++			"setenv fdtfile ti_k3-am642-sk.dtb; fi;" \
> + 		"if test $fdtfile = undefined; then " \
> + 			"echo WARNING: Could not determine device tree to use; fi; \0" \
> + 	"name_kern=Image\0"						\
> +diff --git a/include/configs/am65x_evm.h b/include/configs/am65x_evm.h
> +index c78e4c4493..07d234d5d3 100644
> +--- a/include/configs/am65x_evm.h
> ++++ b/include/configs/am65x_evm.h
> +@@ -64,7 +64,7 @@
> + /* U-Boot general configuration */
> + #define EXTRA_ENV_AM65X_BOARD_SETTINGS					\
> + 	"findfdt="							\
> +-		"setenv name_fdt k3-am654-base-board.dtb;"		\
> ++		"setenv name_fdt ti_k3-am654-base-board.dtb;"		\
> + 		"setenv fdtfile ${name_fdt}\0"				\
> + 	"name_kern=Image\0"						\
> + 	"console=ttyS2,115200n8\0"					\
> +diff --git a/include/configs/j721e_evm.h b/include/configs/j721e_evm.h
> +index 50b018b6ed..ad11494bd0 100644
> +--- a/include/configs/j721e_evm.h
> ++++ b/include/configs/j721e_evm.h
> +@@ -77,13 +77,13 @@
> + #define EXTRA_ENV_J721E_BOARD_SETTINGS					\
> + 	"default_device_tree=" CONFIG_DEFAULT_DEVICE_TREE ".dtb\0"	\
> + 	"findfdt="							\
> +-		"setenv name_fdt ${default_device_tree};"		\
> ++		"setenv name_fdt ti_${default_device_tree};"		\
> + 		"if test $board_name = J721EX-PM1-SOM; then "		\
> +-			"setenv name_fdt k3-j721e-proc-board-tps65917.dtb; fi;" \
> ++			"setenv name_fdt ti_k3-j721e-proc-board-tps65917.dtb; fi;" \
> + 		"if test $board_name = j721e; then "			\
> +-			"setenv name_fdt k3-j721e-common-proc-board.dtb; fi;" \
> ++			"setenv name_fdt ti_k3-j721e-common-proc-board.dtb; fi;" \
> + 		"if test $board_name = j721e-eaik || test $board_name = j721e-sk; then " \
> +-			"setenv name_fdt k3-j721e-sk.dtb; fi;"	\
> ++			"setenv name_fdt ti_k3-j721e-sk.dtb; fi;"	\
> + 		"setenv fdtfile ${name_fdt}\0"				\
> + 	"name_kern=Image\0"						\
> + 	"console=ttyS2,115200n8\0"					\
> +diff --git a/include/configs/j721s2_evm.h b/include/configs/j721s2_evm.h
> +index 2d26eb544d..4b4d4a6e37 100644
> +--- a/include/configs/j721s2_evm.h
> ++++ b/include/configs/j721s2_evm.h
> +@@ -66,11 +66,11 @@
> + #define EXTRA_ENV_J721S2_BOARD_SETTINGS					\
> + 	"default_device_tree=" CONFIG_DEFAULT_DEVICE_TREE ".dtb\0"	\
> + 	"findfdt="							\
> +-		"setenv name_fdt ${default_device_tree};"		\
> ++		"setenv name_fdt ti_${default_device_tree};"		\
> + 		"if test $board_name = j721s2; then "			\
> +-			"setenv name_fdt k3-j721s2-common-proc-board.dtb; fi;" \
> ++			"setenv name_fdt ti_k3-j721s2-common-proc-board.dtb; fi;" \
> + 		"if test $board_name = am68-sk; then "			\
> +-			"setenv name_fdt k3-am68-sk-base-board.dtb; fi;"\
> ++			"setenv name_fdt ti_k3-am68-sk-base-board.dtb; fi;"\
> + 		"setenv fdtfile ${name_fdt}\0"				\
> + 	"name_kern=Image\0"						\
> + 	"console=ttyS2,115200n8\0"					\
> +diff --git a/include/configs/j784s4_evm.h b/include/configs/j784s4_evm.h
> +index eb609100b0..30820ea1c6 100644
> +--- a/include/configs/j784s4_evm.h
> ++++ b/include/configs/j784s4_evm.h
> +@@ -67,11 +67,11 @@
> + #define EXTRA_ENV_J784S4_BOARD_SETTINGS					\
> + 	"default_device_tree=" CONFIG_DEFAULT_DEVICE_TREE ".dtb\0"	\
> + 	"findfdt="                                                      \
> +-		"setenv name_fdt ${default_device_tree};"               \
> ++		"setenv name_fdt ti_${default_device_tree};"               \
> + 		"if test $board_name = am69-sk; then "           \
> +-			"setenv name_fdt k3-am69-sk.dtb; fi;" \
> ++			"setenv name_fdt ti_k3-am69-sk.dtb; fi;" \
> + 		"if test $board_name = j784s4; then "                    \
> +-			"setenv name_fdt k3-j784s4-evm.dtb; fi;" \
> ++			"setenv name_fdt ti_k3-j784s4-evm.dtb; fi;" \
> + 		"setenv fdtfile ${name_fdt}\0"				\
> + 	"name_kern=Image\0"						\
> + 	"console=ttyS2,115200n8\0"					\
> +diff --git a/include/configs/ti_armv7_common.h b/include/configs/ti_armv7_common.h
> +index c48c4c2398..29de095729 100644
> +--- a/include/configs/ti_armv7_common.h
> ++++ b/include/configs/ti_armv7_common.h
> +@@ -68,7 +68,7 @@
> + 		"do;" \
> + 		"setenv overlaystring ${overlaystring}'#'${overlay};" \
> + 		"done;\0" \
> +-	"run_fit=bootm ${addr_fit}#${fdtfile}${overlaystring}\0" \
> ++	"run_fit=bootm ${addr_fit}#conf-${fdtfile}${overlaystring}\0" \
> + 
> + /*
> +  * DDR information.  If the CONFIG_NR_DRAM_BANKS is not defined,
> +-- 
> +2.17.1
> +
> diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb
> index 7763d8b1..7529ce6c 100644
> --- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb
> +++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb
> @@ -1,9 +1,15 @@
> +
> +FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}-${PV}:"
> +
>  require u-boot-ti.inc
>  
>  LIC_FILES_CHKSUM = "file://Licenses/README;md5=5a7450c57ffe5ae63fd732446b988025"
>  
> -PR = "r33"
> +PR = "r34"
>  
>  BRANCH = "ti-u-boot-2021.01"
>  
>  SRCREV = "2ee8efd6543648c6b8a14d93d52a6038854035c8"
> +
> +SRC_URI += "file://0001-configs-Update-to-support-oe-core-fitImage-naming.patch"
> +
> -- 
> 2.17.1

