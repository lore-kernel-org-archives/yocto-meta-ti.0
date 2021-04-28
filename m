Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web11.7533.1619585149236214496
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 27 Apr 2021 21:45:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=IM6tZkYa;
 spf=fail (domain: ti.com, ip: 198.145.29.25, mailfrom: praneeth@ti.com)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by mail.yoctoproject.org (Postfix) with ESMTPS id B3EE038C06A4
	for <meta-ti@yoctoproject.org>; Wed, 28 Apr 2021 04:45:48 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 13S4jl19112686;
	Tue, 27 Apr 2021 23:45:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1619585147;
	bh=Dkez8h542NwohXY58G6MFQqdmkWhZ60KsJ1VxDAySkk=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=IM6tZkYaXiBvss50OeUwGGaXiVqlN6YD8dBEcHyN3GbjrC89TdMR+K1VbvSw3NNZm
	 E86GZd+xR4KuQ0r1LQT3tWiwp6ZBnQOr2wfbmXPdWBQjIe2tbi/Zijif8NJlhpegLa
	 csoxj6xh3QZp7wX9juHbE/7ekbxssjX9J3MnBHsI=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 13S4jluX021901
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 27 Apr 2021 23:45:47 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Tue, 27
 Apr 2021 23:45:47 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Tue, 27 Apr 2021 23:45:47 -0500
Received: from [10.250.78.56] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 13S4jl7C032934;
	Tue, 27 Apr 2021 23:45:47 -0500
Subject: Re: [meta-ti][dunfell/master][PATCH] ti-gc320-driver: update branch for 5.10
To: Gowtham Tammana <g-tammana@ti.com>, <meta-ti@yoctoproject.org>,
        <denys@konsulko.com>
References: <20210427211046.22567-1-g-tammana@ti.com>
From: "praneeth" <praneeth@ti.com>
Message-ID: <4a5b3fc1-918c-28ed-562f-5cb4f089d85e@ti.com>
Date: Tue, 27 Apr 2021 23:45:47 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210427211046.22567-1-g-tammana@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 4/27/2021 4:10 PM, Gowtham Tammana wrote:
> Update branch and srcrev for picking up 5.10 branch.
> 
> Signed-off-by: Gowtham Tammana <g-tammana@ti.com>

Reviewed-by: Praneeth Bajjuri <praneeth@ti.com>

> ---
>   recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb b/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb
> index 77bb0926..d36bcd56 100644
> --- a/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb
> +++ b/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb
> @@ -7,13 +7,13 @@ inherit module features_check
>   
>   REQUIRED_MACHINE_FEATURES = "gc320"
>   
> -MACHINE_KERNEL_PR_append = "h"
> +MACHINE_KERNEL_PR_append = "i"
>   PR = "${MACHINE_KERNEL_PR}"
>   
>   # Need to branch out with ${PV} var
> -BRANCH = "ti-${PV}-k5.4"
> +BRANCH = "ti-${PV}-k5.10"
>   
> -SRCREV = "2a4fbe8353fa56011a613aeeaf69e274cd07a825"
> +SRCREV = "e2a10f31e255a65ec30a6e10b890e77d7e9cb107"
>   
>   SRC_URI = "git://git.ti.com/graphics/ti-gc320-driver.git;protocol=git;branch=${BRANCH}"
>   
> 
