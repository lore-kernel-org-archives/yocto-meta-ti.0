Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5997DC282EC
	for <webhook@archiver.kernel.org>; Tue, 11 Mar 2025 16:24:52 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.13907.1741710286332912708
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 11 Mar 2025 09:24:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=apkR6mSA;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52BGOiwb1242500
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 11 Mar 2025 11:24:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1741710284;
	bh=B2nX086IfsBmCNwoC69wQDZPxyd4uoSXposzNseOKiA=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=apkR6mSAwwirESeoXZIBEAW4W8TE5WwQQbQYb+rjXYaAVSpaQ2xAMYu9Od/A6oxON
	 CMTPhmWqrTP6HWJWKlxlM9XLu690uaYjWrPRdclNB5mGxLjUnUhZzkMMQsQ7bL6jAB
	 UcTcJOYRrzW6NXk8bGDFwRPXWoW/EF+eBH/owxVw=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52BGOiIa112578
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 11 Mar 2025 11:24:44 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 11
 Mar 2025 11:24:44 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 11 Mar 2025 11:24:44 -0500
Received: from [10.249.33.140] ([10.249.33.140])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52BGOiLF013515;
	Tue, 11 Mar 2025 11:24:44 -0500
Message-ID: <4fcb945a-511e-48a2-9189-b027715b42fa@ti.com>
Date: Tue, 11 Mar 2025 11:24:44 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master/scarthgap][PATCH 1/2] conf: machine: j721e: Fix
 overlays for DS90UB954
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
References: <182BCBF447922E62.24390@lists.yoctoproject.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <182BCBF447922E62.24390@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 11 Mar 2025 16:24:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18370


You can ignore the 1/2 in the subject... I'm operating on very little 
sleep and forgot that I had already sent the 2/2 patch to the mailing 
list...

On 3/11/2025 11:18 AM, Ryan Eatmon via lists.yoctoproject.org wrote:
> The previous commit incorrectly added the k3-j721e-evm-ub954.dtbo to
> the KERNEL_DEVICETREE and it was missed during a quick review.
> 
> The correct way to add dtbs is to add a prefix string to the
> KERNEL_DEVICETREE_PREFIX variable so that all files that match the
> string will be picked up.  This allows for multiple kernels to be
> swapped out that may have different DTBs in their respective trees and
> not break a build.
> 
> The upstream testing on the kernel will automatically update the
> KERNEL_DEVICETREE variable when the final kernel version is available.
> That way the KERNEL_DEVICETREE always points to what is available in the
> mainline.
> 
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
>   meta-ti-bsp/conf/machine/j721e-evm.conf | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/meta-ti-bsp/conf/machine/j721e-evm.conf b/meta-ti-bsp/conf/machine/j721e-evm.conf
> index d216bbe2..b0b2a5b6 100644
> --- a/meta-ti-bsp/conf/machine/j721e-evm.conf
> +++ b/meta-ti-bsp/conf/machine/j721e-evm.conf
> @@ -19,7 +19,6 @@ KERNEL_DEVICETREE = " \
>       ti/k3-j721e-evm-quad-port-eth-exp.dtbo \
>       ti/k3-j721e-sk-csi2-dual-imx219.dtbo \
>       ti/k3-j721e-sk.dtb \
> -    ti/k3-j721e-evm-ub954.dtbo \
>   "
>   
>   UBOOT_MACHINE = "j721e_evm_a72_config"
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#18369): https://lists.yoctoproject.org/g/meta-ti/message/18369
> Mute This Topic: https://lists.yoctoproject.org/mt/111643069/6551054
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [reatmon@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

