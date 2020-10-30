Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web12.8730.1604031328816581644
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 29 Oct 2020 21:15:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=Y03rSO2Y;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: denys@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 09U4FRK2017288;
	Thu, 29 Oct 2020 23:15:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1604031327;
	bh=QuO5nO7tCElFZU3BeRUZ9SJtQ9VM2ULoorLLabYdPLU=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=Y03rSO2Yh0IGa9TXpBfsjoXdzEDjYEGM9e8Ejbb3J6TBlbx6sowq+cCrrBnCodTr5
	 sD4ekVHATDWJRuCmukei8lkp1gp7sOKyccT4UsXqBMGm6yGUUT03sCHfpZGuZOu4fa
	 uizQ0yfSRhLYHdTk2tVpPSGlwI81QKqFgezJ+OHI=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 09U4FRft004001
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 29 Oct 2020 23:15:27 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 29
 Oct 2020 23:15:26 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 29 Oct 2020 23:15:27 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 09U4FQTr115696;
	Thu, 29 Oct 2020 23:15:26 -0500
Date: Fri, 30 Oct 2020 00:15:26 -0400
From: "Denys Dmytriyenko" <denys@ti.com>
To: Khem Raj <raj.khem@gmail.com>
CC: <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti] [PATCH v2 2/2] ti-rpmsg-char: Mark these recipes to be TI SOC specific
Message-ID: <20201030041526.GT15849@beryl>
References: <20201030014601.395106-1-raj.khem@gmail.com>
 <20201030014601.395106-2-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20201030014601.395106-2-raj.khem@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Oct 29, 2020 at 06:46:01PM -0700, Khem Raj wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

Reviewed-by: Denys Dmytriyenko <denys@ti.com>


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
> -- 
> 2.29.1
> 

> 
> 
> 

