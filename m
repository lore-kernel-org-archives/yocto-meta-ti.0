Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B62ECC433EF
	for <webhook@archiver.kernel.org>; Fri, 25 Mar 2022 19:23:26 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.1121.1648236205695511317
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 25 Mar 2022 12:23:26 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 8275140C46;
	Fri, 25 Mar 2022 19:23:24 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uNutWg_wyj11; Fri, 25 Mar 2022 19:23:24 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
 [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 5D21C40BA7;
	Fri, 25 Mar 2022 19:23:20 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 8B4B41748B6; Fri, 25 Mar 2022 15:23:19 -0400 (EDT)
Date: Fri, 25 Mar 2022 15:23:19 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: afd@ti.com
Cc: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
	Darren Etheridge <detheridge@ti.com>,
	meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][master][PATCH 1/4] meta-ti: rename j7-evm to
 j721e-evm
Message-ID: <20220325192319.GF23554@denix.org>
References: <20220325184151.16940-1-afd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220325184151.16940-1-afd@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 25 Mar 2022 19:23:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14552

On Fri, Mar 25, 2022 at 01:41:48PM -0500, Andrew F. Davis via lists.yoctoproject.org wrote:
> In many places we use "j7" the family when we should be using a
> specific SoC or EVM and vice-versa. For instance when including
> graphics drivers we add for all "j7" family, but what we really
> want is only for some specific j7 SoC.
> 
> First step in untangling this is to make it clear that there is
> no SoC called j7. There is a SoC called j721e with a j721e-evm.
> 
> Fix up this naming here.

Heh, I was actually thinking of finally making such change myself lately! :)

My main concern was about breaking downstream users of meta-ti who builds on 
top of j7-evm platform. But it is probably a good time to get it into master 
now, as recent layer restructuring already required downstream changes and 
adjustments.


> Signed-off-by: Andrew Davis <afd@ti.com>

I looked over the changes in both patchsets and they seem fine.
I'm going to do a quick test locally though.


> ---
>  .../machine/{j7-evm-k3r5.conf => j721e-evm-k3r5.conf}     | 4 ++--
>  meta-ti-bsp/conf/machine/{j7-evm.conf => j721e-evm.conf}  | 4 ++--
>  ...s-evm-k3r5-sr1-1.conf => j721e-hs-evm-k3r5-sr1-1.conf} | 6 +++---
>  .../{j7-hs-evm-k3r5.conf => j721e-hs-evm-k3r5.conf}       | 4 ++--
>  .../conf/machine/{j7-hs-evm.conf => j721e-hs-evm.conf}    | 8 ++++----
>  meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb        | 6 +++---
>  .../trusted-firmware-a/trusted-firmware-a_%.bbappend      | 2 +-
>  meta-ti-bsp/recipes-security/optee/optee-os_%.bbappend    | 2 +-
>  meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb    | 2 +-
>  9 files changed, 19 insertions(+), 19 deletions(-)
>  rename meta-ti-bsp/conf/machine/{j7-evm-k3r5.conf => j721e-evm-k3r5.conf} (63%)
>  rename meta-ti-bsp/conf/machine/{j7-evm.conf => j721e-evm.conf} (82%)
>  rename meta-ti-bsp/conf/machine/{j7-hs-evm-k3r5-sr1-1.conf => j721e-hs-evm-k3r5-sr1-1.conf} (53%)
>  rename meta-ti-bsp/conf/machine/{j7-hs-evm-k3r5.conf => j721e-hs-evm-k3r5.conf} (67%)
>  rename meta-ti-bsp/conf/machine/{j7-hs-evm.conf => j721e-hs-evm.conf} (79%)

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964

