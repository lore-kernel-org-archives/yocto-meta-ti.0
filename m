Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F372C02181
	for <webhook@archiver.kernel.org>; Wed, 22 Jan 2025 21:26:57 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.5514.1737581208638646213
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 22 Jan 2025 13:26:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Xqt//FTi;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: afd@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50MLQlhG263789
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 22 Jan 2025 15:26:47 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1737581207;
	bh=clJ9RXBZE2gnAApi1UNBkHkY7/VJXfKFK8cx1TSa5G4=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=Xqt//FTiKeGp9IkfmrjXWXvgmyELx7fBDFzbJzqxMgiH7tzmRiqJY1zVE1StY39NH
	 j+0CEIl5L+EVZj0sIHQ0Uiq2MHVFhHGDavdJIAfR8mvVARyEol9iScbb8v6WFvno2G
	 gNmWRggHPwLASWcxs/a2PQvWCOFQ8BfEW6MBE9PA=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 50MLQlQT064467
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 22 Jan 2025 15:26:47 -0600
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 22
 Jan 2025 15:26:46 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 22 Jan 2025 15:26:46 -0600
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50MLQkDF095919;
	Wed, 22 Jan 2025 15:26:46 -0600
Message-ID: <aaa754d7-cb79-4542-a510-d359505fc5e4@ti.com>
Date: Wed, 22 Jan 2025 15:26:46 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master/scarthgap][PATCH v2] linux-ti-staging: Add
 config-fragments for v6.12 Kernel
To: <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20250122172558.22656-1-reatmon@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20250122172558.22656-1-reatmon@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 22 Jan 2025 21:26:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18220

On 1/22/25 11:25 AM, Ryan Eatmon via lists.yoctoproject.org wrote:
> From: Beleswar Padhi <b-padhi@ti.com>
> 
> ti-linux-kernel tree has several prune config fragments for ARM/ARM64/RT
> configurations. Enable the prune config fragments here.
> 
> Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
> ---
> v2: Remove no_smp config settings.  We can add them in later after more
> testing.
> 

Acked-by: Andrew Davis <afd@ti.com>

>   .../recipes-kernel/linux/linux-ti-staging-6.12/defconfig        | 2 +-
>   .../recipes-kernel/linux/linux-ti-staging-6.12/k3/defconfig     | 2 +-
>   .../recipes-kernel/linux/linux-ti-staging-6.12/ti33x/defconfig  | 2 +-
>   .../recipes-kernel/linux/linux-ti-staging-6.12/ti43x/defconfig  | 2 +-
>   .../recipes-kernel/linux/linux-ti-staging-rt-6.12/defconfig     | 2 +-
>   .../recipes-kernel/linux/linux-ti-staging-rt-6.12/k3/defconfig  | 2 +-
>   .../linux/linux-ti-staging-rt-6.12/ti33x/defconfig              | 2 +-
>   .../linux/linux-ti-staging-rt-6.12/ti43x/defconfig              | 2 +-
>   8 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.12/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.12/defconfig
> index 9d579e41..24b53cf7 100644
> --- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.12/defconfig
> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.12/defconfig
> @@ -1,2 +1,2 @@
>   use-kernel-config=multi_v7_defconfig
> -config-fragment=
> +config-fragment=kernel/configs/ti_multi_v7_prune.config
> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.12/k3/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.12/k3/defconfig
> index fd07b34e..ef1d3efd 100644
> --- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.12/k3/defconfig
> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.12/k3/defconfig
> @@ -1,2 +1,2 @@
>   use-kernel-config=defconfig
> -config-fragment=
> +config-fragment=kernel/configs/ti_arm64_prune.config
> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.12/ti33x/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.12/ti33x/defconfig
> index 9d579e41..24b53cf7 100644
> --- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.12/ti33x/defconfig
> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.12/ti33x/defconfig
> @@ -1,2 +1,2 @@
>   use-kernel-config=multi_v7_defconfig
> -config-fragment=
> +config-fragment=kernel/configs/ti_multi_v7_prune.config
> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.12/ti43x/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.12/ti43x/defconfig
> index 9d579e41..24b53cf7 100644
> --- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.12/ti43x/defconfig
> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.12/ti43x/defconfig
> @@ -1,2 +1,2 @@
>   use-kernel-config=multi_v7_defconfig
> -config-fragment=
> +config-fragment=kernel/configs/ti_multi_v7_prune.config
> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.12/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.12/defconfig
> index 9d579e41..43089dc8 100644
> --- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.12/defconfig
> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.12/defconfig
> @@ -1,2 +1,2 @@
>   use-kernel-config=multi_v7_defconfig
> -config-fragment=
> +config-fragment=kernel/configs/ti_multi_v7_prune.config kernel/configs/ti_rt.config
> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.12/k3/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.12/k3/defconfig
> index fd07b34e..47d78664 100644
> --- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.12/k3/defconfig
> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.12/k3/defconfig
> @@ -1,2 +1,2 @@
>   use-kernel-config=defconfig
> -config-fragment=
> +config-fragment=kernel/configs/ti_arm64_prune.config kernel/configs/ti_rt.config
> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.12/ti33x/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.12/ti33x/defconfig
> index 9d579e41..43089dc8 100644
> --- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.12/ti33x/defconfig
> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.12/ti33x/defconfig
> @@ -1,2 +1,2 @@
>   use-kernel-config=multi_v7_defconfig
> -config-fragment=
> +config-fragment=kernel/configs/ti_multi_v7_prune.config kernel/configs/ti_rt.config
> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.12/ti43x/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.12/ti43x/defconfig
> index 9d579e41..43089dc8 100644
> --- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.12/ti43x/defconfig
> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.12/ti43x/defconfig
> @@ -1,2 +1,2 @@
>   use-kernel-config=multi_v7_defconfig
> -config-fragment=
> +config-fragment=kernel/configs/ti_multi_v7_prune.config kernel/configs/ti_rt.config
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#18216): https://lists.yoctoproject.org/g/meta-ti/message/18216
> Mute This Topic: https://lists.yoctoproject.org/mt/110756742/3619733
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [afd@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

