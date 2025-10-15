Return-Path: <p-bhagat@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72587CCD185
	for <webhook@archiver.kernel.org>; Wed, 15 Oct 2025 16:24:04 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.22091.1760545439102783521
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 15 Oct 2025 09:23:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=hfdmJyDN;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: p-bhagat@ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59FGNwee1366699
	for <meta-ti@lists.yoctoproject.org>; Wed, 15 Oct 2025 11:23:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1760545438;
	bh=+4M49Zbqx9EgUVvkpoAdPVusrOathPmH+TStJwW0Tuo=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=hfdmJyDN0leih4QXECtGyUyODjheNSoS3hMNkTwtKRDirBckC08cP9emFaaot4CkA
	 +esUsZoKOhSxX1eUY8Y4/D0nPgfpGzCudNReA5wqQRFSphL3BaUM359MCoAUvQiJ7Q
	 WSnBN/lStt/IB1I7HASUNzbJDX8b4WTkwW6qKPY4=
Received: from DLEE207.ent.ti.com (dlee207.ent.ti.com [157.170.170.95])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59FGNw8S1359229
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Wed, 15 Oct 2025 11:23:58 -0500
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 15 Oct
 2025 11:23:58 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 15 Oct 2025 11:23:58 -0500
Received: from [172.24.233.249] (ula0502350.dhcp.ti.com [172.24.233.249])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59FGNtXn2250326;
	Wed, 15 Oct 2025 11:23:56 -0500
Message-ID: <8995a494-18ac-40b8-b2a1-a335ee25611d@ti.com>
Date: Wed, 15 Oct 2025 21:53:55 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti] [master/scarthgap][PATCH] conf: machine: am62dxx-evm:
 Add overlay for EQEP
To: <meta-ti@lists.yoctoproject.org>, <praneeth@ti.com>, <reatmon@ti.com>
CC: <v-singh1@ti.com>, <j-sahu@ti.com>, <c-shilwant@ti.com>, <khasim@ti.com>,
        <jm@ti.com>
References: <186E9301C1E795BC.13861@lists.yoctoproject.org>
Content-Language: en-US
From: Paresh Bhagat <p-bhagat@ti.com>
In-Reply-To: <186E9301C1E795BC.13861@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 15 Oct 2025 16:24:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19133

Hi all,


I am planning to send a v2 using a more generic approach based on 
internal discussion. please don't merge.


On 15/10/25 10:58, Paresh Bhagat via lists.yoctoproject.org wrote:
> Add overlay for eqep for am62dxx-evm by adding prefix string in
> KERNEL_DEVICETREE_PREFIX.
>
> Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
> ---
> Boot logs
> https://gist.github.com/paresh-bhagat12/f8513c05abeb0585abcc30cfefd6a40a
>
>   meta-ti-bsp/conf/machine/am62dxx-evm.conf | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/meta-ti-bsp/conf/machine/am62dxx-evm.conf b/meta-ti-bsp/conf/machine/am62dxx-evm.conf
> index 1e41c53c..477eebf5 100644
> --- a/meta-ti-bsp/conf/machine/am62dxx-evm.conf
> +++ b/meta-ti-bsp/conf/machine/am62dxx-evm.conf
> @@ -7,6 +7,7 @@ require conf/machine/include/am62dxx.inc
>   KERNEL_DEVICETREE_PREFIX = " \
>       ti/k3-am62d2 \
>       ti/k3-am62a7-sk-edgeai \
> +    ti/k3-am62x-sk-eqep \
>   "
>   
>   KERNEL_DEVICETREE = ""
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#19124): https://lists.yoctoproject.org/g/meta-ti/message/19124
> Mute This Topic: https://lists.yoctoproject.org/mt/115766465/7067447
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [p-bhagat@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

