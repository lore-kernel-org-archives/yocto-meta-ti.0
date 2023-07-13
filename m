Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A82FCC001DE
	for <webhook@archiver.kernel.org>; Thu, 13 Jul 2023 19:47:58 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.523.1689277671451975183
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 13 Jul 2023 12:47:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=nGZ3EVM9;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: rs@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 36DJlo7q101107
	for <meta-ti@lists.yoctoproject.org>; Thu, 13 Jul 2023 14:47:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1689277671;
	bh=jt9RV7NMQluLsKIeWhKDYtgWZesnmBsDMtkLpWp364I=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=nGZ3EVM9Q/IdM8R5l5/z61PgOa6HYODDcdAeimda8grb+NSb0qHvOWm39rVMULUGt
	 kfzFaPN1k7uzSRynjvyz63zFa5Asi24alaMIF2nwN+6Y2gRZfwAfNM8bbbsP6sujZo
	 NpqIGX4DC28YkHvfLqtx+pW+WPf373mbzsvfFUOQ=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 36DJlown002349
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Thu, 13 Jul 2023 14:47:50 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 13
 Jul 2023 14:47:50 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 13 Jul 2023 14:47:50 -0500
Received: from [128.247.81.144] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 36DJlo2j024334;
	Thu, 13 Jul 2023 14:47:50 -0500
Message-ID: <4941628c-de7d-69e3-7230-c321944c85e3@ti.com>
Date: Thu, 13 Jul 2023 14:47:50 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [kirkstone PATCH] meta-ti: conf: am62xx-lp-evm: Use common
 include am62xx.inc
Content-Language: en-US, en-US-large
To: <praneeth@ti.com>, Ryan Eatmon <reatmon@ti.com>,
        Chirag Shilwant
	<c-shilwant@ti.com>
CC: <meta-ti@lists.yoctoproject.org>
References: <20230713193702.10578-1-praneeth@ti.com>
From: Randolph Sapp <rs@ti.com>
In-Reply-To: <20230713193702.10578-1-praneeth@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 13 Jul 2023 19:47:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16845

On 7/13/23 14:37, praneeth@ti.com wrote:
> From: Praneeth Bajjuri <praneeth@ti.com>
> 
> commit 5f9be228390b ("machine: Add AM62Q HS-SE evm configuration")
> has added am62xx-lp.inc which is used by am62xx-lp-evm machine.
> 
> The features listed in am62xx.inc are common between machines
> am62xx-evm and am62xx-lp-evm. (Ex: MACHINE_FEATURES = "gpu")
> 
> Hence updating the necessary include file to have
> common features to be enabled between these two platform variants.
> 
> Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
> Suggested-by: Randolph Sapp <rs@ti.com>
> ---
>   meta-ti-bsp/conf/machine/am62xx-lp-evm.conf    |  2 +-
>   meta-ti-bsp/conf/machine/include/am62xx-lp.inc | 15 ---------------
>   2 files changed, 1 insertion(+), 16 deletions(-)
>   delete mode 100644 meta-ti-bsp/conf/machine/include/am62xx-lp.inc
> 
> diff --git a/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf b/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
> index 1f1b47ba..5c235c29 100644
> --- a/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
> +++ b/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
> @@ -2,7 +2,7 @@
>   #@NAME: AM62XX LP EVM
>   #@DESCRIPTION: Machine configuration for the TI AM62XX LP EVM
>   
> -require conf/machine/include/am62xx-lp.inc
> +require conf/machine/include/am62xx.inc
>   
>   KERNEL_DEVICETREE_PREFIX = " \
>       ti/k3-am62-lp \
> diff --git a/meta-ti-bsp/conf/machine/include/am62xx-lp.inc b/meta-ti-bsp/conf/machine/include/am62xx-lp.inc
> deleted file mode 100644
> index f3fe944b..00000000
> --- a/meta-ti-bsp/conf/machine/include/am62xx-lp.inc
> +++ /dev/null
> @@ -1,15 +0,0 @@
> -require conf/machine/include/k3.inc
> -SOC_FAMILY:append = ":am62xx"
> -
> -MACHINE_FEATURES += "screen touchscreen"
> -
> -TFA_K3_SYSTEM_SUSPEND = "1"
> -
> -# Default tiboot3.bin on AM62x LP is for HS-FS
> -IMAGE_BOOT_FILES += "tiboot3-am62x-hs-fs-evm.bin"
> -
> -# Since default tiboot3.bin on AM62x LP is for HS-FS, add a version for HS-SE
> -IMAGE_BOOT_FILES += "tiboot3-am62x-hs-evm.bin"
> -
> -TFA_BOARD = "lite"
> -OPTEEMACHINE = "k3-am62x"

I'm not sure what takes priority here but I'll add it anyway. LGTM. 
Applies cleanly to master as well.

Reviewed-by: Randolph Sapp <rs@ti.com>

