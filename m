Return-Path: <devarsht@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EBA4C433EF
	for <webhook@archiver.kernel.org>; Fri, 13 May 2022 14:19:32 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.8719.1652451562680021539
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 13 May 2022 07:19:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=UGf+Fnvy;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: devarsht@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 24DEJHMV025247;
	Fri, 13 May 2022 09:19:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1652451557;
	bh=u0pVFF4KMMYJdsRxG4YJ5KT9NhqR4EuJ3+bYb2AsxG4=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=UGf+FnvysyT32Qxt4XnnlLGQG7/7HAPj/A9iQH0RWSNfMrn890JT2oQdaxpqnRSLl
	 gKHMkJ+5A2lX1Vmo0MKx/6txB5igXNQTaOx+F4QGDV5xCl5V7VI4LaUUHhAI3aRN+m
	 hO0/0AnVQNfrnHGFzRixlwbFWq6ybqOZgqQ8nV2U=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 24DEJHMA003392
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 13 May 2022 09:19:17 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 13
 May 2022 09:19:17 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 13 May 2022 09:19:17 -0500
Received: from [10.250.150.71] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 24DEJFji010047;
	Fri, 13 May 2022 09:19:16 -0500
Message-ID: <cafd8c8c-6f1c-3a0c-e569-e2fefd13423b@ti.com>
Date: Fri, 13 May 2022 19:49:14 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [EXTERNAL] [meta-ti] [master][PATCH 21/26] conf: machine: am62xx
 Add missing dtbo file
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>, <meta-ti@lists.yoctoproject.org>,
        Ryan Eatmon <reatmon@ti.com>
References: <20220502145120.726632-1-denis@denix.org>
 <20220502145120.726632-22-denis@denix.org>
From: Devarsh Thakkar <devarsht@ti.com>
In-Reply-To: <20220502145120.726632-22-denis@denix.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 13 May 2022 14:19:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14736


On 02/05/22 20:21, Denys Dmytriyenko wrote:
> From: Ryan Eatmon <reatmon@ti.com>
>
> Add missing k3-am625-sk-csi2-ov5640.dtb required for the camera overlay.
>
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> Reviewed-by: Praneeth Bajjuri <praneeth@ti.com>
> Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
> ---
>  meta-ti-bsp/conf/machine/am62xx-evm.conf | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta-ti-bsp/conf/machine/am62xx-evm.conf b/meta-ti-bsp/conf/machine/am62xx-evm.conf
> index eb1563f8..44f46d78 100644
> --- a/meta-ti-bsp/conf/machine/am62xx-evm.conf
> +++ b/meta-ti-bsp/conf/machine/am62xx-evm.conf
> @@ -8,6 +8,7 @@ MACHINE_FEATURES += "gpu"
>  
>  KERNEL_DEVICETREE = " \
>      ti/k3-am625-sk.dtb \
> +    ti/k3-am625-sk-csi2-ov5640.dtb \
>  "
I think, this should have been compiled and packaged as dtbo instead of dtb.
>  
>  UBOOT_MACHINE = "am62x_evm_a53_defconfig"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#14668): https://lists.yoctoproject.org/g/meta-ti/message/14668
> Mute This Topic: https://lists.yoctoproject.org/mt/90836882/6740599
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [devarsht@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

