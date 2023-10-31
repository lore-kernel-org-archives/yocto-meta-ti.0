Return-Path: <a-bhatia1@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 086CDC4332F
	for <webhook@archiver.kernel.org>; Tue, 31 Oct 2023 19:13:24 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.4398.1698779603362240984
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 31 Oct 2023 12:13:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=y+IVqYH3;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: a-bhatia1@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 39VJDLTY027546;
	Tue, 31 Oct 2023 14:13:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1698779601;
	bh=qy7U+m0MEzWusdulRDamusnWCQ6f8vuc5U14H5jOdQ4=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=y+IVqYH36Gd60oFI8P6h21ZR/Ie9Ez+jYM7kJveXaOg34jrxFwK8g2+KS2GxJy8V5
	 D+I2yORxU+IxJoz3Muh3/Z8V8qYwt70XWU678mp6dfUXHlhcXj7/kkiKexakYyv1PN
	 xxRK5fm33yt9aZUIdeG9X97xjP10rkdvrB4qmcGM=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 39VJDLDq058176
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 31 Oct 2023 14:13:21 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 31
 Oct 2023 14:13:21 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 31 Oct 2023 14:13:21 -0500
Received: from [10.249.132.69] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 39VJDIVA060472;
	Tue, 31 Oct 2023 14:13:19 -0500
Message-ID: <7e40e9f0-edaa-6694-5337-93a87450f569@ti.com>
Date: Wed, 1 Nov 2023 00:43:17 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [master/kirkstone][PATCH] conf: machine: am62*: Pick common
 overlays by prefix
Content-Language: en-US
To: Jai Luthra <j-luthra@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: Ryan Eatmon <reatmon@ti.com>, Denys Dmytriyenko <denys@konsulko.com>,
        Gyan
 Gupta <g-gupta@ti.com>, Chirag Shilwant <c-shilwant@ti.com>,
        Devarsh Thakkar
	<devarsht@ti.com>, Praneeth <praneeth@ti.com>
References: <20231027152836.2985618-1-j-luthra@ti.com>
From: Aradhya Bhatia <a-bhatia1@ti.com>
In-Reply-To: <20231027152836.2985618-1-j-luthra@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 31 Oct 2023 19:13:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17219



On 27-Oct-23 20:58, Jai Luthra wrote:
> SK boards of AM62 SoC family share peripheral expansions for camera
> and audio-over-HDMI.
> 
> The HDMI bridge is common across all SK-AM62* boards. The CSI2 FFC
> camera connector is common across all except SK-AM62-LP which only has a
> B2B Samtec connector.
> 
> As the kernel now uses the same prefix "k3-am62x-sk-" for the devicetree
> overlays for these peripherals, make sure we pick them by prefix for
> applicable boards.
> 
> Link: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit?id=b50ccab9e07c
> Link: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/commit/?&id=0432df3d2ae7
> Signed-off-by: Jai Luthra <j-luthra@ti.com>

Reviewed-by: Aradhya Bhatia <a-bhatia1@ti.com>

Regards
Aradhya

> ---
>  meta-ti-bsp/conf/machine/am62axx-evm.conf   | 2 ++
>  meta-ti-bsp/conf/machine/am62pxx-evm.conf   | 6 +++++-
>  meta-ti-bsp/conf/machine/am62xx-evm.conf    | 6 +++++-
>  meta-ti-bsp/conf/machine/am62xx-lp-evm.conf | 1 +
>  meta-ti-bsp/conf/machine/am62xxsip-evm.conf | 6 +++++-
>  5 files changed, 18 insertions(+), 3 deletions(-)
> 
> diff --git a/meta-ti-bsp/conf/machine/am62axx-evm.conf b/meta-ti-bsp/conf/machine/am62axx-evm.conf
> index d5d60718..ef60e9d1 100644
> --- a/meta-ti-bsp/conf/machine/am62axx-evm.conf
> +++ b/meta-ti-bsp/conf/machine/am62axx-evm.conf
> @@ -6,6 +6,8 @@ require conf/machine/include/am62axx.inc
>  
>  KERNEL_DEVICETREE_PREFIX = " \
>      ti/k3-am62a7 \
> +    ti/k3-am62x-sk-csi2 \
> +    ti/k3-am62x-sk-hdmi \
>      ti/k3-fpdlink \
>  "
>  
> diff --git a/meta-ti-bsp/conf/machine/am62pxx-evm.conf b/meta-ti-bsp/conf/machine/am62pxx-evm.conf
> index c0c62592..931de953 100644
> --- a/meta-ti-bsp/conf/machine/am62pxx-evm.conf
> +++ b/meta-ti-bsp/conf/machine/am62pxx-evm.conf
> @@ -4,7 +4,11 @@
>  
>  require conf/machine/include/am62pxx.inc
>  
> -KERNEL_DEVICETREE_PREFIX = "ti/k3-am62p5"
> +KERNEL_DEVICETREE_PREFIX = " \
> +    ti/k3-am62p5 \
> +    ti/k3-am62x-sk-csi2 \
> +    ti/k3-am62x-sk-hdmi \
> +"
>  
>  KERNEL_DEVICETREE = " \
>      ti/k3-am62p5-sk.dtb \
> diff --git a/meta-ti-bsp/conf/machine/am62xx-evm.conf b/meta-ti-bsp/conf/machine/am62xx-evm.conf
> index 082a1ae7..b60ba156 100644
> --- a/meta-ti-bsp/conf/machine/am62xx-evm.conf
> +++ b/meta-ti-bsp/conf/machine/am62xx-evm.conf
> @@ -5,7 +5,11 @@
>  require conf/machine/include/am62xx.inc
>  require conf/machine/include/ti-extras.inc
>  
> -KERNEL_DEVICETREE_PREFIX = "ti/k3-am625"
> +KERNEL_DEVICETREE_PREFIX = " \
> +    ti/k3-am625 \
> +    ti/k3-am62x-sk-csi2 \
> +    ti/k3-am62x-sk-hdmi \
> +"
>  
>  KERNEL_DEVICETREE = " \
>      ti/k3-am625-sk.dtb \
> diff --git a/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf b/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
> index 5c235c29..0d2f89ca 100644
> --- a/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
> +++ b/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
> @@ -7,6 +7,7 @@ require conf/machine/include/am62xx.inc
>  KERNEL_DEVICETREE_PREFIX = " \
>      ti/k3-am62-lp \
>      ti/k3-am625-sk \
> +    ti/k3-am62x-sk-hdmi \
>  "
>  
>  KERNEL_DEVICETREE = " \
> diff --git a/meta-ti-bsp/conf/machine/am62xxsip-evm.conf b/meta-ti-bsp/conf/machine/am62xxsip-evm.conf
> index dc4f3b77..b3bda44a 100644
> --- a/meta-ti-bsp/conf/machine/am62xxsip-evm.conf
> +++ b/meta-ti-bsp/conf/machine/am62xxsip-evm.conf
> @@ -4,7 +4,11 @@
>  
>  require conf/machine/include/am62xx.inc
>  
> -KERNEL_DEVICETREE_PREFIX = "ti/k3-am625"
> +KERNEL_DEVICETREE_PREFIX = " \
> +    ti/k3-am625 \
> +    ti/k3-am62x-sk-csi2 \
> +    ti/k3-am62x-sk-hdmi \
> +"
>  
>  KERNEL_DEVICETREE = " \
>      ti/k3-am625-sk.dtb \

