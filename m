Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5470C4332F
	for <webhook@archiver.kernel.org>; Thu,  2 Nov 2023 12:31:17 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.29747.1698928269726626487
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 02 Nov 2023 05:31:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=fsThvR/F;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: c-shilwant@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3A2CV8ad067178;
	Thu, 2 Nov 2023 07:31:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1698928268;
	bh=YBrv8Fges9z2gEZB7tXFmJfM4mRtBI3KvvL66l+IKew=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=fsThvR/FkbdB64wrsq+EUviOxkZxBkDksuqrBR5z6MR9H6CGTZNru8rGZ4egiMdHD
	 CFJ5yvjdYUBAuU5iLRswS/9SFmT8bUJQbi2Enp0o5sQih9oJxLRCpVQQrZUvv8dYP3
	 JDsun3DzRp99y752ojTi6BkbP6A4+GPDYq4hWfoc=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3A2CV8uA081877
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 2 Nov 2023 07:31:08 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 2
 Nov 2023 07:31:08 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 2 Nov 2023 07:31:08 -0500
Received: from [172.24.227.238] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3A2CV6Zk009183;
	Thu, 2 Nov 2023 07:31:06 -0500
Message-ID: <d4e79f08-a031-4bbf-b089-83c646324486@ti.com>
Date: Thu, 2 Nov 2023 18:01:05 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXTERNAL] [meta-ti] [kirkstone][PATCH] k3r5: Use the ?= default
 assignment to allow for overrides
Content-Language: en-US
To: Massimiliano Minella <massimiliano.minella@gmail.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Ryan Eatmon <reatmon@ti.com>,
        Massimiliano Minella
	<massimiliano.minella@se.com>,
        Gyan Gupta <g-gupta@ti.com>
References: <20231102104828.100681-1-massimiliano.minella@gmail.com>
From: Chirag Shilwant <c-shilwant@ti.com>
In-Reply-To: <20231102104828.100681-1-massimiliano.minella@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 02 Nov 2023 12:31:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17222


On 02/11/23 16:18, Massimiliano Minella wrote:
> From: Ryan Eatmon <reatmon@ti.com>
>
> Move to setting the values for PREFERRED_PROVIDER using the
> ?= default assignment so that we can override the setting if
> we would like to.
>
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> Signed-off-by: Massimiliano Minella <massimiliano.minella@se.com>


Acked-by: Chirag Shilwant <c-shilwant@ti.com>


> ---
>   meta-ti-bsp/conf/machine/include/k3r5.inc | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta-ti-bsp/conf/machine/include/k3r5.inc b/meta-ti-bsp/conf/machine/include/k3r5.inc
> index c5c03cbf..184d3a09 100644
> --- a/meta-ti-bsp/conf/machine/include/k3r5.inc
> +++ b/meta-ti-bsp/conf/machine/include/k3r5.inc
> @@ -11,9 +11,9 @@ require conf/machine/include/arm/armv7a/tune-cortexa8.inc
>   # https://git.ti.com/cgit/ti-u-boot/ti-u-boot/tree/doc/board/ti/j721e_evm.rst
>   # https://git.ti.com/cgit/ti-u-boot/ti-u-boot/tree/doc/board/ti/am62x_sk.rst
>   # https://git.ti.com/cgit/ti-u-boot/ti-u-boot/tree/doc/board/ti/k3.rst
> -PREFERRED_PROVIDER_virtual/kernel = "linux-dummy"
> -PREFERRED_PROVIDER_virtual/bootloader = "u-boot-ti-staging"
> -PREFERRED_PROVIDER_u-boot = "u-boot-ti-staging"
> +PREFERRED_PROVIDER_virtual/kernel ?= "linux-dummy"
> +PREFERRED_PROVIDER_virtual/bootloader ?= "u-boot-ti-staging"
> +PREFERRED_PROVIDER_u-boot ?= "u-boot-ti-staging"
>   
>   SPL_SUFFIX = "bin"
>   SPL_BINARY = "tiboot3-${SYSFW_SOC}-${SYSFW_SUFFIX}-${SYSFW_CONFIG}.${SPL_SUFFIX}"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#17221): https://lists.yoctoproject.org/g/meta-ti/message/17221
> Mute This Topic: https://lists.yoctoproject.org/mt/102339031/7030289
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [c-shilwant@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

