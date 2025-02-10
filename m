Return-Path: <u-kumar1@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 632D5C02198
	for <webhook@archiver.kernel.org>; Mon, 10 Feb 2025 13:35:50 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web11.50542.1739194540973996977
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 10 Feb 2025 05:35:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=xz2+StTl;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: u-kumar1@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51ADZc2I132569
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 10 Feb 2025 07:35:38 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1739194538;
	bh=BFf+Px4WXV0Ho21K2OoZpELe5yrRvIlQEJJE2f+Xz+I=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=xz2+StTl5JyKSQNEb9mQT0uBwbQ0IjkFKlbTidLXCYKyIhEpn/My/4N65ueQaXaNY
	 ZINwFmwHgBc1RGb7mzHHB1SoTusxe3kcnvC5F7Emuzwn33oGPnJ5tbm9mICCbgPyLR
	 b7LqqaY3Z177ExWXfLaWzqejyFBykWm4t8vWAQOg=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 51ADZcQu007072
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 10 Feb 2025 07:35:38 -0600
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 10
 Feb 2025 07:35:38 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 10 Feb 2025 07:35:38 -0600
Received: from [10.249.141.75] ([10.249.141.75])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51ADZZi8039999;
	Mon, 10 Feb 2025 07:35:36 -0600
Message-ID: <f8c342f8-ded4-4a96-8efe-6d3dc683025b@ti.com>
Date: Mon, 10 Feb 2025 19:05:35 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][scarthgap][PATCH v3] conf: machine: j722s: Add overlay
 to KERNEL_DEVICETREE_PREFIX
To: Anurag Dutta <a-dutta@ti.com>, <reatmon@ti.com>, <denys@konsulko.com>
CC: <a-limaye@ti.com>, <c-shilwant@ti.com>, <meta-ti@lists.yoctoproject.org>
References: <20250210110247.6520-1-a-dutta@ti.com>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <20250210110247.6520-1-a-dutta@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 10 Feb 2025 13:35:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18295


On 2/10/2025 4:32 PM, Anurag Dutta wrote:
> Add the overlay "k3-am625-sk-mcspi-loopback.dtso" to the j722s
> configuration so that SPI loopback tests can be carried out
> successfully.
>
> Signed-off-by: Anurag Dutta <a-dutta@ti.com>
> ---
>
> v3: Changelog:
> 1) Correction in changes
>
> Link to v2: https://lore.kernel.org/all/20250210080101.75507-1-a-dutta@ti.com/
>
> v2: Changelog:
> 1) Added the correct branch
> 2) Added the correct overlay with test results


Reviewed-by: Udit Kumar <u-kumar1@ti.com>


> Link to v1: https://lore.kernel.org/all/20250205073251.42414-1-a-dutta@ti.com/
>
> Test_link: https://gist.github.com/anuragdutta731/f93908b31d524ff0c52c3fd314449948
>
>   meta-ti-bsp/conf/machine/j722s-evm.conf | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/meta-ti-bsp/conf/machine/j722s-evm.conf b/meta-ti-bsp/conf/machine/j722s-evm.conf
> index 2af0981e..52a6cfbd 100644
> --- a/meta-ti-bsp/conf/machine/j722s-evm.conf
> +++ b/meta-ti-bsp/conf/machine/j722s-evm.conf
> @@ -7,6 +7,7 @@ require conf/machine/include/j722s.inc
>   KERNEL_DEVICETREE_PREFIX = " \
>       ti/k3-j722s \
>       ti/k3-fpdlink \
> +    ti/k3-am625-sk-mcspi-loopback \
>       ti/k3-v3link \
>   "
>   

