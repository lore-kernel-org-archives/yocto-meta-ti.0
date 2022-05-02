Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48362C433F5
	for <webhook@archiver.kernel.org>; Mon,  2 May 2022 17:55:07 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.461.1651514105292748182
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 02 May 2022 10:55:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=XkQN5OwS;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 242HsxlG008410;
	Mon, 2 May 2022 12:54:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1651514099;
	bh=AkYUqdnMayxpkbrJlnWsbfcPAAjZgof1VXxOXCjVEDs=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=XkQN5OwSbWesq4OPeZcHSgxH3XqMLQxtPfr/VrBl5RvCB5rdK6P/HnYkP2r3re2X1
	 4YRsIIffaF3GP1L4EgqJNM6UDsh4CfWTkYk95wH8PRLnQhTOTUz1ZSZsy/+qaRHrvE
	 QpiB7PnRDmAk7/ydC4NblfIA2zmXCPw/GZnFYxnI=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 242HsxrC041426
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 2 May 2022 12:54:59 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 2
 May 2022 12:54:58 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 2 May 2022 12:54:58 -0500
Received: from [10.249.39.108] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 242HswEU074657;
	Mon, 2 May 2022 12:54:58 -0500
Message-ID: <40d67be8-fa73-74e0-77bb-a6e65e0e1412@ti.com>
Date: Mon, 2 May 2022 12:54:58 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [meta-ti] [master][PATCH] ti-img-rogue-driver: fix breakage with
 GCC 11
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>, <meta-ti@lists.yoctoproject.org>
CC: Denys Dmytriyenko <denys@konsulko.com>,
        Darren Etheridge
	<detheridge@ti.com>
References: <20220502145553.726889-1-denis@denix.org>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20220502145553.726889-1-denis@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 02 May 2022 17:55:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14671


Patch applied to master.


On 5/2/2022 9:55, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@konsulko.com>
> 
> Explicitly cast the value into correct type to fix this error:
> 
> | .../services/server/devices/rogue/rgxinit.c:1345:36: error: implicit conversion from 'enum <anonymous>' to 'IMG_BOOL' {aka 'enum tag_img_bool'} [-Werror=enum-conversion]
> |  1345 |                         bEnableAPM = false;
> |       |                                    ^
> 
> Cc: Darren Etheridge <detheridge@ti.com>
> Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
> ---
>   ...nit.c-cast-boolean-value-to-IMG_BOOL.patch | 34 +++++++++++++++++++
>   .../ti-img-rogue-driver_1.15.6133109.bb       |  1 +
>   2 files changed, 35 insertions(+)
>   create mode 100644 meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver/0001-rgxinit.c-cast-boolean-value-to-IMG_BOOL.patch
> 
> diff --git a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver/0001-rgxinit.c-cast-boolean-value-to-IMG_BOOL.patch b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver/0001-rgxinit.c-cast-boolean-value-to-IMG_BOOL.patch
> new file mode 100644
> index 00000000..8d909279
> --- /dev/null
> +++ b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver/0001-rgxinit.c-cast-boolean-value-to-IMG_BOOL.patch
> @@ -0,0 +1,34 @@
> +From cc95fb4b1635bd1018d74b668430cda67731148f Mon Sep 17 00:00:00 2001
> +From: Denys Dmytriyenko <denys@konsulko.com>
> +Date: Sat, 30 Apr 2022 18:37:46 +0000
> +Subject: [PATCH] rgxinit.c: cast boolean value to IMG_BOOL
> +
> +Fixes this error with GCC 11:
> +
> +| .../services/server/devices/rogue/rgxinit.c:1345:36: error: implicit conversion from 'enum <anonymous>' to 'IMG_BOOL' {aka 'enum tag_img_bool'} [-Werror=enum-conversion]
> +|  1345 |                         bEnableAPM = false;
> +|       |                                    ^
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
> +---
> + services/server/devices/rogue/rgxinit.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/services/server/devices/rogue/rgxinit.c b/services/server/devices/rogue/rgxinit.c
> +index ca7a1b9..fc94b73 100644
> +--- a/services/server/devices/rogue/rgxinit.c
> ++++ b/services/server/devices/rogue/rgxinit.c
> +@@ -1342,7 +1342,7 @@ PVRSRV_ERROR RGXInitDevPart2(PVRSRV_DEVICE_NODE	*psDeviceNode,
> + 		if (bEnableAPM && (!PVRSRV_VZ_MODE_IS(NATIVE)))
> + 		{
> + 			PVR_DPF((PVR_DBG_WARNING, "%s: Active Power Management disabled in virtualization mode", __func__));
> +-			bEnableAPM = false;
> ++			bEnableAPM = (IMG_BOOL)false;
> + 		}
> +
> + #if defined(RGX_NUM_OS_SUPPORTED) && (RGX_NUM_OS_SUPPORTED > 1) && defined(SUPPORT_AUTOVZ)
> +--
> +2.25.1
> +
> diff --git a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.15.6133109.bb b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.15.6133109.bb
> index 94b05436..2f4a7354 100644
> --- a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.15.6133109.bb
> +++ b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.15.6133109.bb
> @@ -22,6 +22,7 @@ BRANCH = "linuxws/dunfell/k5.10/${PV}"
>   SRC_URI = " \
>       git://git.ti.com/graphics/ti-img-rogue-driver.git;branch=${BRANCH} \
>       file://0001-compiler-support-OpenEmbedded-nodistro-internal-aarc.patch \
> +    file://0001-rgxinit.c-cast-boolean-value-to-IMG_BOOL.patch \
>   "
>   
>   S = "${WORKDIR}/git"
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#14669): https://lists.yoctoproject.org/g/meta-ti/message/14669
> Mute This Topic: https://lists.yoctoproject.org/mt/90837024/6551054
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [reatmon@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

