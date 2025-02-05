Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F828C02192
	for <webhook@archiver.kernel.org>; Wed,  5 Feb 2025 14:53:38 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.13821.1738767211460831188
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 05 Feb 2025 06:53:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=VgDi+42H;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: afd@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 515ErSjp3370572
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 5 Feb 2025 08:53:28 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738767208;
	bh=2fZuglVma/mkn46iT/fhV1Uu5JbrpFigLvGF6pgnK1Y=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=VgDi+42HjQ9zChID3wLXHRTv8MHGh/omQ6BJ5QlswBC3ICAatxQSrlfLHY/1Jzq8X
	 B2WE9rXDDEUX1+XCIMBiLjuBK0e7kcJvEDt25+KUwqkOCeaWEzTyHm72V/YxtcpVST
	 AbSbX0fRxzoORxsQJz0w8x93bDGIe1XX1bYWxnrA=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 515ErSVM080382
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 5 Feb 2025 08:53:28 -0600
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 5
 Feb 2025 08:53:28 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 5 Feb 2025 08:53:28 -0600
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 515ErSMR112114;
	Wed, 5 Feb 2025 08:53:28 -0600
Message-ID: <92a76495-b83e-44d8-954d-abcf81a14365@ti.com>
Date: Wed, 5 Feb 2025 08:53:27 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master/scarthgap][PATCH v2 3/5] trusted-firmware-a:
 Switch TFA to TI fork
To: <c-shilwant@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: Denys <denis@denix.org>, Ryan Eatmon <reatmon@ti.com>
References: <20250205111211.1847450-1-c-shilwant@ti.com>
 <20250205111211.1847450-4-c-shilwant@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20250205111211.1847450-4-c-shilwant@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 05 Feb 2025 14:53:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18278

On 2/5/25 5:12 AM, Chirag Shilwant via lists.yoctoproject.org wrote:
> - While TFA patches for K3-based AM62L platform are under
> review upstream, temporarily switch to TI's GitHub fork
> for all K3 platforms to prevent disruptions and ensure timely bringup
> 
> - Also update the LIC_FILES_CHKSUM since the license file changed between
> upstream TFA v2.12 [1] & the SRCREV in this commit [2][3]
> 

Ah, I didn't see the license change was after v2.12.

Anyway, whole series looks good to me now,

Reviewed-by: Andrew Davis <afd@ti.com>

> [1]: https://github.com/ARM-software/arm-trusted-firmware/blob/v2.12/docs/license.rst
> 
> [2]: https://github.com/ARM-software/arm-trusted-firmware/blob/master/docs/license.rst
> 
> [3]: https://github.com/TexasInstruments/arm-trusted-firmware/blob/ti-master/docs/license.rst
> 
> Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
> ---
>   .../trusted-firmware-a/trusted-firmware-a-ti.inc            | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
> index df3cea23..c628eb15 100644
> --- a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
> +++ b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
> @@ -1,7 +1,7 @@
>   PV:k3 = "2.12+git"
> -SRCREV_tfa:k3 = "4ec2948fe3f65dba2f19e691e702f7de2949179c"
> -LIC_FILES_CHKSUM:k3 = "file://docs/license.rst;md5=83b7626b8c7a37263c6a58af8d19bee1"
> -SRC_URI:k3 = "git://git.trustedfirmware.org/TF-A/trusted-firmware-a.git;protocol=https;name=tfa;branch=master"
> +SRCREV_tfa:k3 = "5227171c079d0c7d22a6d37b5cec079c8c5bb4b1"
> +LIC_FILES_CHKSUM:k3 = "file://docs/license.rst;md5=1118e32884721c0be33267bd7ae11130"
> +SRC_URI:k3 = "git://github.com/TexasInstruments/arm-trusted-firmware.git;protocol=https;name=tfa;branch=ti-master"
>   COMPATIBLE_MACHINE:k3 = "k3"
>   TFA_BUILD_TARGET:k3 = "all"
>   TFA_INSTALL_TARGET:k3 = "bl31"
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#18275): https://lists.yoctoproject.org/g/meta-ti/message/18275
> Mute This Topic: https://lists.yoctoproject.org/mt/111010304/3619733
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [afd@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

