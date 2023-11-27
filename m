Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E719FC4167B
	for <webhook@archiver.kernel.org>; Mon, 27 Nov 2023 22:25:01 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.114317.1701123894782943481
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 27 Nov 2023 14:24:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=DPk33MAn;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3ARMOrAe094559;
	Mon, 27 Nov 2023 16:24:53 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1701123893;
	bh=pIEkQ3Pn8bxlQ1ORi9ur+LS8HSaPJmO235OJSTR4eLM=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=DPk33MAnRLf+JjCNrlzCiVxO8uQN9yhneyLeGH8xERHIhHaOGLgQ7+AnRDo7xkIhi
	 JOknYosRKaNqqg7En1pBOGlAxYyjHygkImRVFhTmWxZdJG0pea0DNpT2qbFh+x7bkF
	 TnMhB2HBKrYRp2GDvBY2BKXQfNUspBVQDc6mLu0U=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3ARMOr7j013983
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 27 Nov 2023 16:24:53 -0600
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 27
 Nov 2023 16:24:52 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 27 Nov 2023 16:24:52 -0600
Received: from [10.249.38.142] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3ARMOqql005388;
	Mon, 27 Nov 2023 16:24:52 -0600
Message-ID: <4e6e0dd5-4428-457c-a210-30451ebfa280@ti.com>
Date: Mon, 27 Nov 2023 16:24:52 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][kirkstone][PATCH 4/4] CI/CD Auto-Merger:
 cicd.kirkstone.202311271209
Content-Language: en-US
To: LCPD Automation Script <lcpdbld@list.ti.com>,
        Praneeth Bajjuri
	<praneeth@ti.com>,
        Denys Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
References: <1701122316-142436-1-git-send-email-lcpdbld@list.ti.com>
 <1701122316-142436-5-git-send-email-lcpdbld@list.ti.com>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <1701122316-142436-5-git-send-email-lcpdbld@list.ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 27 Nov 2023 22:25:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17336


There was a bug in our CICD script.  This is the only new patch.  Ignore 
the other tree patches in the series.  They were already applied.


On 11/27/2023 3:58 PM, LCPD Automation Script wrote:
> Updated the value(s) for:
>    ti-linux-fw: CNM_WAVE521_FW_VERSION,PRUETH_FW_AM65X_SR2_VERSION,TI_DM_FW_VERSION,TI_LINUX_FW_SRCREV,TI_SYSFW_VERSION
>    u-boot-ti-staging_2023.04: SRCREV
>    linux-ti-staging-rt_6.1: SRCREV
>    linux-ti-staging_6.1: SRCREV
> 
> Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
> ---
>   meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc         | 10 +++++-----
>   meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb |  2 +-
>   meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.1.bb |  2 +-
>   meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb    |  2 +-
>   4 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
> index 65edb73..cee23b1 100644
> --- a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
> +++ b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
> @@ -9,15 +9,15 @@ INC_PR = "r4"
>   # Firmware versions
>   CORESDK_RTOS_VERSION = "08.02.00.04"
>   PRUETH_FW_AM65X_VERSION = "08.00.00.20"
> -PRUETH_FW_AM65X_SR2_VERSION = "02.02.11.02"
> +PRUETH_FW_AM65X_SR2_VERSION = "02.02.12.08"
>   GOODIX_FW_VERSION = "1.0.0.0"
>   CADENCE_MHDP_FW_VERSION = "2.1.0"
>   IMG_DEC_FW_VERSION = "1.0"
> -CNM_WAVE521_FW_VERSION = "1.0.00"
> -TI_DM_FW_VERSION = "08.06.04"
> -TI_SYSFW_VERSION = "08.06.04"
> +CNM_WAVE521_FW_VERSION = "1.0.3"
> +TI_DM_FW_VERSION = "09.01.02"
> +TI_SYSFW_VERSION = "09.01.07"
>   
> -TI_LINUX_FW_SRCREV ?= "a2d8865df39e9021001fcf06e5daaeab81ba608c"
> +TI_LINUX_FW_SRCREV ?= "6dc47e330f11d01493d24e3ffb8ab369c15068eb"
>   SRCREV = "${TI_LINUX_FW_SRCREV}"
>   
>   BRANCH ?= "ti-linux-firmware"
> diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb
> index 4456a17..23dee3e 100644
> --- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb
> +++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb
> @@ -6,7 +6,7 @@ PR = "r0"
>   
>   BRANCH = "ti-u-boot-2023.04"
>   
> -SRCREV = "8c121e6e3c7fd7be6e727ddd41880c202fb6e223"
> +SRCREV = "71b8c840ca61a4e11b2cdf63b0e6580ecb427912"
>   
>   do_install:append:am62xx() {
>   	install -d ${D}/boot
> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.1.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.1.bb
> index 3c82270..7f0df73 100644
> --- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.1.bb
> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.1.bb
> @@ -6,7 +6,7 @@ FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}-6.1:"
>   
>   BRANCH = "ti-rt-linux-6.1.y"
>   
> -SRCREV = "2f5db0e70b5e1ea128754128ff87560ff0c7ffbb"
> +SRCREV = "a135c15322cfd7f341bde5de4df28208c1784d59"
>   
>   include ${@ 'recipes-kernel/linux/ti-extras-rt.inc' if d.getVar('TI_EXTRAS') else ''}
>   
> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb
> index 45a43a9..e1ab980 100644
> --- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb
> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb
> @@ -23,7 +23,7 @@ S = "${WORKDIR}/git"
>   
>   BRANCH ?= "ti-linux-6.1.y"
>   
> -SRCREV ?= "3db9a45004a01caba21d64b397814abadcc841b0"
> +SRCREV ?= "5892b80d6b7786cb1a78aba8147c3f844e063119"
>   PV = "6.1.46+git${SRCPV}"
>   
>   # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

