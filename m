Return-Path: <d-gole@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E483C4167B
	for <webhook@archiver.kernel.org>; Fri,  1 Dec 2023 11:22:56 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.20474.1701429774986374748
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 01 Dec 2023 03:22:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=nwJiD9nJ;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: d-gole@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3B1BMs7A125397
	for <meta-ti@lists.yoctoproject.org>; Fri, 1 Dec 2023 05:22:54 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1701429774;
	bh=y1RajX3ctlLfa307+dkkGK1VNIz5AMzFdCVbo7TX2pA=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=nwJiD9nJd0U+nmpifAtjOKyynIA5/OwnSEqXOsuIzjcQ31cIZ2C39wR0Xh5tBGQrA
	 4ip6w1Awk4lx0hWoS54B6zQee+A65roDrFNYCmT2V1VQn3FfKE2Ge22KvytmImc39y
	 zrqmqh7BWio0SA3QO/wUPFmzKC3M3WhiOU6wLIeA=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3B1BMsPS127431
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Fri, 1 Dec 2023 05:22:54 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 1
 Dec 2023 05:22:53 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 1 Dec 2023 05:22:53 -0600
Received: from [10.249.140.226] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3B1BMoQt000744;
	Fri, 1 Dec 2023 05:22:51 -0600
Message-ID: <e707701f-3250-31f5-2176-d043a378ff50@ti.com>
Date: Fri, 1 Dec 2023 16:52:50 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [meta-ti] [kirkstone PATCH] conf: machine: am62xx-lp-evm.conf:
 Pick LPM wkup sources overlay
To: <praneeth@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: Ryan Eatmon <reatmon@ti.com>, Judith Mendez <jm@ti.com>,
        Vibhore Vardhan
	<vibhore@ti.com>, <d-gole@ti.com>
References: <20231129214059.11612-1-praneeth@ti.com>
Content-Language: en-US
From: "Gole, Dhruva" <d-gole@ti.com>
Organization: Texas Instruments Incorporated
In-Reply-To: <20231129214059.11612-1-praneeth@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 01 Dec 2023 11:22:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17341

Hi!

On 11/30/2023 3:10 AM, praneeth via lists.yoctoproject.org wrote:
> commit [1] created a common LPM wkup sources overlay and removes
> k3-am62x-sk-mcu-gpio-wakeup.dtso for am62 device family.
> k3-am62x-sk prefix picks this overlay for am62xx, am62axx and am62xxsip already.
>
> This patch picks the necessary overlay for am62xx-lp-evm since it doesnt use
> the same prefix as other am62 platforms.
>
> [1]: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/commit/?&id=4ba1886b886d
>
> Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
> ---
>  meta-ti-bsp/conf/machine/am62xx-lp-evm.conf | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf b/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
> index dfb9cbfa..229b74bc 100644
> --- a/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
> +++ b/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
> @@ -8,8 +8,8 @@ KERNEL_DEVICETREE_PREFIX = " \
>      ti/k3-am62-lp \
>      ti/k3-am625-sk \
>      ti/k3-am62x-sk-hdmi \
> +    ti/k3-am62x-sk-lpm \


For the change,

Reviewed-by: Dhruva Gole <d-gole@ti.com>


>      ti/k3-am62x-sk-mcan \
> -    ti/k3-am62x-sk-mcu \
>  "
>  
>  KERNEL_DEVICETREE = " \
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#17338): https://lists.yoctoproject.org/g/meta-ti/message/17338
> Mute This Topic: https://lists.yoctoproject.org/mt/102881701/7412672
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/leave/11962887/7412672/717869840/xyzzy [d-gole@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
-- 
Regards,
Dhruva Gole <d-gole@ti.com>


