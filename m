Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 307E1C27C4F
	for <webhook@archiver.kernel.org>; Thu, 13 Jun 2024 21:18:20 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.4024.1718313499543788280
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 13 Jun 2024 14:18:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=CHN31nOV;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45DLIGRt081265;
	Thu, 13 Jun 2024 16:18:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1718313496;
	bh=MadsWYG98f7j4d+BTukIeZxgylgjX8zzppKzFrtRjWc=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=CHN31nOVN/OL1XVJFeaV9fI5DMfVembXLFY5D3JNdhUkb/K4fPeMd3M0Jz+fWOVY/
	 tMQVuELfbdrb/bTT0tqZwk57hmRBZyeekkt6iHN+0aVG1kbGV+qm0g3eSWANFtz8kR
	 hzMl/KyBK7BBj+dyNm91bEzHMXaW6KpYek2pxXgg=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45DLIGGE117174
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 13 Jun 2024 16:18:16 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 13
 Jun 2024 16:18:16 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 13 Jun 2024 16:18:16 -0500
Received: from [10.249.34.39] ([10.249.34.39])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45DLIGx8050339;
	Thu, 13 Jun 2024 16:18:16 -0500
Message-ID: <f74e3a99-3dbc-4a68-b4b8-a5f77f6e149a@ti.com>
Date: Thu, 13 Jun 2024 16:18:16 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti] [master/scarthgap][PATCH 1/4] conf/machine, ti-bsp: add
 support for multiple BSP providers
To: Denys Dmytriyenko <denis@denix.org>, <meta-ti@lists.yoctoproject.org>
CC: Denys Dmytriyenko <denys@konsulko.com>
References: <20240613172254.770920-1-denis@denix.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20240613172254.770920-1-denis@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 13 Jun 2024 21:18:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17726



On 6/13/2024 12:22 PM, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@konsulko.com>
> 
> This adds a facility to define multiple supported BSPs with their own
> preferences for individual components, as well as lets machine configs
> specify conditional configurations for different BSPs.
> 
> Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>



> diff --git a/meta-ti-bsp/conf/machine/include/ti-bsp.inc b/meta-ti-bsp/conf/machine/include/ti-bsp.inc
> new file mode 100644
> index 00000000..3bb94a7f
> --- /dev/null
> +++ b/meta-ti-bsp/conf/machine/include/ti-bsp.inc
> @@ -0,0 +1,109 @@
> +# Support multiple BSP providers
> +# The main input is TI_DEFAULT_BSP, which translates into default
> +# preferences for kernel, bootloader and graphics components, as
> +# well as a dedicated machine override.
> +
> +# Supported options are: mainline, ti-6_6, ti-6_1, bb_org
> +TI_DEFAULT_BSP ??= "ti-6_6"

Should this variable be named TI_DEFAULT_BSP?  That implies that this is 
the value of the default for this feature.  But in reality this variable 
is what chooses the TI BSP version.  Should it be something like 
TI_BSP_VERSION instead?



-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

