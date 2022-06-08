Return-Path: <nm@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2407AC43334
	for <webhook@archiver.kernel.org>; Wed,  8 Jun 2022 18:09:27 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.729.1654711762586859887
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 08 Jun 2022 11:09:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=DgJ7JFTm;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: nm@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 258I9LYq048484
	for <meta-ti@lists.yoctoproject.org>; Wed, 8 Jun 2022 13:09:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1654711761;
	bh=0r8snZkeMhPqaJhlPI2WUn7MlRptOCpP8kS9vDQGZA0=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=DgJ7JFTm9RTo+U8Br/zT5mzyAmlMGPa4gCUZF6Dy3SYoIwgkIhu8uBzSahtP8GE0z
	 0cGrNfrnas0M73hQZ2oBaa+lKRBftpq1Mzt7tW6szekZMNjhReIWMLMXPzfWy1rQsM
	 DvkjUChr1Kuh+Ud8qG+YDUamcGx/244Y31ekpkcY=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 258I9LNP115974
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Wed, 8 Jun 2022 13:09:21 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 8
 Jun 2022 13:09:21 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 8 Jun 2022 13:09:21 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 258I9LLp096798;
	Wed, 8 Jun 2022 13:09:21 -0500
Date: Wed, 8 Jun 2022 13:09:21 -0500
From: Nishanth Menon <nm@ti.com>
To: <j-choudhary@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <afd@ti.com>, <praneeth@ti.com>,
        <reatmon@ti.com>
Subject: Re: [meta-ti] [dunfell PATCH v2 4/5] ti-graphics: Add j721s2-hs-evm
 as a compatible machine
Message-ID: <20220608180921.gdqvowmqs6hln7t7@ritzy>
References: <20220607103529.13068-1-j-choudhary@ti.com>
 <20220607103529.13068-5-j-choudhary@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220607103529.13068-5-j-choudhary@ti.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 08 Jun 2022 18:09:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14796

On 16:05-20220607, Jayesh Choudhary via lists.yoctoproject.org wrote:
> Add HS platform to the list of compatible machines.
> 
> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
> ---
>  .../powervr-drivers/ti-img-rogue-driver_1.15.6133109.bb       | 4 +++-
>  recipes-graphics/libgles/ti-img-rogue-umlibs_1.15.6133109.bb  | 3 ++-
>  2 files changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.15.6133109.bb b/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.15.6133109.bb
> index 718c7845..3a20d809 100644
> --- a/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.15.6133109.bb
> +++ b/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.15.6133109.bb
> @@ -11,7 +11,7 @@ MACHINE_KERNEL_PR_append = "b"
>  PR = "${MACHINE_KERNEL_PR}"
>  
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
> -COMPATIBLE_MACHINE = "j7-evm|j7-hs-evm|j721s2-evm|am62xx"
> +COMPATIBLE_MACHINE = "j7-evm|j7-hs-evm|j721s2-evm|j721s2-hs-evm|am62xx"
>  
>  DEPENDS = "virtual/kernel"
>  
> @@ -31,10 +31,12 @@ SRCREV = "6d3d62a15ceb85b719c35f34c6c9e35f556b406b"
>  TARGET_PRODUCT_j7-evm = "j721e_linux"
>  TARGET_PRODUCT_j7-hs-evm = "j721e_linux"
>  TARGET_PRODUCT_j721s2-evm = "j721s2_linux"
> +TARGET_PRODUCT_j721s2-hs-evm = "j721s2_linux"

^^ DDK km build does'nt again change based on board.. so why are we
doint this based on board?

>  TARGET_PRODUCT_am62xx = "am62_linux"
>  TARGET_BVNC_j7-evm = "22.104.208.318"
>  TARGET_BVNC_j7-hs-evm = "22.104.208.318"
>  TARGET_BVNC_j721s2-evm = "36.53.104.796"
> +TARGET_BVNC_j721s2-hs-evm = "36.53.104.796"

BVNC does'nt change based on evm - so why are we do it based on board?

>  TARGET_BVNC_am62xx = "33.15.11.3"
>  PVR_BUILD = "release"
>  PVR_WS = "wayland"
> diff --git a/recipes-graphics/libgles/ti-img-rogue-umlibs_1.15.6133109.bb b/recipes-graphics/libgles/ti-img-rogue-umlibs_1.15.6133109.bb
> index 1bfb2b93..7921d17b 100644
> --- a/recipes-graphics/libgles/ti-img-rogue-umlibs_1.15.6133109.bb
> +++ b/recipes-graphics/libgles/ti-img-rogue-umlibs_1.15.6133109.bb
> @@ -8,7 +8,7 @@ inherit features_check
>  REQUIRED_MACHINE_FEATURES = "gpu"
>  
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
> -COMPATIBLE_MACHINE = "j7-evm|j7-hs-evm|j721s2-evm|am62xx"
> +COMPATIBLE_MACHINE = "j7-evm|j7-hs-evm|j721s2-evm|j721s2-hs-evm|am62xx"
>  
>  PR = "r2"
>  
> @@ -20,6 +20,7 @@ SRCREV = "fba0c770b712640ab3761dbe8369d43f89f616ed"
>  TARGET_PRODUCT_j7-evm = "j721e_linux"
>  TARGET_PRODUCT_j7-hs-evm = "j721e_linux"
>  TARGET_PRODUCT_j721s2-evm = "j721s2_linux"
> +TARGET_PRODUCT_j721s2-hs-evm = "j721s2_linux"

^^ Same question here as well.. am62xx seems to have done it right.

>  TARGET_PRODUCT_am62xx = "am62_linux"
>  PVR_BUILD ?= "release"
>  PVR_WS = "wayland"
> -- 
> 2.17.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#14790): https://lists.yoctoproject.org/g/meta-ti/message/14790
> Mute This Topic: https://lists.yoctoproject.org/mt/91597544/5513541
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [nm@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

