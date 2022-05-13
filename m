Return-Path: <praneeth@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D5CFC433F5
	for <webhook@archiver.kernel.org>; Fri, 13 May 2022 19:15:59 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web08.1734.1652469349388522211
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 13 May 2022 12:15:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=cUPSfdWR;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: praneeth@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 24DJFlRG111097;
	Fri, 13 May 2022 14:15:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1652469347;
	bh=ZRvbCjnbjveKnXAurGyeJgmRzIxKZ5EiDQN3sma0stQ=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=cUPSfdWRXmsF0XtFViNipKbwFWsmVrLSVhX3nNg/8TRIYF7RBJtD2zqdmGo8egmRk
	 cbDZJR5aLBoZ1WKNGDxD9QFWc9oHFLRwyAzsX6YpLFTc9GkMEPRnEqKf80ItHu7PVB
	 dvIwtsekBZ2juQjtP4JyQ7tv4THcbLrGa6nB/8P8=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 24DJFlpX022361
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 13 May 2022 14:15:47 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 13
 May 2022 14:15:46 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 13 May 2022 14:15:46 -0500
Received: from [10.247.28.135] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 24DJFknP010967;
	Fri, 13 May 2022 14:15:46 -0500
Message-ID: <b8c13565-5188-38dd-9828-b3f503358cda@ti.com>
Date: Fri, 13 May 2022 14:15:46 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [meta-ti][dunfell][PATCH] conf: machine: am62xx Fix overlay
 extension
Content-Language: en-US
To: Ryan Eatmon <reatmon@ti.com>, Denys Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20220513165509.14281-1-reatmon@ti.com>
From: "Bajjuri, Praneeth" <praneeth@ti.com>
In-Reply-To: <20220513165509.14281-1-reatmon@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 13 May 2022 19:15:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14739



On 5/13/2022 11:55 AM, Ryan Eatmon wrote:
> The file extension for the overlay needs to be .dtbo.
> 
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>

Reviewed-by: Praneeth Bajjuri <praneeth@ti.com>


> ---
>   conf/machine/am62xx-evm.conf | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/conf/machine/am62xx-evm.conf b/conf/machine/am62xx-evm.conf
> index 44f46d78..195cb90c 100644
> --- a/conf/machine/am62xx-evm.conf
> +++ b/conf/machine/am62xx-evm.conf
> @@ -8,7 +8,7 @@ MACHINE_FEATURES += "gpu"
>   
>   KERNEL_DEVICETREE = " \
>       ti/k3-am625-sk.dtb \
> -    ti/k3-am625-sk-csi2-ov5640.dtb \
> +    ti/k3-am625-sk-csi2-ov5640.dtbo \
>   "
>   
>   UBOOT_MACHINE = "am62x_evm_a53_defconfig"

