Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1AACC7EE23
	for <webhook@archiver.kernel.org>; Thu,  1 Jun 2023 19:35:38 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.1976.1685648134442719524
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 01 Jun 2023 12:35:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=F9EVFfFo;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: afd@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 351JZUQ6117546;
	Thu, 1 Jun 2023 14:35:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1685648130;
	bh=V9De44F7zs5SpSqIIOmcFR0kSxUZSJRv4exMX2fjkVA=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=F9EVFfFo3stPn234Rdv0takpEzvugX/Iii/ITlUWM2w+LOF6RaTrsUV9DMwU+EiPa
	 rzPQVaEztPu3DpqNIs4wnSPW7DK/+Xl3gt6cTKHAk1Y1Y74bGfGRT6FqeMkXJ8imvO
	 Hl7dQ+TEa3BS7l0i9JWAINfpq3PNmpfLwZrhBypw=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 351JZUHo104952
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 1 Jun 2023 14:35:30 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 1
 Jun 2023 14:35:29 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 1 Jun 2023 14:35:29 -0500
Received: from [10.250.32.6] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 351JZTk4090779;
	Thu, 1 Jun 2023 14:35:29 -0500
Message-ID: <765722ff-f117-32f9-34b3-b531c2b6816c@ti.com>
Date: Thu, 1 Jun 2023 14:35:29 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [meta-ti kirkstone/master PATCH] ti-kernel: Apply RT config
 fragments to RT kernel defconfig
Content-Language: en-US
To: Bryan Brattlof <bb@ti.com>, Ryan Eatmon <reatmon@ti.com>,
        Denys
 Dmytriyenko <denis@denix.org>
CC: Meta-TI <meta-ti@lists.yoctoproject.org>, Res Sapp <rs@ti.com>
References: <20230601185739.2862707-1-bb@ti.com>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20230601185739.2862707-1-bb@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 01 Jun 2023 19:35:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16648

On 6/1/23 1:57 PM, Bryan Brattlof wrote:
> For the v6.1 LTS kernel, we (TI) have moved to using defconfig fragments
> to build the different kernel configurations. To properly build a kernel
> with full preemption support, add the ti_arm64_rt.config to the
> linux-ti-staging-rt-6.1/k3/defconfig
> 
> Signed-off-by: Bryan Brattlof <bb@ti.com>
> ---
>   .../recipes-kernel/linux/linux-ti-staging-rt-6.1/k3/defconfig   | 2 +-

Looks good for k3, what about non-k3 and omapl138?

Andrew

>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.1/k3/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.1/k3/defconfig
> index ef1d3efd50118..54dc86b407c7c 100644
> --- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.1/k3/defconfig
> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.1/k3/defconfig
> @@ -1,2 +1,2 @@
>   use-kernel-config=defconfig
> -config-fragment=kernel/configs/ti_arm64_prune.config
> +config-fragment=kernel/configs/ti_arm64_prune.config kernel/configs/ti_arm64_rt.config
> 
> base-commit: 8fa9ec7dcd2e816cee18aaf7e8947b3eaee9923c

