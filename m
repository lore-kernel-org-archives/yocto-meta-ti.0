Return-Path: <praneeth@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62A2DC0218F
	for <webhook@archiver.kernel.org>; Tue,  4 Feb 2025 08:01:26 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.111415.1738656079435514718
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 04 Feb 2025 00:01:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=sA015qh1;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: praneeth@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51481HcC2296669
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 4 Feb 2025 02:01:18 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738656078;
	bh=FV3ZTep7q/iedAXHbHI7ErDLLMKkDp0y2D6JBShUlRE=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=sA015qh1hQxnHjlefFaaYdB0we7YCiWrabiwSjhESagJQW5xqhonVUmYc1+Chp2vE
	 tnWy+eGm+tgp9Vd1Mb4WxT5f/cwePNFSus5VEp+5LVCU1dxWZB/07sYlnXw3Ws3EZn
	 yonxR/QLc0baErTDjuYRpJ2+WNTAjpy9M2KjOpEs=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 51481Hmk116709
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 4 Feb 2025 02:01:17 -0600
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 4
 Feb 2025 02:01:17 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 4 Feb 2025 02:01:16 -0600
Received: from [172.24.28.129] (lt5cg925bjv2.dhcp.ti.com [172.24.28.129])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51481EHK065985;
	Tue, 4 Feb 2025 02:01:15 -0600
Message-ID: <cfa9f4d2-62c4-48cf-8ca1-dc7959a8f4e0@ti.com>
Date: Tue, 4 Feb 2025 13:31:14 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master][PATCH] u-boot: Fix implicit declaration compile
 error
To: Ryan Eatmon <reatmon@ti.com>, Denys Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20250203232736.9017-1-reatmon@ti.com>
Content-Language: en-US
From: "Bajjuri, Praneeth" <praneeth@ti.com>
In-Reply-To: <20250203232736.9017-1-reatmon@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 04 Feb 2025 08:01:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18254



On 2/4/2025 4:57 AM, Ryan Eatmon wrote:
> A recent patch to ti-u-boot 2025.01 introduces a compile error on
> master for am64xx-evm.  A patch has been sent to the mailing list
> that fixes this, but it will take time before we will see that patch
> available to us on master.  So we need to carry the patch here.
> 
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
>   .../u-boot/u-boot-ti-staging_2025.01.bb       |  2 ++
>   ...-Fix-implicit-definition-of-ti_secur.patch | 32 +++++++++++++++++++

pulled this patch to ti-u-boot-2025.01-next

https://git.ti.com/cgit/ti-u-boot/ti-u-boot/commit/?h=ti-u-boot-2025.01-next&id=5731ef2a5d3ca69c045b30c8ea31f9a6cd0cfbe7


>   2 files changed, 34 insertions(+)
>   create mode 100644 meta-ti-bsp/recipes-bsp/u-boot/u-boot/0001-remoteproc-k3-m4-Fix-implicit-definition-of-ti_secur.patch
> 
> diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
> index 5e56d2db..c041ffe8 100644
> --- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
> +++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
> @@ -6,4 +6,6 @@ PR = "r0"
>   
>   BRANCH = "ti-u-boot-2025.01"
>   
> +SRC_URI += "file://0001-remoteproc-k3-m4-Fix-implicit-definition-of-ti_secur.patch"
> +
>   SRCREV = "4e9c90ad8b12cc5b4fdd1308bc3ac3e4fc869aab"
> diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot/0001-remoteproc-k3-m4-Fix-implicit-definition-of-ti_secur.patch b/meta-ti-bsp/recipes-bsp/u-boot/u-boot/0001-remoteproc-k3-m4-Fix-implicit-definition-of-ti_secur.patch
> new file mode 100644
> index 00000000..c6b15651
> --- /dev/null
> +++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot/0001-remoteproc-k3-m4-Fix-implicit-definition-of-ti_secur.patch
> @@ -0,0 +1,32 @@
> +From f9c2ae13a80f3b0f309214c6b57bc3a705b71398 Mon Sep 17 00:00:00 2001
> +From: Ryan Eatmon <reatmon@ti.com>
> +Date: Mon, 3 Feb 2025 16:54:24 -0600
> +Subject: [tiU25.01]] remoteproc: k3-m4: Fix implicit definition of
> + ti_secure_image_post_process
> +
> +Add missing include to make sure that ti_secure_image_post_process() is
> +not implicitly declared.
> +
> +Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> +
> +Upstream-Status: Pending
> +
> +---
> + drivers/remoteproc/ti_k3_m4_rproc.c | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/drivers/remoteproc/ti_k3_m4_rproc.c b/drivers/remoteproc/ti_k3_m4_rproc.c
> +index 5a5ae2fa81d..516c817385e 100644
> +--- a/drivers/remoteproc/ti_k3_m4_rproc.c
> ++++ b/drivers/remoteproc/ti_k3_m4_rproc.c
> +@@ -20,6 +20,7 @@
> + #include <linux/sizes.h>
> + #include <linux/soc/ti/ti_sci_protocol.h>
> + #include "ti_sci_proc.h"
> ++#include <mach/security.h>
> +
> + /**
> +  * struct k3_m4_mem - internal memory structure
> +--
> +2.17.1
> +

