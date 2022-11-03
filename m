Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F22C1C4332F
	for <webhook@archiver.kernel.org>; Thu,  3 Nov 2022 01:32:38 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.14470.1667439151024329558
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 02 Nov 2022 18:32:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=A1E/S9ir;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: afd@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2A31WPbQ075672;
	Wed, 2 Nov 2022 20:32:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1667439145;
	bh=dPCZNtlACyLYPOUtRovrSPkVJIOqx95up8er3XpZllA=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=A1E/S9irdpB7yAa+jPMucDblc8YQOT9GqK8uXyy6sy36KSn4DWm+HSLDzB4b9RIeJ
	 G9/EwLIxFyOyNNH/abaUSZexBFa76xpq4SquxgBV4moyNcQmX8QMOSZh+DGKzZMPP6
	 m+c9q3cfCvksgBXyqiNryjO4b7eh1QfI5oFSigvs=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2A31WPZC021834
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 2 Nov 2022 20:32:25 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Wed, 2 Nov
 2022 20:32:24 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Wed, 2 Nov 2022 20:32:24 -0500
Received: from [10.249.33.217] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2A31WOGP004488;
	Wed, 2 Nov 2022 20:32:24 -0500
Message-ID: <400b57a4-9411-b279-5c26-cf9e51e764a6@ti.com>
Date: Wed, 2 Nov 2022 20:32:24 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [dunfell][PATCH 2/2] ti-sci-fw: use getVar() to check if
 TI_SECURE_DEV_PKG_K3 is defined
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>, <meta-ti@lists.yoctoproject.org>
CC: Denys Dmytriyenko <denys@konsulko.com>
References: <1667427383-18305-1-git-send-email-denis@denix.org>
 <1667427383-18305-3-git-send-email-denis@denix.org>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <1667427383-18305-3-git-send-email-denis@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 03 Nov 2022 01:32:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15218

On 11/2/22 5:16 PM, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@konsulko.com>
> 
> Otherwise undefined variable is returned literally as ${TI_SECURE_DEV_PKG_K3}
> and the condition won't work.
> 
> Cc: Andrew Davis <afd@ti.com>
> Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
> ---
>   recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
> index 866cd7b..e5dcdd6 100644
> --- a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
> +++ b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
> @@ -20,7 +20,7 @@ COMPATIBLE_MACHINE_aarch64 = "null"
>   
>   PACKAGE_ARCH = "${MACHINE_ARCH}"
>   
> -TI_SECURE_DEV_PKG = "${@ '${TI_SECURE_DEV_PKG_K3}' or '${TI_K3_SECDEV_INSTALL_DIR}' }"
> +TI_SECURE_DEV_PKG = "${@ d.getVar('TI_SECURE_DEV_PKG_K3') or '${TI_K3_SECDEV_INSTALL_DIR}' }"
>   export TI_SECURE_DEV_PKG
>   

I remember +Randolph did exactly this in another spot in this same file[0].
Should we check this everywhere we have input env vars?

Acked-by: Andrew Davis <afd@ti.com>

[0] https://patchwork.yoctoproject.org/project/ti/patch/20220902201247.605908-1-rs@ti.com/


>   SYSFW_SOC ?= "unknown"

