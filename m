Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39E20C636D3
	for <webhook@archiver.kernel.org>; Wed,  8 Feb 2023 18:46:26 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.6892.1675881983079024466
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 08 Feb 2023 10:46:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=TDpkTEK8;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: afd@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 318IkM8g130282;
	Wed, 8 Feb 2023 12:46:22 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1675881982;
	bh=C6Xj3XWn8OtBr5bbCrw04xZ1bYxvlvuZoTPuhW9/C5E=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=TDpkTEK8LkOm7iL7ZSABKdNgrnKT3FxstJ+zbVqKqGufEL2j0e5Ej28ajWSWYVrvZ
	 //nL96MKk6bVTZd6hx/xpNol4ivlJVUhX6hVP590BeaXKFv701gAmgfA5Q67xw3j+p
	 KtCioOkJT4rM81YAwT4dG9SClIXVYcDCiUlCkwno=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 318IkMHh004405
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 8 Feb 2023 12:46:22 -0600
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Wed, 8
 Feb 2023 12:46:22 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Wed, 8 Feb 2023 12:46:22 -0600
Received: from [10.250.32.98] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 318IkLeM012864;
	Wed, 8 Feb 2023 12:46:21 -0600
Message-ID: <a58a1aff-62f7-31d0-52e1-9600efa152bf@ti.com>
Date: Wed, 8 Feb 2023 12:46:21 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [meta-ti][dunfell][PATCH] conf: machine: j721s2: Add DTB and DTBO
 load address for FIT image
Content-Language: en-US
To: <sinthu.raja@mistralsolutions.com>, <reatmon@ti.com>, <denys@ti.com>,
        <detheridge@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, Sinthu Raja <sinthu.raja@ti.com>
References: <20230208183608.2589-1-sinthu.raja@ti.com>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20230208183608.2589-1-sinthu.raja@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 08 Feb 2023 18:46:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15757

On 2/8/23 12:36 PM, Sinthu Raja M via lists.yoctoproject.org wrote:
> From: Sinthu Raja <sinthu.raja@ti.com>
> 
> Now the J721S2 defconfig is merged for both GP and HS-FS devices, the
> HS-FS devices use FIT image to load the kernel and DTB. However, the
> DTB/DTBOs are added to the FIT image, but the load address is not added
> in the image section of each DTB/DTBOs. This load address is calculated
> based on the LOADADDRESS macros in kernel-fitmage class.
> 
> Therefore add the DTB/DTBOs load address and offset macros in J721S2 conf.
> This conf is common to both GP and HS-FS devices
> 
> Signed-off-by: Sinthu Raja <sinthu.raja@ti.com>
> ---
> 
> Hi All,
> This patch resolves the overlay loading issue using name_overlay. This
> is not yet tested and will test tomorrow.
> 
>   conf/machine/j721s2-evm.conf | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/conf/machine/j721s2-evm.conf b/conf/machine/j721s2-evm.conf
> index f1127ed5..2db6c087 100644
> --- a/conf/machine/j721s2-evm.conf
> +++ b/conf/machine/j721s2-evm.conf

Why are we putting these in the -evm level configs? I know we "usually"
only build FIT images for the HS platforms, but FIT is valid and works
for all device types.

So for all platforms with these defines, we should moved them up into
the common machine/include/machine.inc files. Or even better, since these
look to be all the same across K3, bubble it up into k3.inc, then you
won't need to add this same patch for each new platform.

Andrew

> @@ -40,6 +40,9 @@ KERNEL_DEVICETREE = " \
>   "
>   
>   UBOOT_MACHINE = "j721s2_evm_a72_defconfig"
> +UBOOT_DTB_LOADADDRESS =  "0x83000000"
> +UBOOT_DTBO_LOADADDRESS = "0x83080000"
> +UBOOT_DTBO_OFFSET =      "0x00010000"
>   
>   do_image_wic[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
>   do_image_tar[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#15754): https://lists.yoctoproject.org/g/meta-ti/message/15754
> Mute This Topic: https://lists.yoctoproject.org/mt/96836839/3619733
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [afd@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

