Return-Path: <a-limaye@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74B25CDB47E
	for <webhook@archiver.kernel.org>; Fri, 13 Oct 2023 13:00:50 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.37696.1697202043466426608
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 13 Oct 2023 06:00:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=E+T4tPsr;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: a-limaye@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 39DD0gIW055904
	for <meta-ti@lists.yoctoproject.org>; Fri, 13 Oct 2023 08:00:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1697202042;
	bh=97HeDq3kqEC2cWp96RjJWvXwNchK9W9wpQSnHaPGRgk=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=E+T4tPsr3OHJdwdkDcLnVCeFeD1xVXOmmUlejwK4NffnMA+/kFkiH4dk/84rEosTi
	 QnwrO8iQVO+YVjyzzu/OM05fTmd9aqEL+2kT4hh6fjAXFc5tj8Tksn4Q7T/Lc7T9Mg
	 wHk6sA4oc+QPRRwVhCLUrgJO9dJse93PvKPQn/Yc=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 39DD0gAr054610
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Fri, 13 Oct 2023 08:00:42 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 13
 Oct 2023 08:00:42 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 13 Oct 2023 08:00:42 -0500
Received: from [10.24.68.161] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 39DD0egq023998;
	Fri, 13 Oct 2023 08:00:40 -0500
Message-ID: <c3a5a381-a816-4ef0-8489-a69415ea5b6b@ti.com>
Date: Fri, 13 Oct 2023 18:30:39 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXTERNAL] [meta-ti][master/kirkstone][PATCH v2] ti-eth-fw:
 Reduce priority for softlinks to 5.
To: <meta-ti@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <u-kumar1@ti.com>, <minas@ti.com>, <s-vadapalli@ti.com>
References: <178DAA9B9FC5DFE7.8679@lists.yoctoproject.org>
Content-Language: en-US
From: Aniket Limaye <a-limaye@ti.com>
In-Reply-To: <178DAA9B9FC5DFE7.8679@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 13 Oct 2023 13:00:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17102

Please ignore this patch... Sending as a v2 series instead to replace 
the original 2 patches for ti-eth-fw

On 13/10/23 18:00, Aniket Limaye via lists.yoctoproject.org wrote:
> Makes ti-ipc firmware as default for main-r5f0_0 firmware softlink
> The ti-eth-fw binaries are tested at the SDK level and should be added
> there instead
>
> Signed-off-by: Aniket Limaye <a-limaye@ti.com>
> ---
> v1: https://lists.yoctoproject.org/g/meta-ti/message/17094
> Changes in v2:
>      Instead of removing ti-eth-fw entirely, only reduce
>      priority of softlinks
> ---
>   meta-ti-bsp/recipes-bsp/ti-eth-fw/ti-eth-fw.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-ti-bsp/recipes-bsp/ti-eth-fw/ti-eth-fw.bb b/meta-ti-bsp/recipes-bsp/ti-eth-fw/ti-eth-fw.bb
> index 970bfa0a..e1d442d3 100644
> --- a/meta-ti-bsp/recipes-bsp/ti-eth-fw/ti-eth-fw.bb
> +++ b/meta-ti-bsp/recipes-bsp/ti-eth-fw/ti-eth-fw.bb
> @@ -100,7 +100,7 @@ ALTERNATIVE_TARGET[j7200-main-r5f0_0-fw-sec] = "${INSTALL_ETH_FW_DIR}/${ETH_FW}.
>   ALTERNATIVE_TARGET[j784s4-main-r5f0_0-fw]     = "${INSTALL_ETH_FW_DIR}/${ETH_FW}"
>   ALTERNATIVE_TARGET[j784s4-main-r5f0_0-fw-sec] = "${INSTALL_ETH_FW_DIR}/${ETH_FW}.signed"
>   
> -ALTERNATIVE_PRIORITY = "20"
> +ALTERNATIVE_PRIORITY = "5"
>   
>   # make sure that lib/firmware, and all its contents are part of the package
>   FILES:${PN} += "${nonarch_base_libdir}/firmware"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#17101): https://lists.yoctoproject.org/g/meta-ti/message/17101
> Mute This Topic: https://lists.yoctoproject.org/mt/101938780/6607860
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [a-limaye@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

