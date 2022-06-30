Return-Path: <praneeth@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70962C433EF
	for <webhook@archiver.kernel.org>; Thu, 30 Jun 2022 10:09:10 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web09.23426.1656583736490102249
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 30 Jun 2022 03:08:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=T53sIKVq;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: praneeth@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 25UA8r7K027687;
	Thu, 30 Jun 2022 05:08:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1656583733;
	bh=89rpSESNni4qck8ZIRQ+csghC1AteP5ndPJF8EN6/h0=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=T53sIKVqAwq2NWYaotvDzarqv7RfTZQwncNgIKP0FcWjQQAvFTz2FGRyiVX7nvUrm
	 nAOnC1K9vvnIOQO+5nxC5KGxMLRztefXj6Q7ss2MyzxnCtZtyxO7zkXlUNtK52svOW
	 qKTVqMyFrq7Oop6Y7YRRN8M1+eefrP3kwYE+bUeo=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 25UA8rb9020211
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 30 Jun 2022 05:08:53 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 30
 Jun 2022 05:08:53 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 30 Jun 2022 05:08:53 -0500
Received: from [10.250.232.118] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 25UA8oDO056575;
	Thu, 30 Jun 2022 05:08:51 -0500
Message-ID: <dff23446-248d-eb06-06f5-a0862d7aa368@ti.com>
Date: Thu, 30 Jun 2022 15:38:49 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [meta-ti][dunfell][PATCH] linux-ti-staging: Unblock SA2UL for
 AM64x and J7200 HS devices
Content-Language: en-US
To: <afd@ti.com>, Denys Dmytriyenko <denys@konsulko.com>,
        Ryan Eatmon
	<reatmon@ti.com>, <meta-ti@lists.yoctoproject.org>
References: <20220628204514.5159-1-afd@ti.com>
From: "Bajjuri, Praneeth" <praneeth@ti.com>
In-Reply-To: <20220628204514.5159-1-afd@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 30 Jun 2022 10:09:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14847

Andrew,

assuming this is applicable for master branch as well.

On 6/29/2022 2:15 AM, Andrew Davis via lists.yoctoproject.org wrote:
> The SA2UL driver now works on HS devices, unblock this.
> 
> Signed-off-by: Andrew Davis <afd@ti.com>

Reviewed-by: Praneeth Bajjuri <praneeth@ti.com>

> ---
>   recipes-kernel/linux/linux-ti-staging_5.10.bb | 6 ------
>   1 file changed, 6 deletions(-)
> 
> diff --git a/recipes-kernel/linux/linux-ti-staging_5.10.bb b/recipes-kernel/linux/linux-ti-staging_5.10.bb
> index 75ffa904..59094a9e 100644
> --- a/recipes-kernel/linux/linux-ti-staging_5.10.bb
> +++ b/recipes-kernel/linux/linux-ti-staging_5.10.bb
> @@ -45,9 +45,3 @@ module_conf_ti_k3_r5_remoteproc = "softdep ti_k3_r5_remoteproc pre: virtio_rpmsg
>   module_conf_ti_k3_dsp_remoteproc = "softdep ti_k3_dsp_remoteproc pre: virtio_rpmsg_bus"
>   KERNEL_MODULE_PROBECONF += "rpmsg_client_sample ti_k3_r5_remoteproc ti_k3_dsp_remoteproc"
>   KERNEL_MODULE_AUTOLOAD_append_j7 = " rpmsg_kdrv_switch"
> -
> -# Disable SA2UL for AM64x HS and J7200 HS
> -module_conf_sa2ul_am64xx-hs-evm = "blacklist sa2ul"
> -KERNEL_MODULE_PROBECONF_append_am64xx-hs-evm = " sa2ul"
> -module_conf_sa2ul_j7200-hs-evm = "blacklist sa2ul"
> -KERNEL_MODULE_PROBECONF_append_j7200-hs-evm = " sa2ul"
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#14846): https://lists.yoctoproject.org/g/meta-ti/message/14846
> Mute This Topic: https://lists.yoctoproject.org/mt/92052612/2167429
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [praneeth@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

