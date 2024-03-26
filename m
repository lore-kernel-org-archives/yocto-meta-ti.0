Return-Path: <a-limaye@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67229C54E67
	for <webhook@archiver.kernel.org>; Tue, 26 Mar 2024 05:56:27 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.1761.1711432584991276691
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 25 Mar 2024 22:56:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=rprOEFOi;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: a-limaye@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 42Q5uOes097143
	for <meta-ti@lists.yoctoproject.org>; Tue, 26 Mar 2024 00:56:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1711432584;
	bh=9HcpTvDcKBS4ug6aUdwmSte+2ijNIHoCHtCfIrq4irg=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=rprOEFOiUSPND8EMdmbMrvyIqrlcPFOoiA1Li3bIoe92Imv5AwaLbfyOAH/BRha/b
	 TFnDULovD1sGKk/hNGjt/AxpyvASnqqpAi0BF8X9VIerAendC7iYMARvHyAJwMF5cO
	 kWQhbcTcHNLu6Sh5vpeRXZSXc6ae+TOiqHN+uJaw=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 42Q5uO3D009838
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Tue, 26 Mar 2024 00:56:24 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 26
 Mar 2024 00:56:23 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 26 Mar 2024 00:56:23 -0500
Received: from [172.24.17.33] (lt5cd112gt3k.dhcp.ti.com [172.24.17.33])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 42Q5uLrG048756;
	Tue, 26 Mar 2024 00:56:22 -0500
Message-ID: <9a5b6af7-c993-49d7-896b-e84af8d5bc95@ti.com>
Date: Tue, 26 Mar 2024 11:26:21 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master/kirkstone][PATCH] conf: machine: j722s-evm:
 Update KERNERL_DEVICETREE_PREFIX to package fpdlink cam dtbos
To: Rahul T R <r-ravikumar@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: Ryan Eatmon <reatmon@ti.com>
References: <20240325140413.653268-1-r-ravikumar@ti.com>
Content-Language: en-US
From: "Limaye, Aniket" <a-limaye@ti.com>
In-Reply-To: <20240325140413.653268-1-r-ravikumar@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 26 Mar 2024 05:56:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17553


On 3/25/2024 7:34 PM, Rahul T R wrote:
> j722s-evm supports capture from fpdlink cams via fpdlink fusion1 board
> or V3Link camera fusion board. So package fpdlink camera overlays
>
> Signed-off-by: Rahul T R <r-ravikumar@ti.com>

Acked-by: Aniket Limaye <a-limaye@ti.com>


> ---
>   meta-ti-bsp/conf/machine/j722s-evm.conf | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/meta-ti-bsp/conf/machine/j722s-evm.conf b/meta-ti-bsp/conf/machine/j722s-evm.conf
> index 7e5874ab..74bcdfce 100644
> --- a/meta-ti-bsp/conf/machine/j722s-evm.conf
> +++ b/meta-ti-bsp/conf/machine/j722s-evm.conf
> @@ -4,7 +4,11 @@
>   
>   require conf/machine/include/j722s.inc
>   
> -KERNEL_DEVICETREE_PREFIX = "ti/k3-j722s"
> +KERNEL_DEVICETREE_PREFIX = " \
> +    ti/k3-j722s \
> +    ti/k3-fpdlink \
> +    ti/k3-v3link \
> +"
>   
>   KERNEL_DEVICETREE = ""
>   

