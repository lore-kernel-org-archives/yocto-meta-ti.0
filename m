Return-Path: <s-vadapalli@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC77DC3DA42
	for <webhook@archiver.kernel.org>; Mon,  8 Jul 2024 12:23:27 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.78397.1720441404749362136
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 08 Jul 2024 05:23:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=V9W+JOzL;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: s-vadapalli@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 468CNLxS119486;
	Mon, 8 Jul 2024 07:23:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1720441401;
	bh=YxPKwCmRTHnYo0joSxPyRQtqqY23NKy4OeZxU487Ujk=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=V9W+JOzL9KpsES3CKLy9+q5Jh+OyOC5oUME1mPrrJ4wya4cXBHhQx4iLCNDRuyU4D
	 V2AGaXuaTEYLFP+D82Wu9MBjVZ8lEilwNlh5QoK+BL/ACddd1jr1WjslZy81sMgvuJ
	 CY39oAqbItAABxQMGFfw30rQk739/mBthpQz6mqY=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 468CNLXm060872
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 8 Jul 2024 07:23:21 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 8
 Jul 2024 07:23:20 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 8 Jul 2024 07:23:20 -0500
Received: from localhost (uda0492258.dhcp.ti.com [10.24.72.81])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 468CNJBM074263;
	Mon, 8 Jul 2024 07:23:20 -0500
Date: Mon, 8 Jul 2024 17:53:18 +0530
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: Chirag Shilwant <c-shilwant@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <vigneshr@ti.com>, <danishanwar@ti.com>,
        <srk@ti.com>, <denys@konsulko.com>, <praneeth@ti.com>,
        <reatmon@ti.com>, Siddharth Vadapalli <s-vadapalli@ti.com>,
        Gyan Gupta <g-gupta@ti.com>
Subject: Re: [meta-ti][scarthgap][PATCH v2] conf: machine:
 am62*-evm-k3r5.conf: apply fragment for enabling USB DFU
Message-ID: <1cb64086-b6ce-4b11-9465-735ad4a7cdc4@ti.com>
References: <20240708060054.1985156-1-s-vadapalli@ti.com>
 <32db66e5-730c-42ec-9145-72abdf35b6d1@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <32db66e5-730c-42ec-9145-72abdf35b6d1@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 08 Jul 2024 12:23:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17831

On Mon, Jul 08, 2024 at 01:57:23PM +0530, Chirag Shilwant wrote:
> Hi Siddharth,
> 
> 
> I believe this patch is applicable to master branch as well.
> So, an update is needed in patch title.
> 
> 
> s/[scarthgap]/[master/scarthgap]

Sure, I will update this in the v3 patch.

> 
> On 08/07/24 11:30, Siddharth Vadapalli wrote:
> > The config fragment "am62x_r5_usbdfu.config" is applicable to AM62x,
> > AM62x-LP-EVM, AM62Ax and AM62Px devices and enables USB DFU boot support at
> > the R5 stage of boot.
> 
> 
> 
> 
> We need similar update in am62xxsip-evm-k3r5.conf [1] as well to enable USB
> DFU support
> on AM62SIP by default.
> 
> [1]: https://git.ti.com/cgit/arago-project/meta-ti/tree/meta-ti-bsp/conf/machine/am62xxsip-evm-k3r5.conf?h=scarthgap

Thank you for pointing this out. I will include AM62 SIP as well in the
v3 patch.

[...]

Regards,
Siddharth.

