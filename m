Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26F5CC4332F
	for <webhook@archiver.kernel.org>; Tue,  7 Nov 2023 16:28:15 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.15274.1699374493977779100
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 07 Nov 2023 08:28:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=pb1YbJ7S;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3A7GSBur077857;
	Tue, 7 Nov 2023 10:28:11 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1699374491;
	bh=FHpTzm4K211DBbMFyVKPpT/Geko+xn4nhOI9poj0Dug=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=pb1YbJ7S8vWStEVIQ+9q3tGfbvPOoj/JCdNxCzJm8xpEbSsQuDlarO6LRhCp41zuS
	 NmrydhE/npbC9ium8PE0uxYk8aigBqEJvPFYDQlQRyuuNmuaDk98tbZIAKz1l0fTz6
	 p6QxHf+5+v/6EibHDJ0NTaRoXkrvp4i6XYJo8zto=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3A7GSBuc060501
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 7 Nov 2023 10:28:11 -0600
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 7
 Nov 2023 10:28:11 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 7 Nov 2023 10:28:11 -0600
Received: from [128.247.81.69] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3A7GSBtZ055886;
	Tue, 7 Nov 2023 10:28:11 -0600
Message-ID: <b52f8875-e6f7-4686-b279-1009cdd5a66d@ti.com>
Date: Tue, 7 Nov 2023 10:28:11 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [kirkstone][RFC] ti-extras: Add support for extra kernel features
 for RT
Content-Language: en-US
To: Paresh Bhagat <p-bhagat@ti.com>, <meta-ti@lists.yoctoproject.org>,
        <praneeth@ti.com>, <denys@konsulko.com>
CC: <c-shilwant@ti.com>, <s-adivi@ti.com>, <khasim@ti.com>, <g-gupta@ti.com>
References: <20231107160558.2661070-1-p-bhagat@ti.com>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20231107160558.2661070-1-p-bhagat@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 07 Nov 2023 16:28:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17257



On 11/7/2023 10:05 AM, Paresh Bhagat wrote:
> Add support for ti-extras features for rt as it was added for non
> rt kernel and u-boot earlier. It will also be accessible via the
> TI_EXTRAS variable in the local.conf file.
> 
> Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
> ---
>   .../recipes-kernel/linux/linux-ti-staging-rt_6.1.bb   |  5 +++--
>   meta-ti-bsp/recipes-kernel/linux/ti-extras-rt.inc     | 11 +++++++++++
>   2 files changed, 14 insertions(+), 2 deletions(-)
>   create mode 100644 meta-ti-bsp/recipes-kernel/linux/ti-extras-rt.inc
> 
> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.1.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.1.bb
> index a600630e..93e1be39 100644
> --- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.1.bb
> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.1.bb
> @@ -1,10 +1,11 @@
>   require linux-ti-staging_6.1.bb
> +include ${@ 'recipes-kernel/linux/ti-extras-rt.inc' if d.getVar('TI_EXTRAS') else ''}
>   
>   # Look in the generic major.minor directory for files
>   # This will have priority over generic non-rt path
>   FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}-6.1:"
>   
> -BRANCH = "ti-rt-linux-6.1.y"
> +BRANCH ?= "ti-rt-linux-6.1.y"
>   
> -SRCREV = "eda9974e8513cdd2c5cc20c3c6b851f9977acd4d"
> +SRCREV ?= "eda9974e8513cdd2c5cc20c3c6b851f9977acd4d"

I may need Denys to weigh on these comments:

You cannot use the ?= here.  This recipe includes the 
linux-ti-staging_6.1.bb recipe which has the default lines already in 
there.  And the ?= is a soft default which will only set the value IF it 
is not already set.  So this will break RT builds.

Bitbake also processes the = at the moment you see it.  So the "last" 
time a variable is set with = it will be the value that wins.

So for the RT recipe, you will likely need to move the include to AFTER 
the above BRANCH/SRCREV settings.

Basically, I think you need:

   BRANCH = "ti-rt-linux-6.1.y"

   SRCREV = "eda9974e8513cdd2c5cc20c3c6b851f9977acd4d"

   include ${@ 'recipes-kernel/linux/ti-extras-rt.inc' if 
d.getVar('TI_EXTRAS') else ''}


So this inclusion of the extra will need to be different in the RT 
recipe versus the non-RT recipe.  All because the RT recipe includes the 
non-RT recipe.


>   PV = "6.1.46+git${SRCPV}"
> diff --git a/meta-ti-bsp/recipes-kernel/linux/ti-extras-rt.inc b/meta-ti-bsp/recipes-kernel/linux/ti-extras-rt.inc
> new file mode 100644
> index 00000000..1fc40934
> --- /dev/null
> +++ b/meta-ti-bsp/recipes-kernel/linux/ti-extras-rt.inc
> @@ -0,0 +1,11 @@
> +
> +# Use different commit, repo and branch for TI extras build
> +# This will have priority over generic rt path
> +
> +COMPATIBLE_MACHINE = "am62xx"
> +
> +BRANCH = "ti-rt-linux-6.1.y"
> +BRANCH:tie-jailhouse = "ti-rt-linux-6.1.y-jailhouse"
> +
> +SRCREV = "685e77152461bd6b791500f717bec62d17c1b36d"
> +SRCREV:tie-jailhouse = "a74088b40b4d27478a2af5c20cdc0b4ec8ed9470"

This file should be fine.


-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

