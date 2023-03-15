Return-Path: <praneeth@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7357C6FD1D
	for <webhook@archiver.kernel.org>; Wed, 15 Mar 2023 23:42:23 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.601.1678923742691803162
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 15 Mar 2023 16:42:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=iT42IZxe;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: praneeth@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 32FNgL5Y051389;
	Wed, 15 Mar 2023 18:42:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1678923741;
	bh=AX9rsrSAaHFWnFy11i7oMP7/i0xfsWImR3nWiysUoRw=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=iT42IZxeEyKuF2z1bR2izzxwd2uGSXURa44kLqQYirAf9bkrvjzwhW9IMv/JMaFkC
	 EK3xNdqR9oqRBxvfoqgVaACn/s0b51ByvdYb5FlyNePAeWdyHf3iAZbJZvyKG7/dCE
	 iYafqBxOFiR5KJwvpfcp1k2qYesakMMye+rILpMU=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 32FNgLj2008564
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 15 Mar 2023 18:42:21 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Wed, 15
 Mar 2023 18:42:21 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Wed, 15 Mar 2023 18:42:21 -0500
Received: from [10.247.30.6] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 32FNgLAr008434;
	Wed, 15 Mar 2023 18:42:21 -0500
Message-ID: <249580c9-1d6a-c93c-5d70-e20284426346@ti.com>
Date: Wed, 15 Mar 2023 18:42:21 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [kirkstone PATCH] u-boot-ti-staging: upgrade to 2023.01
To: <meta-ti@lists.yoctoproject.org>
CC: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        Andrew Davis <afd@ti.com>
References: <20230315234025.5531-1-praneeth@ti.com>
Content-Language: en-US
From: "Bajjuri, Praneeth" <praneeth@ti.com>
In-Reply-To: <20230315234025.5531-1-praneeth@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 15 Mar 2023 23:42:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15985



On 3/15/2023 6:40 PM, Praneeth Bajjuri wrote:
> upgrade to 2023.01 and make 2021.01 recipe as not
> default version.

build and sanity boot tested bootloader on am62xx gp.


> 
> Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
> ---
>   .../recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb      | 2 ++
>   .../recipes-bsp/u-boot/u-boot-ti-staging_2023.01.bb      | 9 +++++++++
>   2 files changed, 11 insertions(+)
>   create mode 100644 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.01.bb
> 
> diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb
> index 1640d042..df428dfa 100644
> --- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb
> +++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb
> @@ -7,3 +7,5 @@ PR = "r33"
>   BRANCH = "ti-u-boot-2021.01"
>   
>   SRCREV = "78a217ca9ea687ee5c3e7dd3a339a1f7d136e93d"
> +
> +DEFAULT_PREFERENCE = "-1"
> diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.01.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.01.bb
> new file mode 100644
> index 00000000..f1867e73
> --- /dev/null
> +++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.01.bb
> @@ -0,0 +1,9 @@
> +require u-boot-ti.inc
> +
> +LIC_FILES_CHKSUM = "file://Licenses/README;md5=2ca5f2c35c8cc335f0a19756634782f1"
> +
> +PR = "r0"
> +
> +BRANCH = "ti-u-boot-2023.01"
> +
> +SRCREV = "62e2ad1ceafbfdf2c44d3dc1b6efc81e768a96b9"

