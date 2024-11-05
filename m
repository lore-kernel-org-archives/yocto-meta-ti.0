Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC11FD36138
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 20:24:48 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.30360.1730838284730877026
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 05 Nov 2024 12:24:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=rrtJpCMK;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4A5KOekP040784;
	Tue, 5 Nov 2024 14:24:40 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1730838280;
	bh=+/2vPCaJAD/QTjAYQR8JublpBH6RA+g51bKcvaxJlz8=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=rrtJpCMKpnZv1i0fBRY3Z8jpdRG8Ok423GOystzlnGc35kkNstfHZZtA2/kG+pnMh
	 v38ErefspPJfYgrZvnuYHyQbEG8Li/uDTAV7XVRKdAxavdC5FhO9kkpXDUq+b/ggxH
	 mK1NM9HfRioZ60DOcK/rC/v3XsBya+3CTtBoHjJg=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4A5KOe0E109015
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 5 Nov 2024 14:24:40 -0600
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 5
 Nov 2024 14:24:40 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 5 Nov 2024 14:24:40 -0600
Received: from [10.249.32.170] ([10.249.32.170])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4A5KOeui065932;
	Tue, 5 Nov 2024 14:24:40 -0600
Message-ID: <b8b363e2-4f7f-42d2-a0e1-6c3d191586f7@ti.com>
Date: Tue, 5 Nov 2024 14:24:40 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti] [master][RFC PATCH 2/6] meta-beagle: create a separate
 layer for Beagle platforms
To: Denys Dmytriyenko <denis@denix.org>, <meta-ti@lists.yoctoproject.org>
CC: Denys Dmytriyenko <denys@konsulko.com>
References: <20241105191100.532413-1-denis@denix.org>
 <20241105191100.532413-2-denis@denix.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20241105191100.532413-2-denis@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 05 Nov 2024 20:24:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18047



On 11/5/2024 1:10 PM, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@konsulko.com>
> 
> The new meta-beagle will host all supported Beagle platforms that
> use TI SoCs and hence need to depend on meta-ti-bsp. The default
> BSP for the platforms in this layer will use BeagleBoard.org
> official trees for the Linux kernel and U-boot.
> 
> Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
> ---
>   meta-beagle/conf/layer.conf | 15 +++++++++++++++
>   1 file changed, 15 insertions(+)
>   create mode 100644 meta-beagle/conf/layer.conf
> 
> diff --git a/meta-beagle/conf/layer.conf b/meta-beagle/conf/layer.conf
> new file mode 100644
> index 00000000..ca920f29
> --- /dev/null
> +++ b/meta-beagle/conf/layer.conf
> @@ -0,0 +1,15 @@
> +# We have a conf and classes directory, append to BBPATH
> +BBPATH .= ":${LAYERDIR}"
> +
> +# We have a recipes directory, add to BBFILES
> +BBFILES += "${LAYERDIR}/recipes*/*/*.bb ${LAYERDIR}/recipes*/*/*.bbappend"
> +
> +BBFILE_COLLECTIONS += "meta-beagle"
> +BBFILE_PATTERN_meta-beagle := "^${LAYERDIR}/"
> +BBFILE_PRIORITY_meta-beagle = "6"
> +
> +LAYERSERIES_COMPAT_meta-beagle = "scarthgap styhead walnascar"
> +
> +LAYERDEPENDS_meta-bealge = " \

misspelling------------^

> +    meta-ti-bsp \
> +"
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#18041): https://lists.yoctoproject.org/g/meta-ti/message/18041
> Mute This Topic: https://lists.yoctoproject.org/mt/109412224/6551054
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [reatmon@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

