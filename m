Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEB1AC0219B
	for <webhook@archiver.kernel.org>; Mon, 10 Feb 2025 14:47:40 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.52711.1739198855265961377
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 10 Feb 2025 06:47:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=SjQ6j0Je;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51AElYCs3514776
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 10 Feb 2025 08:47:34 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1739198854;
	bh=vJApPFo2+cQFTWyVPBoumI8P6yYkzlF/uYxdp1QcBjc=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=SjQ6j0JermaQW1OTmd8zz/7qCxVPDuYWhSfq2Wx9vKqk/CT9KDAl0YCIMe+J/AiK/
	 b5Gg/tBeM1NFCaOIoazp33c6Ss2404OheVlR2idMd+Yczbzk30Wldxvbc19GR3Lrcu
	 Vjh2W7EobxDMrEJykbfWQieSA/2YnuEe/O/WK27Y=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 51AElYtE125733
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 10 Feb 2025 08:47:34 -0600
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 10
 Feb 2025 08:47:33 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 10 Feb 2025 08:47:33 -0600
Received: from [10.249.32.250] ([10.249.32.250])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51AElXJa015714;
	Mon, 10 Feb 2025 08:47:33 -0600
Message-ID: <3a662062-2d07-467d-b7af-00d9ee5dd52a@ti.com>
Date: Mon, 10 Feb 2025 08:47:33 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][scarthgap][PATCH v2] conf: machine: j722s: Add overlay
 to KERNEL_DEVICETREE_PREFIX
To: Anurag Dutta <a-dutta@ti.com>, <denys@konsulko.com>
CC: <u-kumar1@ti.com>, <meta-ti@lists.yoctoproject.org>, <a-limaye@ti.com>,
        <c-shilwant@ti.com>
References: <20250210080101.75507-1-a-dutta@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20250210080101.75507-1-a-dutta@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 10 Feb 2025 14:47:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18296


The first version of the patch was already accepted and promoted last 
week.  So while this patch will apply, I am not going to accept it since 
the commit message does not really document what is being changed.

You should really check the prod branch before you send a v2/v3 patch to 
see if it was accepted and promoted already.

In this case, resend this patch without any v2, and reword all of the 
commit message text to explain what is changing.



On 2/10/2025 2:01 AM, Anurag Dutta wrote:
> Add the overlay "k3-am625-sk-mcspi-loopback.dtso" to the j722s
> configuration so that SPI loopback tests can be carried out
> successfully.
> 
> Signed-off-by: Anurag Dutta <a-dutta@ti.com>
> ---
> 
> v2: Changelog:
> 1) Added the correct branch
> 2) Added the correct overlay with test results
> 
> Link to v1: https://lore.kernel.org/all/20250205073251.42414-1-a-dutta@ti.com/
> 
> Test_link:https://gist.github.com/anuragdutta731/f93908b31d524ff0c52c3fd314449948
> 
>   meta-ti-bsp/conf/machine/j722s-evm.conf | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-ti-bsp/conf/machine/j722s-evm.conf b/meta-ti-bsp/conf/machine/j722s-evm.conf
> index 8f42866c..52a6cfbd 100644
> --- a/meta-ti-bsp/conf/machine/j722s-evm.conf
> +++ b/meta-ti-bsp/conf/machine/j722s-evm.conf
> @@ -7,7 +7,7 @@ require conf/machine/include/j722s.inc
>   KERNEL_DEVICETREE_PREFIX = " \
>       ti/k3-j722s \
>       ti/k3-fpdlink \
> -    ti/k3-j7200-evm-mcspi-loopback \
> +    ti/k3-am625-sk-mcspi-loopback \
>       ti/k3-v3link \
>   "
>   

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

