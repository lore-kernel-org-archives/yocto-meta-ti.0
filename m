Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A55BC87FCA
	for <webhook@archiver.kernel.org>; Fri,  1 Aug 2025 12:32:08 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.86260.1754051527839915981
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 01 Aug 2025 05:32:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=j/WU6WCD;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: reatmon@ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 571CW6fH3681187;
	Fri, 1 Aug 2025 07:32:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1754051526;
	bh=kPDWPulXOFMEcqmA8CnG4AcERj7d2PQCE5TlhifxfHo=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=j/WU6WCD2+bunqGfDgD3SnH4mTFERQosvx0elwgGqJfjFtLwNlx1vtpqeszT9A4W9
	 kZUGUTfAIzAanWxD9pWFwVngbJziNq0nciHChzPpOjwjMRZZFzGrpOwPnWAtBf8FpA
	 Ejfcxssar5/isUICfV+zqOjwCMW4PFBVndRop52E=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 571CW6E5769964
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 1 Aug 2025 07:32:06 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 1
 Aug 2025 07:32:06 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 1 Aug 2025 07:32:06 -0500
Received: from [10.249.37.202] ([10.249.37.202])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 571CW6w9073010;
	Fri, 1 Aug 2025 07:32:06 -0500
Message-ID: <efed6ef2-d85b-4915-a410-c313beb30641@ti.com>
Date: Fri, 1 Aug 2025 07:32:06 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [master/scarthgap][PATCH 2/2] ti-pka-fw: Update license to PKA-FW
To: Beleswar Padhi <b-padhi@ti.com>, <denys@konsulko.com>
CC: <a-limaye@ti.com>, <afd@ti.com>, <u-kumar1@ti.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20250801044441.1059527-1-b-padhi@ti.com>
 <20250801044441.1059527-3-b-padhi@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20250801044441.1059527-3-b-padhi@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 01 Aug 2025 12:32:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18870



On 7/31/2025 11:44 PM, Beleswar Padhi wrote:
> The PKA-FW license has been added to meta-ti. Point to that license in
> the PKA firmware recipe.
> 
> Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
> ---
>   meta-ti-bsp/recipes-bsp/ti-pka-fw/ti-pka-fw_git.bb | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-ti-bsp/recipes-bsp/ti-pka-fw/ti-pka-fw_git.bb b/meta-ti-bsp/recipes-bsp/ti-pka-fw/ti-pka-fw_git.bb
> index 49ae0251..bd31726c 100644
> --- a/meta-ti-bsp/recipes-bsp/ti-pka-fw/ti-pka-fw_git.bb
> +++ b/meta-ti-bsp/recipes-bsp/ti-pka-fw/ti-pka-fw_git.bb
> @@ -1,7 +1,7 @@
>   SUMMARY = "PKA prebuilt binary firmware image"
>   
> -LICENSE = "TI-TFL & INSIDE Secure"
> -LIC_FILES_CHKSUM = "file://LICENCE.pka_fw;md5=dc20391b287874f0dce069cf87917206"
> +LICENSE = "PKA-FW"
> +LIC_FILES_CHKSUM = "file://${THISDIR}/../../licenses/PKA-FW;md5=251316268d8e7d1a546e5e6a08af6d9c"
>   
>   COMPATIBLE_MACHINE = "k3"
>   

Don't we need BOTH TI_TFL and PKA-FW?  Or are you thinking that since 
the license file contains both that covers it?


-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

