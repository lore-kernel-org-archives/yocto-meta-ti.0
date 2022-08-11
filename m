Return-Path: <praneeth@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46EDFC19F2A
	for <webhook@archiver.kernel.org>; Thu, 11 Aug 2022 15:53:10 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web09.8087.1660233187494596962
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 11 Aug 2022 08:53:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=nQKarna7;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: praneeth@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 27BFr65A056478
	for <meta-ti@lists.yoctoproject.org>; Thu, 11 Aug 2022 10:53:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1660233186;
	bh=RBhcsBz3pLz9rqE1vMkzDLMYg+moOXk01CJHcE0mqLM=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=nQKarna7RW7WncugA0T0zuUS7hUp1sROyfx9HnEbGwVnRrbNVstY3bfw1Tu4kN/PE
	 e/nBNF7iSTmSObQiVOlKmKjAA+LVHct39pl9u++LmDxWVFOfJFFG1tuRU7zrvXGw8N
	 wA8QN5Q2oXU9zvRE5mFcAxpwE/3rwd4YsBYFdO8M=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 27BFr6RZ039841
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Thu, 11 Aug 2022 10:53:06 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Thu, 11
 Aug 2022 10:53:06 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Thu, 11 Aug 2022 10:53:06 -0500
Received: from [10.247.29.70] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 27BFr65E069814;
	Thu, 11 Aug 2022 10:53:06 -0500
Message-ID: <e2f7097d-37d6-1d2a-23a1-0c030a95d7ab@ti.com>
Date: Thu, 11 Aug 2022 10:53:06 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [dunfell/master PATCH] trusted-firmware-a: upgrade to v2.7
Content-Language: en-US
To: Andrew Davis <afd@ti.com>, <meta-ti@lists.yoctoproject.org>,
        Ryan Eatmon
	<reatmon@ti.com>
CC: Judith Mendez <jm@ti.com>
References: <20220811155210.10055-1-praneeth@ti.com>
From: "Bajjuri, Praneeth" <praneeth@ti.com>
In-Reply-To: <20220811155210.10055-1-praneeth@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 11 Aug 2022 15:53:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14949



On 8/11/2022 10:52 AM, Praneeth Bajjuri wrote:
> upgrade arm-trusted-firmare to v2.7
> 
> Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
> Tested-by: Judith Mendez <jm@ti.com>
> ---
>   recipes-bsp/ti-linux-fw/ti-linux-fw.inc                      | 2 +-
>   recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend | 2 +-

Accidentally squashed a different fw patch.
Ignore this . Will submit v2

>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
> index 8aaf1559..a8627c68 100644
> --- a/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
> +++ b/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
> @@ -25,7 +25,7 @@ SRCREV = "${TI_LINUX_FW_SRCREV}"
>   
>   BRANCH ?= "ti-linux-firmware"
>   
> -K3_IMAGE_GEN_SRCREV ?= "85a70059fc24242ea03653a5014b98100e4da2d6"
> +K3_IMAGE_GEN_SRCREV ?= "91a75b17c616a5cc41b3345905dccba5c29aca66"
>   SRCREV_imggen = "${K3_IMAGE_GEN_SRCREV}"
>   SRCREV_FORMAT = "imggen"
>   
> diff --git a/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend b/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
> index 9645137e..4dd13952 100644
> --- a/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
> +++ b/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
> @@ -1,6 +1,6 @@
>   PV_k3 = "2.6"
>   LIC_FILES_CHKSUM_k3 = "file://license.rst;md5=1dd070c98a281d18d9eefd938729b031"
> -SRCREV_tfa_k3 = "453abc80b2eacbf2816c838e47e40f063227d934"
> +SRCREV_tfa_k3 = "35f4c7295bafeb32c8bcbdfb6a3f2e74a57e732b"
>   COMPATIBLE_MACHINE_k3 = "k3"
>   TFA_BUILD_TARGET_k3 = "all"
>   TFA_INSTALL_TARGET_k3 = "bl31"

