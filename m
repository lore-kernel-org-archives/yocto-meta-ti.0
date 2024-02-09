Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5043C48297
	for <webhook@archiver.kernel.org>; Fri,  9 Feb 2024 03:13:23 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.3184.1707448397458956656
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 08 Feb 2024 19:13:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=HXzOJW56;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4193DFGt022432;
	Thu, 8 Feb 2024 21:13:15 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1707448396;
	bh=y45TxAVIXrBqSlgVTwWeICgG+lQJWBOQMfdWQJoqUxU=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=HXzOJW56eZCPs16KBmnVI/m7/l0MKeZtfHa+IpFOHn5QPRTE6JIdCTedCUM6HPIsC
	 Tr850D0SGPU6tZBbd+HougqnH98EANR6Xn5CIKsvlYUcn+49DRzBg4R5zGzlxsRZgh
	 qY5udtkVVoa0lUfXEwle5irutiRj35sAsnv0nZ5A=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4193DF6J025869
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 8 Feb 2024 21:13:15 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 8
 Feb 2024 21:13:15 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 8 Feb 2024 21:13:15 -0600
Received: from [10.249.39.53] ([10.249.39.53])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4193DFDq120623;
	Thu, 8 Feb 2024 21:13:15 -0600
Message-ID: <b2a9c2ca-5103-462e-b5b6-0130d170e5f9@ti.com>
Date: Thu, 8 Feb 2024 21:13:15 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master][PATCH 1/2] ti-img-rogue-*: switch branches to
 new lts
Content-Language: en-US
To: <rs@ti.com>, <detheridge@ti.com>, <denys@konsulko.com>
CC: <meta-ti@lists.yoctoproject.org>
References: <20240208233722.2565237-1-rs@ti.com>
 <20240208233722.2565237-2-rs@ti.com>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20240208233722.2565237-2-rs@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 09 Feb 2024 03:13:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17462



On 2/8/2024 5:37 PM, rs@ti.com wrote:
> From: Randolph Sapp <rs@ti.com>
> 
> Switch the branches to the new LTS names. These are still experimental,
> hence the isolation from kirkstone. The upstream branch is now carrying
> the equivalent to the kbuild patch so we're dropping it here.
> 
> Signed-off-by: Randolph Sapp <rs@ti.com>
> ---
>   .../powervr-drivers/ti-img-rogue-driver_23.3.6512818.bb     | 6 ++----
>   .../powervr-umlibs/ti-img-rogue-umlibs_23.3.6512818.bb      | 2 +-
>   2 files changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.3.6512818.bb b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.3.6512818.bb
> index 0e894534..02ec9fe9 100644
> --- a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.3.6512818.bb
> +++ b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.3.6512818.bb
> @@ -16,15 +16,13 @@ COMPATIBLE_MACHINE = "j721e|j721s2|j784s4|am62xx|am62pxx|j722s"
>   
>   DEPENDS = "virtual/kernel"
>   
> -BRANCH = "linuxws/kirkstone/k6.1/${PV}"
> +BRANCH = "linuxws/scarthgap/k6.6/${PV}"
>   
>   SRC_URI = "git://git.ti.com/git/graphics/ti-img-rogue-driver.git;protocol=https;branch=${BRANCH}"
>   
> -SRC_URI:append = " file://0001-build-kbuild-Makefile.template-use-SECONDARY.patch"
> -

NAK.  Your previous patch for bumping the version to 23.3.6512818 did 
not build on master because of this patch.  So I went ahead and removed 
it and "fixed up" your patch with the removal.  I like to have as atomic 
commits as possible.

I should have said something at that time, but I know you are busy.

Please rebase on master-wip and resubmit this patch.


>   S = "${WORKDIR}/git"
>   
> -SRCREV = "41a494accb30aa2f247e6a4e123a4954982f2a88"
> +SRCREV = "2f409b4dd2540e896b54bff02219d4fc51129b81"
>   
>   TARGET_PRODUCT:j721e = "j721e_linux"
>   TARGET_PRODUCT:j721s2 = "j721s2_linux"
> diff --git a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.3.6512818.bb b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.3.6512818.bb
> index 288eb52b..a0a9a295 100644
> --- a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.3.6512818.bb
> +++ b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.3.6512818.bb
> @@ -12,7 +12,7 @@ COMPATIBLE_MACHINE = "j721e|j721s2|j784s4|am62xx|am62pxx|j722s"
>   
>   PR = "r3"
>   
> -BRANCH = "linuxws/kirkstone/k6.1/${PV}"
> +BRANCH = "linuxws/scarthgap/k6.6/${PV}"
>   SRC_URI = "git://git.ti.com/git/graphics/ti-img-rogue-umlibs.git;protocol=https;branch=${BRANCH}"
>   SRCREV = "0b9e64254269be2fa95c4f3e1dd925d6e4d58199"
>   S = "${WORKDIR}/git/targetfs/${TARGET_PRODUCT}/${PVR_WS}/${PVR_BUILD}"

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

