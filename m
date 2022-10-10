Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 177CCC433F5
	for <webhook@archiver.kernel.org>; Mon, 10 Oct 2022 15:34:36 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.7508.1665416067791741395
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 10 Oct 2022 08:34:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=oILQmO90;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: afd@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 29AFYRaq121172
	for <meta-ti@lists.yoctoproject.org>; Mon, 10 Oct 2022 10:34:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1665416067;
	bh=+JD4ygZIqQL80nJq3KTdhCu3uP5n8MeNxHznLIzYxFQ=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=oILQmO90bKmRU58ZDfxYyPg2JXpcHRy6/lRkkXFLFBghCqkoksAUjnbbxyXbsSCec
	 aCP0tT2Q0p9Kn/SKszWEpQHOTR+eVQvTw2tMxl8L7YZyX6wN+gp7VRFuQlOYFAuWA4
	 fbV4n8ifriPnLnaJ3A84e7toHYRFlueMBecIl20U=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 29AFYRbB048413
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Mon, 10 Oct 2022 10:34:27 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Mon, 10
 Oct 2022 10:34:26 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Mon, 10 Oct 2022 10:34:26 -0500
Received: from [10.250.35.37] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 29AFYQw2025459;
	Mon, 10 Oct 2022 10:34:26 -0500
Message-ID: <5bb358fe-c7de-5621-a23e-99febc90261f@ti.com>
Date: Mon, 10 Oct 2022 10:34:25 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [meta-ti][dunfell PATCH v2 1/4] optee-os: Update SRCREV for
 OP-TEE TRNG in J784S4
Content-Language: en-US
To: Jayesh Choudhary <j-choudhary@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: <praneeth@ti.com>, <reatmon@ti.com>
References: <20221010153058.28310-1-j-choudhary@ti.com>
 <20221010153058.28310-2-j-choudhary@ti.com>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20221010153058.28310-2-j-choudhary@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 10 Oct 2022 15:34:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15131

On 10/10/22 10:30 AM, Jayesh Choudhary wrote:
> Update the SRCREV to the commit when sa3ul support was
> added in upstream OP-TEE for J784S4 platform to access rng.
> 
> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>


I had Ack'd this whole series in v1, you should add the
acks collected to your patches so when you re-post them
they are maintained here.

Andrew


> ---
>   recipes-security/optee/optee-os_%.bbappend | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/recipes-security/optee/optee-os_%.bbappend b/recipes-security/optee/optee-os_%.bbappend
> index e7de5157..ff639baa 100644
> --- a/recipes-security/optee/optee-os_%.bbappend
> +++ b/recipes-security/optee/optee-os_%.bbappend
> @@ -1,5 +1,5 @@
>   PV_ti-soc = "3.18.0+git${SRCPV}"
> -SRCREV_ti-soc = "8e155bae3a5eb9d1a3ed9260bd7281a7a35f5086"
> +SRCREV_ti-soc = "6bf4a81a8f5388e6cb6b1d7e8ebe57c5089c0954"
>   SRC_URI_ti-soc = "git://github.com/OP-TEE/optee_os.git;protocol=https"
>   
>   DEPENDS_append_ti-soc = " python3-cryptography-native"

