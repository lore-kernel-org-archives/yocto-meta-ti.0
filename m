Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7370CDB474
	for <webhook@archiver.kernel.org>; Tue, 17 Oct 2023 09:36:57 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.203514.1697535413822483960
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 17 Oct 2023 02:36:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=r/4CGNCY;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: c-shilwant@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 39H9apSu123222;
	Tue, 17 Oct 2023 04:36:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1697535411;
	bh=RD8RK62LewEJgIGopITuPwvXgdI47QJ4l58ZEvVcsbA=;
	h=Date:Subject:To:References:CC:From:In-Reply-To;
	b=r/4CGNCY/tYyJv9pTqE3p3G5m1L3BGXwSUk1gn+XUCZ6HzM/dNyCIN1CfAGZXXZLT
	 vSPd8Pl2s1xgjgbEGuuwoheY0dBXcXPYnXrEZIK282cHcUlg84VESp1nVIAY4tWnAb
	 0J2d3xKMSAyyHfsV8/YxLLfLGn1JFaPpn0AgaEkU=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 39H9apwM090992
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 17 Oct 2023 04:36:51 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 17
 Oct 2023 04:36:51 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 17 Oct 2023 04:36:51 -0500
Received: from [172.24.227.238] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 39H9anSn051413;
	Tue, 17 Oct 2023 04:36:49 -0500
Message-ID: <81938d52-8853-4ea0-9810-a04a3e3d9e9f@ti.com>
Date: Tue, 17 Oct 2023 15:06:48 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXTERNAL] [meta-ti][master/kirkstone][PATCH] machine: include:
 test sgx on am43 platform
Content-Language: en-US
To: <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20231016150227.15319-1-reatmon@ti.com>
CC: Gyan Gupta <g-gupta@ti.com>
From: Chirag Shilwant <c-shilwant@ti.com>
In-Reply-To: <20231016150227.15319-1-reatmon@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 17 Oct 2023 09:36:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17131

This patch is not needed as "[kirkstone][PATCHv3 3/3] machine: include: 
enable sgx on tested platforms" [1] covers ti43x as well.

Reference
---------
[1] https://lists.yoctoproject.org/g/meta-ti/message/17130

On 16/10/23 20:32, Ryan Eatmon via lists.yoctoproject.org wrote:
> Enable SGX Graphics for am43 for testing.
>
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
>   meta-ti-bsp/conf/machine/include/ti43x.inc | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-ti-bsp/conf/machine/include/ti43x.inc b/meta-ti-bsp/conf/machine/include/ti43x.inc
> index ea5d1505..c70a8363 100644
> --- a/meta-ti-bsp/conf/machine/include/ti43x.inc
> +++ b/meta-ti-bsp/conf/machine/include/ti43x.inc
> @@ -14,7 +14,7 @@ PREFERRED_PROVIDER_u-boot ?= "u-boot-ti-staging"
>   
>   # Graphics providers and variables
>   require conf/machine/include/mesa-pvr.inc
> -PREFERRED_PROVIDER_virtual/gpudriver ?= ""
> +PREFERRED_PROVIDER_virtual/gpudriver ?= "ti-sgx-ddk-km"
>   PVR_DISPLAY_CONTROLLER_ALIAS ?= "omapdrm"
>   
>   KERNEL_IMAGETYPE = "zImage"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#17121): https://lists.yoctoproject.org/g/meta-ti/message/17121
> Mute This Topic: https://lists.yoctoproject.org/mt/101997376/7030289
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/leave/11470056/7030289/1265141306/xyzzy [c-shilwant@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

