Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B891ECCF9E0
	for <webhook@archiver.kernel.org>; Fri, 24 Oct 2025 15:34:41 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.14445.1761320071467399741
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 24 Oct 2025 08:34:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=l5X8hkVK;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: reatmon@ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59OFYSTs1930153;
	Fri, 24 Oct 2025 10:34:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1761320068;
	bh=61unrEGg0AGSg5hBGq5mfAvtE5kKZCkX0P/haCB1JPQ=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=l5X8hkVK+aQ1N2gspej0TKDouJ7/+x7/DeksHseQvow9NU5qJVbrlyxPrsaPe1ToE
	 5xR1B14MM6RpRxw9hoVdvnQfY/rrQKdzAhAq6LImk/jx+thVzpp28qEmofVPVmO4Ml
	 THeXj5AJbugvAw/4WIJNOD0QFeJfYJKX+hVDoH88=
Received: from DFLE206.ent.ti.com (dfle206.ent.ti.com [10.64.6.64])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59OFYSvQ3670543
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 24 Oct 2025 10:34:28 -0500
Received: from DFLE214.ent.ti.com (10.64.6.72) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 24 Oct
 2025 10:34:28 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 24 Oct 2025 10:34:28 -0500
Received: from [10.249.37.202] ([10.249.37.202])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59OFYR6N540009;
	Fri, 24 Oct 2025 10:34:27 -0500
Message-ID: <97250325-0126-47b4-ab79-0fb42e627a58@ti.com>
Date: Fri, 24 Oct 2025 10:34:27 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti] [master][PATCH] packagegroup-ti-core-initramfs: ensure
 TI_INITRAMFS_KERNEL_MODULES is set
To: Denys Dmytriyenko <denis@denix.org>, <meta-ti@lists.yoctoproject.org>
CC: Denys Dmytriyenko <denys@konsulko.com>
References: <20251023181013.25365-1-denis@denix.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20251023181013.25365-1-denis@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 24 Oct 2025 15:34:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19169



On 10/23/2025 1:10 PM, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@konsulko.com>
> 
> TI_INITRAMFS_KERNEL_MODULES gets set only for TI platfroms and ends up
> being undefined otherwise, which breaks parsing in yocto-check-layer
> and/or in multi-BSP setups. Ensure the variable is defined in the
> packagegroup, if not already set by the machine configuration.
> 
> Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
> ---
>   .../recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb      | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb b/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb
> index e9cf5e6b..6845f0c9 100644
> --- a/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb
> +++ b/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb
> @@ -2,6 +2,8 @@ SUMMARY = "Minimal initramfs for boot requirements"
>   
>   require recipes-core/packagegroups/packagegroup-core-boot.bb
>   
> +TI_INITRAMFS_KERNEL_MODULES ?= ""
> +
>   RDEPENDS:${PN} += "\
>       ${TI_INITRAMFS_KERNEL_MODULES} \
>       initramfs-framework-base \

I'm going to send an alternative patch.  We have the default assignment 
in ti-soc.inc, and my patch will remove that as well as it not needed 
there.  I'm going to blend your commit message and mine into a v2. 
Sending shortly.


> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#19156): https://lists.yoctoproject.org/g/meta-ti/message/19156
> Mute This Topic: https://lists.yoctoproject.org/mt/115915657/6551054
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [reatmon@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

