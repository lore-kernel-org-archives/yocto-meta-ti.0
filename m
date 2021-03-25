Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.4075.1616708063280076765
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 25 Mar 2021 14:34:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=NlWNMBc3;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: praneeth@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 12PLYMDG001219
	for <meta-ti@lists.yoctoproject.org>; Thu, 25 Mar 2021 16:34:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1616708062;
	bh=7JGAU8N1s+EPWDWF9caPiZ23bnrG0s/rmqPTDGhFBsA=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=NlWNMBc3QOTQPC0ppeNRer7VIVIoHel9TWaJO6RHnkfPrc76mjTOK/S1DqD0e7Qi0
	 N35TrNwQpSTYn4yef/DIpTtRkFkK5cx3ITI4OhgietF4Fib56ydgP69Mbu5ypOiZeD
	 QNFY1JeKjXWOZiPkLyqPdBbgWgU7oJvzW5Fh2AzM=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 12PLYM4D056142
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Thu, 25 Mar 2021 16:34:22 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Thu, 25
 Mar 2021 16:34:21 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Thu, 25 Mar 2021 16:34:21 -0500
Received: from [10.250.50.222] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 12PLYLYs019013;
	Thu, 25 Mar 2021 16:34:21 -0500
Subject: Re: [dunfell/master PATCH] ti-rtos: update metadata and version of am64x rtos firmware
To: Shiju Sivasankaran <shiju@ti.com>, <meta-ti@lists.yoctoproject.org>
References: <20210325063010.8808-1-shiju@ti.com>
From: "praneeth" <praneeth@ti.com>
Message-ID: <1a2f7012-0c7b-33fe-5fe4-a0621ebcf1fb@ti.com>
Date: Thu, 25 Mar 2021 16:34:21 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210325063010.8808-1-shiju@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 3/25/2021 1:30 AM, Shiju Sivasankaran wrote:
> updated rtos firmware
> am64xx: 07.03.00.13
> 
> rtos fw of am64x build and upload from mcu-plus-sdk repo.
> rtos fw of am65x, j7 and j7200 build and upload from pdk repo.

But all of the fws are coming from the same repo 
processor-sdk/coresdk_rtos_releases where metadata.inc is updated on 
master with  right tag and public urls inside the metadata_*.inc isnt it ?

> a separate TI_RTOS_METADATA_SRCREV_am64xx for pining am64x fw
> from macu-plus-sdk

typo s/macu?

  avoids syncing of builds from two different repos.

TI_RTOS_METADATA_SRCREV is pointing to master branch commitsha
where the given tag is present. I dont see why we have to seperate this 
macro for each device seperately.


Add your signoff by.

> ---
>   recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb | 6 +++---
>   recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb | 1 +
>   2 files changed, 4 insertions(+), 3 deletions(-)
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
> index 83e0e901..f052c627 100644
> --- a/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb
> +++ b/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb
> @@ -19,6 +19,7 @@ PLAT_SFX_am64xx = "/am64x"
>   TI_RTOS_METADATA_URI ?= "git://git.ti.com/processor-sdk/coresdk_rtos_releases.git"
>   TI_RTOS_METADATA_PROTOCOL ?= "git"
>   TI_RTOS_METADATA_SRCREV ?= "3cda650c9e22eb4fd4eb5797ad998991a6124243"
> +TI_RTOS_METADATA_SRCREV_am64xx ?= "051de801b539f4acc6e7630684f9993e34332dde"

Why this?
Why TI_RTOS_METADATA_SRCREV ?= "051de801b539f4acc6e7630684f9993e34332dde"
willnot work for all devices?


>   TI_RTOS_METADATA_BRANCH ?= "master"
>   TI_RTOS_METADATA_DIR ?= "${PLAT_SFX}"
>   TI_RTOS_METADATA_FILE ?= "${S}${TI_RTOS_METADATA_DIR}/metadata.inc"
> 
