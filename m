Return-Path: <s-vadapalli@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2462C2BD09
	for <webhook@archiver.kernel.org>; Tue,  9 Jul 2024 05:32:07 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.6191.1720503122562677508
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 08 Jul 2024 22:32:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=thxr2KOh;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: s-vadapalli@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4695W1Oq007281;
	Tue, 9 Jul 2024 00:32:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1720503121;
	bh=s2NaGgIYL7E9ODGWhRn88oss48VTKiTLK38+8Aw37Ek=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=thxr2KOhvLY522NNRivssMO79DrlEau486mxa1RLJsEMJRuHXnp9WraH+r5dMxyFU
	 lf5cLj6mEKh3Nu9sMzJj3gpb8E9VNM2IhgEK/lewgQT1pKmWq54R2vtUW1L1L10L+K
	 4KjjjWLM0B6vNq4oDcUridm1nXCHSyj8dilBMqZI=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4695W0qW026962
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 9 Jul 2024 00:32:01 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 9
 Jul 2024 00:32:00 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 9 Jul 2024 00:32:00 -0500
Received: from localhost (uda0492258.dhcp.ti.com [10.24.72.81])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4695VwFg061466;
	Tue, 9 Jul 2024 00:31:59 -0500
Date: Tue, 9 Jul 2024 11:01:58 +0530
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: Chirag Shilwant <c-shilwant@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <praneeth@ti.com>, <denys@konsulko.com>,
        <vigneshr@ti.com>, <danishanwar@ti.com>, <srk@ti.com>,
        Ryan Eatmon
	<reatmon@ti.com>,
        Siddharth Vadapalli <s-vadapalli@ti.com>, Gyan Gupta
	<g-gupta@ti.com>
Subject: Re: [meta-ti][master/scarthgap][PATCH v3] conf: machine:
 am62*-evm-k3r5.conf: apply fragment for enabling USB DFU
Message-ID: <ff14ecd5-84da-4492-97e1-e2347b8f7175@ti.com>
References: <20240708123653.2200919-1-s-vadapalli@ti.com>
 <390e677c-5027-4d0b-bf7c-78664ea12d88@ti.com>
 <297d188e-1904-4c4f-9e2f-a4b13a0eb367@ti.com>
 <7c683042-2573-40ba-bc0a-3b5181a15f00@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <7c683042-2573-40ba-bc0a-3b5181a15f00@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 09 Jul 2024 05:32:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17837

On Tue, Jul 09, 2024 at 09:55:41AM +0530, Chirag Shilwant wrote:
> Hi Siddharth,
> On 09/07/24 09:36, Siddharth Vadapalli wrote:

[...]

> > Since USB DFU is independent of Splash Screen, I agree that the above
> > approach you have suggested is the right way to implement this. I will
> > implement your suggestion in the v4 patch.
> 
> 
> 
> 
> Agreed with Ryan. This approach looks much cleaner. I would encourage you
> to build test the case where both am62x_evm_prune_splashscreen.config &
> am62x_r5_usbdfu.config
> are passed to u-boot just to avoid last moment hiccups during final code
> freeze stage :)
> 

I have built and tested the combination:
am62px_evm_r5_defconfig + am62x_r5_usbdfu.config +
am62x_evm_prune_splashscreen.config

I did not face any build errors and have also validated USB DFU
functionatlity. Logs:
https://gist.github.com/Siddharth-Vadapalli-at-TI/38331822c5f8ed0887225ecab51f3395

Regards,
Siddharth.

