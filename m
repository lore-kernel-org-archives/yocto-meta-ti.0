Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07DA0C61DA4
	for <webhook@archiver.kernel.org>; Thu,  9 Feb 2023 16:39:59 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.20898.1675960796873279921
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 09 Feb 2023 08:39:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=bbbN5kLX;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: afd@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 319GdtIS069041;
	Thu, 9 Feb 2023 10:39:55 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1675960795;
	bh=2F4aojHNJeRNI8f7Om2D6XYMcrUYqt5a04Xd3Pz5VXY=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=bbbN5kLXuW5Jv+Cm0wmrLmnfUOnQzL/8p9EMLOkEgreesztXg3pYEZe+qD3besBhP
	 2e+wgXRe5kxkDPWb6GU2iv/+V2Ja/hHiakh97Tr+f+tH82flBDE87vUXLMSrcNeFDC
	 WFAEtPrJnLrsTCF+qGRX9ur2rtCMg0ypSkAwcSdE=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 319GdtjB099283
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 9 Feb 2023 10:39:55 -0600
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Thu, 9
 Feb 2023 10:39:55 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Thu, 9 Feb 2023 10:39:55 -0600
Received: from [10.250.32.173] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 319GdsFI113435;
	Thu, 9 Feb 2023 10:39:54 -0600
Message-ID: <de291649-7224-28df-b7f1-0577386c45b9@ti.com>
Date: Thu, 9 Feb 2023 10:39:54 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [meta-ti][dunfell][PATCH V2] conf: machine: k3: Add DTB and DTBO
 load address for FIT image
Content-Language: en-US
To: <sinthu.raja@mistralsolutions.com>, <reatmon@ti.com>, <denys@ti.com>,
        <detheridge@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, Sinthu Raja <sinthu.raja@ti.com>
References: <20230209082057.7744-1-sinthu.raja@ti.com>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20230209082057.7744-1-sinthu.raja@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 09 Feb 2023 16:39:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15772

On 2/9/23 2:20 AM, Sinthu Raja M via lists.yoctoproject.org wrote:
> From: Sinthu Raja <sinthu.raja@ti.com>
> 
> K3 platforms include the fit image-based kernel as the default. The fit

Not "as the default", rather "by default". Only HS has it as "the" default.

> image loads the kernel and DTB. The DTB/DTBOs, however, are added to the

The FIT image does not do the loading, U-Boot/SBL does. Recommend change
the wording to "The bootloader loads the kernel and DTB from the FIT image".

Remove ", however,".

> fit image, but the load address is not included in the image section of
> each DTB/DTBO, for non-HS platforms. This load address is determined by
> the LOADADDRESS macros in the kernel-fitmage class.
> 
> Hence, in K3, include the DTB/DTBOs load address and offset macros, which
> will be used by all K3 platforms.

Include them where? The whole point of the patch is you are now including
them in a common include file, that should be stated.

"FIT" is an acronym, capitalize it everywhere.

> 
> Signed-off-by: Sinthu Raja <sinthu.raja@ti.com>
> ---
> 
> Hi,
> Build tested locally and validated the fitImage on AM68 SK.
> 
> Changes in V2:
> =============
> Address review comment:
> - Move the change to k3.inc as the fit image is included as default
>    image across all platforms
> 
> V1: https://lists.yoctoproject.org/g/meta-ti/message/15754
>   
>   conf/machine/include/k3.inc | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/conf/machine/include/k3.inc b/conf/machine/include/k3.inc
> index 81139571..96f7dbd5 100644
> --- a/conf/machine/include/k3.inc
> +++ b/conf/machine/include/k3.inc
> @@ -21,6 +21,9 @@ KERNEL_CLASSES += "kernel-fitimage"
>   UBOOT_ARCH = "arm"
>   UBOOT_ENTRYPOINT = "0x80008000"
>   UBOOT_LOADADDRESS = "0x80008000"
> +UBOOT_DTB_LOADADDRESS =  "0x83000000"
> +UBOOT_DTBO_LOADADDRESS = "0x83080000"
> +UBOOT_DTBO_OFFSET =      "0x00010000"

Should include UBOOT_RD_* also.

Now that you add this info here, all other files that include this
file should have these lines removed.

Andrew

>   
>   SPL_BINARY = "tispl.bin"
>   SPL_BINARYNAME = "tispl.bin"
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#15768): https://lists.yoctoproject.org/g/meta-ti/message/15768
> Mute This Topic: https://lists.yoctoproject.org/mt/96849292/3619733
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [afd@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

