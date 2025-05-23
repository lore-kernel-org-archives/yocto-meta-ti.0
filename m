Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A47F5C54ED0
	for <webhook@archiver.kernel.org>; Fri, 23 May 2025 09:00:38 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.43907.1747990835091445999
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 23 May 2025 02:00:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=F9KrUt24;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: c-shilwant@ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 54N90W04875175;
	Fri, 23 May 2025 04:00:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1747990832;
	bh=xbVgDCmTMNRFofD9qyP+5JfP3z/qed64axJLbdUL1tY=;
	h=Date:Subject:To:References:CC:From:In-Reply-To;
	b=F9KrUt24lFZZ7m7xpcipFc366OfjFup+akvbOxppXUG9OvmKLWkWmFX+5sSpIyLzf
	 nJBH0W6Onv+Qk7KAXivjpWBgtYp4u2FtN0dWEg5sCFypO7Nxbf71Fy6bb3YF0qbf9U
	 pqX8GsHa6tcDF4l8oK3SIfrb3/WMu0y9+YCS4k/o=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 54N90WjM4157799
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 23 May 2025 04:00:32 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 23
 May 2025 04:00:32 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 23 May 2025 04:00:32 -0500
Received: from [172.24.227.238] (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 54N90U9s1143438;
	Fri, 23 May 2025 04:00:31 -0500
Message-ID: <de91211e-df51-4ff6-983b-fe600129c5e3@ti.com>
Date: Fri, 23 May 2025 14:30:29 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master/scarthgap][PATCH] meta-ti-bsp: am62lxx: Do not
 deploy extra tiboot3.bin copy
To: <afd@ti.com>, <meta-ti@lists.yoctoproject.org>
References: <20250522210712.2106045-1-afd@ti.com>
Content-Language: en-US
CC: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>
From: Chirag Shilwant <c-shilwant@ti.com>
In-Reply-To: <20250522210712.2106045-1-afd@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 23 May 2025 09:00:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18589

On 23/05/25 02:37, Andrew Davis via lists.yoctoproject.org wrote:
> For AM62L there is no GP and both HS sub-types are supported by the
> same TIFS. This means we do not need multiple versions of tiboot3.bin.
> So no need to deploy an additional version which is identical to the
> default tiboot3.bin already deployed.
>
> Signed-off-by: Andrew Davis <afd@ti.com>
> ---
>   meta-ti-bsp/conf/machine/include/am62lxx.inc | 3 ---
>   1 file changed, 3 deletions(-)
>
> diff --git a/meta-ti-bsp/conf/machine/include/am62lxx.inc b/meta-ti-bsp/conf/machine/include/am62lxx.inc
> index d3bc81df..b4f0b8c9 100644
> --- a/meta-ti-bsp/conf/machine/include/am62lxx.inc
> +++ b/meta-ti-bsp/conf/machine/include/am62lxx.inc
> @@ -3,9 +3,6 @@ SOC_FAMILY:append = ":am62lxx"
>   
>   MACHINE_FEATURES += "screen"
>   
> -# Default tiboot3.bin on AM62L is for HS-FS
> -IMAGE_BOOT_FILES += "tiboot3-am62lx-hs-fs-evm.bin"


I still see the current ti-u-boot-2025.01-next shipping the 
|tiboot3-am62lx-hs-fs-evm.bin|[0]
Are we planning to drop that entry from 
arch/arm/dts/k3-am62l3-evm-binman.dtsi as well ?


[0]: 
https://git.ti.com/cgit/ti-u-boot/ti-u-boot/tree/arch/arm/dts/k3-am62l3-evm-binman.dtsi?h=ti-u-boot-2025.01-next&id=3d024809613c2a8f1d69258554ab8954d26537f5#n54


--
Chirag


> -
>   TFA_BOARD = "am62l"
>   TFA_K3_SYSTEM_SUSPEND = "1"
>   
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#18588): https://lists.yoctoproject.org/g/meta-ti/message/18588
> Mute This Topic: https://lists.yoctoproject.org/mt/113254992/7030289
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [c-shilwant@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

