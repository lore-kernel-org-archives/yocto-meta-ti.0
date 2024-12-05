Return-Path: <jm@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 491EAE7716D
	for <webhook@archiver.kernel.org>; Thu,  5 Dec 2024 00:22:18 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.30236.1733358131986046633
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 04 Dec 2024 16:22:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=fH+v9lw0;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: jm@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4B50MAjN1842919
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 4 Dec 2024 18:22:10 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1733358130;
	bh=2+useigBczsnal65zAUdNARU3z2YE+ERAwrvrDlLqr4=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=fH+v9lw0SmUYyunLC9VG1vHMVMTQr0eVZgpPA4B3mVJIbnG2GfpEUFpTeaYK+t6ba
	 shoi57CpSPxVG6q1/bClJCTbGpkskEZca9hXNftQO/lvCQgkw1ZszbVfv1LS+NxOnt
	 8LoDM8dKnxzj67mhpuCCYNySIzZacJhFfvoKRrqM=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4B50MAjW088472
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 4 Dec 2024 18:22:10 -0600
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 4
 Dec 2024 18:22:09 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 4 Dec 2024 18:22:10 -0600
Received: from [128.247.81.105] (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4B50MAjn053848;
	Wed, 4 Dec 2024 18:22:10 -0600
Message-ID: <68466ae0-1e4f-4a40-8839-6e430a8f9031@ti.com>
Date: Wed, 4 Dec 2024 18:22:10 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master/scarthgap][PATCH] conf: machine: am62xx-lp-evm:
 Add PWM overlay
To: Ryan Eatmon <reatmon@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, Denys Dmytriyenko <denys@konsulko.com>,
        Randolph Sapp <rs@ti.com>, Praneeth Bajjuri <praneeth@ti.com>
References: <20241202194929.67533-1-jm@ti.com>
Content-Language: en-US
From: Judith Mendez <jm@ti.com>
In-Reply-To: <20241202194929.67533-1-jm@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 05 Dec 2024 00:22:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18079

Hi all,

Please do not merge, I will be adding a second overlay to this patch.

~ Judith

On 12/2/24 1:49 PM, Judith Mendez wrote:
> Add the k3-am62x-sk-pwm.dtbo overlay for AM62 LP SK.
> 
> Signed-off-by: Judith Mendez <jm@ti.com>
> ---
>   meta-ti-bsp/conf/machine/am62xx-lp-evm.conf | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf b/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
> index 51e99728..cd413afe 100644
> --- a/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
> +++ b/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
> @@ -11,6 +11,7 @@ KERNEL_DEVICETREE_PREFIX = " \
>       ti/k3-am62x-sk-hdmi \
>       ti/k3-am62x-sk-lpm \
>       ti/k3-am62x-sk-mcan \
> +    ti/k3-am62x-sk-pwm \
>   "
>   
>   KERNEL_DEVICETREE = " \


