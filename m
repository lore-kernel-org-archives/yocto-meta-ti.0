Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BDF6C004C0
	for <webhook@archiver.kernel.org>; Mon, 23 Oct 2023 15:54:02 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.124361.1698076438794023168
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 23 Oct 2023 08:53:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=pEde4fH/;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 39NFrt6Y089447;
	Mon, 23 Oct 2023 10:53:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1698076435;
	bh=YbhF03E3VhITFY6d3UYVU6QyKlEffGjXpx0BoPs/Dg0=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=pEde4fH/xXdcPjltHgpnfWvsTiLIfYzVDLSDKYf/abhIEEcntHs5F9P9znB1L0PCf
	 L0YWUBOPf/jN2gyh5JX9zRp743SEXuSjyCWaDJx/eB/te34fFWShkILn5nbkmX4+mM
	 ICnupve3ljeqo49SDlfTpUEfwXIiBusdkkk9AXf0=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 39NFrtI2018255
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 23 Oct 2023 10:53:55 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 23
 Oct 2023 10:53:55 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 23 Oct 2023 10:53:55 -0500
Received: from [10.249.38.142] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 39NFqnf3022158;
	Mon, 23 Oct 2023 10:53:55 -0500
Message-ID: <57734958-cb3c-4165-93dc-6645df9bfa04@ti.com>
Date: Mon, 23 Oct 2023 10:53:55 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti] [master/kirkstone][PATCH 3/5] linux-bb.org: update
 kernel to 6.1 for Beagle devices
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>, <meta-ti@lists.yoctoproject.org>
CC: Denys Dmytriyenko <denys@konsulko.com>
References: <20231020204458.546852-1-denis@denix.org>
 <20231020204458.546852-3-denis@denix.org>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20231020204458.546852-3-denis@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 23 Oct 2023 15:54:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17169


I just sent a patch for master only against this recipe that removes all 
of the patches.  Not sure if you want a v2 series that includes that 
change, or just have a follow on patch.


On 10/20/2023 3:44 PM, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@konsulko.com>
> 
> Update both 32-bit and 64-bit configs to use the latest 6.1 Linux kernel
> from beagleboard.org repository, which is based on ti-linux-kernel repo
> used in linux-ti-staging, but with extra Beagle-specific features on top.
> 
> Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
> ---
>   .../recipes-kernel/linux/linux-bb.org_git.bb  | 19 +++++++++++--------
>   1 file changed, 11 insertions(+), 8 deletions(-)
> 
> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-bb.org_git.bb b/meta-ti-bsp/recipes-kernel/linux/linux-bb.org_git.bb
> index f4c1775d..4048e106 100644
> --- a/meta-ti-bsp/recipes-kernel/linux/linux-bb.org_git.bb
> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-bb.org_git.bb
> @@ -10,21 +10,24 @@ inherit kernel
>   require recipes-kernel/linux/setup-defconfig.inc
>   require recipes-kernel/linux/ti-kernel.inc
>   
> +# BB.org hasn't switched to "vendored" DTB layout by default yet
> +KERNEL_DTBVENDORED = "0"
> +
>   DEPENDS += "gmp-native libmpc-native"
>   
>   KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT} ${EXTRA_DTC_ARGS}"
>   
>   S = "${WORKDIR}/git"
>   
> -# 5.10.168 version for 32-bit
> -SRCREV:armv7a = "a943fc1987e1b8057b0b5219ecd3c5a85285d62a"
> -PV:armv7a = "5.10.168+git${SRCPV}"
> -BRANCH:armv7a = "v5.10.168-ti-r70"
> +# 6.1.33 version for 32-bit
> +SRCREV:armv7a = "feb1c153a9693d44dec5772d134bd2c7986ff95d"
> +PV:armv7a = "6.1.33+git${SRCPV}"
> +BRANCH:armv7a = "v6.1.33-ti-r7"
>   
> -# 5.10.162 version for 64-bit
> -SRCREV:aarch64 = "a2f5d5746b6c389e58d20fda0a0fa88403da428b"
> -PV:aarch64 = "5.10.162+git${SRCPV}"
> -BRANCH:aarch64 = "v5.10.162-ti-arm64-r99"
> +# 6.1.46 version for 64-bit
> +SRCREV:aarch64 = "0a1e93a38c699fdd3c629d57f5cd015f90ab0d36"
> +PV:aarch64 = "6.1.46+git${SRCPV}"
> +BRANCH:aarch64 = "v6.1.46-ti-arm64-r9"
>   
>   SRC_URI = " \
>       git://github.com/beagleboard/linux.git;protocol=https;branch=${BRANCH} \
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#17158): https://lists.yoctoproject.org/g/meta-ti/message/17158
> Mute This Topic: https://lists.yoctoproject.org/mt/102089682/6551054
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/leave/10828724/6551054/1815494134/xyzzy [reatmon@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

