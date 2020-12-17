Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web10.2084.1608233850384072060
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 17 Dec 2020 11:37:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=KwZlHiCN;
 spf=fail (domain: ti.com, ip: 198.145.29.25, mailfrom: nm@ti.com)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 8AC4B38C12CE
	for <meta-ti@yoctoproject.org>; Thu, 17 Dec 2020 19:37:29 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0BHJbS7q076123
	for <meta-ti@yoctoproject.org>; Thu, 17 Dec 2020 13:37:28 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1608233848;
	bh=wE7Ni33soJ7aQHuQJ/HCSxDCK9NXhgm7bi4vk0Eh/V0=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=KwZlHiCNw9zbfDyo8NTpFB+d0BgT8ZyRdEffgvO2QmcEFCWn7QU5rXPs4pLCOgoox
	 qDeuxiAPoGYapbPcxQzEVUN+o51xgn3+VNkUBDRBRcZ6WzhNa1Am6TjkApKQzXxTBd
	 gAGn8QGsIjr399MFCV39nQkZnFKcYI78CvXlOiOI=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0BHJbSNa061914
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Thu, 17 Dec 2020 13:37:28 -0600
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 17
 Dec 2020 13:37:28 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 17 Dec 2020 13:37:28 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0BHJbS3f011338;
	Thu, 17 Dec 2020 13:37:28 -0600
Date: Thu, 17 Dec 2020 13:37:28 -0600
From: "Nishanth Menon" <nm@ti.com>
To: <dmurphy@ti.com>
CC: <meta-ti@yoctoproject.org>
Subject: Re: [meta-ti] [dunfell/master] [PATCH v3 01/10] linux-ti-staging: Update kernel to latest commit sha
Message-ID: <20201217193728.lgxj5nlh75fia2cu@kahuna>
References: <20201217184929.18031-1-dmurphy@ti.com>
MIME-Version: 1.0
In-Reply-To: <20201217184929.18031-1-dmurphy@ti.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On 12:49-20201217, Dan Murphy via lists.yoctoproject.org wrote:
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
>  recipes-kernel/linux/linux-ti-staging-rt_5.4.bb | 4 ++--
>  recipes-kernel/linux/linux-ti-staging_5.4.bb    | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/recipes-kernel/linux/linux-ti-staging-rt_5.4.bb b/recipes-kernel/linux/linux-ti-staging-rt_5.4.bb
> index 2f8fe2bfec9d..faa7f6d8226e 100644
> --- a/recipes-kernel/linux/linux-ti-staging-rt_5.4.bb
> +++ b/recipes-kernel/linux/linux-ti-staging-rt_5.4.bb
> @@ -6,5 +6,5 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-5.4:"
>  
>  BRANCH = "ti-rt-linux-5.4.y"
>  
> -SRCREV = "a59ca20fbcdc436be90ca38c199f9b640671fdb7"
> -PV = "5.4.78+git${SRCPV}"
> +SRCREV = "058c8ee4e4ae3ae72ca01b5b4b2aea8213561ab9"
> +PV = "5.4.82+git${SRCPV}"
> diff --git a/recipes-kernel/linux/linux-ti-staging_5.4.bb b/recipes-kernel/linux/linux-ti-staging_5.4.bb
> index 8275988bb1a7..cd13d6e33e13 100644
> --- a/recipes-kernel/linux/linux-ti-staging_5.4.bb
> +++ b/recipes-kernel/linux/linux-ti-staging_5.4.bb
> @@ -21,8 +21,8 @@ S = "${WORKDIR}/git"
>  
>  BRANCH = "ti-linux-5.4.y"
>  
> -SRCREV = "7a5e2e57a39a097b4dde09bad8f72a2d31dc09c4"
> -PV = "5.4.78+git${SRCPV}"
> +SRCREV = "73039d258adb0cac813342cc7e746e22295765fe"
> +PV = "5.4.82+git${SRCPV}"
>  
>  # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
>  MACHINE_KERNEL_PR_append = "a"
> -- 
> 2.29.2
> 

> 
> 
> 

Dan,

	Assuming you have taken care of all the topics we have discussed
	in thread.. we should be good.
-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
