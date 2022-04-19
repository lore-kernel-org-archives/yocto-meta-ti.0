Return-Path: <nm@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1305FC4167D
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 16:46:06 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.1631.1650409977644515391
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 19 Apr 2022 16:12:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=G6Gbbzea;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: nm@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 23JNCr1A103352;
	Tue, 19 Apr 2022 18:12:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1650409973;
	bh=ln+fFnSKBwOFmDyfgCHtNZLHVqKwRMIDSZvWL045E04=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=G6GbbzeaaCLM4wv88fmlMjnjpbrMyHVRWEVlzUvdnJ94Fmjr2ly5V1jHqNoqvD94l
	 pXC3oiM1rNnlR7qVCr7J/ZxI8cMynwrHPjkqITu6CEQWgWTkhvPaAFI1e/B+qzpLSk
	 JQS6u7vMApltSgxkXqQv6dgSsyf2gunEwPNDlP3A=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 23JNCrWk044543
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 19 Apr 2022 18:12:53 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 19
 Apr 2022 18:12:53 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 19 Apr 2022 18:12:53 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 23JNCrqx053130;
	Tue, 19 Apr 2022 18:12:53 -0500
Date: Tue, 19 Apr 2022 18:12:53 -0500
From: Nishanth Menon <nm@ti.com>
To: Denys Dmytriyenko <denis@denix.org>
CC: <meta-ti@lists.yoctoproject.org>, Denys Dmytriyenko <denys@konsulko.com>
Subject: Re: [meta-ti] [dunfell][PATCH] linux-ti-staging/mainline: depend on
 libmpc-native and gmp-native
Message-ID: <20220419231253.6rigwxy5xpwx2ctc@gatherer>
References: <1650398253-47514-1-git-send-email-denis@denix.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1650398253-47514-1-git-send-email-denis@denix.org>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 21 Apr 2022 16:46:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14606

On 15:57-20220419, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@konsulko.com>
> 
> Similar to OE-Core changes:
> https://git.openembedded.org/openembedded-core/commit/?id=128abf5eb76dd0d2680c93f043bf7cac0a3552b8
> 
> 5.10.85 changed how the GCC plugins are built, which means they now
> depend on both GMP and MPC to be built.
> 
> Also add MPC dependency to linux-ti-mainline, as it already depends
> on GMP since:
> https://git.yoctoproject.org/meta-ti/commit/?id=0376ebcd4333ea2915b3113945ff6a818f7cb442
> 
> Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
> ---
>  recipes-kernel/linux/linux-ti-mainline_git.bb | 2 +-
>  recipes-kernel/linux/linux-ti-staging_5.10.bb | 2 ++
>  2 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/recipes-kernel/linux/linux-ti-mainline_git.bb b/recipes-kernel/linux/linux-ti-mainline_git.bb
> index 7491dae..4a5034f 100644
> --- a/recipes-kernel/linux/linux-ti-mainline_git.bb
> +++ b/recipes-kernel/linux/linux-ti-mainline_git.bb
> @@ -10,7 +10,7 @@ require recipes-kernel/linux/setup-defconfig.inc
>  require recipes-kernel/linux/kernel-rdepends.inc
>  require recipes-kernel/linux/ti-kernel.inc
>  
> -DEPENDS += "gmp-native"
> +DEPENDS += "gmp-native libmpc-native"
>  
>  KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT} \
>  		      ${EXTRA_DTC_ARGS}"
> diff --git a/recipes-kernel/linux/linux-ti-staging_5.10.bb b/recipes-kernel/linux/linux-ti-staging_5.10.bb
> index 9eb5a30..a0ba18e 100644
> --- a/recipes-kernel/linux/linux-ti-staging_5.10.bb
> +++ b/recipes-kernel/linux/linux-ti-staging_5.10.bb
> @@ -13,6 +13,8 @@ require recipes-kernel/linux/bundle-devicetree.inc
>  require recipes-kernel/linux/kernel-rdepends.inc
>  require recipes-kernel/linux/ti-kernel.inc
>  
> +DEPENDS += "gmp-native libmpc-native"
> +
>  # Look in the generic major.minor directory for files
>  FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-5.10:"


Thank you.

Reviewed-by: Nishanth Menon <nm@ti.com>

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

