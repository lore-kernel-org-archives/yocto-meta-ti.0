Return-Path: <r-gunasekaran@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2111EB64D8
	for <webhook@archiver.kernel.org>; Thu, 22 Jun 2023 09:06:45 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.7126.1687424803358939625
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 22 Jun 2023 02:06:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=WadevgIK;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: r-gunasekaran@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35M96f8f100223;
	Thu, 22 Jun 2023 04:06:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1687424801;
	bh=J+x6Mt9NT8ialiDjp9iQE4H7g7H2GCIqAmmRvtlkJhU=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=WadevgIKY3tEUcuIDAjSdjzq/GSbbUyIJqfoxk6Lc6UnhGb5Vxqq6L/jBK/YcePeq
	 RoN3wHucNcOAUVASvyATMRpgGZxWbaPLDWvdwZCmfowEItRM7JG+scb1k9oUHzwwpH
	 YNHW5x35zRFLdgFbXSuN1LSF75drylOmvUvbM9hI=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35M96fiN015738
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 22 Jun 2023 04:06:41 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 22
 Jun 2023 04:06:40 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 22 Jun 2023 04:06:41 -0500
Received: from [10.24.69.79] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35M96cxt050322;
	Thu, 22 Jun 2023 04:06:39 -0500
Message-ID: <e033207a-b8d7-81cb-fe87-b05fee207898@ti.com>
Date: Thu, 22 Jun 2023 14:36:38 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [master/kirkstone][PATCH] prusw-fw: SR2.0: Package switch
 firmware for AM64
Content-Language: en-US
To: <meta-ti@lists.yoctoproject.org>, <reatmon@ti.com>, <denys@konsulko.com>,
        <praneeth@ti.com>
CC: <danishanwar@ti.com>
References: <20230622090201.18622-1-r-gunasekaran@ti.com>
From: Ravi Gunasekaran <r-gunasekaran@ti.com>
In-Reply-To: <20230622090201.18622-1-r-gunasekaran@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 22 Jun 2023 09:06:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16772



On 6/22/23 2:32 PM, Ravi Gunasekaran wrote:
> Now that driver support is added to support switch mode
> for AM64, update recipes to package the switch firmware.
> 
> Signed-off-by: Ravi Gunasekaran <r-gunasekaran@ti.com>
> ---
> This patch applies on top of [1]
> 
> [1] - https://lists.yoctoproject.org/g/meta-ti/message/16770

The patch will apply on top of [1]. Ideally I would wait until [1] is merged.
But due to time constraint I have posted it back to back. 
If the right process is to wait unitl [1] is merged and then send out this patch,
please let me know. I will do so. 

> 
>  meta-ti-bsp/recipes-bsp/prusw-fw/prusw-fw-am65x-sr2_git.bb | 2 +-
>  meta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc       | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-ti-bsp/recipes-bsp/prusw-fw/prusw-fw-am65x-sr2_git.bb b/meta-ti-bsp/recipes-bsp/prusw-fw/prusw-fw-am65x-sr2_git.bb
> index 97adf6fc..e0cf2cb5 100644
> --- a/meta-ti-bsp/recipes-bsp/prusw-fw/prusw-fw-am65x-sr2_git.bb
> +++ b/meta-ti-bsp/recipes-bsp/prusw-fw/prusw-fw-am65x-sr2_git.bb
> @@ -7,7 +7,7 @@ PR = "${INC_PR}.0"
>  
>  CLEANBROKEN = "1"
>  
> -COMPATIBLE_MACHINE = "am65xx-evm"
> +COMPATIBLE_MACHINE = "am65xx-evm|am64xx"
>  
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
> diff --git a/meta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc b/meta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc
> index 7c8f3171..266a7ef5 100644
> --- a/meta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc
> +++ b/meta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc
> @@ -17,7 +17,7 @@ RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:ti43x = " prueth-fw pruhsr-fw pruprp
>  RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:ti33x = " prueth-fw pruhsr-fw pruprp-fw"
>  RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:am65xx = " prueth-fw-am65x"
>  RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:am65xx-evm = " prueth-fw-am65x-sr2 pruhsr-fw-am65x-sr2 prusw-fw-am65x-sr2"
> -RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:am64xx = " prueth-fw-am65x-sr2 pruhsr-fw-am65x-sr2"
> +RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:am64xx = " prueth-fw-am65x-sr2 pruhsr-fw-am65x-sr2 prusw-fw-am65x-sr2"
>  
>  # Add run-time dependency for Cadence MHDP firmware to the rootfs
>  RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:j721e = " cadence-mhdp-fw"

-- 
Regards,
Ravi

