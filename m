Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 373E3E00ABE; Wed, 17 Oct 2018 13:11:51 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [198.47.19.142 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9659CE00A0C
	for <meta-ti@yoctoproject.org>; Wed, 17 Oct 2018 13:11:50 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id w9HKBnxa076508;
	Wed, 17 Oct 2018 15:11:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1539807109;
	bh=0S+eF6lSns/TPfXNlaKU6rlrECTpTLvIKxjP5VsW/ZI=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=k3cxCbPuJushmG5xNABM9/VYbqxBQM017HqusTx3UhD/pyDTGw8wQrRFREDiHC+n0
	fUnN4UZMmLnhMHJO9vw+MmeQ6OjIWULVX0hf6lkIdwPrnw3xkNDy4psYJq1tjygh55
	bX15rhOWp7NhiecD1fICFK51vci3I8gkNRo7MxGY=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w9HKBnkP012199;
	Wed, 17 Oct 2018 15:11:49 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE101.ent.ti.com
	(10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Wed, 17 Oct 2018 15:11:49 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE102.ent.ti.com
	(10.64.6.23) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Wed, 17 Oct 2018 15:11:49 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w9HKBmS7025871;
	Wed, 17 Oct 2018 15:11:49 -0500
Date: Wed, 17 Oct 2018 16:11:47 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20181017201146.GL4031@beryl>
References: <20181017192853.42942-1-raj.khem@gmail.com>
	<20181017192853.42942-2-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20181017192853.42942-2-raj.khem@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH 2/5] recips: Mark more recipes to be ti-soc specific
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
X-List-Received-Date: Wed, 17 Oct 2018 20:11:51 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Oct 17, 2018 at 12:28:50PM -0700, Khem Raj wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb | 3 +++
>  recipes-bsp/cmem/cmem.inc                   | 2 ++
>  recipes-ti/devtools/ti-xdctools-common.inc  | 5 +++++
>  recipes-ti/osal/ti-osal.inc                 | 4 ++++
>  4 files changed, 14 insertions(+)
> 
> diff --git a/recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb b/recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb
> index 93cebd71..e1f21054 100644
> --- a/recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb
> +++ b/recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb
> @@ -24,3 +24,6 @@ do_install() {
>  }
>  
>  FILES_${PN} += "${base_libdir}/firmware"
> +COMPATIBLE_HOST ?= "null"
> +COMPATIBLE_HOST_ti33x = "(.*)"

This is incorrect - it's not limited to ti33x soc, but multiple socs with 
Cortex-M3 used for PM...


> +

I noticed bunch of "new blank line at EOF" from git, so I'm cleaning it up and 
while at it, I'll squash these 2 similar patches...


> diff --git a/recipes-bsp/cmem/cmem.inc b/recipes-bsp/cmem/cmem.inc
> index 11cebe8d..abbf2492 100644
> --- a/recipes-bsp/cmem/cmem.inc
> +++ b/recipes-bsp/cmem/cmem.inc
> @@ -12,3 +12,5 @@ PV = "4.15.00.02+git${SRCPV}"
>  SRC_URI = "git://git.ti.com/ipc/ludev.git;protocol=git;branch=${BRANCH}"
>  
>  S = "${WORKDIR}/git"
> +COMPATIBLE_HOST ?= "null"
> +COMPATIBLE_HOST_ti-soc = "(.*)"
> diff --git a/recipes-ti/devtools/ti-xdctools-common.inc b/recipes-ti/devtools/ti-xdctools-common.inc
> index a3949cad..0e86ef7a 100644
> --- a/recipes-ti/devtools/ti-xdctools-common.inc
> +++ b/recipes-ti/devtools/ti-xdctools-common.inc
> @@ -61,3 +61,8 @@ libhpi.so \
>  lib.so \
>  libcairo.so.2 \
>  "
> +COMPATIBLE_HOST ?= "null"
> +COMPATIBLE_HOST_ti-soc = "(.*)"
> +COMPATIBLE_HOST_class-native = "(.*)"
> +COMPATIBLE_HOST_class-nativesdk = "(.*)"
> +
> diff --git a/recipes-ti/osal/ti-osal.inc b/recipes-ti/osal/ti-osal.inc
> index cb8da354..bbbdf517 100644
> --- a/recipes-ti/osal/ti-osal.inc
> +++ b/recipes-ti/osal/ti-osal.inc
> @@ -19,3 +19,7 @@ INSANE_SKIP_${PN}-dev = "staticdev"
>  
>  ALLOW_EMPTY_${PN} = "1"
>  FILES_${PN}-dev += "${OSAL_INSTALL_DIR_RECIPE}"
> +
> +COMPATIBLE_HOST ?= "null"
> +COMPATIBLE_HOST_ti-soc = "(.*)"
> +
> -- 
> 2.19.1
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

