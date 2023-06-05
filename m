Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 554D5C7EE24
	for <webhook@archiver.kernel.org>; Mon,  5 Jun 2023 13:30:13 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.7739.1685971806986279947
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 05 Jun 2023 06:30:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=DaHjxWUD;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 355DU6VB015951
	for <meta-ti@lists.yoctoproject.org>; Mon, 5 Jun 2023 08:30:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1685971806;
	bh=YpqsYUpkLUTl+f+c1+3P8XF9dRtZkJU9HxCgWzXheHI=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=DaHjxWUD6av6p31Fsu7H2c7/CEf/MubNTHZCIajJwUSXBCxnGD5BV/uJyxiN8lWy3
	 8A/3VAYC/2HAv9gmJXjLEm19qXkcXlwmnsU5x3JOZdY2Hfr1OYrHNfQGzGNgMyC10F
	 Tkr2PnW/efb0GzlbT+jUilI6le9+jVIzN3134Zd8=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 355DU5N8013394
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Mon, 5 Jun 2023 08:30:06 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 5
 Jun 2023 08:30:05 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 5 Jun 2023 08:30:05 -0500
Received: from [128.247.81.69] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 355DU51e067768;
	Mon, 5 Jun 2023 08:30:05 -0500
Message-ID: <26867fa1-90b5-3764-38a5-fc378a84348d@ti.com>
Date: Mon, 5 Jun 2023 08:30:04 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [kirkstone][PATCH v2] meta-ti-bsp: Add recipe for
 u-boot-ti-jailhouse and linux-ti-jailhouse
To: Paresh Bhagat <p-bhagat@ti.com>, <meta-ti@lists.yoctoproject.org>,
        <praneeth@ti.com>
CC: <c-shilwant@ti.com>, <s-adivi@ti.com>, <khasim@ti.com>, <g-gupta@ti.com>
References: <20230605131152.69991-1-p-bhagat@ti.com>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20230605131152.69991-1-p-bhagat@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 05 Jun 2023 13:30:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16665



On 6/5/2023 8:11 AM, Paresh Bhagat wrote:
> Add new recipe for u-boot-ti-jailhouse and linux-ti-jailhouse which will
> be used for jailhouse for am62xx-evm.
> 
> Jailhouse support for am62xx-evm requires few patches for u-boot and linux
> which are hosted at processor-sdk/u-boot and processor/linux respectively.
> To build a image with jailhouse for am62xx-evm, these recipes
> will be used instead of u-boot-ti-staging and linux-ti-staging by changing
> the preferred_provider.
> 
> Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
> ---
>   .../recipes-bsp/u-boot/u-boot-ti-jailhouse_2023.04.bb    | 9 +++++++++
>   .../recipes-kernel/linux/linux-ti-jailhouse_6.1.bb       | 9 +++++++++
>   2 files changed, 18 insertions(+)
>   create mode 100644 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-jailhouse_2023.04.bb
>   create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-jailhouse_6.1.bb
> 
> diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-jailhouse_2023.04.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-jailhouse_2023.04.bb
> new file mode 100644
> index 00000000..079d55dd
> --- /dev/null
> +++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-jailhouse_2023.04.bb
> @@ -0,0 +1,9 @@
> +require u-boot-ti-staging_2023.04.bb
> +
> +# This will have priority over generic uboot path
> +
> +BRANCH = "ti-u-boot-2023.04-jailhouse"
> +
> +UBOOT_GIT_URI = "git://git.ti.com/git/processor-sdk/u-boot.git"

What is reasoning for not upstreaming these patches (both u-boot and 
kernel) even just into the TI repositories?

My concern is the CICD process.  This is adding another recipe with a 
completely different linux/u-boot repository that we need to add support 
for to keep the recipes up to date.

And you guys will to keep rebasing these patches on top of the latest 
6.1 prod branch when CICD promotes.

This just feels like something that is going to turn into a lot of 
maintenance work in the future.


> +SRCREV = "79615e1c99b9aa73948f811f5f866cff2e34dc37"
> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-jailhouse_6.1.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-jailhouse_6.1.bb
> new file mode 100644
> index 00000000..8e1edb55
> --- /dev/null
> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-jailhouse_6.1.bb
> @@ -0,0 +1,9 @@
> +require linux-ti-staging_6.1.bb
> +
> +# Use different commit, repo and branch for jailhouse build
> +
> +BRANCH = "ti-linux-6.1.y-jailhouse"
> +
> +SRCREV = "0ed0dec2462b805b0188fe080895adc437871549"
> +
> +KERNEL_GIT_URI = "git://git.ti.com/git/processor-sdk/linux.git"

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

