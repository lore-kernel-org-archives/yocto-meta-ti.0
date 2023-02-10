Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 769B8C636D4
	for <webhook@archiver.kernel.org>; Fri, 10 Feb 2023 21:08:15 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.6167.1676063286912859226
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 10 Feb 2023 13:08:07 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 5063440C06;
	Fri, 10 Feb 2023 21:08:06 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jYlqgkJmbtYE; Fri, 10 Feb 2023 21:08:06 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 26C2D40BA8;
	Fri, 10 Feb 2023 21:08:03 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 24F33163758; Fri, 10 Feb 2023 16:07:40 -0500 (EST)
Date: Fri, 10 Feb 2023 16:07:40 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: afd@ti.com
Cc: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
	meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][master/kirkstone][PATCH 4/8] ti-rtos-firmware: Do
 not break the source directory by renaming files
Message-ID: <20230210210740.GD22689@denix.org>
References: <20230207234239.30720-1-afd@ti.com>
 <20230207234239.30720-4-afd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230207234239.30720-4-afd@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 10 Feb 2023 21:08:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15805

On Tue, Feb 07, 2023 at 05:42:35PM -0600, Andrew Davis via lists.yoctoproject.org wrote:
> If we rename files in the source directory the next time we need to rebuild
> the original files will be gone and build will fail. Use symlinks instead.

Just a question - will the install/deploy steps later dereference that symlink 
and install the file content or just a now broken symlink? Would a hardlink be 
better here and avoid uncertainty/confusion?


> Signed-off-by: Andrew Davis <afd@ti.com>
> ---
>  .../recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb       | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb b/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
> index c09f67b5..3c372b32 100644
> --- a/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
> +++ b/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
> @@ -125,18 +125,18 @@ do_install:prepend:j721s2-hs-evm() {
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
> 

