Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 03AD5E00988; Fri, 29 May 2015 12:59:50 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI,
	URI_HEX autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.40 listed in list.dnswl.org]
	*  1.1 URI_HEX URI: URI hostname has long hexadecimal sequence
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4BCADE0086D
	for <meta-ti@yoctoproject.org>; Fri, 29 May 2015 12:59:48 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t4TJxkEs007382
	for <meta-ti@yoctoproject.org>; Fri, 29 May 2015 14:59:46 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t4TJxk9C017299
	for <meta-ti@yoctoproject.org>; Fri, 29 May 2015 14:59:46 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 29 May 2015 14:59:46 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t4TJxkTq006757;
	Fri, 29 May 2015 14:59:46 -0500
Date: Fri, 29 May 2015 15:59:46 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20150529195945.GQ16418@edge>
References: <1432811728-3980-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
In-Reply-To: <1432811728-3980-1-git-send-email-j-stiffler@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] omapdrm-pvr: Use kernel mechanism for module installation.
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
X-List-Received-Date: Fri, 29 May 2015 19:59:50 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Ack

On Thu, May 28, 2015 at 07:15:28AM -0400, Jacob Stiffler wrote:
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>  .../powervr-drivers/omapdrm-pvr_1.9.2253347.bb     |    6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/recipes-bsp/powervr-drivers/omapdrm-pvr_1.9.2253347.bb b/recipes-bsp/powervr-drivers/omapdrm-pvr_1.9.2253347.bb
> index 4ef920e..39885f8 100644
> --- a/recipes-bsp/powervr-drivers/omapdrm-pvr_1.9.2253347.bb
> +++ b/recipes-bsp/powervr-drivers/omapdrm-pvr_1.9.2253347.bb
> @@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://eurasia_km/README;beginline=13;endline=22;md5=2b841bf
>  
>  inherit module
>  
> -MACHINE_KERNEL_PR_append = "d"
> +MACHINE_KERNEL_PR_append = "e"
>  PR = "${MACHINE_KERNEL_PR}"
>  
>  BRANCH = "next"
> @@ -22,7 +22,5 @@ do_compile_prepend() {
>  }
>  
>  do_install() {
> -    mkdir -p ${D}/lib/modules/${KERNEL_VERSION}/extra/
> -    cp ${S}/eurasia_km/eurasiacon/binary2_omap5430_linux_release/target/kbuild/omapdrm_pvr.ko \
> -    ${D}/lib/modules/${KERNEL_VERSION}/extra/
> +    make -C ${STAGING_KERNEL_DIR} SUBDIRS=${B}/eurasia_km/eurasiacon/binary2_omap5430_linux_release/target/kbuild INSTALL_MOD_PATH=${D} PREFIX=${STAGING_DIR_HOST} modules_install
>  }
> -- 
> 1.7.9.5
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

