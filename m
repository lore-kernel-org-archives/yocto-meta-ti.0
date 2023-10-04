Return-Path: <praneeth@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B1EAE7C4D8
	for <webhook@archiver.kernel.org>; Wed,  4 Oct 2023 15:55:15 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.22230.1696434906616003244
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 04 Oct 2023 08:55:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=a/qf4F04;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: praneeth@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 394Ft4CE095367;
	Wed, 4 Oct 2023 10:55:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1696434904;
	bh=ULw0eDPJvzH/Kf+WMUuxJb0FlvPt6pLAehOK/VuGn14=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=a/qf4F04WJwv9iQR6Hyk98Yv7syn3XJsf0x0Nw3E9acxWKAepC7OWZnj17VuZaQsI
	 0J7AA+6LmQdOB+8myLzfZX1AAmshENZmjpqZqgfdUSwzpQTldlDHR675oqH2Y7rjw3
	 /hmcbQYm7kzKENzF/YOYfLT3JRA8PG1EtOlxP6Vg=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 394Ft4YK095314
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 4 Oct 2023 10:55:04 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 4
 Oct 2023 10:55:04 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 4 Oct 2023 10:55:04 -0500
Received: from [10.247.18.57] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 394Ft3XY021685;
	Wed, 4 Oct 2023 10:55:04 -0500
Message-ID: <8a935839-1f62-db96-2ee6-c1e01bf0c53b@ti.com>
Date: Wed, 4 Oct 2023 10:55:03 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] trusted-firmware-a: Update to sha fixing deep sleep on
 AM62x
Content-Language: en-US
To: Kamlesh Gurudasani <kamlesh@ti.com>, <vigneshr@ti.com>, <u-kumar1@ti.com>,
        <afd@ti.com>, <m-chawdhry@ti.com>, <reatmon@ti.com>,
        <denys@konsulko.com>
CC: <meta-ti@lists.yoctoproject.org>, <vibhore@ti.com>, <vishalm@ti.com>
References: <20231004-atf-bump-lpm-v1-1-66ebc652e365@ti.com>
From: "Bajjuri, Praneeth" <praneeth@ti.com>
In-Reply-To: <20231004-atf-bump-lpm-v1-1-66ebc652e365@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 04 Oct 2023 15:55:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17053



On 10/4/2023 10:49 AM, Kamlesh Gurudasani wrote:
> Update to commit d7a7135d32a8c7da004c0c19b75bd4e2813f9759,
> which fixes deep sleep bug on AM62x

Thanks for the patch, But is this commit sanity tested across all K3 
platforms?


> 
> https://git.trustedfirmware.org/TF-A/trusted-firmware-a.git/commit/?id=d7a7135d32a8c7da004c0c19b75bd4e2813f9759
> 
> Signed-off-by: Kamlesh Gurudasani <kamlesh@ti.com>
> ---
>   meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
> index 64bfec67..b2787005 100644
> --- a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
> +++ b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
> @@ -1,5 +1,5 @@
>   PV:k3 = "2.9+git${SRCPV}"
> -SRCREV_tfa:k3 = "d3e71ead6ea5bc3555ac90a446efec84ef6c6122"
> +SRCREV_tfa:k3 = "d7a7135d32a8c7da004c0c19b75bd4e2813f9759"
>   SRC_URI:k3 = "git://git.trustedfirmware.org/TF-A/trusted-firmware-a.git;protocol=https;name=tfa;branch=master"
>   COMPATIBLE_MACHINE:k3 = "k3"
>   TFA_BUILD_TARGET:k3 = "all"
> 
> ---
> base-commit: 771e12cfb7a9ffedb40395632bc123cd4ce5fb9a
> change-id: 20231004-atf-bump-lpm-cf9d26d6f4ce
> 
> Best regards,

