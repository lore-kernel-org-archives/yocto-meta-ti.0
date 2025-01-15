Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6394C02183
	for <webhook@archiver.kernel.org>; Wed, 15 Jan 2025 19:07:35 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web11.30300.1736968050611984624
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 15 Jan 2025 11:07:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=QjthGqpk;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: afd@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50FJ7SiV3909891
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 15 Jan 2025 13:07:28 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1736968048;
	bh=3YvTK1pUrlEmCYthEKFl/9JIOHnt6zvw2OPewlkZkn8=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=QjthGqpkldl5A6tkoyv8T+RRsYKdAgOzigSyv9GzD8R5TV+qP1ZFCGs3QeIaK0T/2
	 o5gHt2lHGrMr++I6Ju3iB5CtMs6BCeRAEAKwPd9Ipdu2N6rojVGtz+Mbph7vuYmRf0
	 5hBcVof6B5IHOCLKP5AiqPvHRW6tcffqCjiOI9wg=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 50FJ7SFE029610
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 15 Jan 2025 13:07:28 -0600
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 15
 Jan 2025 13:07:27 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 15 Jan 2025 13:07:27 -0600
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50FJ7Rbh063937;
	Wed, 15 Jan 2025 13:07:27 -0600
Message-ID: <bb311c87-bd6c-4e20-8023-102005fb44e6@ti.com>
Date: Wed, 15 Jan 2025 13:07:27 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master/scarthgap][PATCH 2/2] conf: machine:
 beaglebone-ai64: Update SPLY_BINARY
To: <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20250113225222.13622-1-reatmon@ti.com>
 <20250113225222.13622-2-reatmon@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20250113225222.13622-2-reatmon@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 15 Jan 2025 19:07:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18197

On 1/13/25 4:52 PM, Ryan Eatmon via lists.yoctoproject.org wrote:
> Rather than override the value for SPL_BINARY for all bsps, simply just
> set the value to the correct value.  This should be ok since all
> beaglebone-ai64 variations should use tispl.bin_unsigned.
> 
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---

Typo in subject line, s/SPLY_BINAR/SPL_BINARY

Andrew

>   meta-beagle/conf/machine/beaglebone-ai64.conf | 6 +-----
>   1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/meta-beagle/conf/machine/beaglebone-ai64.conf b/meta-beagle/conf/machine/beaglebone-ai64.conf
> index a521c8cf..ecd3a6e7 100644
> --- a/meta-beagle/conf/machine/beaglebone-ai64.conf
> +++ b/meta-beagle/conf/machine/beaglebone-ai64.conf
> @@ -18,11 +18,7 @@ UBOOT_CONFIG_FRAGMENTS:bsp-ti-6_1 = "j721e_beagleboneai64_a72.config"
>   UBOOT_MACHINE:bsp-bb_org-6_1 = "j721e_evm_a72_config"
>   UBOOT_CONFIG_FRAGMENTS:bsp-bb_org-6_1 = "j721e_beagleboneai64_a72.config"
>   
> -SPL_BINARY:bsp-ti-6_6 = "tispl.bin_unsigned"
> -SPL_BINARYNAME:bsp-ti-6_6 = "tispl.bin"
> -
> -SPL_BINARY:bsp-bb_org-6_6 = "tispl.bin_unsigned"
> -SPL_BINARYNAME:bsp-bb_org-6_6 = "tispl.bin"
> +SPL_BINARY = "tispl.bin_unsigned"
>   
>   KERNEL_DEVICETREE_PREFIX = " \
>       ti/k3-j721e \
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#18190): https://lists.yoctoproject.org/g/meta-ti/message/18190
> Mute This Topic: https://lists.yoctoproject.org/mt/110598031/3619733
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [afd@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

