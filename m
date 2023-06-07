Return-Path: <praneeth@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB475C77B7A
	for <webhook@archiver.kernel.org>; Wed,  7 Jun 2023 23:52:20 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.1438.1686181932446820131
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 07 Jun 2023 16:52:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=sjaAMopc;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: praneeth@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 357Nq898047307;
	Wed, 7 Jun 2023 18:52:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1686181928;
	bh=Nwm+ONGlkeX2PNlXe/ou/BtsPQjG5X3tFv2aJIArKLQ=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=sjaAMopcG8zN584FmzaCXnpQ67p2pbLWdNvYQcBFiU8S66njx6v/oS9Tgoh1AiKBC
	 /ga7Gl4+eJoQuTuPDGTowTyFHnsMXX7vIl9qpE1/lkdXCRpikhByhvEGXj7OpsSPKW
	 WiOt6JpKyuxBT1haPsscYJN5j9mruYDEJyljlHhE=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 357Nq88d035501
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 7 Jun 2023 18:52:08 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 7
 Jun 2023 18:52:08 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 7 Jun 2023 18:52:08 -0500
Received: from [10.247.28.33] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 357Nq7q9112986;
	Wed, 7 Jun 2023 18:52:08 -0500
Message-ID: <db2c694c-a4b0-8f0b-6603-4544dd574777@ti.com>
Date: Wed, 7 Jun 2023 18:52:07 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [meta-ti] [meta-ti kirkstone/master PATCH v2] ti-kernel: Apply RT
 fragments to RT kernel config
Content-Language: en-US
To: <bb@ti.com>, Ryan Eatmon <reatmon@ti.com>,
        Denys Dmytriyenko
	<denis@denix.org>
CC: Andrew Davis <afd@ti.com>, Meta-TI <meta-ti@lists.yoctoproject.org>
References: <20230607230924.2889679-1-bb@ti.com>
From: "Bajjuri, Praneeth" <praneeth@ti.com>
In-Reply-To: <20230607230924.2889679-1-bb@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 07 Jun 2023 23:52:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16693



On 6/7/2023 6:09 PM, Bryan Brattlof via lists.yoctoproject.org wrote:
> Apply the ti_rt.config fragment to all the linux-ti-staging-rt-6.1
> defconfigs so we can properly build the RT kernel for our devices.
> 
> Signed-off-by: Bryan Brattlof <bb@ti.com>

Acked-by: Praneeth Bajjuri <praneeth@ti.com>


> ---
> 
> Changes since v1:[0]
> - applied rt fragment to all devices, not just K3
> 
> [0] https://lists.yoctoproject.org/g/meta-ti/message/16646
> 
>   .../recipes-kernel/linux/linux-ti-staging-rt-6.1/defconfig      | 2 +-
>   .../recipes-kernel/linux/linux-ti-staging-rt-6.1/k3/defconfig   | 2 +-
>   .../linux/linux-ti-staging-rt-6.1/omapl138/defconfig            | 1 +
>   3 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.1/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.1/defconfig
> index 24b53cf7aecb5..43089dc87d0bf 100644
> --- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.1/defconfig
> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.1/defconfig
> @@ -1,2 +1,2 @@
>   use-kernel-config=multi_v7_defconfig
> -config-fragment=kernel/configs/ti_multi_v7_prune.config
> +config-fragment=kernel/configs/ti_multi_v7_prune.config kernel/configs/ti_rt.config
> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.1/k3/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.1/k3/defconfig
> index ef1d3efd50118..47d78664bdd1d 100644
> --- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.1/k3/defconfig
> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.1/k3/defconfig
> @@ -1,2 +1,2 @@
>   use-kernel-config=defconfig
> -config-fragment=kernel/configs/ti_arm64_prune.config
> +config-fragment=kernel/configs/ti_arm64_prune.config kernel/configs/ti_rt.config
> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.1/omapl138/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.1/omapl138/defconfig
> index 099493af19a0d..2c829c0ba3c22 100644
> --- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.1/omapl138/defconfig
> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.1/omapl138/defconfig
> @@ -1 +1,2 @@
>   use-kernel-config=davinci_all_defconfig
> +config-fragment=kernel/configs/ti_rt.config
> 
> base-commit: 02fb90c7972aa53ad6c3599a161ec62fd91d1efa
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#16692): https://lists.yoctoproject.org/g/meta-ti/message/16692
> Mute This Topic: https://lists.yoctoproject.org/mt/99396234/2167429
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [praneeth@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

