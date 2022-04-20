Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90341C352B6
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 16:46:06 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web09.3688.1650424459689800084
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 19 Apr 2022 20:14:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=jgF7vL0h;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: afd@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 23K3EH9W093422;
	Tue, 19 Apr 2022 22:14:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1650424457;
	bh=maXVvKJ2apETCcL6qJ/krKpc9x0c8djZfHUt32L9SXY=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=jgF7vL0hn02/Mv60qY9rHiZrNUsnOFPDWZRTRyqKVYVVZWCmQttGGXHOQtQtZOFZp
	 rK6P0EO2MzMtGYStTsW7pqnSnIO+zrLuCmYUGnLfY9kmn0iXqq2no5+57dwbHDKkNr
	 4ke84SKRn0fRnbSK8iTMxf7KQl8mKBoFAD7eGSOE=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 23K3EHbt003591
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 19 Apr 2022 22:14:17 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 19
 Apr 2022 22:14:17 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 19 Apr 2022 22:14:17 -0500
Received: from [10.250.34.159] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 23K3EHFO030803;
	Tue, 19 Apr 2022 22:14:17 -0500
Message-ID: <e2fea769-44c1-98f2-e7c9-d34a93f59818@ti.com>
Date: Tue, 19 Apr 2022 22:14:16 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [meta-ti][master/dunfell][PATCH] ti-graphics: Add j7-hs-evm as a
 compatible machine.
Content-Language: en-US
To: <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20220418222026.3201-1-reatmon@ti.com>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20220418222026.3201-1-reatmon@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 21 Apr 2022 16:46:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14608

On 4/18/22 5:20 PM, Ryan Eatmon via lists.yoctoproject.org wrote:
> The recent change to explicitly list the compatible machines is missing the j7-hs-evm.
> 
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
>   .../powervr-drivers/ti-img-rogue-driver_1.15.6133109.bb       | 4 +++-
>   recipes-graphics/libgles/ti-img-rogue-umlibs_1.15.6133109.bb  | 3 ++-
>   2 files changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.15.6133109.bb b/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.15.6133109.bb
> index fbff6c51..6d2d68cd 100644
> --- a/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.15.6133109.bb
> +++ b/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.15.6133109.bb
> @@ -11,7 +11,7 @@ MACHINE_KERNEL_PR_append = "a"
>   PR = "${MACHINE_KERNEL_PR}"
>   
>   PACKAGE_ARCH = "${MACHINE_ARCH}"
> -COMPATIBLE_MACHINE = "j7-evm|j721s2-evm|am62xx"
> +COMPATIBLE_MACHINE = "j7-evm|j7-hs-evm|j721s2-evm|am62xx"


Doesn't seem right, we haven't needed to specify the HS version before..

Seems we are mixing SoC and board, the GPU driver depends on the SoC
not the board, we match correctly for am62xx on SoC, but J7 on
specific board name. Suggest

+COMPATIBLE_MACHINE = "j7|j721s2|am62xx"

Andrew


>   
>   DEPENDS = "virtual/kernel"
>   
> @@ -29,9 +29,11 @@ S = "${WORKDIR}/git"
>   SRCREV = "ee0674adccac16f5b2f7cb8d5d05948706080cb5"
>   
>   TARGET_PRODUCT_j7-evm = "j721e_linux"
> +TARGET_PRODUCT_j7-hs-evm = "j721e_linux"
>   TARGET_PRODUCT_j721s2-evm = "j721s2_linux"
>   TARGET_PRODUCT_am62xx = "am62_linux"
>   TARGET_BVNC_j7-evm = "22.104.208.318"
> +TARGET_BVNC_j7-hs-evm = "22.104.208.318"
>   TARGET_BVNC_j721s2-evm = "36.53.104.796"
>   TARGET_BVNC_am62xx = "33.15.11.3"
>   PVR_BUILD = "release"
> diff --git a/recipes-graphics/libgles/ti-img-rogue-umlibs_1.15.6133109.bb b/recipes-graphics/libgles/ti-img-rogue-umlibs_1.15.6133109.bb
> index e00dce99..0f3f9192 100644
> --- a/recipes-graphics/libgles/ti-img-rogue-umlibs_1.15.6133109.bb
> +++ b/recipes-graphics/libgles/ti-img-rogue-umlibs_1.15.6133109.bb
> @@ -8,7 +8,7 @@ inherit features_check
>   REQUIRED_MACHINE_FEATURES = "gpu"
>   
>   PACKAGE_ARCH = "${MACHINE_ARCH}"
> -COMPATIBLE_MACHINE = "j7-evm|j721s2-evm|am62xx"
> +COMPATIBLE_MACHINE = "j7-evm|j7-hs-evm|j721s2-evm|am62xx"
>   
>   PR = "r1"
>   
> @@ -18,6 +18,7 @@ SRC_URI = "git://git.ti.com/graphics/ti-img-rogue-umlibs.git;branch=${BRANCH}"
>   SRCREV = "47c3ffc44f2881397d45c8a2b5dfa7d6c58b79fb"
>   
>   TARGET_PRODUCT_j7-evm = "j721e_linux"
> +TARGET_PRODUCT_j7-hs-evm = "j721e_linux"
>   TARGET_PRODUCT_j721s2-evm = "j721s2_linux"
>   TARGET_PRODUCT_am62xx = "am62_linux"
>   PVR_BUILD ?= "release"
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#14603): https://lists.yoctoproject.org/g/meta-ti/message/14603
> Mute This Topic: https://lists.yoctoproject.org/mt/90550375/3619733
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [afd@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

