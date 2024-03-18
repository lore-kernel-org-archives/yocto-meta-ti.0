Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F50FC54E58
	for <webhook@archiver.kernel.org>; Mon, 18 Mar 2024 11:01:34 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.40565.1710759687489053273
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 18 Mar 2024 04:01:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=ARVDNumq;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: c-shilwant@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 42IB1Qc7086518
	for <meta-ti@lists.yoctoproject.org>; Mon, 18 Mar 2024 06:01:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1710759686;
	bh=tMOqIuJkzxbT00fLRURCEypQ89N7BVdL4TxVrx/0l1U=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=ARVDNumqec9MQZ/u/nzyD2J/SZXyJkJWTOFVcWihfw3zBH/vjmmdtVIcY5rFnDAt6
	 z9XA1op2YCO8kRfe2I4xHuF6J74iH+WwrSJBndW8I2jCxzHHq4vOI+EuejVxk/Kj0h
	 X7CHJKxMPGATKUB+KzZxfsEug6IjAGBPbwUaDrTc=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 42IB1QV0019737
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Mon, 18 Mar 2024 06:01:26 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 18
 Mar 2024 06:01:25 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 18 Mar 2024 06:01:26 -0500
Received: from [172.24.227.238] (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 42IB1MwA011493;
	Mon, 18 Mar 2024 06:01:23 -0500
Message-ID: <f22533db-ff66-4ecf-833b-28e47735d2fc@ti.com>
Date: Mon, 18 Mar 2024 16:31:22 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [kirkstone][PATCH] Update SRCREV for jailhouse recipe
To: <meta-ti@lists.yoctoproject.org>
CC: <s-adivi@ti.com>, <khasim@ti.com>, <g-gupta@ti.com>,
        Paresh Bhagat
	<p-bhagat@ti.com>, <reatmon@ti.com>, <praneeth@ti.com>
References: <20240318105253.1067209-1-p-bhagat@ti.com>
Content-Language: en-US
From: Chirag Shilwant <c-shilwant@ti.com>
In-Reply-To: <20240318105253.1067209-1-p-bhagat@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 18 Mar 2024 11:01:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17539

On 18/03/24 16:22, Paresh Bhagat wrote:
> Update SRCREV for jailhouse recipe which will add changes for Out of Box
> demo and also a new application to test whether the linux inmate cell has
> crashed or not.
>
> Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>


Acked-by: Chirag Shilwant <c-shilwant@ti.com>

> ---
>   meta-ti-extras/recipes-ti/jailhouse/ti-jailhouse.inc | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-ti-extras/recipes-ti/jailhouse/ti-jailhouse.inc b/meta-ti-extras/recipes-ti/jailhouse/ti-jailhouse.inc
> index a63891bf..af94a780 100644
> --- a/meta-ti-extras/recipes-ti/jailhouse/ti-jailhouse.inc
> +++ b/meta-ti-extras/recipes-ti/jailhouse/ti-jailhouse.inc
> @@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = " \
>   COMPATIBLE_MACHINE = "am62xx|am62pxx"
>   TARGET_CC_ARCH += "${LDFLAGS}"
>   PV = "0.12+git${SRCPV}"
> -SRCREV = "0b29ad90f6f54105b98d6bbf35cc47fb244f7799"
> +SRCREV = "603819ef9a771a3c253a141220daab8e61751a43"
>   BRANCH = "master"
>   SRC_URI = " \
>       git://git.ti.com/git/jailhouse/ti-jailhouse.git;protocol=https;branch=${BRANCH} \

