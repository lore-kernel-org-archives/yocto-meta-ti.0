Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18F92C0218C
	for <webhook@archiver.kernel.org>; Wed, 22 Jan 2025 16:50:42 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.48660.1737564634561613960
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 22 Jan 2025 08:50:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=yAelo4TZ;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: afd@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50MGoWOB1047039
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 22 Jan 2025 10:50:32 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1737564632;
	bh=MzpzdrQ+LmbAhk2Tp8PSxvf+kVjiQDcq4UQJZamrt8E=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=yAelo4TZVgbl3fxIxLOoijWjBFrbektWgsb+nj9iLipmciBy92Uw69SjfOhD75Br1
	 oiHBuzjuESE4wuIfhJixw0OJuy9kNin+LHMRGNlGyyfMHvTVwEcM4pxVhAih/JISbd
	 S1Pp/kcjjeFGGFIrpA+ZPKeIRqt5HoBJfeyER7tg=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 50MGoW7e037830
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 22 Jan 2025 10:50:32 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 22
 Jan 2025 10:50:32 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 22 Jan 2025 10:50:31 -0600
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50MGoVGw036905;
	Wed, 22 Jan 2025 10:50:31 -0600
Message-ID: <7ea61ec8-e499-48d7-9fb5-f5159c6bc82d@ti.com>
Date: Wed, 22 Jan 2025 10:50:31 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [scarthgap][PATCH] linux-ti-staging: Add config-fragments for
 v6.12 Kernel
To: Beleswar Padhi <b-padhi@ti.com>, <reatmon@ti.com>, <denys@konsulko.com>
CC: <u-kumar1@ti.com>, <meta-ti@lists.yoctoproject.org>
References: <20250121175625.4114041-1-b-padhi@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20250121175625.4114041-1-b-padhi@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 22 Jan 2025 16:50:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18212

On 1/21/25 11:56 AM, Beleswar Padhi wrote:
> ti-linux-kernel tree has several prune config fragments for ARM/ARM64/RT
> configurations. Enable the prune config fragments here.
> 
> Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
> ---
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
> index 9d579e41..e6a967e1 100644
> --- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.12/ti33x/defconfig
> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.12/ti33x/defconfig
> @@ -1,2 +1,2 @@
>   use-kernel-config=multi_v7_defconfig
> -config-fragment=
> +config-fragment=kernel/configs/ti_multi_v7_prune.config kernel/configs/no_smp.config

We are running into some issues with the no_smp.config, seems some kernel
sysfs items relating to CPU counts are misbehaving (Chirag has more details
if anyone is interested). Disabling SMP is not well tested in general anymore
as it is often enabled by default even for single-core systems. The very small
performance change is not worth the lack of testing and instability caused
by going with non-standard configurations IMHO.

Everything else here looks good, but could we drop no_smp.config for now
and take up a debate on adding it in at a later time?

This also has the side benefit of reducing our kernel builds from 6 variations
to just 4 (arm32/64 x rt/non-rt).

Andrew

> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.12/ti43x/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.12/ti43x/defconfig
> index 9d579e41..e6a967e1 100644
> --- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.12/ti43x/defconfig
> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.12/ti43x/defconfig
> @@ -1,2 +1,2 @@
>   use-kernel-config=multi_v7_defconfig
> -config-fragment=
> +config-fragment=kernel/configs/ti_multi_v7_prune.config kernel/configs/no_smp.config
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
> index 9d579e41..5de2b229 100644
> --- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.12/ti33x/defconfig
> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.12/ti33x/defconfig
> @@ -1,2 +1,2 @@
>   use-kernel-config=multi_v7_defconfig
> -config-fragment=
> +config-fragment=kernel/configs/ti_multi_v7_prune.config kernel/configs/ti_rt.config kernel/configs/no_smp.config
> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.12/ti43x/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.12/ti43x/defconfig
> index 9d579e41..5de2b229 100644
> --- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.12/ti43x/defconfig
> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.12/ti43x/defconfig
> @@ -1,2 +1,2 @@
>   use-kernel-config=multi_v7_defconfig
> -config-fragment=
> +config-fragment=kernel/configs/ti_multi_v7_prune.config kernel/configs/ti_rt.config kernel/configs/no_smp.config

