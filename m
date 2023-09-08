Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77164EE800C
	for <webhook@archiver.kernel.org>; Fri,  8 Sep 2023 14:19:28 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.40311.1694182760887878626
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 08 Sep 2023 07:19:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=HDoiRFoh;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: afd@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 388EJJOD048047
	for <meta-ti@lists.yoctoproject.org>; Fri, 8 Sep 2023 09:19:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1694182759;
	bh=n0Y3Dj+ng4xFAtM7TrPlRpmweuCBlhUa/qbU/ijsbok=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=HDoiRFohGGZLImiO2jcQliIuLYjzWnS4B0G/9N+uxJPBEh8ZAbIjlembTu2IRQpWI
	 Jp3Q5bb0J74E4uBkGWE2awUOWswVge1OXMRC0p0Ck05eMXTKJeBzFvD78S8kUQtIqD
	 H3PpMzCgMMRiRnyvNrBZSADLiQvnu0cxMZ/QBPuw=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 388EJJKH016699
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Fri, 8 Sep 2023 09:19:19 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 8
 Sep 2023 09:19:18 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 8 Sep 2023 09:19:18 -0500
Received: from [10.250.38.120] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 388EJHW1089893;
	Fri, 8 Sep 2023 09:19:18 -0500
Message-ID: <3bce9ebc-90ba-e525-67da-fda1b8ce95a4@ti.com>
Date: Fri, 8 Sep 2023 09:19:17 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [meta-ti][kirkstone][PATCH v2] kernel-rdepends: Remove PRU
 Ethernet firmwares for legacy devices
To: <r-gunasekaran@ti.com>, <meta-ti@lists.yoctoproject.org>, <reatmon@ti.com>
CC: <praneeth@ti.com>, <srk@ti.com>
References: <20230908114439.13213-1-r-gunasekaran@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20230908114439.13213-1-r-gunasekaran@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 08 Sep 2023 14:19:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16937

On 9/8/23 6:44 AM, Ravi Gunasekaran via lists.yoctoproject.org wrote:
> Remove the PRU Ethernet firmwares from being packaged for
> AM33x, AM43x and AM57x.
> 

Commit messages should give the "why", we can read the code.

Are we dropping support for PRUETH from these boards? I still
use this, I'm sure others do too.

Andrew

> Signed-off-by: Ravi Gunasekaran <r-gunasekaran@ti.com>
> ---
> Changes from v1:
> --------------
> * Corrected the commit message.
> 
>   meta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc | 3 ---
>   1 file changed, 3 deletions(-)
> 
> diff --git a/meta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc b/meta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc
> index 266a7ef5..317ab1b1 100644
> --- a/meta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc
> +++ b/meta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc
> @@ -12,9 +12,6 @@ RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:dra7xx = " vpdma-fw"
>   RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:dra7xx = " goodix-fw"
>   
>   # Add run-time dependency for PRU Ethernet firmware to the rootfs
> -RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:am57xx = " prueth-fw prusw-fw pruhsr-fw pruprp-fw"
> -RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:ti43x = " prueth-fw pruhsr-fw pruprp-fw"
> -RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:ti33x = " prueth-fw pruhsr-fw pruprp-fw"
>   RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:am65xx = " prueth-fw-am65x"
>   RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:am65xx-evm = " prueth-fw-am65x-sr2 pruhsr-fw-am65x-sr2 prusw-fw-am65x-sr2"
>   RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:am64xx = " prueth-fw-am65x-sr2 pruhsr-fw-am65x-sr2 prusw-fw-am65x-sr2"
> 
> base-commit: c3916324a01fe96c68a78ef9ed0070d6b1fc8f2f
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#16932): https://lists.yoctoproject.org/g/meta-ti/message/16932
> Mute This Topic: https://lists.yoctoproject.org/mt/101234600/3619733
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [afd@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

