Return-Path: <r-gunasekaran@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F1E4EE57FC
	for <webhook@archiver.kernel.org>; Fri,  8 Sep 2023 11:40:16 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.37026.1694173210244086304
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 08 Sep 2023 04:40:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=wtx+4yCp;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: r-gunasekaran@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 388Be9Xc128687
	for <meta-ti@lists.yoctoproject.org>; Fri, 8 Sep 2023 06:40:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1694173209;
	bh=D0ELUz5Jm55N8MDJCn95rd3OyWXjDmMZgzEVDT9/RM8=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=wtx+4yCpPp2ckCWKTRVvXyhGJCnX+dXuu3wDTCY/pKpNtO33vT+4PE3+m9n8rTV//
	 Pn9kf7H4x8CoQjR/eAlPTQStBgECAp6vyF1d+SkKJu3sDjk8lDC0BEgxGz232pLIfd
	 JjZC+hSgNo84JQkj7a1wpklp5kyFQ3YNK+L2OoQI=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 388Be97T111604
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Fri, 8 Sep 2023 06:40:09 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 8
 Sep 2023 06:40:09 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 8 Sep 2023 06:40:09 -0500
Received: from [172.24.227.83] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 388Be73n030427;
	Fri, 8 Sep 2023 06:40:08 -0500
Message-ID: <804972a0-b2d1-9cee-cbe0-abac88e5b223@ti.com>
Date: Fri, 8 Sep 2023 17:10:07 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [meta-ti][kirkstone]] kernel-rdepends: Remove PRU Ethernet
 firmwares for legacy devices
Content-Language: en-US
To: <meta-ti@lists.yoctoproject.org>, <reatmon@ti.com>
CC: <praneeth@ti.com>, <srk@ti.com>
References: <20230908113836.12413-1-r-gunasekaran@ti.com>
From: Ravi Gunasekaran <r-gunasekaran@ti.com>
In-Reply-To: <20230908113836.12413-1-r-gunasekaran@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 08 Sep 2023 11:40:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16931



On 9/8/23 5:08 PM, Ravi Gunasekaran wrote:
> Remove the PRU Ethernet drivers from being packaged.

Please ignore this patch. It is supposed to be firmware and not drivers
I will send out a v2 fixing this.

> 
> Signed-off-by: Ravi Gunasekaran <r-gunasekaran@ti.com>
> ---
>  meta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/meta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc b/meta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc
> index 266a7ef5..317ab1b1 100644
> --- a/meta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc
> +++ b/meta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc
> @@ -12,9 +12,6 @@ RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:dra7xx = " vpdma-fw"
>  RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:dra7xx = " goodix-fw"
>  
>  # Add run-time dependency for PRU Ethernet firmware to the rootfs
> -RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:am57xx = " prueth-fw prusw-fw pruhsr-fw pruprp-fw"
> -RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:ti43x = " prueth-fw pruhsr-fw pruprp-fw"
> -RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:ti33x = " prueth-fw pruhsr-fw pruprp-fw"
>  RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:am65xx = " prueth-fw-am65x"
>  RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:am65xx-evm = " prueth-fw-am65x-sr2 pruhsr-fw-am65x-sr2 prusw-fw-am65x-sr2"
>  RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:am64xx = " prueth-fw-am65x-sr2 pruhsr-fw-am65x-sr2 prusw-fw-am65x-sr2"
> 
> base-commit: c3916324a01fe96c68a78ef9ed0070d6b1fc8f2f

-- 
Regards,
Ravi

