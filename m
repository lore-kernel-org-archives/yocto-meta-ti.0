Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7EE7C48BF6
	for <webhook@archiver.kernel.org>; Thu, 29 Feb 2024 08:33:01 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.19712.1709195576397514795
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 29 Feb 2024 00:32:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=TvCmlQ6o;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: c-shilwant@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 41T8WtCG079682;
	Thu, 29 Feb 2024 02:32:55 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1709195575;
	bh=oGitxGyFjIkAcbf7LetkMtv16dWcXLBDrp83KJ4zG/8=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=TvCmlQ6oHVb3XF7o/U6U5/4QQOX2cX925dEGd3jjNT07x0GZMbqyA8w1acjaQcePV
	 1cZu/D60HvsoMg9Bn3NrVcHr70XESX2r9U6hnahTdSqJwQgOxQ8cJO5CJx4HTTb52t
	 f1YRKYw0jlqnDVRJOIjWV7cogPJSx7x4ZiADLfqM=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 41T8WtRP118955
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 29 Feb 2024 02:32:55 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 29
 Feb 2024 02:32:54 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 29 Feb 2024 02:32:54 -0600
Received: from [172.24.227.238] (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 41T8WqAA063174;
	Thu, 29 Feb 2024 02:32:52 -0600
Message-ID: <4004fdc8-7e82-4c0a-85a8-7475a55e51a8@ti.com>
Date: Thu, 29 Feb 2024 14:02:51 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [master/kirkstone][PATCH] conf: machine: am62axx: Pick overlays
 for V3Link cameras
To: Jai Luthra <j-luthra@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: Ryan Eatmon <reatmon@ti.com>, Denys Dmytriyenko <denys@konsulko.com>,
        Gyan
 Gupta <g-gupta@ti.com>, Devarsh Thakkar <devarsht@ti.com>,
        Aradhya Bhatia
	<a-bhatia1@ti.com>
References: <20240229081201.3850832-1-j-luthra@ti.com>
Content-Language: en-US
From: Chirag Shilwant <c-shilwant@ti.com>
In-Reply-To: <20240229081201.3850832-1-j-luthra@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 29 Feb 2024 08:33:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17498

On 29/02/24 13:42, Jai Luthra wrote:
> The new V3Link camera fusion board [1] comes with a CSI to FPDLink
> serializer board, which allows interfacing multiple 22-pin FFC
> compatible sensors with SK-AM62A.
>
> Currently overlays for interfacing IMX219 sensor with V3Link are built
> as part of the TI linux kernel, so pick these in the BSP filesystem.
>
> [1]: https://www.arducam.com/fpd-link-3-cameras/
>
> Signed-off-by: Jai Luthra <j-luthra@ti.com>
Acked-by: Chirag Shilwant <c-shilwant@ti.com>

> ---
>   meta-ti-bsp/conf/machine/am62axx-evm.conf | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/meta-ti-bsp/conf/machine/am62axx-evm.conf b/meta-ti-bsp/conf/machine/am62axx-evm.conf
> index 22f61401..238718d0 100644
> --- a/meta-ti-bsp/conf/machine/am62axx-evm.conf
> +++ b/meta-ti-bsp/conf/machine/am62axx-evm.conf
> @@ -8,6 +8,7 @@ KERNEL_DEVICETREE_PREFIX = " \
>       ti/k3-am62a7 \
>       ti/k3-am62x-sk \
>       ti/k3-fpdlink \
> +    ti/k3-v3link \
>   "
>   
>   KERNEL_DEVICETREE = " \

