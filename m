Return-Path: <nm@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE581C43334
	for <webhook@archiver.kernel.org>; Wed, 20 Jul 2022 21:07:54 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web08.2727.1658351268107106867
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 20 Jul 2022 14:07:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=j/YGioou;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: nm@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 26KL7li6105960;
	Wed, 20 Jul 2022 16:07:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1658351267;
	bh=/QHHxn7NNP0w2CiC1Juv/2nKHK5JbGFLAnQJ0OfwKrs=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=j/YGiooujmLrVAMBFQ9QH2UWibx/YCNwbD8ghr9EH/gjggoWjhK90+3V19Ymfb2CK
	 TqDBDZlQXEa5olNKp/gbzGPAtlELIyM5DlKStniLCppSMrT/6SRSDorSPTp/4mNJTx
	 xYX/q0kVlXeXBBrp0cjMGxOq/37nM1erGD+4eP54=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 26KL7ll5000992
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 20 Jul 2022 16:07:47 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 20
 Jul 2022 16:07:46 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 20 Jul 2022 16:07:46 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 26KL7k89005836;
	Wed, 20 Jul 2022 16:07:46 -0500
Date: Wed, 20 Jul 2022 16:07:46 -0500
From: Nishanth Menon <nm@ti.com>
To: <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][dunfell][PATCH] kernel u-boot: Fix formulation of
 LOCALVERSION
Message-ID: <20220720210746.erktcfv3gvc2ocfo@lunacy>
References: <20220720210131.23272-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220720210131.23272-1-reatmon@ti.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 20 Jul 2022 21:07:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14892

On 16:01-20220720, Ryan Eatmon via lists.yoctoproject.org wrote:
> devtool does not work with the current formulation of
> the LOCALVERSION variables.  We need to use SRCPV to
> avoid AUTOREV on bleeding builds, but there will be no
> + in the string, so we cannot split on that.  Just
> use SRCPV directly.
> 
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>

Reported-by: Daniel Thompson <daniel.thompson@linaro.org>
Tested-by: Nishanth Menon <nm@ti.com>


We will need to apply this to master as well - looks like we carried the
bug there as well.

> ---
>  recipes-bsp/u-boot/u-boot-ti.inc         | 2 +-
>  recipes-kernel/linux/setup-defconfig.inc | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes-bsp/u-boot/u-boot-ti.inc b/recipes-bsp/u-boot/u-boot-ti.inc
> index e7c93335..c2da2281 100644
> --- a/recipes-bsp/u-boot/u-boot-ti.inc
> +++ b/recipes-bsp/u-boot/u-boot-ti.inc
> @@ -1,6 +1,6 @@
>  # UBOOT_LOCALVERSION can be set to add a tag to the end of the
>  # U-boot version string.  such as the commit id
> -UBOOT_LOCALVERSION = "-g${@d.getVar('SRCPV', True).split('+')[1]}"
> +UBOOT_LOCALVERSION = "-g${@d.getVar('SRCPV', True)[:10]}"
>  
>  UBOOT_SUFFIX ?= "img"
>  SPL_BINARY ?= "MLO"
> diff --git a/recipes-kernel/linux/setup-defconfig.inc b/recipes-kernel/linux/setup-defconfig.inc
> index 1e97acc0..08e9b638 100644
> --- a/recipes-kernel/linux/setup-defconfig.inc
> +++ b/recipes-kernel/linux/setup-defconfig.inc
> @@ -1,6 +1,6 @@
>  # KERNEL_LOCALVERSION can be set to add a tag to the end of the
>  # kernel version string.  such as the commit id
> -KERNEL_LOCALVERSION = "-g${@d.getVar('SRCPV', True).split('+')[1]}"
> +KERNEL_LOCALVERSION = "-g${@d.getVar('SRCPV', True)[:10]}"
>  
>  # Check the defconfig file and see if it points to an in kernel
>  # defconfig that should be used, or if it is a complete config file
> -- 
> 2.17.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#14891): https://lists.yoctoproject.org/g/meta-ti/message/14891
> Mute This Topic: https://lists.yoctoproject.org/mt/92514313/5513541
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [nm@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

