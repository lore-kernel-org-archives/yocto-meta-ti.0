Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web12.3181.1619038778583421104
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 21 Apr 2021 13:59:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=uuCeM9jU;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: s-anna@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 13LKxbEf081787;
	Wed, 21 Apr 2021 15:59:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1619038777;
	bh=1j91/os766V0tKLlAfFZTajz7obTzaaHKof9QuPei+E=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=uuCeM9jUSO6wO2XdSmn4Vw6frb6TEbYoj8DZ8Fcq1nYu4sroDLmnm9bVtIBQcrND0
	 8zM+Tp+BfysOOukC32JqJFG57IB2MQRP6TFB/fXlIh5Gg1wFR3ViGhDR5ZYeaaCBSO
	 ydO7d7+IAZyuUTK2sT1MtFuqMmjbioE/kRJlfGmQ=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 13LKxbQ0120046
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 21 Apr 2021 15:59:37 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Wed, 21
 Apr 2021 15:59:37 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Wed, 21 Apr 2021 15:59:37 -0500
Received: from [10.250.33.21] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 13LKxarN010643;
	Wed, 21 Apr 2021 15:59:36 -0500
Subject: Re: [dunfell/master PATCH 1/4] cmem: Update to new version 4.20.00.00
To: <praneeth@ti.com>
CC: Denys Dmytriyenko <denys@konsulko.com>, Lokesh Vutla <lokeshvutla@ti.com>,
        Yogesh Siraswar <yogeshs@ti.com>, Nishanth Menon <nm@ti.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20210421205326.22047-1-praneeth@ti.com>
 <20210421205326.22047-2-praneeth@ti.com>
From: "Suman Anna" <s-anna@ti.com>
Message-ID: <57007295-80b9-a6d7-297c-6503bafa8570@ti.com>
Date: Wed, 21 Apr 2021 15:59:36 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210421205326.22047-2-praneeth@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 4/21/21 3:53 PM, praneeth@ti.com wrote:
> From: Praneeth Bajjuri <praneeth@ti.com>
> 
> The update brings the fix for 5.10.x linux kernel.
> commit 8aba20e20bf7 ("cmemk: Fix build errors for 5.10+ kernels")
> 
> Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>

Reviewed-by: Suman Anna <s-anna@ti.com>

regards
Suman

> ---
>  recipes-bsp/cmem/cmem.inc | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/recipes-bsp/cmem/cmem.inc b/recipes-bsp/cmem/cmem.inc
> index c2719403..385e1084 100644
> --- a/recipes-bsp/cmem/cmem.inc
> +++ b/recipes-bsp/cmem/cmem.inc
> @@ -4,10 +4,10 @@ LICENSE = "GPLv2"
>  LIC_FILES_CHKSUM = "file://include/ti/cmem.h;beginline=1;endline=30;md5=26be509e4bb413905bda8309e338e2b1"
>  
>  BRANCH = "master"
> -# This corresponds to version 4.16.00.00
> -SRCREV = "4f970f053b42e8d2a6f1a8cd4b14786196468fd3"
> +# This corresponds to version 4.20.00.00
> +SRCREV = "b0b57a4e810d27cbb23cb752ef437019f56a5506"
>  
> -PV = "4.16.00.00+git${SRCPV}"
> +PV = "4.20.00.00+git${SRCPV}"
>  
>  SRC_URI = "git://git.ti.com/ipc/ludev.git;protocol=git;branch=${BRANCH}"
>  
> 

