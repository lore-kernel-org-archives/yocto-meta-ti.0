Return-Path: <praneeth@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71302C433F5
	for <webhook@archiver.kernel.org>; Tue,  3 May 2022 19:29:30 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web12.1502.1651606165465120904
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 03 May 2022 12:29:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=RpdM6ZXP;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: praneeth@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 243JTM0t006286;
	Tue, 3 May 2022 14:29:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1651606162;
	bh=iB2QSDrROixGns1geflTHBoPr/5oyZpEGb/pqAHIXyQ=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=RpdM6ZXPAzJ1lD09opuoKEY/JYJ19BPoG2Wf3Owgflf0ijtkB7IQxy/fykkvTvEbP
	 +camsZC0CjGvTuEnSNSZLuL8qY9Gb/u9eGUVY2BxBvCFfT/uxBCKcaBvqg1s11Kngk
	 cT7wluYDXi8q6WN6ZFrLvEPvDxBv9rk4f4YApg8U=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 243JTMox003833
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 3 May 2022 14:29:22 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 3
 May 2022 14:29:21 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 3 May 2022 14:29:21 -0500
Received: from [10.247.28.135] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 243JTLeQ014243;
	Tue, 3 May 2022 14:29:21 -0500
Message-ID: <46cbc39b-af86-a700-b7a0-e5c87895cf34@ti.com>
Date: Tue, 3 May 2022 14:29:21 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [meta-ti] [dunfell PATCH] conf/machine: am62xx: Update build flag
 for low power mode
Content-Language: en-US
To: Ryan Eatmon <reatmon@ti.com>, Denys Dmytriyenko <denis@denix.org>
CC: Nishanth Menon <nm@ti.com>, Denys Dmytriyenko <denys@konsulko.com>,
        Dave
 Gerlach <d-gerlach@ti.com>, <meta-ti@lists.yoctoproject.org>
References: <16EBAED9FBD16545.22719@lists.yoctoproject.org>
From: "Bajjuri, Praneeth" <praneeth@ti.com>
In-Reply-To: <16EBAED9FBD16545.22719@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 03 May 2022 19:29:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14688



On 5/3/2022 2:25 PM, praneeth via lists.yoctoproject.org wrote:
> Update build flag for arm-trusted-firmware to include low power mode
> support
> 
> K3_PM_SYSTEM_SUSPEND is added in arm-trusted-firmware now which enables
> low power mode support for am62xx.
> 
> Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>

I would like a dunfell-next build with this patch and
https://lists.yoctoproject.org/g/meta-ti/message/14680 together.

Would like to check nightly build and boot test across all K3 platforms.

Will resubmit both patches together after merging ti-atf-next to ti-atf 
  once i review the test results

Thanks
Praneeth

> ---
>   conf/machine/include/am62xx.inc | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/conf/machine/include/am62xx.inc b/conf/machine/include/am62xx.inc
> index e8823dd2..59cb7053 100644
> --- a/conf/machine/include/am62xx.inc
> +++ b/conf/machine/include/am62xx.inc
> @@ -13,5 +13,6 @@ do_image_wic[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
>   do_image_tar[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
>   
>   TFA_BOARD = "lite"
> +K3_PM_SYSTEM_SUSPEND = "1"
>   OPTEEMACHINE = "k3-am65x"
>   OPTEEOUTPUTMACHINE = "k3"
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#14687): https://lists.yoctoproject.org/g/meta-ti/message/14687
> Mute This Topic: https://lists.yoctoproject.org/mt/90867143/2167429
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [praneeth@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

