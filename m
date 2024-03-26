Return-Path: <j-luthra@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD0DFC54E58
	for <webhook@archiver.kernel.org>; Tue, 26 Mar 2024 07:09:17 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.2800.1711436954015300085
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 26 Mar 2024 00:09:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=FyY85x/w;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: j-luthra@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 42Q79DCA004445
	for <meta-ti@lists.yoctoproject.org>; Tue, 26 Mar 2024 02:09:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1711436953;
	bh=MWhBXiTnu77YO+yZ0gqeyq0ECCeYhPJkBzYCoumOuLc=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=FyY85x/wF8KesLAlTDRXvtw6Dl1FINhafATouADyhfaxitJ292M5Kc/zOuxJylcIb
	 sAW/S0oYeOQ+wlXWyZTpYk2pdkMPxdCm4D3WzXuGM7metSJSpvsbP+Aau/HT4TPsqh
	 kFvJptcbIuqb4O69ta085cBrzLoC8hr6NPhYaSrM=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 42Q79Dpb087328
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Tue, 26 Mar 2024 02:09:13 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 26
 Mar 2024 02:09:13 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 26 Mar 2024 02:09:13 -0500
Received: from localhost (jluthra.dhcp.ti.com [172.24.227.116])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 42Q79C3s054173;
	Tue, 26 Mar 2024 02:09:13 -0500
Date: Tue, 26 Mar 2024 12:39:12 +0530
From: Jai Luthra <j-luthra@ti.com>
To: Rahul T R <r-ravikumar@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <a-limaye@ti.com>,
        Ryan Eatmon
	<reatmon@ti.com>, <vaishnav.a@ti.com>
Subject: Re: [meta-ti][master/kirkstone][PATCH] conf: machine: j721s2/j784s4:
 Pick overlays for V3Link cameras
Message-ID: <maxizetj33colv57q2cihp5dfbgpi5utceqdie32whfi5arsot@x6gryngfz4wi>
References: <20240326070041.699601-1-r-ravikumar@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240326070041.699601-1-r-ravikumar@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 26 Mar 2024 07:09:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17555

Hi Rahul,

Thanks for the patch.

On Mar 26, 2024 at 12:30:41 +0530, Rahul T R wrote:
> am69 and am68 sk boards supports V3Link cameras interfaced via V3Link
> camera fusion board. Refer to
> commit b7a97b1b (conf: machine: am62axx: Pick overlays for V3Link cameras)
> for details
> 
> Signed-off-by: Rahul T R <r-ravikumar@ti.com>

Acked-by: Jai Luthra <j-luthra@ti.com>

> ---
>  meta-ti-bsp/conf/machine/j721s2-evm.conf | 1 +
>  meta-ti-bsp/conf/machine/j784s4-evm.conf | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/meta-ti-bsp/conf/machine/j721s2-evm.conf b/meta-ti-bsp/conf/machine/j721s2-evm.conf
> index ecb1836f..c4e8af90 100644
> --- a/meta-ti-bsp/conf/machine/j721s2-evm.conf
> +++ b/meta-ti-bsp/conf/machine/j721s2-evm.conf
> @@ -12,6 +12,7 @@ KERNEL_DEVICETREE_PREFIX = " \
>      ti/k3-fpdlink \
>      ti/k3-j7200-evm-mcspi-loopback \
>      ti/k3-am68-sk \
> +    ti/k3-v3link \
>  "
>  
>  KERNEL_DEVICETREE = " \
> diff --git a/meta-ti-bsp/conf/machine/j784s4-evm.conf b/meta-ti-bsp/conf/machine/j784s4-evm.conf
> index 40a63651..e451bf47 100644
> --- a/meta-ti-bsp/conf/machine/j784s4-evm.conf
> +++ b/meta-ti-bsp/conf/machine/j784s4-evm.conf
> @@ -12,6 +12,7 @@ KERNEL_DEVICETREE_PREFIX = " \
>      ti/k3-fpdlink \
>      ti/k3-j7200-evm-mcspi-loopback \
>      ti/k3-am69-sk \
> +    ti/k3-v3link \
>  "
>  
>  KERNEL_DEVICETREE = " \
> -- 
> 2.34.1
> 

-- 
Thanks,
Jai

GPG Fingerprint: 4DE0 D818 E5D5 75E8 D45A AFC5 43DE 91F9 249A 7145

