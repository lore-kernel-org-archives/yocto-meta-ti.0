Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D8CDC677F1
	for <webhook@archiver.kernel.org>; Wed, 22 Feb 2023 19:43:18 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.2921.1677094991726410659
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 22 Feb 2023 11:43:12 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 2A63D40C2E;
	Wed, 22 Feb 2023 19:43:11 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Vvqe7B0tBeJg; Wed, 22 Feb 2023 19:43:11 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 0B4BD40AC9;
	Wed, 22 Feb 2023 19:43:09 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 4739F163764; Wed, 22 Feb 2023 14:42:44 -0500 (EST)
Date: Wed, 22 Feb 2023 14:42:44 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: afd@ti.com
Cc: Ryan Eatmon <reatmon@ti.com>, meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][master/kirkstone][PATCH v2 11/15] ti-rtos-firmware:
 Do not break the source directory by renaming files
Message-ID: <20230222194244.GC22689@denix.org>
References: <20230215193355.9676-1-afd@ti.com>
 <20230215193355.9676-12-afd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230215193355.9676-12-afd@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 22 Feb 2023 19:43:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15917

On Wed, Feb 15, 2023 at 01:33:51PM -0600, Andrew Davis via lists.yoctoproject.org wrote:
> If we rename files in the source directory the next time we need to rebuild
> the original files will be gone and build will fail. Use symlinks instead.
> 
> Signed-off-by: Andrew Davis <afd@ti.com>

Tested-by: Denys Dmytriyenko <denys@konsulko.com>


> ---
>  .../recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb       | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb b/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
> index 4744be84..56071a8c 100644
> --- a/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
> +++ b/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
> @@ -121,18 +121,18 @@ do_install:prepend:j721s2-hs-evm() {
>  # Update the am64xx ipc binaries to be consistent with other platforms
>  do_install:prepend:am64xx() {
>          ( cd ${RTOS_IPC_FW_DIR}; \
> -                mv am64-main-r5f0_0-fw ipc_echo_test_mcu1_0_release_strip.xer5f; \
> -                mv am64-main-r5f0_1-fw ipc_echo_test_mcu1_1_release_strip.xer5f; \
> -                mv am64-main-r5f1_0-fw ipc_echo_test_mcu2_0_release_strip.xer5f; \
> -                mv am64-main-r5f1_1-fw ipc_echo_test_mcu2_1_release_strip.xer5f; \
> -                mv am64-mcu-m4f0_0-fw ipc_echo_test_mcu3_0_release_strip.xer5f; \
> +                ln -s am64-main-r5f0_0-fw ipc_echo_test_mcu1_0_release_strip.xer5f; \
> +                ln -s am64-main-r5f0_1-fw ipc_echo_test_mcu1_1_release_strip.xer5f; \
> +                ln -s am64-main-r5f1_0-fw ipc_echo_test_mcu2_0_release_strip.xer5f; \
> +                ln -s am64-main-r5f1_1-fw ipc_echo_test_mcu2_1_release_strip.xer5f; \
> +                ln -s am64-mcu-m4f0_0-fw ipc_echo_test_mcu3_0_release_strip.xer5f; \
>          )
>  }
>  
>  # Update the am62xx ipc binaries to be consistent with other platforms
>  do_install:prepend:am62xx() {
>          ( cd ${RTOS_IPC_FW_DIR}; \
> -                mv am62-mcu-m4f0_0-fw ipc_echo_test_mcu2_0_release_strip.xer5f; \
> +                ln -s am62-mcu-m4f0_0-fw ipc_echo_test_mcu2_0_release_strip.xer5f; \
>          )
>  }
>  
> -- 
> 2.39.1

