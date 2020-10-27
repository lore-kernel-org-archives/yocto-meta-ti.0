Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web08.7997.1603765171514974759
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 26 Oct 2020 19:19:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=DwkVIXwX;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: s-anna@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 09R2JTL5087732;
	Mon, 26 Oct 2020 21:19:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1603765169;
	bh=AOeIti9vFxNcGd0FXqdsGvG+lRx8zdavx6VcfK/aJSU=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=DwkVIXwXoH2WxCZYO933zBgTy2KXrgiWF0Djbi9bYXrEbOt4JVp5K3Etz9Rr3inTm
	 ISNoPEYU13yy4UTfx60/LfzzUunqSG0HCPVW8Is0k7GpYAmOrfK9JV5kidwG84DJ9g
	 2il12i+9YXLydIt0Z1ioVJvwU1fF8TvKsKeiVrMo=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 09R2JTFk041723
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 26 Oct 2020 21:19:29 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 26
 Oct 2020 21:19:29 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 26 Oct 2020 21:19:29 -0500
Received: from [10.250.39.72] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 09R2JTDv019400;
	Mon, 26 Oct 2020 21:19:29 -0500
Subject: Re: [meta-ti] [PATCH 2/2] ti-rpmsg-char: Mark these recipes to be TI SOC specific
To: Khem Raj <raj.khem@gmail.com>, <meta-ti@lists.yoctoproject.org>
References: <20201025065934.3308920-1-raj.khem@gmail.com>
 <20201025065934.3308920-2-raj.khem@gmail.com>
From: "Suman Anna" <s-anna@ti.com>
Message-ID: <03f490f1-ff1a-b3fc-6511-00b8d707eb6e@ti.com>
Date: Mon, 26 Oct 2020 21:19:29 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201025065934.3308920-2-raj.khem@gmail.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Raj,

On 10/25/20 1:59 AM, Khem Raj wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  recipes-ti/ipc/ti-rpmsg-char.inc | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/recipes-ti/ipc/ti-rpmsg-char.inc b/recipes-ti/ipc/ti-rpmsg-char.inc
> index b41e68eb..d08031cb 100644
> --- a/recipes-ti/ipc/ti-rpmsg-char.inc
> +++ b/recipes-ti/ipc/ti-rpmsg-char.inc
> @@ -13,3 +13,6 @@ SRCREV = "9be402c2bf4053900b6b9a8092fbb42e7e303108"
>  PV = "0.1.0+git${SRCPV}"
>  
>  S = "${WORKDIR}/git"
> +
> +COMPATIBLE_HOST ?= "null"
> +COMPATIBLE_HOST_ti-soc = "(.*)"
> 

This looks ok, but I am trying to understand why this is needed in general (am
still getting familiar with OE). Aren't the recipes processed only on
packagegroups that include them?

regards
Suman

> 
> 
> 
> 

