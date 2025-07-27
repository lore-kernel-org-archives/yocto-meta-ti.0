Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A634C87FCC
	for <webhook@archiver.kernel.org>; Sun, 27 Jul 2025 15:50:31 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.62283.1753631430369670354
 for <meta-ti@lists.yoctoproject.org>;
 Sun, 27 Jul 2025 08:50:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=kzWs4FbH;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: reatmon@ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56RFoP1X2116583;
	Sun, 27 Jul 2025 10:50:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1753631425;
	bh=jkDBlkfaFbPKnpjJVlBijhvK0xXl10cCXPU1vzxmPk8=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=kzWs4FbHXRy7hwo0+mBdJZYcCLmAjFwVYGSVJ0GIedOHuBFjd8eXBYjTWD9LgNfxK
	 vsSm4cM1llGKIOK7ClPpujtSMfbPGZcqWcbqfqSmc78uqp/A84GyPlt2spdKnKqeaG
	 MTC61kVs/SIqLn5uym/WUueyX/g9T60svnWDnf0s=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56RFoPA73818325
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Sun, 27 Jul 2025 10:50:25 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Sun, 27
 Jul 2025 10:50:25 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Sun, 27 Jul 2025 10:50:25 -0500
Received: from [10.249.37.202] ([10.249.37.202])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56RFoPX9671670;
	Sun, 27 Jul 2025 10:50:25 -0500
Message-ID: <a6a7ff30-7e8b-4501-bc60-83c173a6a39a@ti.com>
Date: Sun, 27 Jul 2025 10:50:25 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti] [master][PATCH 1/3] meta-ti-bsp: move
 KERNEL_DTBVENDORED settings
To: Denys Dmytriyenko <denis@denix.org>, <meta-ti@lists.yoctoproject.org>
CC: Denys Dmytriyenko <denys@konsulko.com>
References: <20250725204836.2549216-1-denis@denix.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20250725204836.2549216-1-denis@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Sun, 27 Jul 2025 15:50:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18835


This approach is much cleaner and gives us a step towards being able to 
upstream this concept.  It passed all builds and initial manual 
examination shows that the correct files are in the boot partition.

Thanks for putting this together.

If I don't hear any objections by mid week, then I'll accept these 
patches and we can work on getting them into production.



On 7/25/2025 3:48 PM, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@konsulko.com>
> 
> Move KERNEL_DTBVENDORED settings from the kernel to ti-soc.inc
> in the config scope.
> 
> Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
> ---
>   meta-ti-bsp/conf/machine/include/ti-soc.inc    | 5 +++++
>   meta-ti-bsp/recipes-kernel/linux/ti-kernel.inc | 5 -----
>   2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/meta-ti-bsp/conf/machine/include/ti-soc.inc b/meta-ti-bsp/conf/machine/include/ti-soc.inc
> index 56ea9e47..2eefa8a0 100644
> --- a/meta-ti-bsp/conf/machine/include/ti-soc.inc
> +++ b/meta-ti-bsp/conf/machine/include/ti-soc.inc
> @@ -14,3 +14,8 @@ MACHINE_ESSENTIAL_EXTRA_RDEPENDS += "kernel-devicetree"
>   
>   # All machines should start off pointing at the default base kernel class
>   KERNEL_BASE_CLASS = "kernel"
> +
> +# Tell the kernel class to install the DTBs in the same directory structure as
> +# the kernel
> +KERNEL_DTBDEST = "${KERNEL_IMAGEDEST}/dtb"
> +KERNEL_DTBVENDORED = "1"
> diff --git a/meta-ti-bsp/recipes-kernel/linux/ti-kernel.inc b/meta-ti-bsp/recipes-kernel/linux/ti-kernel.inc
> index 40ddc4fd..ef4ba4a1 100644
> --- a/meta-ti-bsp/recipes-kernel/linux/ti-kernel.inc
> +++ b/meta-ti-bsp/recipes-kernel/linux/ti-kernel.inc
> @@ -1,8 +1,3 @@
> -# Tell the kernel class to install the DTBs in the same directory structure as
> -# the kernel.
> -KERNEL_DTBDEST = "${KERNEL_IMAGEDEST}/dtb"
> -KERNEL_DTBVENDORED = "1"
> -
>   KERNEL_GIT_URI ?= "git://git.ti.com/git/ti-linux-kernel/ti-linux-kernel.git"
>   KERNEL_GIT_PROTOCOL ?= "https"
>   KERNEL_GIT_BRANCH ?= "branch=${BRANCH}"
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#18829): https://lists.yoctoproject.org/g/meta-ti/message/18829
> Mute This Topic: https://lists.yoctoproject.org/mt/114344327/6551054
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [reatmon@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

