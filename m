Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B54FC4707A
	for <webhook@archiver.kernel.org>; Thu, 14 Apr 2022 16:03:53 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.2354.1649875619533005877
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 13 Apr 2022 11:47:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=kJ5MzSX3;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 23DIkwDP084624
	for <meta-ti@lists.yoctoproject.org>; Wed, 13 Apr 2022 13:46:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1649875618;
	bh=CAc16JF5xoHBZDWpzP52GLUK8TWuN62pFcrJOS//MDQ=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=kJ5MzSX3zQ80FN6UGFmWtRAOwc1TeqL1meIfNqTHyLjr5xTfxMUSoWUX/+PS14c5E
	 BImQTwyEEeDyO1j2eQj9p/ernubBAWwfgI+lBWOUcTQnQLR8S4T/5r3PSqoiXzxJDr
	 +RQs3qyKPYJ6Hi98lgOv6JHaqNol99xeRRzmH0NU=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 23DIkwAK061884
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Wed, 13 Apr 2022 13:46:58 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 13
 Apr 2022 13:46:58 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 13 Apr 2022 13:46:58 -0500
Received: from [128.247.81.69] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 23DIkw6K051892;
	Wed, 13 Apr 2022 13:46:58 -0500
Message-ID: <582e51c4-9c98-6aed-8a79-6f9ee96b1045@ti.com>
Date: Wed, 13 Apr 2022 13:46:58 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [meta-ti][master/dunfell PATCH v1 2/2] pru-icss_git.bb: add AM62x
To: Nick Saulnier <nsaulnier@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: <kishon@ti.com>, <s-anna@ti.com>
References: <20220412013559.4140-1-nsaulnier@ti.com>
 <20220412013559.4140-2-nsaulnier@ti.com>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20220412013559.4140-2-nsaulnier@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 14 Apr 2022 16:03:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14600

Applied patch to dunfell-next.

