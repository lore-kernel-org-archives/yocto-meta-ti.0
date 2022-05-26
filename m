Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10601C433F5
	for <webhook@archiver.kernel.org>; Thu, 26 May 2022 16:08:14 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web08.21897.1653581287642835903
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 26 May 2022 09:08:08 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 6F2BB40D00;
	Thu, 26 May 2022 16:08:06 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KQmPapOHyYrZ; Thu, 26 May 2022 16:08:06 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
 [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 527B040CFF;
	Thu, 26 May 2022 16:08:03 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 8D80317495A; Thu, 26 May 2022 12:08:02 -0400 (EDT)
Date: Thu, 26 May 2022 12:08:02 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: afd@ti.com
Cc: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
	meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][dunfell][PATCH 1/2] trusted-firmware-a: Update to
 latest upstream master
Message-ID: <20220526160802.GX9834@denix.org>
References: <20220526155254.32536-1-afd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220526155254.32536-1-afd@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 26 May 2022 16:08:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14760

On Thu, May 26, 2022 at 10:52:53AM -0500, Andrew Davis via lists.yoctoproject.org wrote:
> For TF-A we work against upstream first, our fork has only been
> used in the rare cases we need to ship a feature before we can
> get it upstream. This is not currently the case so lets switch
> to upstream repo until there is a need for our fork.
> 
> Signed-off-by: Andrew Davis <afd@ti.com>
> ---
>  recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend b/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
> index 68bfa899..207f3dac 100644
> --- a/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
> +++ b/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
> @@ -1,8 +1,6 @@
>  PV_k3 = "2.6"
>  LIC_FILES_CHKSUM_k3 = "file://license.rst;md5=1dd070c98a281d18d9eefd938729b031"
> -BRANCH_k3 = "ti-atf"
> -SRC_URI_k3 = "git://git.ti.com/atf/arm-trusted-firmware.git;branch=${BRANCH};name=tfa"
> -SRCREV_tfa_k3 = "6541aa24f834daa80da701e0054dfe3a16cda0ce"
> +SRCREV_tfa_k3 = "453abc80b2eacbf2816c838e47e40f063227d934"

What is the corresponding TFA version for this commit?


>  COMPATIBLE_MACHINE_k3 = "k3"
>  TFA_BUILD_TARGET_k3 = "all"
>  TFA_INSTALL_TARGET_k3 = "bl31"
> -- 
> 2.36.1

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964

