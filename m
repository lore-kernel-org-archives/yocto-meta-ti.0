Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2169C636D4
	for <webhook@archiver.kernel.org>; Fri, 10 Feb 2023 18:56:14 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.2618.1676055364630059404
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 10 Feb 2023 10:56:04 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 14A2C40C1E;
	Fri, 10 Feb 2023 18:56:04 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c6bSTrG6iKOG; Fri, 10 Feb 2023 18:56:04 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id E283140A0B;
	Fri, 10 Feb 2023 18:56:00 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 5B051163757; Fri, 10 Feb 2023 13:55:38 -0500 (EST)
Date: Fri, 10 Feb 2023 13:55:38 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: afd@ti.com
Cc: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
	meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][master/kirkstone][PATCH 3/4] u-boot-ti: Use
 ti-k3-secdev if TI_SECURE_DEV_PKG_K3 is not defined
Message-ID: <20230210185538.GY22689@denix.org>
References: <20230208231031.16363-1-afd@ti.com>
 <20230208231031.16363-3-afd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230208231031.16363-3-afd@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 10 Feb 2023 18:56:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15798

On Wed, Feb 08, 2023 at 05:10:30PM -0600, Andrew Davis via lists.yoctoproject.org wrote:
> Use the new ti-k3-secdev package to pull in the signing tools if they are
> not provided by the environment. This allows us to use these tools
> unconditionally. Remove the checks for the script and do the signing
> for all K3 machines. The signature is automatically stripped from
> the binaries on non-HS devices at boot time as needed so this change
> is harmless for GP devices.
> 
> Signed-off-by: Andrew Davis <afd@ti.com>
> ---
>  meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
> index 6f5b6313..ae87ec6a 100644
> --- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
> +++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
> @@ -24,6 +24,7 @@ PV:append = "+git${SRCPV}"
>  
>  # u-boot needs devtree compiler to parse dts files
>  DEPENDS += "dtc-native bc-native lzop-native flex-native bison-native python3-setuptools-native"
> +DEPENDS:append:k3 = "${@ '' if d.getVar('TI_SECURE_DEV_PKG_K3') else ' ti-k3-secdev-native' }"
>  
>  DM_FIRMWARE = "ipc_echo_testb_mcu1_0_release_strip.xer5f"
>  
> @@ -49,8 +50,13 @@ PKG:${PN}-dbg = "u-boot-dbg"
>  
>  S = "${WORKDIR}/git"
>  
> +# set a default value for TI_K3_SECDEV_INSTALL_DIR
> +export TI_K3_SECDEV_INSTALL_DIR = "${STAGING_DIR_NATIVE}${datadir}/ti/ti-k3-secdev"
> +include recipes-ti/includes/ti-paths.inc

Here as well


> +
>  # Support for secure devices - detailed info is in doc/README.ti-secure
>  TI_SECURE_DEV_PKG ?= ""
> +TI_SECURE_DEV_PKG:k3 = "${@ d.getVar('TI_SECURE_DEV_PKG_K3') or d.getVar('TI_K3_SECDEV_INSTALL_DIR') }"
>  export TI_SECURE_DEV_PKG
>  
>  SYSROOT_DIRS += "/boot"
> -- 
> 2.39.1

