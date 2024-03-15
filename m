Return-Path: <vibhore@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FB0BC54E60
	for <webhook@archiver.kernel.org>; Fri, 15 Mar 2024 01:50:17 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.10462.1710467414566071831
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 14 Mar 2024 18:50:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=spLXBReO;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: vibhore@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 42F1oDxQ056428
	for <meta-ti@lists.yoctoproject.org>; Thu, 14 Mar 2024 20:50:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1710467413;
	bh=zgY3ZI0xUOampXmgHFoqugKVFdyhow9BN+5BrovG2ug=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=spLXBReOwh3Hyx3OW5///+/38q56mfCDKRRAaO1Nm5kiVYmULEj7FzudHl0OAxNdH
	 hlEAc3+j5lqrp4Ny4qYaIk9BwyyBXZrPBHLpmlcj+lOGMV08EETqeRmyJQBREzKy3I
	 rXvHs4dYC/cBgnMwiJ1Vpr2ysonoSK6XpeKFGW1M=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 42F1oDNW079406
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Thu, 14 Mar 2024 20:50:13 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 14
 Mar 2024 20:50:13 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 14 Mar 2024 20:50:13 -0500
Received: from localhost ([10.249.34.194])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 42F1oDcd022023;
	Thu, 14 Mar 2024 20:50:13 -0500
Date: Thu, 14 Mar 2024 20:50:13 -0500
From: Vibhore Vardhan <vibhore@ti.com>
To: <praneeth@ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [kirkstone PATCH] conf: machine: am62p: pick lpm overlay
Message-ID: <20240315015013.t373irqwz25yqoux@ult0866455>
References: <20240314173406.10661-1-praneeth@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240314173406.10661-1-praneeth@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 15 Mar 2024 01:50:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17535

On 12:34-20240314, praneeth@ti.com wrote:
> From: Praneeth Bajjuri <praneeth@ti.com>
> 
> overlay k3-am62x-sk-lpm-wkup-sources.dtso is common across
> am62x platforms. This overlay is added in 6.1 kernel at [1]
> 
> [1]: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/commit/?&id=4ba1886b886d
> 
> This patch is to enable the same low power management wakeup sources
> overlay for am62pxx platform as well.

Thanks Praneeth!

Reviewed-by: Vibhore Vardhan <vibhore@ti.com>

> Reported-by: Vibhore Vardhan <vibhore@ti.com>
> Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
> ---
>  meta-ti-bsp/conf/machine/am62pxx-evm.conf | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta-ti-bsp/conf/machine/am62pxx-evm.conf b/meta-ti-bsp/conf/machine/am62pxx-evm.conf
> index 95602116..fab96bd8 100644
> --- a/meta-ti-bsp/conf/machine/am62pxx-evm.conf
> +++ b/meta-ti-bsp/conf/machine/am62pxx-evm.conf
> @@ -9,6 +9,7 @@ KERNEL_DEVICETREE_PREFIX = " \
>      ti/k3-am62p5 \
>      ti/k3-am62x-sk-csi2 \
>      ti/k3-am62x-sk-hdmi \
> +    ti/k3-am62x-sk-lpm \
>  "
>  
>  KERNEL_DEVICETREE = " \
> -- 
> 2.17.1
> 

