Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1DC3C3ABBC
	for <webhook@archiver.kernel.org>; Tue,  6 May 2025 21:15:48 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.1258.1746566144297613072
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 06 May 2025 14:15:45 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 4156040CBF;
	Tue,  6 May 2025 21:15:43 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D2umITx8Zsoi; Tue,  6 May 2025 21:15:43 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 18A6240CBD;
	Tue,  6 May 2025 21:15:41 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id C6B3A16792B; Tue,  6 May 2025 17:15:40 -0400 (EDT)
Date: Tue, 6 May 2025 17:15:40 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Chirag Shilwant <c-shilwant@ti.com>
Cc: meta-ti@lists.yoctoproject.org, Ryan Eatmon <reatmon@ti.com>
Subject: Re: [meta-ti][master/scarthgap][PATCH 1/1] recipes-bsp: Add
 DM_FIRMWARE override for am62pxx display cluster
Message-ID: <20250506211540.GG18383@denix.org>
References: <20250506091015.4049616-1-c-shilwant@ti.com>
 <20250506091015.4049616-2-c-shilwant@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250506091015.4049616-2-c-shilwant@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 06 May 2025 21:15:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18536

On Tue, May 06, 2025 at 02:40:15PM +0530, Chirag Shilwant wrote:
> * For AM62P display cluster usecase, we need to pick
> "dss_display_share.wkup-r5f0_0.release.strip.out" from ti-linux-firmware [0]
> Hence, pick the display cluster firmware only when DISPLAY_CLUSTER_ENABLE is set to 1.
> 
> * When DISPLAY_CLUSTER_ENABLE is not set to 1, fallback to pick the "ipc_echo_testb_mcu1_0_release_strip.xer5f"
> DM firmware.

Should a similar condition be added for am62axx to select between dm_edgeai_mcu1_0_release_strip.out 
and ipc_echo_testb_mcu1_0_release_strip.xer5f ?


> [0]: https://git.ti.com/cgit/processor-firmware/ti-linux-firmware/tree/ti-dm/am62pxx?h=11.00.12
> 
> Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
> ---
>  meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb | 1 +
>  meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb b/meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb
> index a7d15e30..eaa82a62 100644
> --- a/meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb
> +++ b/meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb
> @@ -40,6 +40,7 @@ INSTALL_DM_FW_DIR  = "${nonarch_base_libdir}/firmware/${DM_FW_DIR}"
>  
>  DM_FIRMWARE = "ipc_echo_testb_mcu1_0_release_strip.xer5f"
>  DM_FIRMWARE:am62axx = "dm_edgeai_mcu1_0_release_strip.out"
> +DM_FIRMWARE:am62pxx = "${@oe.utils.conditional('DISPLAY_CLUSTER_ENABLE', '1', 'dss_display_share.wkup-r5f0_0.release.strip.out', 'ipc_echo_testb_mcu1_0_release_strip.xer5f', d)}"
>  
>  DM_FW_LIST = ""
>  DM_FW_LIST:j721e =   "${DM_FIRMWARE}"
> diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
> index 57bf7a4e..6b7e2bea 100644
> --- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
> +++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
> @@ -46,6 +46,7 @@ DEPENDS:append:j784s4 = " ti-hsm-demo-fw"
>  
>  DM_FIRMWARE = "ipc_echo_testb_mcu1_0_release_strip.xer5f"
>  DM_FIRMWARE:am62axx = "dm_edgeai_mcu1_0_release_strip.out"
> +DM_FIRMWARE:am62pxx = "${@oe.utils.conditional('DISPLAY_CLUSTER_ENABLE', '1', 'dss_display_share.wkup-r5f0_0.release.strip.out', 'ipc_echo_testb_mcu1_0_release_strip.xer5f', d)}"
>  
>  PLAT_SFX = ""
>  PLAT_SFX:j721e = "j721e"
> -- 
> 2.34.1
> 

