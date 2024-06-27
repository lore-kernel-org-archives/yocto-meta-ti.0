Return-Path: <j-luthra@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22C8BC3064D
	for <webhook@archiver.kernel.org>; Thu, 27 Jun 2024 08:47:32 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.3532.1719478047551039287
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 27 Jun 2024 01:47:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=esjQMfWt;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: j-luthra@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45R8lQQY086146;
	Thu, 27 Jun 2024 03:47:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1719478046;
	bh=90u1nvodRPhav1feJeahbLrENa0M7x9Uk8DJBPFylN0=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=esjQMfWtGt7Ndw6Fh7yUt4qie0KjxHgAr6bDBnye9nNr1hzriN8OYRWBC6hCidzw6
	 GQDwDP2Ew2D/w/kxjmSYXYB1pwJnbzlAVbN4nsAevg6nKQ9A8L/SyQqSaaFMzlxE3N
	 ZYO/sPPdAC9Mfu5qHGSND8mXHgk1EUAB7wfVep90=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45R8lQg9105551
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 27 Jun 2024 03:47:26 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 27
 Jun 2024 03:47:26 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 27 Jun 2024 03:47:26 -0500
Received: from localhost (jluthra.dhcp.ti.com [172.24.227.116])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45R8lPRZ022539;
	Thu, 27 Jun 2024 03:47:26 -0500
Date: Thu, 27 Jun 2024 14:17:25 +0530
From: Jai Luthra <j-luthra@ti.com>
To: Vaishnav Achath <vaishnav.a@ti.com>
CC: <reatmon@ti.com>, <praneeth@ti.com>, <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>, <u-kumar1@ti.com>, <a-limaye@ti.com>,
        <m-chawdhry@ti.com>, <r-ravikumar@ti.com>
Subject: Re: [meta-ti][scarthgap][PATCH 0/3] conf: machine: j784s4/am68/am69
 : Pick reused CSI overlays
Message-ID: <4ncsqxqijvyqn5tcjjpzofhhoqtkthbmli2gcbie6rizbhlrcw@iqfhxozrpdwc>
References: <20240627083431.1096889-1-vaishnav.a@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240627083431.1096889-1-vaishnav.a@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 27 Jun 2024 08:47:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17813

Hi Vaishnav,

On Jun 27, 2024 at 14:04:28 +0530, Vaishnav Achath wrote:
> CSI2 connectivity of J721E SK, AM68 SK and AM69 SK is similar and
> the camera overlays can be reused, this series adds the necessary
> changes to pick the reused overlays across these platforms.
> 
> Thanks and Regards,
> Vaishnav
> 
> Vaishnav Achath (3):
>   conf: machine: j784s4-evm: Pick overlays for CSI2 and FPD-Link
>   conf: machine: am68-sk: Pick overlays for IMX219 and FPD-Link
>   conf: machine: am69-sk: Pick overlays for IMX219 and FPD-Link
> 
>  meta-ti-bsp/conf/machine/am68-sk.conf    | 2 ++
>  meta-ti-bsp/conf/machine/am69-sk.conf    | 3 +++
>  meta-ti-bsp/conf/machine/j784s4-evm.conf | 2 ++
>  3 files changed, 7 insertions(+)
> 
> -- 
> 2.34.1
> 

Acked-by: Jai Luthra <j-luthra@ti.com>

-- 
Thanks,
Jai

GPG Fingerprint: 4DE0 D818 E5D5 75E8 D45A AFC5 43DE 91F9 249A 7145

