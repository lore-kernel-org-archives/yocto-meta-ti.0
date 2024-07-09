Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C365C2BD09
	for <webhook@archiver.kernel.org>; Tue,  9 Jul 2024 12:13:39 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.11419.1720527211648886946
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 09 Jul 2024 05:13:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=GWcAy5tD;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: c-shilwant@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 469CDRRv057521;
	Tue, 9 Jul 2024 07:13:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1720527208;
	bh=Me9ttHi+eEeUGK8HgwIjX7unkfrw517rnffK4X+nYlE=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=GWcAy5tDqRVsWhfOxb1eBObtWHpDfM8U4AlKJMP/nuLlgb093mIkkUSKIi8Y2UxSa
	 YtLBHlLUR8c/jMG1GzcuuuLhgdxSeUzpwuMkQM+Fr9IsAmuzJjjnxWOF6LgXnz2dYp
	 /Nx7kLxkDGQGK0NaQASDkJ1VULh+QaRpmfpWz0sQ=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 469CDRnV017054
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 9 Jul 2024 07:13:27 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 9
 Jul 2024 07:13:27 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 9 Jul 2024 07:13:27 -0500
Received: from [172.24.227.238] (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 469CDO8v088683;
	Tue, 9 Jul 2024 07:13:25 -0500
Message-ID: <4d8f8f38-729d-492f-bae5-88d95597d21e@ti.com>
Date: Tue, 9 Jul 2024 17:43:23 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [scarthgap][PATCH] ti-extras: Update SRCREV and BRANCH for
 ti-extras sources
To: <meta-ti@lists.yoctoproject.org>
CC: <s-adivi@ti.com>, <khasim@ti.com>, <g-gupta@ti.com>,
        Paresh Bhagat
	<p-bhagat@ti.com>, <praneeth@ti.com>, <reatmon@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>
References: <20240709120020.3025264-1-p-bhagat@ti.com>
Content-Language: en-US
From: Chirag Shilwant <c-shilwant@ti.com>
In-Reply-To: <20240709120020.3025264-1-p-bhagat@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 09 Jul 2024 12:13:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17842

Hi,

I believe this patch is applicable to master branch as well.
So, an update is needed in patch title.

s/[scarthgap]/[master/scarthgap]

---
Chirag

On 09/07/24 17:30, Paresh Bhagat wrote:
> Update u-boot/ti-extras.inc to 2024.04 version.
> Update linux/ti-extras-rt.inc to 6.6 version.
> Update linux/ti-extras.inc to version 6.6.
>
> Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
> ---
>   meta-ti-bsp/recipes-bsp/u-boot/ti-extras.inc      | 8 ++++----
>   meta-ti-bsp/recipes-kernel/linux/ti-extras-rt.inc | 8 ++++----
>   meta-ti-bsp/recipes-kernel/linux/ti-extras.inc    | 8 ++++----
>   3 files changed, 12 insertions(+), 12 deletions(-)
>
> diff --git a/meta-ti-bsp/recipes-bsp/u-boot/ti-extras.inc b/meta-ti-bsp/recipes-bsp/u-boot/ti-extras.inc
> index d32c6529..0252e2c3 100644
> --- a/meta-ti-bsp/recipes-bsp/u-boot/ti-extras.inc
> +++ b/meta-ti-bsp/recipes-bsp/u-boot/ti-extras.inc
> @@ -3,10 +3,10 @@
>   
>   COMPATIBLE_MACHINE = "am62xx|am62pxx"
>   
> -BRANCH = "ti-u-boot-2023.04"
> -BRANCH:tie-jailhouse = "ti-u-boot-2023.04-jailhouse"
> +BRANCH = "ti-u-boot-2024.04"
> +BRANCH:tie-jailhouse = "ti-u-boot-2024.04-jailhouse"
>   
> -SRCREV = "b0d868ee086eb5c96a3d32f72a7cb9670abf5b90"
> -SRCREV:tie-jailhouse = "765cab112d16fcf68a3266738073663dae67a55d"
> +SRCREV = "b3c10f333acccef49ebaf4abc575616ea7326d50"
> +SRCREV:tie-jailhouse = "b3c10f333acccef49ebaf4abc575616ea7326d50"
>   
>   UBOOT_GIT_URI = "git://git.ti.com/git/processor-sdk/u-boot.git"
> diff --git a/meta-ti-bsp/recipes-kernel/linux/ti-extras-rt.inc b/meta-ti-bsp/recipes-kernel/linux/ti-extras-rt.inc
> index 530a1783..df10d594 100644
> --- a/meta-ti-bsp/recipes-kernel/linux/ti-extras-rt.inc
> +++ b/meta-ti-bsp/recipes-kernel/linux/ti-extras-rt.inc
> @@ -4,8 +4,8 @@
>   
>   COMPATIBLE_MACHINE = "am62xx|am62pxx"
>   
> -BRANCH = "ti-rt-linux-6.1.y"
> -BRANCH:tie-jailhouse = "ti-rt-linux-6.1.y-jailhouse"
> +BRANCH = "ti-rt-linux-6.6.y"
> +BRANCH:tie-jailhouse = "ti-rt-linux-6.6.y-jailhouse"
>   
> -SRCREV = "685e77152461bd6b791500f717bec62d17c1b36d"
> -SRCREV:tie-jailhouse = "a74088b40b4d27478a2af5c20cdc0b4ec8ed9470"
> +SRCREV = "fb89cd4d622ce6cc1b7b254ae21298570d437a08"
> +SRCREV:tie-jailhouse = "ea592a872ebdb974f26f6f839596e0a79e9d408b"
> diff --git a/meta-ti-bsp/recipes-kernel/linux/ti-extras.inc b/meta-ti-bsp/recipes-kernel/linux/ti-extras.inc
> index 0b22aca9..880d5d87 100644
> --- a/meta-ti-bsp/recipes-kernel/linux/ti-extras.inc
> +++ b/meta-ti-bsp/recipes-kernel/linux/ti-extras.inc
> @@ -4,11 +4,11 @@
>   
>   COMPATIBLE_MACHINE = "am62xx|am62pxx"
>   
> -BRANCH = "ti-linux-6.1.y"
> -BRANCH:tie-jailhouse = "ti-linux-6.1.y-jailhouse"
> +BRANCH = "ti-linux-6.6.y"
> +BRANCH:tie-jailhouse = "ti-linux-6.6.y-jailhouse"
>   
> -SRCREV = "ec058c3ddc5377c629e988a95ef84826b14a3307"
> -SRCREV:tie-jailhouse = "d035e0cc72399f1c087a63c4210d29e79a7a66e4"
> +SRCREV = "e298dab666632b6f62ed61eac35813331341c3aa"
> +SRCREV:tie-jailhouse = "b45ba5ae4b724d4a09c0c7125ffb49e9d58c04f7"
>   
>   KERNEL_GIT_URI = "git://git.ti.com/git/processor-sdk/linux.git"
>   

