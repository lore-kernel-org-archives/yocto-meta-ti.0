Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A63FC433FE
	for <webhook@archiver.kernel.org>; Tue,  3 May 2022 15:31:45 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web12.577.1651591899387963968
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 03 May 2022 08:31:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=BgvOKZQQ;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 243FVYFe037314;
	Tue, 3 May 2022 10:31:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1651591894;
	bh=wiWlyDVWMGvq2GhSar7r6ZFGKIzF07kurvQjGyXmmLA=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=BgvOKZQQKy8lL1f9elooD17kKtDwxYqH1AsfTgmKuior9Xc/vLmRxFI4tCT8yuD5K
	 y6ZYUu4LfsDswXSMUqABeFaZ6/apClyKZbxFm36vBIdQmOZch5zDQmp8IEMotpm9vA
	 blI5iltggUUMTCALZaE1ro6eKJYZtz8iOHZk3Do0=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 243FVYfR034967
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 3 May 2022 10:31:34 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 3
 May 2022 10:31:34 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 3 May 2022 10:31:34 -0500
Received: from [10.249.39.108] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 243FVYSA016013;
	Tue, 3 May 2022 10:31:34 -0500
Message-ID: <c3609b45-fee6-d86d-9903-6deda8850dd0@ti.com>
Date: Tue, 3 May 2022 10:31:33 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [dunfell-next RFC PATCH] trusted-firmware-a: upgrade to v2.6+
Content-Language: en-US
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko <denis@denix.org>
CC: Nishanth Menon <nm@ti.com>, Denys Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20220503152428.25598-1-praneeth@ti.com>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20220503152428.25598-1-praneeth@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 03 May 2022 15:31:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14681



On 5/3/2022 10:24, Praneeth Bajjuri wrote:
> upgrade arm-trusted-firmare to master which is currently v2.6+
> 
> This upgrade picks up am62x low power mode feature.
> 
> Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
> ---
> 
> AM62 low power mode support:
> https://review.trustedfirmware.org/q/topic:%22ti-k3-system-suspend-base-support%22
> 
>   .../trusted-firmware-a/trusted-firmware-a_%.bbappend        | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend b/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
> index b84da1f3..4476d23e 100644
> --- a/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
> +++ b/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
> @@ -1,8 +1,8 @@
> -PV_k3 = "2.5"
> +PV_k3 = "2.6"
>   LIC_FILES_CHKSUM_k3 = "file://license.rst;md5=1dd070c98a281d18d9eefd938729b031"
> -BRANCH_k3 = "ti-atf"
> +BRANCH_k3 = "ti-atf-next"

Changing to the next branch seems like the only issue.  I know this is 
an RFC, but if you want it to become a real patch then that needs to be 
addressed.


>   SRC_URI_k3 = "git://git.ti.com/atf/arm-trusted-firmware.git;branch=${BRANCH};name=tfa"
> -SRCREV_tfa_k3 = "0693f356eb2a25adf8758d98058120bed082cc73"
> +SRCREV_tfa_k3 = "6541aa24f834daa80da701e0054dfe3a16cda0ce"
>   COMPATIBLE_MACHINE_k3 = "k3"
>   TFA_BUILD_TARGET_k3 = "all"
>   TFA_INSTALL_TARGET_k3 = "bl31"

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

