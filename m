Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.2175.1588360966218257696
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 01 May 2020 12:22:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=B4t7EMCp;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: denys@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 041JMjis119383;
	Fri, 1 May 2020 14:22:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1588360965;
	bh=LjYPWEvYwtahHZfmgAL33UY0AgmlNfuQ7P7MRU7o69c=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=B4t7EMCpFZOwkN7eOO+F62K+7R5t8hZB+5+NPi5utSVcSlW6OBnTfi82vIuDw2ag/
	 +bXcjz6sBTGOs5jbm4KYIgHqLFABEFESLTlWWUvZZbARzdrUsvX336fEi5MsKHCnFM
	 Xey8Km/WXdQE7/svJCxHlIphg4mTQPBv1WUbL/aw=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 041JMiQ8020183;
	Fri, 1 May 2020 14:22:44 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 1 May
 2020 14:22:44 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 1 May 2020 14:22:44 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 041JMiqm004548;
	Fri, 1 May 2020 14:22:44 -0500
Date: Fri, 1 May 2020 15:22:44 -0400
From: "Denys Dmytriyenko" <denys@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Khem Raj <raj.khem@gmail.com>
Subject: Re: [meta-ti] [PATCH] u-boot-ti: Limit compatibility to TI SOCs
Message-ID: <20200501192244.GJ11212@beryl>
References: <20200501191409.43178-1-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20200501191409.43178-1-raj.khem@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, May 01, 2020 at 12:14:09PM -0700, Khem Raj wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  recipes-bsp/u-boot/u-boot-ti.inc | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/recipes-bsp/u-boot/u-boot-ti.inc b/recipes-bsp/u-boot/u-boot-ti.inc
> index 736efc0e..04ff559d 100644
> --- a/recipes-bsp/u-boot/u-boot-ti.inc
> +++ b/recipes-bsp/u-boot/u-boot-ti.inc
> @@ -38,6 +38,8 @@ PACKAGECONFIG[optee] = "TEE=${STAGING_DIR_HOST}/boot/bl32.bin,,optee-os"
>  
>  PACKAGECONFIG_append_aarch64 = " atf optee"

Oops, the above used to have _append_k3 override - I was experimenting with 
multiconfig and changed it to aarch64 and forgot to change back. I see how 
it affects you now...


> +COMPATIBLE_MACHINE = "(ti-soc)"
> +
>  EXTRA_OEMAKE += "${PACKAGECONFIG_CONFARGS}"
>  
>  PROVIDES += "u-boot"
> -- 
> 2.26.2
> 

> 

