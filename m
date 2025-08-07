Return-Path: <a-limaye@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A52E2C87FCA
	for <webhook@archiver.kernel.org>; Thu,  7 Aug 2025 08:05:08 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.46350.1754553903692835210
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 07 Aug 2025 01:05:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=lsBCVi0T;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: a-limaye@ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 577851IR270313;
	Thu, 7 Aug 2025 03:05:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1754553901;
	bh=6oBBz7B1YC4O98vdTnplIW6AEtNWokWlPs7Dj5CVof4=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=lsBCVi0TWvJlhzIDhLvLLehYY+dG5RxFekGmiuhiKh40qRTW06BdYtERF47HF2SBU
	 /6FPdhZFY5pF2b1dOwdfbw/uz+TrV7oOFZxu2PIzqH0pAikPkt8SDIFtFXBmNG7zn+
	 v+W0I4MTNekIRTCvcOLqJCOiGtiVEKKfU71cwd8A=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 5778517X657808
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 7 Aug 2025 03:05:01 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 7
 Aug 2025 03:05:01 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 7 Aug 2025 03:05:01 -0500
Received: from [172.24.234.127] (psdkl-workstation0.dhcp.ti.com [172.24.234.127])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57784xGL996852;
	Thu, 7 Aug 2025 03:04:59 -0500
Message-ID: <f5800c6a-88a3-4a32-b474-496f88578019@ti.com>
Date: Thu, 7 Aug 2025 13:34:58 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [master/scarthgap][PATCH v2 4/5] meta-ti-extras: ti-ipc-rtos:
 Remove deploy task
To: Beleswar Padhi <b-padhi@ti.com>, <reatmon@ti.com>, <denys@konsulko.com>
CC: <afd@ti.com>, <u-kumar1@ti.com>, <meta-ti@lists.yoctoproject.org>
References: <20250806170442.243461-1-b-padhi@ti.com>
 <20250806170442.243461-5-b-padhi@ti.com>
Content-Language: en-US
From: Aniket Limaye <a-limaye@ti.com>
In-Reply-To: <20250806170442.243461-5-b-padhi@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 07 Aug 2025 08:05:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18904

Beleswar,

On 06/08/25 22:34, Beleswar Padhi wrote:
> The pre-built messageq IPC firmware is packaged into rootfs and boot
> partition as part of ti-rtos-messageq-test-fw recipe in the meta-ti-bsp
> layers. There is no need to deploy the vayu IPC firmware anymore. Remove
> the deploy task.
> 
> Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
> ---

This patch might need to be squashed into the previous 2 patches.

Without this patch, 2 recipes will be deploying to the same filename 
${DEPLOYDIR}/ipc/dra7-ipu1-fw.xem4 which will fail builds I believe

Regards,
Aniket


>   meta-ti-extras/recipes-ti/ipc/ti-ipc-rtos_git.bb | 12 ------------
>   1 file changed, 12 deletions(-)
> 
> diff --git a/meta-ti-extras/recipes-ti/ipc/ti-ipc-rtos_git.bb b/meta-ti-extras/recipes-ti/ipc/ti-ipc-rtos_git.bb
> index 853fa117..d2ac6276 100644
> --- a/meta-ti-extras/recipes-ti/ipc/ti-ipc-rtos_git.bb
> +++ b/meta-ti-extras/recipes-ti/ipc/ti-ipc-rtos_git.bb
> @@ -2,7 +2,6 @@ require recipes-ti/ipc/ti-ipc.inc
>   require recipes-ti/ipc/ti-ipc-common.inc
>   require ti-ipc-rtos.inc
>   
> -inherit deploy
>   inherit update-alternatives
>   
>   DEPENDS = "ti-xdctools-native ti-sysbios doxygen-native zip-native"
> @@ -100,17 +99,6 @@ ALTERNATIVE_TARGET[dra7-dsp2-fw.xe66] = "${nonarch_base_libdir}/firmware/ipc/ti_
>   ALTERNATIVE_TARGET[dra7-ipu1-fw.xem4] = "${nonarch_base_libdir}/firmware/ipc/ti_platforms_evmDRA7XX_ipu1/test_omx_ipu1_vayu.xem4"
>   ALTERNATIVE_TARGET[dra7-ipu2-fw.xem4] = "${nonarch_base_libdir}/firmware/ipc/ti_platforms_evmDRA7XX_ipu2/test_omx_ipu2_vayu.xem4"
>   
> -do_deploy() {
> -  install -d ${DEPLOYDIR}
> -}
> -
> -do_deploy:append:omap-a15() {
> -  install -d ${DEPLOYDIR}/ipc
> -  install -m 0644 ${S}/packages/ti/ipc/tests/bin/ti_platforms_evmDRA7XX_ipu1/test_omx_ipu1_vayu.xem4 ${DEPLOYDIR}/ipc/dra7-ipu1-fw.xem4
> -}
> -
> -addtask deploy after do_install
> -
>   # Disable the "buildpaths" check while we figure out how we are
>   # going to address this issue.
>   #


