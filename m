Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 22729E00B3D; Thu, 24 Aug 2017 12:55:50 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.19.17 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3DD36E0090A
	for <meta-ti@yoctoproject.org>; Thu, 24 Aug 2017 12:55:48 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v7OJtmbn014081
	for <meta-ti@yoctoproject.org>; Thu, 24 Aug 2017 14:55:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1503604548;
	bh=e7m4HV181MEc3gMVUQGhqvDcs41oJgSlb2FO0zepFbw=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=vG8uEPSCobC/9WxTCJjCXy5eXuq12dPtpbisy4DxtSboHSE/8V2IXDIYpSCtRXLmw
	M4Ft7UEUQcQ/P6h+CPWaJ9ExVynCxusg+CTjbD4DZfbl/XtuIq3MEnbC2rdP7S4bPy
	T/2K8tBtwjp9kQOQ2bg4ckok3ZKF4FnA5ik/11CA=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v7OJtmqV015584
	for <meta-ti@yoctoproject.org>; Thu, 24 Aug 2017 14:55:48 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE104.ent.ti.com
	(157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Thu, 24 Aug 2017 14:55:47 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Thu, 24 Aug 2017 14:55:47 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v7OJtlBk012551;
	Thu, 24 Aug 2017 14:55:47 -0500
Date: Thu, 24 Aug 2017 15:55:43 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
Message-ID: <20170824195543.GJ28233@edge>
References: <1500419028-3361-1-git-send-email-m-radhakrishnan2@ti.com>
	<1500419028-3361-27-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
In-Reply-To: <1500419028-3361-27-git-send-email-m-radhakrishnan2@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH v2 27/37] pruss-lld: Add rtos recipe & update the version to 1.0.0.7
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
X-List-Received-Date: Thu, 24 Aug 2017 19:55:50 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Jul 18, 2017 at 07:03:38PM -0400, Mahesh Radhakrishnan wrote:
> Upstreaming the RTOS low level driver of the PRUSS module & updating to
> the latest version
> Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
> ---
> 
> v2 - Added summary
> 
>  recipes-bsp/pruss-lld/pruss-lld-rtos_git.bb | 23 +++++++++++++++++++++++
>  recipes-bsp/pruss-lld/pruss-lld.inc         |  8 ++++----
>  2 files changed, 27 insertions(+), 4 deletions(-)
>  create mode 100644 recipes-bsp/pruss-lld/pruss-lld-rtos_git.bb
> 
> diff --git a/recipes-bsp/pruss-lld/pruss-lld-rtos_git.bb b/recipes-bsp/pruss-lld/pruss-lld-rtos_git.bb
> new file mode 100644
> index 0000000..5068286
> --- /dev/null
> +++ b/recipes-bsp/pruss-lld/pruss-lld-rtos_git.bb
> @@ -0,0 +1,23 @@
> +SUMMARY = "TI RTOS low level driver library for PRUSS"
> +
> +inherit ti-pdk
> +require recipes-bsp/pruss-lld/pruss-lld.inc
> +
> +PR = "${INC_PR}.0"
> +
> +S = "${WORKDIR}/${PRUSS_LLD_GIT_DESTSUFFIX}"
> +
> +DEPENDS_append = " osal-rtos"
> +DEPENDS_append_ti33x = " starterware-rtos"
> +DEPENDS_append_ti43x = " starterware-rtos"
> +
> +# Build with make instead of XDC
> +TI_PDK_XDCMAKE = "0"
> +
> +export PDK_PRUSS_ROOT_PATH ="${WORKDIR}/build"
> +export DEST_ROOT="${WORKDIR}/build"
> +
> +# HTML doc link params
> +PDK_COMP_LINK_TEXT = "PRUSS LLD"
> +
> +INSANE_SKIP_${PN} = "arch"
> diff --git a/recipes-bsp/pruss-lld/pruss-lld.inc b/recipes-bsp/pruss-lld/pruss-lld.inc
> index 8620108..1f1bfc5 100644
> --- a/recipes-bsp/pruss-lld/pruss-lld.inc
> +++ b/recipes-bsp/pruss-lld/pruss-lld.inc
> @@ -1,7 +1,7 @@
>  LICENSE = "BSD-3-Clause"
>  LIC_FILES_CHKSUM = "file://pruicss.h;beginline=1;endline=31;md5=315177aa03d58bcd124a6e799e2bd458"
>  
> -COMPATIBLE_MACHINE = "ti33x|ti43x|am57xx-evm|k2g-evm"
> +COMPATIBLE_MACHINE = "ti33x|ti43x|am57xx-evm|k2g-evm|k2g-hs-evm"

That's why you want to use "k2g" SOC family to automatically cover variants.


>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
>  PRUSS_LLD_GIT_URI = "git://git.ti.com/keystone-rtos/pruss-lld.git"
> @@ -9,12 +9,12 @@ PRUSS_LLD_GIT_PROTOCOL = "git"
>  PRUSS_LLD_GIT_BRANCH = "master"
>  PRUSS_LLD_GIT_DESTSUFFIX = "git/ti/drv/pruss"
>  
> -# Below commit ID corresponds to "DEV.PRUSS_LLD.01.00.00.06A"
> -PRUSS_LLD_SRCREV = "b98729cc1fc26c9ac32846146892646a23c28adb"
> +# Below commit ID corresponds to "DEV.PRUSS_LLD.01.00.00.07"
> +PRUSS_LLD_SRCREV = "636bb5645014723c54c08245cf8c2ee401eceb4f"
>  
>  BRANCH = "${PRUSS_LLD_GIT_BRANCH}"
>  SRC_URI = "${PRUSS_LLD_GIT_URI};destsuffix=${PRUSS_LLD_GIT_DESTSUFFIX};protocol=${PRUSS_LLD_GIT_PROTOCOL};branch=${BRANCH}"
>  
>  SRCREV = "${PRUSS_LLD_SRCREV}"
> -PV = "01.00.00.06A"
> +PV = "01.00.00.07"
>  INC_PR = "r0"
> -- 
> 1.9.1
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

