Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27BC8C7EE25
	for <webhook@archiver.kernel.org>; Fri,  9 Jun 2023 14:35:49 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.14950.1686321342795247296
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 09 Jun 2023 07:35:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=TfQjv1Py;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: afd@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 359EZffI047668;
	Fri, 9 Jun 2023 09:35:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1686321341;
	bh=58YoxlbkEcmfov3veqrUGECPKtzt4bwiudqsPwaQAD4=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=TfQjv1PyRUbxo9FUV0SKYTiGLwBOs+GNVK39nOD2I0RHH4Q5aJOI1I7pcLzrsjbC1
	 dxjO7+zgORBmmdiJkKR24zm0/f1tlB0Sa0+nohehKzD1gjyKSUnmzEZP/6FoZpz9uk
	 2Qf5y8aJ8nB95riIFw/DO/Byovc+YHmxHwnWiCgs=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 359EZf8t025454
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 9 Jun 2023 09:35:41 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 9
 Jun 2023 09:35:41 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 9 Jun 2023 09:35:41 -0500
Received: from [10.250.37.94] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 359EZeKa085151;
	Fri, 9 Jun 2023 09:35:41 -0500
Message-ID: <e1371f0a-3dbe-6039-022b-d1b5ce403028@ti.com>
Date: Fri, 9 Jun 2023 09:35:40 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [meta-ti] [kirkstone] [PATCH 1/2] u-boot-ti-staging_2023.04: Copy
 bitmap file to boot partition for AM62x
To: Devarsh Thakkar <devarsht@ti.com>, <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>, <praneeth@ti.com>,
        <denys@konsulko.com>
CC: <nm@ti.com>, <vigneshr@ti.com>, <a-bhatia1@ti.com>, <j-luthra@ti.com>,
        <khasim@ti.com>, <nsekhar@ti.com>, <rs@ti.com>
References: <20230609142901.2958733-1-devarsht@ti.com>
 <20230609142901.2958733-2-devarsht@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20230609142901.2958733-2-devarsht@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 09 Jun 2023 14:35:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16703

On 6/9/23 9:29 AM, Devarsh Thakkar wrote:
> Early splash screen support for AM62x has been enabled in u-boot
> and it requires ti.gz bitmap file to be present in boot partition
> as per the default environment settings done in u-boot [1].
> 
> Copy ti.gz [2] to boot partition to enable out of box early display on
> AM62x when it is flashed with the wic image compiled using TI's
> bsp.
> 
> [1] https://git.ti.com/cgit/ti-u-boot/ti-u-boot/tree/board/ti/am62x/am62x.env?h=09.00.00.001#n34
> [2] https://git.ti.com/cgit/ti-u-boot/ti-u-boot/tree/tools/logos/ti.gz?h=ti-u-boot-2023.04
> 
> Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
> ---
>   .../recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb      | 9 +++++++++
>   1 file changed, 9 insertions(+)
> 
> diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb
> index 4bbb6433..5067e3c8 100644
> --- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb
> +++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb
> @@ -8,3 +8,12 @@ BRANCH = "ti-u-boot-2023.04"
>   
>   SRCREV = "d8e6f9178f6c80abff4ed2e9094001357bda40d4"
>   
> +do_install:append:am62xx() {
> +	install -d ${D}/boot
> +	install -m 0644 ${S}/tools/logos/ti.gz ${D}/boot

Could you copy this over as ti_logo.gz or similar so we have some idea of the contents.

Andrew

> +}
> +
> +do_deploy:append:am62xx() {
> +	install -d ${DEPLOYDIR}
> +	install -m 0644 ${S}/tools/logos/ti.gz ${DEPLOYDIR}
> +}

