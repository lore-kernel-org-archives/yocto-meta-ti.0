Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web09.2384.1603130424443988658
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 19 Oct 2020 11:00:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=c1gatQfa;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: dmurphy@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 09JI0NQx014806
	for <meta-ti@lists.yoctoproject.org>; Mon, 19 Oct 2020 13:00:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1603130423;
	bh=LAw0NYqXS6JUTS2cgm7yuzV5jtosMgxfKrv/rgGQvL0=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=c1gatQfaM9cQmG3qdn7EVRV9nHSPxvBySPBCJtViUCyjR4dhgr1eC8zzLOeehySr8
	 8Jk30JoIoG68aM8NaeW43R4U2FhkDHeWLONtQGcND82W5oMGlVavg61NsTAGv7dEv+
	 cUXDEVinRQOAkOYrqhybzVgyKAexn8THuI3IXQ9s=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 09JI0Nbd095500
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Mon, 19 Oct 2020 13:00:23 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 19
 Oct 2020 13:00:22 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 19 Oct 2020 13:00:23 -0500
Received: from [10.250.70.26] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 09JI0MQV023485;
	Mon, 19 Oct 2020 13:00:22 -0500
Subject: Re: [PATCH] u-boot-ti-staging: Update to latest SHA
To: <denys@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: <s-anna@ti.com>, <d-gerlach@ti.com>
References: <20201019115637.1047-1-dmurphy@ti.com>
From: "Dan Murphy" <dmurphy@ti.com>
Message-ID: <b5b31c3c-1c48-e24b-d0fb-dcdd1e1af785@ti.com>
Date: Mon, 19 Oct 2020 13:00:22 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201019115637.1047-1-dmurphy@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

All

On 10/19/20 6:56 AM, Dan Murphy wrote:
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
>   recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb b/recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb
> index 5b09cb579eff..25e19092a00b 100644
> --- a/recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb
> +++ b/recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb
> @@ -1,7 +1,7 @@
>   require u-boot-ti.inc
>   
> -PR = "r18"
> +PR = "r19"
>   
>   BRANCH = "ti-u-boot-2020.01"
>   
> -SRCREV = "eea73800730b3d9125f5c12a629db2f88e566b71"
> +SRCREV = "6cd79efcfdcf482549dafe775b259924baa2c995"

This fails to build am65 and J7 HS platforms.

So Nack to this patch

Dan