On 4/11/2022 8:35 PM, Nick Saulnier wrote:
> This commit adds the PRU Software Support Package (PSSP) to the AM62x Linux
> Processor SDK under example-applications/pru-icss-x.x.x. It also adds prebuilt
> PRU firmware to the default AM62x filesystem image under the /lib/firmware
> folder.
> 
> Signed-off-by: Nick Saulnier <nsaulnier@ti.com>
> ---
>   recipes-bsp/pru/pru-icss_git.bb | 21 +++++++++++++++++++++
>   1 file changed, 21 insertions(+)
> 
> diff --git a/recipes-bsp/pru/pru-icss_git.bb b/recipes-bsp/pru/pru-icss_git.bb
> index ac75103d31d6..1ceba0573af0 100644
> --- a/recipes-bsp/pru/pru-icss_git.bb
> +++ b/recipes-bsp/pru/pru-icss_git.bb
> @@ -41,6 +41,7 @@ PLATFORM_ti33x = "am335x"
>   PLATFORM_ti43x = "am437x"
>   PLATFORM_omap-a15 = "am572x"
>   PLATFORM_k2g = "k2g"
> +PLATFORM_am62xx = "am62x"
>   PLATFORM_am64xx = "am64x"
>   PLATFORM_am65xx = "am65x"
>   PLATFORM_j7 = "j721e"
> @@ -113,6 +114,16 @@ do_install_append_k2g() {
>       done
>   }
>   
> +do_install_append_am62xx() {
> +    install -m 644 ${S}/examples/${PLATFORM}/PRU_Halt/gen/PRU_Halt.out \
> +                   ${D}${base_libdir}/firmware/pru
> +    for i in 0 1
> +    do
> +        install -m 0644 ${S}/examples/${PLATFORM}/PRU_RPMsg_Echo_Interrupt${i}/gen/PRU_RPMsg_Echo_Interrupt${i}.out \
> +                        ${D}${base_libdir}/firmware/pru
> +    done
> +}
> +
>   do_install_append_am64xx(){
>       for i in 0 1
>       do
> @@ -190,6 +201,7 @@ PRU_ICSS_ALTERNATIVES_ti33x    = "am335x-pru0-fw am335x-pru1-fw"
>   PRU_ICSS_ALTERNATIVES_ti43x    = "am437x-pru0_0-fw am437x-pru0_1-fw am437x-pru1_0-fw am437x-pru1_1-fw"
>   PRU_ICSS_ALTERNATIVES_omap-a15 = "am57xx-pru1_0-fw am57xx-pru1_1-fw am57xx-pru2_0-fw am57xx-pru2_1-fw"
>   PRU_ICSS_ALTERNATIVES_k2g      = "k2g-pru0_0-fw k2g-pru0_1-fw k2g-pru1_0-fw k2g-pru1_1-fw"
> +PRU_ICSS_ALTERNATIVES_am62xx   = "am62x-pru0-fw am62x-pru1-fw"
>   PRU_ICSS_ALTERNATIVES_am64xx   = "am64x-pru0_0-fw am64x-pru0_1-fw am64x-pru1_0-fw am64x-pru1_1-fw am64x-rtu0_0-fw am64x-rtu0_1-fw am64x-rtu1_0-fw am64x-rtu1_1-fw"
>   PRU_ICSS_ALTERNATIVES_am65xx   = "am65x-pru0_0-fw am65x-pru0_1-fw am65x-pru1_0-fw am65x-pru1_1-fw am65x-pru2_0-fw am65x-pru2_1-fw am65x-rtu0_0-fw am65x-rtu0_1-fw am65x-rtu1_0-fw am65x-rtu1_1-fw am65x-rtu2_0-fw am65x-rtu2_1-fw"
>   PRU_ICSS_ALTERNATIVES_j7       = "j7-pru0_0-fw j7-pru0_1-fw j7-pru1_0-fw j7-pru1_1-fw j7-rtu0_0-fw j7-rtu0_1-fw j7-rtu1_0-fw j7-rtu1_1-fw"
> @@ -213,6 +225,9 @@ ALTERNATIVE_LINK_NAME[k2g-pru0_1-fw] = "${base_libdir}/firmware/k2g-pru0_1-fw"
>   ALTERNATIVE_LINK_NAME[k2g-pru1_0-fw] = "${base_libdir}/firmware/k2g-pru1_0-fw"
>   ALTERNATIVE_LINK_NAME[k2g-pru1_1-fw] = "${base_libdir}/firmware/k2g-pru1_1-fw"
>   
> +ALTERNATIVE_LINK_NAME[am62x-pru0-fw] = "${base_libdir}/firmware/am62x-pru0-fw"
> +ALTERNATIVE_LINK_NAME[am62x-pru1-fw] = "${base_libdir}/firmware/am62x-pru1-fw"
> +
>   ALTERNATIVE_LINK_NAME[am64x-pru0_0-fw] = "${base_libdir}/firmware/am64x-pru0_0-fw"
>   ALTERNATIVE_LINK_NAME[am64x-pru0_1-fw] = "${base_libdir}/firmware/am64x-pru0_1-fw"
>   ALTERNATIVE_LINK_NAME[am64x-pru1_0-fw] = "${base_libdir}/firmware/am64x-pru1_0-fw"
> @@ -284,6 +299,9 @@ ALTERNATIVE_TARGET_pru-icss-halt[k2g-pru0_1-fw] = "${base_libdir}/firmware/pru/P
>   ALTERNATIVE_TARGET_pru-icss-halt[k2g-pru1_0-fw] = "${base_libdir}/firmware/pru/PRU_Halt.out"
>   ALTERNATIVE_TARGET_pru-icss-halt[k2g-pru1_1-fw] = "${base_libdir}/firmware/pru/PRU_Halt.out"
>   
> +ALTERNATIVE_TARGET_pru-icss-halt[am62x-pru0-fw] = "${base_libdir}/firmware/pru/PRU_Halt.out"
> +ALTERNATIVE_TARGET_pru-icss-halt[am62x-pru1-fw] = "${base_libdir}/firmware/pru/PRU_Halt.out"
> +
>   ALTERNATIVE_TARGET_pru-icss-halt[am64x-pru0_0-fw] = "${base_libdir}/firmware/pru/PRU_Halt_0.out"
>   ALTERNATIVE_TARGET_pru-icss-halt[am64x-pru0_1-fw] = "${base_libdir}/firmware/pru/PRU_Halt_1.out"
>   ALTERNATIVE_TARGET_pru-icss-halt[am64x-pru1_0-fw] = "${base_libdir}/firmware/pru/PRU_Halt_0.out"
> @@ -353,6 +371,9 @@ ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[k2g-pru0_1-fw] = "${base_libdir}/firmware
>   ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[k2g-pru1_0-fw] = "${base_libdir}/firmware/pru/PRU_RPMsg_Echo_Interrupt1_0.out"
>   ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[k2g-pru1_1-fw] = "${base_libdir}/firmware/pru/PRU_RPMsg_Echo_Interrupt1_1.out"
>   
> +ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am62x-pru0-fw] = "${base_libdir}/firmware/pru/PRU_RPMsg_Echo_Interrupt0.out"
> +ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am62x-pru1-fw] = "${base_libdir}/firmware/pru/PRU_RPMsg_Echo_Interrupt1.out"
> +
>   ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am64x-pru0_0-fw] = "${base_libdir}/firmware/pru/PRU_RPMsg_Echo_Interrupt0_0.out"
>   ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am64x-pru0_1-fw] = "${base_libdir}/firmware/pru/PRU_RPMsg_Echo_Interrupt0_1.out"
>   ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am64x-pru1_0-fw] = "${base_libdir}/firmware/pru/PRU_RPMsg_Echo_Interrupt1_0.out"

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

