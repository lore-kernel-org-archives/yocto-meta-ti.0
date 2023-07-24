Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80FB3C001B0
	for <webhook@archiver.kernel.org>; Mon, 24 Jul 2023 16:15:32 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.52011.1690215324786911029
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 24 Jul 2023 09:15:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=B0/9NZaq;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: afd@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 36OGFNjS115317;
	Mon, 24 Jul 2023 11:15:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1690215323;
	bh=0WpGPO2jTn4Fq7KcIZjMNrC+Almc+0/wGwPu+0MXXUc=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=B0/9NZaq364/H3C0YdSGSVitHSNMdcmS+N1WcLoETHx3PscbABRQ4wOa00oqD6NTS
	 zhDh6ve1ZMWY7LHpGJK4V8ocU2EiMlhhYC8seP0rJKsYmy/g6JSazK6GN1WjteewRJ
	 k9FAA7L2xj2r0tIlvcdo+kI4fsgBy44Zwm/e22dg=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 36OGFNG2104104
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 24 Jul 2023 11:15:23 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 24
 Jul 2023 11:15:23 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 24 Jul 2023 11:15:22 -0500
Received: from [10.250.32.217] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 36OGFMWw085283;
	Mon, 24 Jul 2023 11:15:22 -0500
Message-ID: <560601b6-4e7d-c4ab-f644-0e215764a477@ti.com>
Date: Mon, 24 Jul 2023 11:15:22 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [meta-ti][master/kirkstone][PATCH] ti-rtos-firmware: Add missing
 links and reformat file for consistency
To: <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>, Kamlesh Gurudasani
	<kamlesh@ti.com>
References: <20230724152621.25980-1-reatmon@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20230724152621.25980-1-reatmon@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 24 Jul 2023 16:15:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16859

On 7/24/23 10:26 AM, Ryan Eatmon via lists.yoctoproject.org wrote:
> Add in missing *-sec links pointing to signed files especially for
> j784s4.  Reformat file a little to make the groupings easier to
> manage in the future when looking to see if -sec links are missing.
> 
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
>   .../ti-rtos-bin/ti-rtos-firmware.bb           | 353 ++++++++++--------
>   1 file changed, 194 insertions(+), 159 deletions(-)
> 
> diff --git a/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb b/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
> index 7958c0e6..c560e7b4 100644
> --- a/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
> +++ b/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
> @@ -53,14 +53,14 @@ C7X_3_FW   = "ipc_echo_test_c7x_3_release_strip.xe71"
>   C7X_4_FW   = "ipc_echo_test_c7x_4_release_strip.xe71"
>   
>   IPC_FW_LIST = ""
> -IPC_FW_LIST:j721e =   "              ${MCU_1_1_FW} ${MCU_2_0_FW} ${MCU_2_1_FW} ${MCU_3_0_FW} ${MCU_3_1_FW}                             ${C66_1_FW} ${C66_2_FW} ${C7X_1_FW}"
> -IPC_FW_LIST:j7200 =   "              ${MCU_1_1_FW} ${MCU_2_0_FW} ${MCU_2_1_FW}"
> -IPC_FW_LIST:j721s2 =  "              ${MCU_1_1_FW} ${MCU_2_0_FW} ${MCU_2_1_FW} ${MCU_3_0_FW} ${MCU_3_1_FW}                                                     ${C7X_1_FW} ${C7X_2_FW}"
> -IPC_FW_LIST:j784s4 =  "              ${MCU_1_1_FW} ${MCU_2_0_FW} ${MCU_2_1_FW} ${MCU_3_0_FW} ${MCU_3_1_FW} ${MCU_4_0_FW} ${MCU_4_1_FW}                         ${C7X_1_FW} ${C7X_2_FW} ${C7X_3_FW} ${C7X_4_FW}"
>   IPC_FW_LIST:am65xx =  "${MCU_1_0_FW} ${MCU_1_1_FW}"
>   IPC_FW_LIST:am64xx =  "${MCU_1_0_FW} ${MCU_1_1_FW} ${MCU_2_0_FW} ${MCU_2_1_FW} ${MCU_3_0_FW}"
>   IPC_FW_LIST:am62xx =  "                            ${MCU_2_0_FW}"
>   IPC_FW_LIST:am62axx = "                            ${MCU_2_0_FW}                                                                                               ${C7X_1_FW}"
> +IPC_FW_LIST:j721e =   "              ${MCU_1_1_FW} ${MCU_2_0_FW} ${MCU_2_1_FW} ${MCU_3_0_FW} ${MCU_3_1_FW}                             ${C66_1_FW} ${C66_2_FW} ${C7X_1_FW}"
> +IPC_FW_LIST:j7200 =   "              ${MCU_1_1_FW} ${MCU_2_0_FW} ${MCU_2_1_FW}"
> +IPC_FW_LIST:j721s2 =  "              ${MCU_1_1_FW} ${MCU_2_0_FW} ${MCU_2_1_FW} ${MCU_3_0_FW} ${MCU_3_1_FW}                                                     ${C7X_1_FW} ${C7X_2_FW}"
> +IPC_FW_LIST:j784s4 =  "              ${MCU_1_1_FW} ${MCU_2_0_FW} ${MCU_2_1_FW} ${MCU_3_0_FW} ${MCU_3_1_FW} ${MCU_4_0_FW} ${MCU_4_1_FW}                         ${C7X_1_FW} ${C7X_2_FW} ${C7X_3_FW} ${C7X_4_FW}"
>   
>   # Update the am64xx ipc binaries to be consistent with other platforms
>   do_install:prepend:am64xx() {
> @@ -105,225 +105,260 @@ do_install() {
>   
>   # Set up names for the firmwares
>   ALTERNATIVE:${PN}:am65xx = "\
> -                    am65x-mcu-r5f0_0-fw \
> -                    am65x-mcu-r5f0_1-fw \
> +                    am65x-mcu-r5f0_0-fw   am65x-mcu-r5f0_0-fw-sec \
> +                    am65x-mcu-r5f0_1-fw   am65x-mcu-r5f0_1-fw-sec \

Good idea, this is easier to see at a glance :)

+Kamlesh, might be good to get a tested-by that having these files now on Sitara
filesystem doesn't change anything, I don't think it will, but never hurts to check.

Andrew

