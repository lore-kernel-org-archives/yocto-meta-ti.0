Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8F956E0086E; Mon, 30 Mar 2015 07:09:22 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.152 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3E618E0085D
	for <meta-ti@yoctoproject.org>; Mon, 30 Mar 2015 07:09:17 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t2UE9HQa018781
	for <meta-ti@yoctoproject.org>; Mon, 30 Mar 2015 09:09:17 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2UE9GN9032172
	for <meta-ti@yoctoproject.org>; Mon, 30 Mar 2015 09:09:16 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 30 Mar 2015 09:09:15 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2UE9FP2003799;
	Mon, 30 Mar 2015 09:09:15 -0500
Date: Mon, 30 Mar 2015 10:09:15 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20150330140914.GH21023@edge>
References: <1427715709-4258-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
In-Reply-To: <1427715709-4258-1-git-send-email-j-stiffler@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] omap3-sgx-modules: Install via the kernel's "modules_install" target.
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
X-List-Received-Date: Mon, 30 Mar 2015 14:09:22 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Mar 30, 2015 at 07:41:49AM -0400, Jacob Stiffler wrote:
> * This allows the modules to have a consistent installation structure
>   when directly building from source.
> * Previously, these modules would be manualy installed to appears as
>   in-tree modules.
> 
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>  .../omap3-sgx-modules_4.05.00.03.bb                |   13 ++-----------
>  .../omap3-sgx-modules_4.09.00.01.bb                |   13 ++-----------
>  .../omap3-sgx-modules_5.01.01.01.bb                |   14 ++------------
>  .../omap3-sgx-modules_5.01.01.02.bb                |   14 ++------------
>  4 files changed, 8 insertions(+), 46 deletions(-)
> 
> diff --git a/recipes-bsp/powervr-drivers/omap3-sgx-modules_4.05.00.03.bb b/recipes-bsp/powervr-drivers/omap3-sgx-modules_4.05.00.03.bb
> index bd476f0..a54a643 100644
> --- a/recipes-bsp/powervr-drivers/omap3-sgx-modules_4.05.00.03.bb
> +++ b/recipes-bsp/powervr-drivers/omap3-sgx-modules_4.05.00.03.bb
> @@ -10,7 +10,7 @@ BINFILE := "Graphics_SDK_setuplinux_${SGXPV}.bin"
>  
>  inherit module
>  
> -MACHINE_KERNEL_PR_append = "b"
> +MACHINE_KERNEL_PR_append = "c"
>  PR = "${MACHINE_KERNEL_PR}"
>  
>  DEFAULT_PREFERENCE_omap3 = "99"
> @@ -32,17 +32,8 @@ TI_PLATFORM_ti814x = "ti81xx"
>  TI_PLATFORM_ti816x = "ti81xx"
>  TI_PLATFORM_ti33x = "ti335x"
>  
> -MODULESLOCATION_omap3 = "dc_omapfb3_linux"
> -MODULESLOCATION_ti814x = "dc_ti81xx_linux"
> -MODULESLOCATION_ti816x = "dc_ti81xx_linux"
> -MODULESLOCATION_ti33x = "dc_ti335x_linux"
> -
>  MAKE_TARGETS = " BUILD=${PVRBUILD} TI_PLATFORM=${TI_PLATFORM}"
>  
>  do_install() {
> -	mkdir -p ${D}/lib/modules/${KERNEL_VERSION}/kernel/drivers/gpu/pvr
> -	cp ${S}/pvrsrvkm.ko \
> -	   ${S}/services4/3rdparty/${MODULESLOCATION}/omaplfb.ko  \
> -	   ${S}/services4/3rdparty/bufferclass_ti/bufferclass_ti.ko \
> -	   ${D}/lib/modules/${KERNEL_VERSION}/kernel/drivers/gpu/pvr
> +    make -C ${STAGING_KERNEL_DIR} SUBDIRS=${B} INSTALL_MOD_PATH=${D} PREFIX=${STAGING_DIR_HOST} modules_install

If you want the standard module installation, then move any additional 
variables to EXTRA_OEMAKE and drop do_install completely.


>  }
> diff --git a/recipes-bsp/powervr-drivers/omap3-sgx-modules_4.09.00.01.bb b/recipes-bsp/powervr-drivers/omap3-sgx-modules_4.09.00.01.bb
> index 4b97bbc..cd6dbe4 100644
> --- a/recipes-bsp/powervr-drivers/omap3-sgx-modules_4.09.00.01.bb
> +++ b/recipes-bsp/powervr-drivers/omap3-sgx-modules_4.09.00.01.bb
> @@ -10,7 +10,7 @@ IMGPV = "1.9.2188537"
>  
>  inherit module
>  
> -MACHINE_KERNEL_PR_append = "c"
> +MACHINE_KERNEL_PR_append = "d"
>  PR = "${MACHINE_KERNEL_PR}"
>  
>  DEFAULT_PREFERENCE = "-1"
> @@ -44,19 +44,10 @@ TI_PLATFORM_ti814x = "ti81xx"
>  TI_PLATFORM_ti816x = "ti81xx"
>  TI_PLATFORM_ti33x = "ti335x"
>  
> -MODULESLOCATION_omap3 = "dc_omapfb3_linux"
> -MODULESLOCATION_ti814x = "dc_ti81xx_linux"
> -MODULESLOCATION_ti816x = "dc_ti81xx_linux"
> -MODULESLOCATION_ti33x = "dc_ti335x_linux"
> -
>  MAKE_TARGETS = " BUILD=${PVRBUILD} TI_PLATFORM=${TI_PLATFORM} SUPPORT_XORG=0"
>  
>  MAKE_TARGETS_append_ti33x = " PM_RUNTIME=1"
>  
>  do_install() {
> -    mkdir -p ${D}/lib/modules/${KERNEL_VERSION}/kernel/drivers/gpu/pvr
> -    cp  ${S}/pvrsrvkm.ko \
> -        ${S}/services4/3rdparty/${MODULESLOCATION}/omaplfb.ko  \
> -        ${S}/services4/3rdparty/bufferclass_ti/bufferclass_ti.ko \
> -        ${D}/lib/modules/${KERNEL_VERSION}/kernel/drivers/gpu/pvr
> +    make -C ${STAGING_KERNEL_DIR} SUBDIRS=${B} INSTALL_MOD_PATH=${D} PREFIX=${STAGING_DIR_HOST} modules_install
>  }
> diff --git a/recipes-bsp/powervr-drivers/omap3-sgx-modules_5.01.01.01.bb b/recipes-bsp/powervr-drivers/omap3-sgx-modules_5.01.01.01.bb
> index a1d95bf..1ac60da 100644
> --- a/recipes-bsp/powervr-drivers/omap3-sgx-modules_5.01.01.01.bb
> +++ b/recipes-bsp/powervr-drivers/omap3-sgx-modules_5.01.01.01.bb
> @@ -10,7 +10,7 @@ IMGPV = "1.10.2359475"
>  
>  inherit module
>  
> -MACHINE_KERNEL_PR_append = "c"
> +MACHINE_KERNEL_PR_append = "d"
>  PR = "${MACHINE_KERNEL_PR}"
>  
>  BINFILE_HARDFP = "Graphics_SDK_setuplinux_hardfp_${SGXPV}.bin"
> @@ -55,18 +55,8 @@ TI_PLATFORM_ti816x = "ti81xx"
>  TI_PLATFORM_ti33x = "ti335x"
>  TI_PLATFORM_ti43x = "ti43xx"
>  
> -MODULESLOCATION_omap3 = "dc_omapfb3_linux"
> -MODULESLOCATION_ti814x = "dc_ti81xx_linux"
> -MODULESLOCATION_ti816x = "dc_ti81xx_linux"
> -MODULESLOCATION_ti33x = "dc_ti335x_linux"
> -MODULESLOCATION_ti43x = "dc_ti43xx_linux"
> -
>  MAKE_TARGETS = " BUILD=${PVRBUILD} TI_PLATFORM=${TI_PLATFORM} SUPPORT_XORG=${SUPPORT_XORG}"
>  
>  do_install() {
> -    mkdir -p ${D}/lib/modules/${KERNEL_VERSION}/kernel/drivers/gpu/pvr
> -    cp  ${S}/pvrsrvkm.ko \
> -        ${S}/services4/3rdparty/${MODULESLOCATION}/omaplfb.ko  \
> -        ${S}/services4/3rdparty/bufferclass_ti/bufferclass_ti.ko \
> -        ${D}/lib/modules/${KERNEL_VERSION}/kernel/drivers/gpu/pvr
> +    make -C ${STAGING_KERNEL_DIR} SUBDIRS=${B} INSTALL_MOD_PATH=${D} PREFIX=${STAGING_DIR_HOST} modules_install
>  }
> diff --git a/recipes-bsp/powervr-drivers/omap3-sgx-modules_5.01.01.02.bb b/recipes-bsp/powervr-drivers/omap3-sgx-modules_5.01.01.02.bb
> index 6a07d4f..cf042fc 100644
> --- a/recipes-bsp/powervr-drivers/omap3-sgx-modules_5.01.01.02.bb
> +++ b/recipes-bsp/powervr-drivers/omap3-sgx-modules_5.01.01.02.bb
> @@ -10,7 +10,7 @@ IMGPV = "1.10.2359475"
>  
>  inherit module
>  
> -MACHINE_KERNEL_PR_append = "a"
> +MACHINE_KERNEL_PR_append = "b"
>  PR = "${MACHINE_KERNEL_PR}"
>  
>  BINFILE_HARDFP = "Graphics_SDK_setuplinux_hardfp_${SGXPV}.bin"
> @@ -51,18 +51,8 @@ TI_PLATFORM_ti816x = "ti81xx"
>  TI_PLATFORM_ti33x = "ti335x"
>  TI_PLATFORM_ti43x = "ti43xx"
>  
> -MODULESLOCATION_omap3 = "dc_omapfb3_linux"
> -MODULESLOCATION_ti814x = "dc_ti81xx_linux"
> -MODULESLOCATION_ti816x = "dc_ti81xx_linux"
> -MODULESLOCATION_ti33x = "dc_ti335x_linux"
> -MODULESLOCATION_ti43x = "dc_ti43xx_linux"
> -
>  MAKE_TARGETS = " BUILD=${PVRBUILD} TI_PLATFORM=${TI_PLATFORM} SUPPORT_XORG=${SUPPORT_XORG}"
>  
>  do_install() {
> -    mkdir -p ${D}/lib/modules/${KERNEL_VERSION}/kernel/drivers/gpu/pvr
> -    cp  ${S}/pvrsrvkm.ko \
> -        ${S}/services4/3rdparty/${MODULESLOCATION}/omaplfb.ko  \
> -        ${S}/services4/3rdparty/bufferclass_ti/bufferclass_ti.ko \
> -        ${D}/lib/modules/${KERNEL_VERSION}/kernel/drivers/gpu/pvr
> +    make -C ${STAGING_KERNEL_DIR} SUBDIRS=${B} INSTALL_MOD_PATH=${D} PREFIX=${STAGING_DIR_HOST} modules_install
>  }
> -- 
> 1.7.9.5
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

