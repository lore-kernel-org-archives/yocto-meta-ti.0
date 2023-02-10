Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F6D8C05027
	for <webhook@archiver.kernel.org>; Fri, 10 Feb 2023 21:02:35 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.6070.1676062950211566919
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 10 Feb 2023 13:02:30 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 8122A40C06;
	Fri, 10 Feb 2023 21:02:29 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id weo5G_hBT6dg; Fri, 10 Feb 2023 21:02:29 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 5B18040BA8;
	Fri, 10 Feb 2023 21:02:26 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id C444F163758; Fri, 10 Feb 2023 16:02:03 -0500 (EST)
Date: Fri, 10 Feb 2023 16:02:03 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: afd@ti.com
Cc: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
	meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][master/kirkstone][PATCH 1/8] ti-rtos-firmware: Use
 ti-k3-secdev if TI_SECURE_DEV_PKG_K3 not defined
Message-ID: <20230210210203.GC22689@denix.org>
References: <20230207234239.30720-1-afd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230207234239.30720-1-afd@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 10 Feb 2023 21:02:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15804

On Tue, Feb 07, 2023 at 05:42:32PM -0600, Andrew Davis via lists.yoctoproject.org wrote:
> Use ti-k3-secdev native package to provide secure-binary-image.sh script
> when it is not passed on as an environment variable. This fixes and issue

Fixes *an* issue


> with AM64xx which is always HS but should not require TI_SECURE_DEV_PKG
> when building for HS-FS platforms.

And GP?


> 
> Signed-off-by: Andrew Davis <afd@ti.com>
> ---
>  meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb b/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
> index 9a6da088..6c59b8ab 100644
> --- a/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
> +++ b/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
> @@ -31,9 +31,11 @@ CLEANBROKEN = "1"
>  PR = "${INC_PR}.0"
>  
>  # Secure Build
> +include recipes-ti/includes/ti-paths.inc

Set TI_K3_SECDEV_INSTALL_DIR here instead of including ti-paths.inc?


>  DEPENDS += "openssl-native"
> -
> -TI_SECURE_DEV_PKG ?= ""
> +DEPENDS:append = "${@ '' if d.getVar('TI_SECURE_DEV_PKG_K3') else ' ti-k3-secdev-native' }"

Should probably use DEPENDS += here instead of a generic :append override. 
As :append and :remove are almost impossible to fight/override downstream, 
it is recommended to use += whenever possible, like in this case...


> +TI_SECURE_DEV_PKG = "${@ d.getVar('TI_SECURE_DEV_PKG_K3') or d.getVar('TI_K3_SECDEV_INSTALL_DIR') }"
> +export TI_SECURE_DEV_PKG
>  
>  RTOS_ETH_FW_DIR = "${S}/ti-eth/${PLAT_SFX}"
>  RTOS_DM_FW_DIR = "${S}/ti-dm/${PLAT_SFX}"
> @@ -49,7 +51,6 @@ DM_FIRMWARE = "ipc_echo_testb_mcu1_0_release_strip.xer5f"
>  
>  # J721e HS support
>  do_install:prepend:j721e-hs-evm() {
> -        export TI_SECURE_DEV_PKG=${TI_SECURE_DEV_PKG}
>          ( cd ${RTOS_DM_FW_DIR}; \
>                  mv ${DM_FIRMWARE} ${DM_FIRMWARE}.unsigned; \
>                  ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ${DM_FIRMWARE}.unsigned ${DM_FIRMWARE}; \
> @@ -80,7 +81,6 @@ do_install:prepend:j721e-hs-evm() {
>  
>  # J7200 HS support
>  do_install:prepend:j7200-hs-evm() {
> -        export TI_SECURE_DEV_PKG=${TI_SECURE_DEV_PKG}
>          ( cd ${RTOS_DM_FW_DIR}; \
>                  mv ${DM_FIRMWARE} ${DM_FIRMWARE}.unsigned; \
>                  ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ${DM_FIRMWARE}.unsigned ${DM_FIRMWARE}; \
> @@ -101,7 +101,6 @@ do_install:prepend:j7200-hs-evm() {
>  
>  # J721s2 HS support
>  do_install:prepend:j721s2-hs-evm() {
> -        export TI_SECURE_DEV_PKG=${TI_SECURE_DEV_PKG}
>          ( cd ${RTOS_DM_FW_DIR}; \
>                  mv ${DM_FIRMWARE} ${DM_FIRMWARE}.unsigned; \
>                  ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ${DM_FIRMWARE}.unsigned ${DM_FIRMWARE}; \
> -- 
> 2.39.1

