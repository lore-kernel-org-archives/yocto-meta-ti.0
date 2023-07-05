Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24A6BEB64DA
	for <webhook@archiver.kernel.org>; Wed,  5 Jul 2023 21:34:16 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.7337.1688592845723054390
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 05 Jul 2023 14:34:06 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id BE0BD40C50;
	Wed,  5 Jul 2023 21:34:03 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YKlyEMxKiFHC; Wed,  5 Jul 2023 21:34:03 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 8147A40C16;
	Wed,  5 Jul 2023 21:33:59 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id A621E163BC1; Wed,  5 Jul 2023 17:33:58 -0400 (EDT)
Date: Wed, 5 Jul 2023 17:33:58 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: nsaulnier@ti.com
Cc: "Bajjuri, Praneeth" <praneeth@ti.com>, "Eatmon, Ryan" <reatmon@ti.com>,
	"Nagalla, Hari" <hnagalla@ti.com>,
	"meta-ti@lists.yoctoproject.org" <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti] [kirkstone PATCH v2] pru-icss_git.bb: update to PSSP
 v6.2.0
Message-ID: <20230705213358.GZ1518@denix.org>
References: <20230705210705.15757-1-praneeth@ti.com>
 <fff7298dd43a43b4b7f9959952cf8474@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fff7298dd43a43b4b7f9959952cf8474@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 05 Jul 2023 21:34:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16817

Are there any plans to convert this to a prebuilt firmware binary hosted at 
ti-linux-firmware, like was done to many other firmwares in meta-ti?


On Wed, Jul 05, 2023 at 09:09:06PM +0000, Nick Saulnier via lists.yoctoproject.org wrote:
> No top-level build errors observed with the updated PSSP commits. Thanks Praneeth!
> -Nick
> 
> -----Original Message-----
> From: Bajjuri, Praneeth 
> Sent: Wednesday, July 05, 2023 4:07 PM
> To: Bajjuri, Praneeth <praneeth@ti.com>; Eatmon, Ryan <reatmon@ti.com>; Saulnier, Nick <nsaulnier@ti.com>; Nagalla, Hari <hnagalla@ti.com>
> Cc: meta-ti@lists.yoctoproject.org
> Subject: [kirkstone PATCH v2] pru-icss_git.bb: update to PSSP v6.2.0
> 
> From: Praneeth Bajjuri <praneeth@ti.com>
> 
> Upgrade to v6.2.0 version.
> This release supports Linux kernel 6.1.
> The RPMsg library in previous versions of the PSSP will not work with the PRU RPMsg drivers in Linux kernel 6.1.
> 
> Other changes in this version:
>  * Bug fixes:
>      - Getting Started Labs, fix "zero" command clearing too many bytes
>      - Include files, add a missing parentheses to pru_cfg, pru_ctrl, pru_ecap
>  * Update ReadMe files to point to the latest URLs
> 
> Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
> ---
> v2: fixes build issue reported on 32b platforms
> 
>  meta-ti-extras/recipes-bsp/pru/pru-icss_git.bb | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/meta-ti-extras/recipes-bsp/pru/pru-icss_git.bb b/meta-ti-extras/recipes-bsp/pru/pru-icss_git.bb
> index 3b0805d9..e73e0e7e 100644
> --- a/meta-ti-extras/recipes-bsp/pru/pru-icss_git.bb
> +++ b/meta-ti-extras/recipes-bsp/pru/pru-icss_git.bb
> @@ -8,10 +8,10 @@ inherit update-alternatives
>  
>  BRANCH = "master"
>  SRC_URI = "git://git.ti.com/git/pru-software-support-package/pru-software-support-package.git;protocol=https;branch=${BRANCH}"
> -SRCREV = "ae1decf0b494b2904e6157e1379691ffc468f0cf"
> +SRCREV = "3d0e311580d8967d0854ca789e9069e2810e9c1a"
>  
> -PV = "6.1.0"
> -PR = "r0"
> +PV = "6.2.0"
> +PR = "r1"

Not critical, but you usually want to reset PR (set to r0 or completely 
remove, as r0 is the default), when bumping PV, not increase it.

PV = Package Version, corresponds to the version of the component
PR = Package Revision, corresponds to recipe modifications w/o bumping 
component itself

Please note that these days Bitbake handles PR on its own and it rarely needs 
to be bumped manually.


>  require recipes-ti/includes/ti-paths.inc
>  
> --
> 2.17.1

