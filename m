Return-Path: <praneeth@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86F75C433F5
	for <webhook@archiver.kernel.org>; Fri, 22 Apr 2022 19:30:18 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.165.1650655688495110866
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 22 Apr 2022 12:28:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=PMvfPNDC;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: praneeth@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 23MJS747067894;
	Fri, 22 Apr 2022 14:28:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1650655687;
	bh=KMbix9x9vDiiYEclf+qbzpmNjxTc3ncAucSJJOEXaw4=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=PMvfPNDCceM2Z/R5DYaGFmlO4PplG3UBfsoCtcZksy9WIHWVNgaW27H9PuAUffg+Z
	 3I5h4X4EyFkAjBgNzFNe3PIwgHFi8XrlmKIGbN0MwycntZerXKc8I481z1I0ATAjIV
	 S1dCbRLLdvefZOPjswgzabyE9qfM5uR08MY3CTFo=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 23MJS7uC051831
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 22 Apr 2022 14:28:07 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 22
 Apr 2022 14:28:07 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 22 Apr 2022 14:28:06 -0500
Received: from [10.247.28.135] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 23MJS6Ft095889;
	Fri, 22 Apr 2022 14:28:06 -0500
Message-ID: <170e74f6-6492-4f13-d7d9-82f6e4a61cf6@ti.com>
Date: Fri, 22 Apr 2022 14:28:06 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [meta-ti][master/dunfell][PATCH] conf: machine: am62xx Add
 missing dtbo file
Content-Language: en-US
To: Ryan Eatmon <reatmon@ti.com>, Denys Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20220422155713.12925-1-reatmon@ti.com>
From: "Bajjuri, Praneeth" <praneeth@ti.com>
In-Reply-To: <20220422155713.12925-1-reatmon@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 22 Apr 2022 19:30:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14616



On 4/22/2022 10:57 AM, Ryan Eatmon wrote:
> Add missing k3-am625-sk-csi2-ov5640.dtb required for the camera overlay.
> 
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>

Reviewed-by: Praneeth Bajjuri <praneeth@ti.com>

> ---
>   conf/machine/am62xx-evm.conf | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/conf/machine/am62xx-evm.conf b/conf/machine/am62xx-evm.conf
> index eb1563f8..44f46d78 100644
> --- a/conf/machine/am62xx-evm.conf
> +++ b/conf/machine/am62xx-evm.conf
> @@ -8,6 +8,7 @@ MACHINE_FEATURES += "gpu"
>   
>   KERNEL_DEVICETREE = " \
>       ti/k3-am625-sk.dtb \ > +    ti/k3-am625-sk-csi2-ov5640.dtb \

But this patch is only applicable to dunfell branch,
Ensure you make a similar change in master in
meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_5.10.bb
also consider updating updating kernel SRCREV to latest at same time.

>   "
>   
>   UBOOT_MACHINE = "am62x_evm_a53_defconfig"

