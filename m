Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.19104.1627908413013791064
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 02 Aug 2021 05:46:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=eRQkZuDJ;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: nm@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 172Ckmqr079546;
	Mon, 2 Aug 2021 07:46:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1627908408;
	bh=HjhoMGV2IMSc8OoVT2EIdlVL9h45Le8+BOt1YFyj2oY=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=eRQkZuDJ6U7xNEsYazIti7LfONVd4EBpXgNPRlZ/I7io0JN343YBr7xo9ORveKUIX
	 G7hxrCAIaLgHTBFTBYOp0rqxxT3JjpmsqoU/vG1zOtfziKt6SHhQWXI9yQ37+gSrYk
	 kTXnXQcdOwLimRfC7S33Ri05kXcU+bVvu5WD2tVQ=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 172CkmBi089782
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 2 Aug 2021 07:46:48 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Mon, 2 Aug
 2021 07:46:47 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Mon, 2 Aug 2021 07:46:47 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 172Ckl04011127;
	Mon, 2 Aug 2021 07:46:47 -0500
Date: Mon, 2 Aug 2021 07:46:47 -0500
From: "Nishanth Menon" <nm@ti.com>
To: Lokesh Vutla <lokeshvutla@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, Praneeth Bajjuri <praneeth@ti.com>,
        <yogeshs@ti.com>, <denis@denix.org>
Subject: Re: [dunfell/master PATCH] linux-ti-mainline: Bump kernel version to v5.14-rc3
Message-ID: <20210802124647.rvovxj7a7gy6hb3z@scrubbed>
References: <20210802043432.16635-1-lokeshvutla@ti.com>
MIME-Version: 1.0
In-Reply-To: <20210802043432.16635-1-lokeshvutla@ti.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On 10:04-20210802, Lokesh Vutla wrote:
> Bump the kernel version to 5.14-rc3
> 


NAK. Lets not move the mainline meta-ti to RCs - just complete versions.

> Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
> ---
>  recipes-kernel/linux/linux-ti-mainline_git.bb | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/recipes-kernel/linux/linux-ti-mainline_git.bb b/recipes-kernel/linux/linux-ti-mainline_git.bb
> index 5d043da7..fad01ae1 100644
> --- a/recipes-kernel/linux/linux-ti-mainline_git.bb
> +++ b/recipes-kernel/linux/linux-ti-mainline_git.bb
> @@ -20,9 +20,9 @@ S = "${WORKDIR}/git"
>  BRANCH = "master"
>  TOOLS_BRANCH = "master"
>  
> -# 5.13 Mainline version
> -SRCREV = "62fb9874f5da54fdb243003b386128037319b219"
> -PV = "5.13+git${SRCPV}"
> +# 5.14-rc3 Mainline version
> +SRCREV = "ff1176468d368232b684f75e82563369208bc371"
> +PV = "5.14-rc3+git${SRCPV}"
>  
>  # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
>  MACHINE_KERNEL_PR_append = "b"
> -- 
> 2.30.0
> 

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D)/Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
