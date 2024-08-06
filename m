Return-Path: <m-chawdhry@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB11EC3DA64
	for <webhook@archiver.kernel.org>; Tue,  6 Aug 2024 10:24:19 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.4270.1722939856714492014
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 06 Aug 2024 03:24:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=BvDHcJ2x;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: m-chawdhry@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 476AOF0s040663;
	Tue, 6 Aug 2024 05:24:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1722939855;
	bh=r6KWruk/th1nFGDG2Doqz7F6tRGaPIf7auJiodIZi+k=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=BvDHcJ2xu56TT82q5byzW02VZh1bO3/b1CtTkAU2TeY7bzkX3mn/cq3CXoiLQZGYC
	 ubAa5wie8iv85mP6dLW0bdOQsBuWVwGn/jeTIPfpnSbMW/tlu+UG6dfeEWvEl9LsoZ
	 KScE1md3A96cLJ2RH7XqFGdCbu69RmWCFSiAO3jU=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 476AOFVS125228
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 6 Aug 2024 05:24:15 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 6
 Aug 2024 05:24:15 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 6 Aug 2024 05:24:15 -0500
Received: from localhost (uda0497581.dhcp.ti.com [10.24.68.185])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 476AOEKJ054230;
	Tue, 6 Aug 2024 05:24:15 -0500
Date: Tue, 6 Aug 2024 15:54:14 +0530
From: Manorit Chawdhry <m-chawdhry@ti.com>
To: Kamlesh Gurudasani <kamlesh@ti.com>
CC: <vigneshr@ti.com>, <praneeth@ti.com>, <u-kumar1@ti.com>, <reatmon@ti.com>,
        <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [PATCH [meta-ti][Scarthgap/Master]] meta-ti-bsp:
 trusted-firmware-a: Update to v2.11 release tag
Message-ID: <20240806102414.mavlxgstn7haczzu@uda0497581>
References: <20240806-atf-2-11-upgrade-v1-1-666f4b5bc161@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240806-atf-2-11-upgrade-v1-1-666f4b5bc161@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 06 Aug 2024 10:24:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17927

Hi Kamlesh,

On 15:24-20240806, Kamlesh Gurudasani wrote:
> Update to latest release tag, i.e. v2.11
> 
> Commit:
> https://git.trustedfirmware.org/TF-A/trusted-firmware-a/+/f2735ebccf5173f74c0458736ec526276106097e
> 
> Tag:
> https://git.trustedfirmware.org/TF-A/trusted-firmware-a/+/refs/tags/v2.11
> 
> Signed-off-by: Kamlesh Gurudasani <kamlesh@ti.com>
> ---
>  meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
> index 291259c0..8d61907a 100644
> --- a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
> +++ b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
> @@ -1,5 +1,5 @@
> -PV:k3 = "2.10+git"
> -SRCREV_tfa:k3 = "00f1ec6b8740ccd403e641131e294aabacf2a48b"
> +PV:k3 = "2.11+git"
> +SRCREV_tfa:k3 = "f2735ebccf5173f74c0458736ec526276106097e"

Tested-by: Manorit Chawdhry <m-chawdhry@ti.com>

Regards,
Manorit

>  SRC_URI:k3 = "git://git.trustedfirmware.org/TF-A/trusted-firmware-a.git;protocol=https;name=tfa;branch=master"
>  COMPATIBLE_MACHINE:k3 = "k3"
>  TFA_BUILD_TARGET:k3 = "all"
> 
> ---
> base-commit: 44c411e544b2393cff7df7edeae9a8bdb7bc9b0e
> change-id: 20240806-atf-2-11-upgrade-7cc6bc5fc4c5
> 
> Best regards,
> -- 
> Kamlesh Gurudasani <kamlesh@ti.com>
> 

