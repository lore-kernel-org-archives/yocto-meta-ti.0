Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09D25C433EF
	for <webhook@archiver.kernel.org>; Fri, 13 May 2022 21:54:08 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.257.1652478840551486230
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 13 May 2022 14:54:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 85F5840CBB;
	Fri, 13 May 2022 21:53:59 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qCiKPcbtPzpp; Fri, 13 May 2022 21:53:59 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
 [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 4875140CB7;
	Fri, 13 May 2022 21:53:53 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 0E6DF174933; Fri, 13 May 2022 17:53:53 -0400 (EDT)
Date: Fri, 13 May 2022 17:53:53 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Aparna M <a-m1@ti.com>
Cc: meta-ti@lists.yoctoproject.org, nm@ti.com, praneeth@ti.com,
	reatmon@ti.com, devarsht@ti.com, s-adivi@ti.com
Subject: Re: [meta-ti][dunfell][PATCH] ti-tros-firmware: Add DM firmware
 binary to deploy directory for am62xx-evm
Message-ID: <20220513215353.GF9834@denix.org>
References: <20220513073848.13539-1-a-m1@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220513073848.13539-1-a-m1@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 13 May 2022 21:54:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14740

On Fri, May 13, 2022 at 01:08:48PM +0530, Aparna M wrote:
> The DM firmware binary is required for building uboot binaries for
> am62xx-evm  using toplevel makefile in SDK. Add this file to deploy
> directory so it can be included in prebuilt-images directory of SDK
> for am62xx-evm.
> 
> Signed-off-by: Aparna M <a-m1@ti.com>
> ---
> 
> I have had to include a dummy do_deplo without which yocto build fails
> with a "Task do_deploy is empty" error. Any suggestions as to why this
> could be happening?

You could have an empty do_deploy with a single colon symbol (NOP) in it:
https://git.openembedded.org/openembedded-core/tree/meta/recipes-support/user-creation/xuser-account_0.1.bb?h=dunfell


>  recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
> index 56a74899..0f2ba9af 100644
> --- a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
> +++ b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
> @@ -169,6 +169,16 @@ do_install_am62xx() {
>      install -m 0644 ${RTOS_DM_FW_DIR}/ipc_echo_testb_mcu1_0_release_strip.xer5f ${LEGACY_DM_FW_DIR}
>  }
>  
> +
> +do_deploy() {
> +    install -d ${DEPLOYDIR}
> +}
> +
> +do_deploy_am62xx() {
> +    install -d ${DEPLOYDIR}
> +    install -m 0644 ${RTOS_DM_FW_DIR}/ipc_echo_testb_mcu1_0_release_strip.xer5f ${DEPLOYDIR}
> +}
> +
>  # Set up names for the firmwares
>  ALTERNATIVE_${PN}_am65xx = "\
>                      am65x-mcu-r5f0_0-fw \
> @@ -357,3 +367,5 @@ INSANE_SKIP_${PN} += "arch"
>  # we don't want to configure and build the source code
>  do_compile[noexec] = "1"
>  do_configure[noexec] = "1"
> +
> +addtask deploy after do_install
> -- 
> 2.17.1
> 

