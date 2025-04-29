Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC9FFC369DC
	for <webhook@archiver.kernel.org>; Tue, 29 Apr 2025 14:02:37 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web11.20695.1745935353521538820
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 29 Apr 2025 07:02:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=pYx6rjLK;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53TE2Sh23861789
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 29 Apr 2025 09:02:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745935348;
	bh=hjQrrSVyMbePjY+J+0adHLjxcaWPJvTfyXkheAtFgis=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=pYx6rjLKsfYyjvtKD7GjCifZiletbdrJpTMvBg7InLMHjxhFcEbdloXvusjzGtlIi
	 1KHTHSPokgqYKeqRRHGIfwySkENtcUfMdLoefG2T+AX8ve7/PznrH7yjfqyJ88uDe0
	 H4o37j+OzuPwTGLLsUH8sXe12oOz0AZB4j5YexL8=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53TE2S3d015887
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 29 Apr 2025 09:02:28 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 29
 Apr 2025 09:02:28 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 29 Apr 2025 09:02:28 -0500
Received: from [10.249.33.142] ([10.249.33.142])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53TE2SCP063676;
	Tue, 29 Apr 2025 09:02:28 -0500
Message-ID: <b53630a0-2f73-4033-8633-f4bb52f62ae2@ti.com>
Date: Tue, 29 Apr 2025 09:02:28 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master/scarthgap][PATCH 1/2] recipes-ti:
 ti-rtos-firmware: Add C7X_1_FW override for am62axx
To: Chirag Shilwant <c-shilwant@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: Denys <denis@denix.org>
References: <20250428134152.1921752-1-c-shilwant@ti.com>
 <20250428134152.1921752-2-c-shilwant@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20250428134152.1921752-2-c-shilwant@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 29 Apr 2025 14:02:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18522


This patch does not apply to master.  There was another patch that 
Andrew sent earlier (mid december) that moves the recipe location and 
name.  I should have add that patch to scarthgap as well.

Let me add that patch, and then I'll rebase this patch on that and send 
in a v2.

On 4/28/2025 8:41 AM, Chirag Shilwant wrote:
> * With [0], the C7x IPC EdgeAI firmware for am62axx will now be
> maintained at ti-linux-firmware. Until now, the same firmware was
> maintained on psdk_fw [1] with a different name & fetched in TI SDK
> via meta-edgeai [2].
> 
> * Hence, add a am62axx specific override for C7X_1_FW inorder to
> match the firmware name as maintained in "ti-ipc/am62axx" of
> ti-linux-firmware.
> 
> [0]: https://git.ti.com/cgit/processor-firmware/ti-linux-firmware/commit/?h=ti-linux-firmware&id=1e5d64d9385d6472d29e11ac7021765004ddff27
> 
> [1]: https://git.ti.com/cgit/processor-sdk/psdk_fw/
> 
> [2]: https://git.ti.com/cgit/edgeai/meta-edgeai/tree/recipes-tisdk/ti-psdk-rtos/ti-edgeai-firmware.bb?h=EDGEAI_CICD_20250417
> 
> Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
> ---
>   meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb b/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
> index 00112017..e5cb18c2 100644
> --- a/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
> +++ b/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
> @@ -48,6 +48,7 @@ MCU_4_1_FW = "ipc_echo_test_mcu4_1_release_strip.xer5f"
>   C66_1_FW   = "ipc_echo_test_c66xdsp_1_release_strip.xe66"
>   C66_2_FW   = "ipc_echo_test_c66xdsp_2_release_strip.xe66"
>   C7X_1_FW   = "ipc_echo_test_c7x_1_release_strip.xe71"
> +C7X_1_FW:am62axx   = "dsp_edgeai_c7x_1_release_strip.out"
>   C7X_2_FW   = "ipc_echo_test_c7x_2_release_strip.xe71"
>   C7X_3_FW   = "ipc_echo_test_c7x_3_release_strip.xe71"
>   C7X_4_FW   = "ipc_echo_test_c7x_4_release_strip.xe71"

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

