Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F5C4C433EF
	for <webhook@archiver.kernel.org>; Fri, 25 Mar 2022 01:47:17 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web08.176.1648172835832981141
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 24 Mar 2022 18:47:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=Pd99BJgo;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: afd@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 22P1lEIW078494;
	Thu, 24 Mar 2022 20:47:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1648172834;
	bh=R7DyAduUWEBLlnBtkEXIRL4UhQK8/zZXms+rVOjEGLg=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=Pd99BJgoH0SoDwCUpE8rF582Z/0b5v7B+skbEwQAKNmdo2kDrypVjwlN+wBLVhNUD
	 sHFcj2PyRF/oUhaefx8pA6qKsA52DZDXOZ4CGgZQGoez8rS1ueTbRr0CEajj2tzLI3
	 YUhSd9aXgejnBqDXYpyDp9anxccPpfNxiT+l4kzo=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 22P1lEk4023710
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 24 Mar 2022 20:47:14 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 24
 Mar 2022 20:47:13 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 24 Mar 2022 20:47:13 -0500
Received: from [10.249.35.254] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 22P1lDiH104165;
	Thu, 24 Mar 2022 20:47:13 -0500
Message-ID: <a0625acc-3a60-a54d-655f-e4438ba1e917@ti.com>
Date: Thu, 24 Mar 2022 20:47:12 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [meta-ti][dunfell][PATCH v3] machine: Add am62xx evm
 configuration
Content-Language: en-US
To: <reatmon@ti.com>, Yogesh Siraswar <yogeshs@ti.com>,
        Praneeth Bajjuri
	<praneeth@ti.com>,
        Denys Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20220324222129.9313-1-reatmon@ti.com>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20220324222129.9313-1-reatmon@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 25 Mar 2022 01:47:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14547

On 3/24/22 5:21 PM, Ryan Eatmon via lists.yoctoproject.org wrote:
> @@ -167,6 +182,10 @@ ALTERNATIVE_${PN}_am64xx = "\
>                       am64-main-r5f1_1-fw \
>                       am64-mcu-m4f0_0-fw \
>                       "
> +ALTERNATIVE_${PN}_am62xx = "\
> +                    am62-mcu-m4f0_0-fw \
> +		            am62-main-r5f0_0-fw \


^^ Looks like some tabs found there way in here..

Why do we have these indented so far anyway, this whole file has wacky
indenting, needs normalized.

Andrew

> +                    "
>   
>   ALTERNATIVE_${PN}_j7 = "\
>                       j7-mcu-r5f0_0-fw \
> @@ -216,6 +235,9 @@ TARGET_MAIN_R5FSS1_0_am64xx = "am64-main-r5f1_0-fw"
>   TARGET_MAIN_R5FSS1_1_am64xx = "am64-main-r5f1_1-fw"
>   TARGET_MCU_M4FSS0_0_am64xx = "am64-mcu-m4f0_0-fw"
>   
> +TARGET_MAIN_R5FSS0_0_am62xx = "am62-main-r5f0_0-fw"
> +TARGET_MCU_M4FSS0_0_am62xx = "am62-mcu-m4f0_0-fw"
> +


