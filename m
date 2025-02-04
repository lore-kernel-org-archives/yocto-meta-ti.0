Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD173C02194
	for <webhook@archiver.kernel.org>; Tue,  4 Feb 2025 16:25:18 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web11.120320.1738686318255927698
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 04 Feb 2025 08:25:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=gTQyEOQn;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: afd@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 514GPFI73251172
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 4 Feb 2025 10:25:15 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738686315;
	bh=DHLBUfni0d1VYd2kH09VmTw7ScLpyox5LmlMj1gUw9s=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=gTQyEOQnxQzlKgHV1VVkRdoV1VQ1yQUOdxJZUimT/6xkmnQd2QADYdDq+SqolcIa9
	 DaelWJ+4hTblLCkJ85h6Cq65UaIMrUKmCvGvshtsvM8ba4EMoWikJsTBwDbdWg3xGI
	 cE8bH02CnBXP/n9FabGWXT63sLagnDo2PS14xNYg=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 514GPFK8099771
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 4 Feb 2025 10:25:15 -0600
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 4
 Feb 2025 10:25:15 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 4 Feb 2025 10:25:15 -0600
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 514GPFHn093738;
	Tue, 4 Feb 2025 10:25:15 -0600
Message-ID: <11d39f7d-7b08-42e0-87a5-0b4380859706@ti.com>
Date: Tue, 4 Feb 2025 10:25:14 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master/scarthgap][PATCH 1/3] trusted-firmware-a: Switch
 TFA to TI fork
To: <c-shilwant@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: Denys <denis@denix.org>, Ryan Eatmon <reatmon@ti.com>
References: <20250204134925.968150-1-c-shilwant@ti.com>
 <20250204134925.968150-2-c-shilwant@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20250204134925.968150-2-c-shilwant@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 04 Feb 2025 16:25:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18261

On 2/4/25 7:49 AM, Chirag Shilwant via lists.yoctoproject.org wrote:
> - While TFA patches for K3-based AM62L platform are under
> review upstream, temporarily switch to TI's GitHub fork
> for all K3 platforms to prevent disruptions and ensure timely bringup
> 
> - Also update the PV & LIC_FILES_CHKSUM as well

The license change isn't something we did as part of our fork ti-atf.
Maybe you could split this into two to make that clear,

  * Update to upstream 2.12 + license fix
  * Patch that only deals with switching to ti-atf.

Andrew

> 
> Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
> ---
>   .../trusted-firmware-a/trusted-firmware-a-ti.inc         | 9 +++++----
>   1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
> index ebb13bbd..e4a9c49b 100644
> --- a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
> +++ b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
> @@ -1,7 +1,8 @@
> -PV:k3 = "2.11+git"
> -SRCREV_tfa:k3 = "58b25570c9ef91753b14c2103f45f4be9dddb696"
> -LIC_FILES_CHKSUM:k3 = "file://docs/license.rst;md5=83b7626b8c7a37263c6a58af8d19bee1"
> -SRC_URI:k3 = "git://git.trustedfirmware.org/TF-A/trusted-firmware-a.git;protocol=https;name=tfa;branch=master"
> +PV:k3 = "2.12+git"
> +SRCREV_tfa:k3 = "5227171c079d0c7d22a6d37b5cec079c8c5bb4b1"
> +LIC_FILES_CHKSUM:k3 = "file://docs/license.rst;md5=1118e32884721c0be33267bd7ae11130"
> +SRC_URI:k3 = "git://github.com/TexasInstruments/arm-trusted-firmware.git;protocol=https;name=tfa;branch=ti-master"
> +
>   COMPATIBLE_MACHINE:k3 = "k3"
>   TFA_BUILD_TARGET:k3 = "all"
>   TFA_INSTALL_TARGET:k3 = "bl31"
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#18256): https://lists.yoctoproject.org/g/meta-ti/message/18256
> Mute This Topic: https://lists.yoctoproject.org/mt/110991529/3619733
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [afd@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

