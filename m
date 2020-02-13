Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web10.2192.1581623062852413167
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 13 Feb 2020 11:44:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=vUHH+U7D;
 spf=fail (domain: ti.com, ip: 140.211.169.56, mailfrom: denys@ti.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B44D2E015F8; Thu, 13 Feb 2020 11:44:22 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_MED,URI_HEX autolearn=ham version=3.3.1
X-Spam-HAM-Report: 
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/,
	*      medium trust
	*      [198.47.19.141 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 URI_HEX URI: URI hostname has long hexadecimal sequence
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 45EE4E003E1
	for <meta-ti@yoctoproject.org>; Thu, 13 Feb 2020 11:44:21 -0800 (PST)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01DJiLu7106114
	for <meta-ti@yoctoproject.org>; Thu, 13 Feb 2020 13:44:21 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1581623061;
	bh=FoeMRlaZVEvdZv0FCZadV4e8cDbs/Hbh93wZr9YRj1k=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=vUHH+U7D6DVvEwn9SXBxG1RsIama/5/1Yt/IYjkRpI0KPCHeutgNOUIICHLcO0Yyd
	 zyg5CvTDHPPVffzgsW2qDJIDPWRHuCTTVZkxwB1lC6yK+1Y9X277rFC/4B2+TBRFef
	 PZNxG5QOcMK8rqxGjnKo1ne4dQQCZne39f497Yc4=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01DJiLqC062541
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Thu, 13 Feb 2020 13:44:21 -0600
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 13
 Feb 2020 13:44:21 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 13 Feb 2020 13:44:21 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01DJiKxU062943;
	Thu, 13 Feb 2020 13:44:21 -0600
Date: Thu, 13 Feb 2020 14:44:20 -0500
From: "Denys Dmytriyenko" <denys@ti.com>
To: Gowtham Tammana <g-tammana@ti.com>
CC: <meta-ti@yoctoproject.org>
Subject: Re: [meta-ti][zeus][PATCH] ti-sgx-ddk-km: Update srcrev for rtlinux build
Message-ID: <20200213194420.GF7085@beryl>
References: <20200213194108.18290-1-g-tammana@ti.com>
MIME-Version: 1.0
In-Reply-To: <20200213194108.18290-1-g-tammana@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Thanks, can you please rebase it?


On Thu, Feb 13, 2020 at 01:41:08PM -0600, Gowtham Tammana wrote:
> Update srcrev to pickup fix for rt linux build issue.
> 
> Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
> ---
>  recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb b/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
> index 47581f63..1d8eb4c0 100644
> --- a/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
> +++ b/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
> @@ -7,7 +7,7 @@ inherit module
>  
>  COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|k3"
>  
> -MACHINE_KERNEL_PR_append = "t"
> +MACHINE_KERNEL_PR_append = "u"
>  PR = "${MACHINE_KERNEL_PR}"
>  
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
> @@ -24,7 +24,7 @@ SRC_URI = "git://git.ti.com/graphics/omap5-sgx-ddk-linux.git;protocol=git;branch
>  
>  S = "${WORKDIR}/git"
>  
> -SRCREV = "1cc2eded30f83bfce58c8ccc8cd61005addf9c0b"
> +SRCREV = "76f305295daf9a77d9f8a563ce81bcf9b94e8eac"
>  
>  TARGET_PRODUCT_omap-a15 = "jacinto6evm"
>  TARGET_PRODUCT_ti33x = "ti335x"
> -- 
> 2.25.0
> 
