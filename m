Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 97915E00B6C; Thu, 27 Sep 2018 14:39:11 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [198.47.19.141 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id F323CE0090A
	for <meta-ti@yoctoproject.org>; Thu, 27 Sep 2018 14:39:10 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8RLdA51064697
	for <meta-ti@yoctoproject.org>; Thu, 27 Sep 2018 16:39:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1538084350;
	bh=KMkiAPab59iTzcXVyNRTGpLPTskcYmxVTenCBitMRdk=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=gkniartnBESKnCvc7pteYsZ+VwlkJfkvGaLR0S/l7tg3qSq1pNUlLSjaj64ZA5cmT
	gIF8Pkqf0yVdD2IuBJTRmt6YrXj+kEQYcLX4vz4BApr4t4GQbLxSlDwpWFa4S/70Zq
	9xmyOgSsgbzRpPYN3IxMZ6aOnra4NmVVi72+Y8E4=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8RLdASP024206
	for <meta-ti@yoctoproject.org>; Thu, 27 Sep 2018 16:39:10 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 27 Sep 2018 16:39:10 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Thu, 27 Sep 2018 16:39:10 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8RLdAJU015819;
	Thu, 27 Sep 2018 16:39:10 -0500
Date: Thu, 27 Sep 2018 17:39:10 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
Message-ID: <20180927213909.GP8582@beryl>
References: <1538081009-52859-1-git-send-email-m-radhakrishnan2@ti.com>
	<1538081009-52859-14-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
In-Reply-To: <1538081009-52859-14-git-send-email-m-radhakrishnan2@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-ti@yoctoproject.org
Subject: Re: [rocko/master][PATCH v2 13/30] mcasp-lld-rtos: Update to 01.00.00.11A
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Thu, 27 Sep 2018 21:39:11 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Sep 27, 2018 at 04:43:12PM -0400, Mahesh Radhakrishnan wrote:
> Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
> ---
>  recipes-bsp/mcasp-lld/mcasp-lld-rtos_git.bb | 15 ++++++++++-----
>  1 file changed, 10 insertions(+), 5 deletions(-)
> 
> diff --git a/recipes-bsp/mcasp-lld/mcasp-lld-rtos_git.bb b/recipes-bsp/mcasp-lld/mcasp-lld-rtos_git.bb
> index 902b7a0..440133d 100644
> --- a/recipes-bsp/mcasp-lld/mcasp-lld-rtos_git.bb
> +++ b/recipes-bsp/mcasp-lld/mcasp-lld-rtos_git.bb
> @@ -3,9 +3,9 @@ SUMMARY = "TI RTOS low level driver for Multi channel Audio Serial port (McASP)"
>  inherit ti-pdk
>  
>  LICENSE = "BSD-3-Clause"
> -LIC_FILES_CHKSUM = "file://mcaspver.h;beginline=1;endline=47;md5=cc81a11c1566fe1cf19270744f504619"
> +LIC_FILES_CHKSUM = "file://mcaspver.h;beginline=1;endline=47;md5=25868d96216e5d6f286d5fb05a3be9f4"

Why the change?


> -COMPATIBLE_MACHINE = "ti43x|omap-a15|k2g|ti33x|omapl1"
> +COMPATIBLE_MACHINE = "ti43x|omap-a15|k2g|ti33x|omapl1|k3"
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
>  MCASP_LLD_GIT_URI = "git://git.ti.com/keystone-rtos/mcasp-lld.git"
> @@ -13,14 +13,14 @@ MCASP_LLD_GIT_PROTOCOL = "git"
>  MCASP_LLD_GIT_BRANCH = "master"
>  MCASP_LLD_GIT_DESTSUFFIX = "git/ti/drv/mcasp"
>  
> -# Below commit ID corresponds to "DEV.MCASP_LLD.01.01.00.10"
> -MCASP_LLD_SRCREV = "c44ce7ee06c6cfb698bd12d2fa1b58dca04c1375"
> +# Below commit ID corresponds to "DEV.MCASP_LLD.01.01.00.11A"
> +MCASP_LLD_SRCREV = "3620edb04240b63b50b7b9dcb3da361af8152048"
>  
>  BRANCH = "${MCASP_LLD_GIT_BRANCH}"
>  SRC_URI = "${MCASP_LLD_GIT_URI};destsuffix=${MCASP_LLD_GIT_DESTSUFFIX};protocol=${MCASP_LLD_GIT_PROTOCOL};branch=${BRANCH}"
>  
>  SRCREV = "${MCASP_LLD_SRCREV}"
> -PV = "01.01.00.10"
> +PV = "01.01.00.11A"
>  PR = "r0"
>  
>  S = "${WORKDIR}/${MCASP_LLD_GIT_DESTSUFFIX}"
> @@ -32,6 +32,11 @@ DEPENDS_append_ti43x = " starterware-rtos \
>  "
>  DEPENDS_append_ti33x = " starterware-rtos \
>  "
> +
> +DEPENDS_remove_k3 = "edma3-lld-rtos "
> +DEPENDS_append_k3 = " udma-lld-rtos \
> +"
> +
>  # Build with make instead of XDC
>  TI_PDK_XDCMAKE = "0"
>  
> -- 
> 1.9.1
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

