Return-Path: <hnagalla@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D4E9C3DA59
	for <webhook@archiver.kernel.org>; Fri, 19 Jul 2024 18:58:27 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.25872.1721415498227252113
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 19 Jul 2024 11:58:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=WvFj/hbJ;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: hnagalla@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 46JIwGUs036158
	for <meta-ti@lists.yoctoproject.org>; Fri, 19 Jul 2024 13:58:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1721415496;
	bh=Qyb6M8slZOTgQZmWYWkDF9tzkZkPv8ei+PnA2ic1ic0=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=WvFj/hbJes0Fg56x0XcNbbdRsGhwo+BQPuGXdYrJWHTjEuizzaMHbi6z8KTYmnMac
	 jWy+XL1KST1S1n0ykWjfuVWogCVIvqrwMkTyicL/FhYrrgc2i9DSI63HrqmKZBkNKI
	 HVfaLHu2zz2croK/W5WAK43enHRt7HyER1/skFho=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 46JIwG37006270
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Fri, 19 Jul 2024 13:58:16 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 19
 Jul 2024 13:58:16 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 19 Jul 2024 13:58:16 -0500
Received: from [10.250.38.65] ([10.250.38.65])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 46JIwGA3049924;
	Fri, 19 Jul 2024 13:58:16 -0500
Message-ID: <1443e154-2515-7211-39e6-3642244a4a22@ti.com>
Date: Fri, 19 Jul 2024 13:58:15 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [scarthgap PATCH] ipc: ti-rpmsg-char: Update library to 0.6.7
To: <praneeth@ti.com>, Ryan Eatmon <reatmon@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, Nick Saulnier <nsaulnier@ti.com>
References: <20240715235724.28197-1-praneeth@ti.com>
Content-Language: en-US
From: Hari Nagalla <hnagalla@ti.com>
In-Reply-To: <20240715235724.28197-1-praneeth@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 19 Jul 2024 18:58:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17894

On 7/15/24 18:57, praneeth@ti.com wrote:
> --- a/meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-char.inc
> +++ b/meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-char.inc
> @@ -7,10 +7,10 @@ PROTOCOL = "https"
>   BRANCH = "master"
>   SRC_URI = "git://git.ti.com/git/rpmsg/ti-rpmsg-char.git;protocol=${PROTOCOL};branch=${BRANCH};"
>   
> -# 0.6.6 release
> -SRCREV = "55a6f4032246631a309f8608af5e822024664b59"
> +# 0.6.7 release
> +SRCREV = "5100a2e4a4a951e40ea0708fa78960770ec0ac33"
>   
> -PV = "0.6.6+git"
> +PV = "0.6.7+git"
>   
>   S = "${WORKDIR}/git"
>   
Acked-by : Hari Nagalla <hnagalla@ti.com>

