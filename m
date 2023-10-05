Return-Path: <d-gole@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4803BE936F9
	for <webhook@archiver.kernel.org>; Thu,  5 Oct 2023 04:43:43 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.8608.1696481019578796782
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 04 Oct 2023 21:43:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Y9siQPwD;
 spf=none, err=SPF record not found (domain: ti.com, ip: 198.47.23.248, mailfrom: d-gole@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3954hZDW024996;
	Wed, 4 Oct 2023 23:43:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1696481015;
	bh=55TCgqUCkagXySAbZdVSbgk4SBkC2b5WYqZzj0hDH6Y=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=Y9siQPwDUafgd/721oET2gcBvdhMyMH4XdJMn/5UKvs/Z3VB9Nr27qPzM0CmhyAaK
	 9gedM0AwngZcY/4LzJO7Gk2agLZPuARSuxOgiHSn1fy6ihzBIzM9VvFPUTp2uD6Wjw
	 YPgxfnJc1afSV30Shdj3tFZcFKpB+mgYmcBW7EsM=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3954hZPK094299
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 4 Oct 2023 23:43:35 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 4
 Oct 2023 23:43:35 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 4 Oct 2023 23:43:34 -0500
Received: from localhost (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3954hY2a028750;
	Wed, 4 Oct 2023 23:43:34 -0500
Date: Thu, 5 Oct 2023 10:13:33 +0530
From: Dhruva Gole <d-gole@ti.com>
To: Kamlesh Gurudasani <kamlesh@ti.com>
CC: <vigneshr@ti.com>, <praneeth@ti.com>, <u-kumar1@ti.com>, <afd@ti.com>,
        <m-chawdhry@ti.com>, <reatmon@ti.com>, <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>, <vibhore@ti.com>, <vishalm@ti.com>
Subject: Re: [PATCH] trusted-firmware-a: Update to sha fixing deep sleep on
 AM62x
Message-ID: <20231005044333.skc2zm2crplecwna@dhruva>
References: <20231004-atf-bump-lpm-v1-1-66ebc652e365@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231004-atf-bump-lpm-v1-1-66ebc652e365@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 05 Oct 2023 04:43:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17057

On Oct 04, 2023 at 21:19:50 +0530, Kamlesh Gurudasani wrote:
> Update to commit d7a7135d32a8c7da004c0c19b75bd4e2813f9759,
> which fixes deep sleep bug on AM62x
> 
> https://git.trustedfirmware.org/TF-A/trusted-firmware-a.git/commit/?id=d7a7135d32a8c7da004c0c19b75bd4e2813f9759
> 
> Signed-off-by: Kamlesh Gurudasani <kamlesh@ti.com>
> ---
>  meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
> index 64bfec67..b2787005 100644
> --- a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
> +++ b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
> @@ -1,5 +1,5 @@
>  PV:k3 = "2.9+git${SRCPV}"
> -SRCREV_tfa:k3 = "d3e71ead6ea5bc3555ac90a446efec84ef6c6122"
> +SRCREV_tfa:k3 = "d7a7135d32a8c7da004c0c19b75bd4e2813f9759"

checked-out to this ATF commit sha locally and tested on my AM62x-SK HSFS
and GP samples:

https://gist.github.com/DhruvaG2000/6f3e950417ce418c1bf083661c1a6fca


NOTE: Local changes to enable suspend support:

8<------------------------------------------------------------------------------
diff --git a/plat/ti/k3/common/plat_common.mk b/plat/ti/k3/common/plat_common.mk
index fb633a832713..d234b7f3d690 100644
--- a/plat/ti/k3/common/plat_common.mk
+++ b/plat/ti/k3/common/plat_common.mk
@@ -45,7 +45,7 @@ K3_USART_BAUD         :=      115200
 $(eval $(call add_define,K3_USART_BAUD))

 # Enable system suspend modes
-K3_PM_SYSTEM_SUSPEND   :=      0
+K3_PM_SYSTEM_SUSPEND   :=      1
 $(eval $(call add_define,K3_PM_SYSTEM_SUSPEND))

 # Libraries
------------------------------------------------------------------------------>8


>  SRC_URI:k3 = "git://git.trustedfirmware.org/TF-A/trusted-firmware-a.git;protocol=https;name=tfa;branch=master"
>  COMPATIBLE_MACHINE:k3 = "k3"
>  TFA_BUILD_TARGET:k3 = "all"
> 
> ---
> base-commit: 771e12cfb7a9ffedb40395632bc123cd4ce5fb9a
> change-id: 20231004-atf-bump-lpm-cf9d26d6f4ce
> 

Tested-by: Dhruva Gole <d-gole@ti.com>

-- 
Best regards,
Dhruva Gole <d-gole@ti.com>

