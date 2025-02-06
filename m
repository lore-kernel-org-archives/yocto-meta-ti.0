Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A576C02194
	for <webhook@archiver.kernel.org>; Thu,  6 Feb 2025 20:44:37 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.52634.1738874670584636358
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 06 Feb 2025 12:44:31 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id A3DCC40C1E;
	Thu,  6 Feb 2025 20:44:29 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TrTPKuYg-ugC; Thu,  6 Feb 2025 20:44:29 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 7EC2140C1C;
	Thu,  6 Feb 2025 20:44:27 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 9A47316422B; Thu,  6 Feb 2025 15:44:26 -0500 (EST)
Date: Thu, 6 Feb 2025 15:44:26 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Chirag Shilwant <c-shilwant@ti.com>
Cc: meta-ti@lists.yoctoproject.org, Ryan Eatmon <reatmon@ti.com>
Subject: Re: [meta-ti][master][PATCH v3 0/5] Upgrade TFA, OPTEE-OS & enable
 AM62L support
Message-ID: <20250206204426.GP21608@denix.org>
References: <20250206144021.3007831-1-c-shilwant@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250206144021.3007831-1-c-shilwant@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 06 Feb 2025 20:44:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18287

On Thu, Feb 06, 2025 at 08:10:16PM +0530, Chirag Shilwant wrote:
> This series is intended only for master.
> It bumps up TFA to v2.12+ & OPTEE-OS to v4.5.0+
> It also aims to enable platform support for AM62L in meta-ti-bsp
> 
> Link to AM62L TRM: https://www.ti.com/lit/pdf/sprujb4

The series looks good to me now, thank you!


> Changes in v3:
> 
> * Add License-Update tag for "trusted-firmware-a: Switch TFA to TI fork"
> 
> Changes in v2:
> 
> * Upgrade optee-os to v4.5.0+ & drop Add-initial-support-for-AM62Lx-SoC.patch
> * Split TFA upgrade to v2.12 & switch to Github TI fork into 2 commits
> * Fix indentation for AM62L specific newly added changes in u-boot-ti.inc by using OE-Core policy
> * Set KERNEL_DEVICETREE to empty
> * Drop SERIAL_CONSOLES from am62lxx.inc as k3.inc already has it defined
> 
> Chirag Shilwant (5):
>   recipes-security: optee: Update to v4.5.0+
>   trusted-firmware-a: Update to v2.12 release tag
>   trusted-firmware-a: Switch TFA to TI fork
>   meta-ti-bsp: Add Support for AM62L
>   conf: machine: am62lxx-evm: Add logic to generate UBI filesystem
>     images
> 
>  meta-ti-bsp/conf/machine/am62lxx-evm.conf     | 19 +++++++++++++++++
>  meta-ti-bsp/conf/machine/include/am62lxx.inc  | 12 +++++++++++
>  meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb  |  2 ++
>  .../recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb    |  6 ++++++
>  .../trusted-firmware-a-ti.inc                 | 11 ++++++----
>  meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc  | 21 +++++++++++++++++++
>  .../optee/optee-os-ti-overrides.inc           |  1 +
>  .../optee/optee-os-ti-version.inc             |  4 ++--
>  8 files changed, 70 insertions(+), 6 deletions(-)
>  create mode 100644 meta-ti-bsp/conf/machine/am62lxx-evm.conf
>  create mode 100644 meta-ti-bsp/conf/machine/include/am62lxx.inc
> 
> -- 
> 2.34.1

