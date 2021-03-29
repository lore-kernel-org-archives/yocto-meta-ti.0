Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.17323.1616992907206698170
 for <meta-ti@lists.yoctoproject.org>;
 Sun, 28 Mar 2021 21:41:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=eBbk94dw;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: praneeth@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 12T4fkrm004741
	for <meta-ti@lists.yoctoproject.org>; Sun, 28 Mar 2021 23:41:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1616992906;
	bh=gjNgrofxrm3gn69yoLm7JE3PnZDmdHm9jXMZD3VkXpI=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=eBbk94dweVy6pBvpfhSnfASLFDdf+42GV2g16ZWFx9nSf7NdVuaFbDjaPVN3yCFJn
	 vBYiDdG7zTGX0J3aP9HbMleuaXzmPOvoEwnYxjGdIXCDU7aBBeFVV1ll3ulMiuSdyq
	 SH8XqiIuVuGqqelQ6ccHnz3eSae0umWrvFC78Ecs=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 12T4fkuI086918
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Sun, 28 Mar 2021 23:41:46 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Sun, 28
 Mar 2021 23:41:46 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Sun, 28 Mar 2021 23:41:46 -0500
Received: from [10.250.50.222] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 12T4fjUe082324;
	Sun, 28 Mar 2021 23:41:45 -0500
Subject: Re: [dunfell/master PATCH] ti-rtos: update metadata and version of am64x rtos firmware
To: Shiju Sivasankaran <shiju@ti.com>, <meta-ti@lists.yoctoproject.org>
References: <20210329041149.26461-1-shiju@ti.com>
From: "praneeth" <praneeth@ti.com>
Message-ID: <866225bd-6cc4-fb6f-82a5-f5fc1ad2bb5e@ti.com>
Date: Sun, 28 Mar 2021 23:41:45 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210329041149.26461-1-shiju@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 3/28/2021 11:11 PM, Shiju Sivasankaran wrote:
> updated rtos firmware
> am64xx: 07.03.00.13
> 
> rtos fw of am64x build and upload from mcu-plus-sdk repo.
> rtos fw of am65x, j7 and j7200 build and upload from pdk repo.

This patch is not doing anything on non AM64x device.

so this message about am65,j7* is redundant on what this patch is 
actually trying to address.


> 
> Signed-off-by: Shiju Sivasankaran <shiju@ti.com>
> ---
> 
> v3 - The way this system was designed is to be used with nightly builds
> where commit is AUTOREV-ed (from next branch) and should work the same with
> master branch as well, hence TI_RTOS_METADATA_SRCREV_am64xx is removed
> from previous patch
> 
>   recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb | 6 +++---
>   recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb | 2 +-
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
> index e85948b2..fe020aa3 100644
> --- a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
> +++ b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
> @@ -23,8 +23,8 @@ DEFAULT_RTOS_FAMILY = "jacinto"
>   DEFAULT_RTOS_VERSION = "07_03_00_21"
>   DEFAULT_RTOS_VERSION_DOT = "07.03.00.21"
>   
> -DEFAULT_RTOS_VERSION_am64xx = "07_03_00_03"
> -DEFAULT_RTOS_VERSION_DOT_am64xx = "07.03.00.03"
> +DEFAULT_RTOS_VERSION_am64xx = "07_03_00_13"
> +DEFAULT_RTOS_VERSION_DOT_am64xx = "07.03.00.13"
>   
>   DEFAULT_RTOS_VERSION_am65xx = "07_03_00_22"
>   DEFAULT_RTOS_VERSION_DOT_am65xx = "07.03.00.22"
> @@ -51,7 +51,7 @@ DEFAULT_FIRMWARE_SHA256SUM = "unknown"
>   DEFAULT_FIRMWARE_SHA256SUM_j7 = "fc7805ed3d6c1801efb2b85ac9af99a8657aa3a7a9327bc16a1163d566f11c2c"
>   DEFAULT_FIRMWARE_SHA256SUM_j7200-evm = "71f282ba6768ad3b603a17d30851cc621986c88311c174960a50196bfc79f85c"
>   DEFAULT_FIRMWARE_SHA256SUM_am65xx = "61e0be08bea8ab1055645bd96504a6a29c70318c5b277237dee9981cd94d7f79"
> -DEFAULT_FIRMWARE_SHA256SUM_am64xx = "bc2d3d603ad30006ea3fefa3e777c26c19b95ee6d6f5a630259009f2f5a4996b"
> +DEFAULT_FIRMWARE_SHA256SUM_am64xx = "0c43cea6ccaf45b3d7c48996f1c561e814a6e409a330da5d45877c82ce7a299a"
>   
>   # Use weak assignment for CORESDK_RTOS_* variables to use defaults if not yet set
>   CORESDK_RTOS_FAMILY ?= "${DEFAULT_RTOS_FAMILY}"
> diff --git a/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb b/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb
> index 83e0e901..d7f22a1a 100644
> --- a/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb
> +++ b/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb
> @@ -18,7 +18,7 @@ PLAT_SFX_am64xx = "/am64x"
>   # Use weak assignment to set defaults to TI_RTOS_METADATA_* variables
>   TI_RTOS_METADATA_URI ?= "git://git.ti.com/processor-sdk/coresdk_rtos_releases.git"
>   TI_RTOS_METADATA_PROTOCOL ?= "git"
> -TI_RTOS_METADATA_SRCREV ?= "3cda650c9e22eb4fd4eb5797ad998991a6124243"
> +TI_RTOS_METADATA_SRCREV ?= "051de801b539f4acc6e7630684f9993e34332dde"
>   TI_RTOS_METADATA_BRANCH ?= "master"
>   TI_RTOS_METADATA_DIR ?= "${PLAT_SFX}"
>   TI_RTOS_METADATA_FILE ?= "${S}${TI_RTOS_METADATA_DIR}/metadata.inc"
> 
