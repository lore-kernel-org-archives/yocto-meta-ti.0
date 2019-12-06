Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web09.6149.1575649756108577936
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 06 Dec 2019 08:29:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=GB+ieQhy;
 spf=fail (domain: ti.com, ip: 140.211.169.56, mailfrom: denys@ti.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BC5E2E01156; Fri,  6 Dec 2019 08:29:15 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/,
	*      medium trust
	*      [198.47.19.142 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E03B5E00B7A
	for <meta-ti@yoctoproject.org>; Fri,  6 Dec 2019 08:29:14 -0800 (PST)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id xB6GTEGp048939
	for <meta-ti@yoctoproject.org>; Fri, 6 Dec 2019 10:29:14 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1575649754;
	bh=yuEXK07EiXY2VImEvFvT9yV7aNs4PlcIut5AaGm7erc=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=GB+ieQhyUQc6y12E83UPPW+fPLBq7IcXjVQV9+wXcILftmrmV0TuIxuN4WIJ+pIde
	 XD+T67RXEnxBQXQ0Aoyznt2vYS3EAQJZIWzwjyq5QMJKFUIiSQsb6zJ7S0xscsHY4x
	 PuZdE6PY/v0EZBKxHzBtRIim/zR64uEEPud+00kw=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xB6GTEhx025094
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Fri, 6 Dec 2019 10:29:14 -0600
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Fri, 6 Dec
 2019 10:29:14 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Fri, 6 Dec 2019 10:29:14 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id xB6GTDnY026630;
	Fri, 6 Dec 2019 10:29:13 -0600
Date: Fri, 6 Dec 2019 11:29:13 -0500
From: "Denys Dmytriyenko" <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
CC: <meta-ti@yoctoproject.org>
Subject: Re: [meta-ti] [master/thud][PATCH 24/42] pru: migrate to ti-pdk-fetch.bbclass
Message-ID: <20191206162913.GU24609@beryl>
References: <1573830902-17409-1-git-send-email-j-stiffler@ti.com>
 <1573830902-17409-25-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
In-Reply-To: <1573830902-17409-25-git-send-email-j-stiffler@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Nov 15, 2019 at 10:14:44AM -0500, Jacob Stiffler wrote:
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>  recipes-bsp/pru/pru-pwm-fw_git.bb    | 11 +++++------
>  recipes-bsp/pru/pru-swuart-fw_git.bb | 12 ++++++------
>  2 files changed, 11 insertions(+), 12 deletions(-)
> 
> diff --git a/recipes-bsp/pru/pru-pwm-fw_git.bb b/recipes-bsp/pru/pru-pwm-fw_git.bb

This seems to break pru-pwm-fw on am65xx:

"iepPwm.c", line 594: error #20: identifier "CSL_ICSS_IEP0_CFG_BASE" is undefined
"iepPwm.c", line 600: error #20: identifier "CSL_ICSS_IEP1_CFG_BASE" is undefined

Jake, do you know if this can be fixed quickly, so I don't have to drop 42 
patches from next branch? Thanks!

Denys


> index 0fe7987..a8c7103 100644
> --- a/recipes-bsp/pru/pru-pwm-fw_git.bb
> +++ b/recipes-bsp/pru/pru-pwm-fw_git.bb
> @@ -8,17 +8,16 @@ require recipes-ti/includes/ti-paths.inc
>  COMPATIBLE_MACHINE = "am65xx"
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
> -# Below commit ID corresponds to "DEV.PRUSS_LLD.01.00.00.15B"
> -SRCREV = "989f802266d52f50a6db8f2be6967eacd9d2b409"
>  
> -PV = "01.00.00.15B"
>  
> -BRANCH = "master"
> -SRC_URI = "git://git.ti.com/keystone-rtos/pruss-lld.git;protocol=git;branch=${BRANCH}"
> +inherit ti-pdk-fetch
> +
> +TI_PDK_COMP = "ti.drv.pruss.example.apps.icssg_pwm.firmware.src"
> +
> +PE = "1"
>  
>  DEPENDS = "ti-cgt-pru-native pru-icss common-csl-ip-rtos"
>  
> -S = "${WORKDIR}/git/example/apps/icssg_pwm/firmware/src"
>  
>  EXTRA_OEMAKE += " \
>      PRU_CGT="${TI_CGT_PRU_INSTALL_DIR}" \
> diff --git a/recipes-bsp/pru/pru-swuart-fw_git.bb b/recipes-bsp/pru/pru-swuart-fw_git.bb
> index e22b3be..1cb51f3 100644
> --- a/recipes-bsp/pru/pru-swuart-fw_git.bb
> +++ b/recipes-bsp/pru/pru-swuart-fw_git.bb
> @@ -8,20 +8,20 @@ require recipes-ti/includes/ti-paths.inc
>  COMPATIBLE_MACHINE = "ti33x"
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
> -# Below commit ID corresponds to "DEV.UART_LLD.01.00.00.15"
> -SRCREV = "4493f456549c85749a05b1f46bf0b75d23976db1"
>  
> -PV = "01.00.00.15"
> +inherit ti-pdk-fetch
>  
> -BRANCH = "master"
> -SRC_URI = "git://git.ti.com/keystone-rtos/uart-lld.git;protocol=git;branch=${BRANCH} \
> +TI_PDK_COMP = "ti.drv.uart"
> +
> +PE = "1"
> +
> +SRC_URI_append = " \
>  	file://0001-icss_uart-add-Makefile-for-building-firmware.patch \
>  	file://0001-icss_uart-remove-dependency-on-PDK-CSL.patch \
>  "
>  
>  DEPENDS = "ti-cgt-pru-native pru-icss"
>  
> -S = "${WORKDIR}/git"
>  
>  export PRU_CGT = "${TI_CGT_PRU_INSTALL_DIR}"
>  export PRU_SSP = "${STAGING_DIR_TARGET}/usr"
> -- 
> 2.7.4
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
