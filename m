Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8403CE00D5E; Wed, 26 Oct 2016 13:21:35 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 26767E00D59
	for <meta-ti@yoctoproject.org>; Wed, 26 Oct 2016 13:21:33 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id u9QKLWui017151
	for <meta-ti@yoctoproject.org>; Wed, 26 Oct 2016 15:21:32 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u9QKLWdE016070
	for <meta-ti@yoctoproject.org>; Wed, 26 Oct 2016 15:21:32 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 26 Oct 2016 15:21:32 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id u9QKLWDj006531;
	Wed, 26 Oct 2016 15:21:32 -0500
Date: Wed, 26 Oct 2016 16:21:31 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Eric Ruei <e-ruei1@ti.com>
Message-ID: <20161026202131.GA12745@edge>
References: <1477512873-11482-1-git-send-email-e-ruei1@ti.com>
MIME-Version: 1.0
In-Reply-To: <1477512873-11482-1-git-send-email-e-ruei1@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] ti-gc320-driver: add SRCIPK
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
X-List-Received-Date: Wed, 26 Oct 2016 20:21:35 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

NAK

On Wed, Oct 26, 2016 at 04:14:33PM -0400, Eric Ruei wrote:
> Signed-off-by: Eric Ruei <e-ruei1@ti.com>
> ---
>  recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb b/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb
> index 9344e30..9c8db73 100644
> --- a/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb
> +++ b/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb
> @@ -17,6 +17,9 @@ SRC_URI = "git://git.ti.com/graphics/ti-gc320-driver.git;protocol=git;branch=${B
>  S = "${WORKDIR}/git/src"
>  
>  EXTRA_OEMAKE += "-f Kbuild AQROOT=${S} KERNEL_DIR=${STAGING_KERNEL_DIR} TOOLCHAIN_PATH=${TOOLCHAIN_PATH} CROSS_COMPILE=${TARGET_PREFIX} ARCH_TYPE=${TARGET_ARCH}"
> +
> +CREATE_SRCIPK = "1"
> +SRCIPK_INSTALL_DIR = "board-support/extra-drivers/${PN}-${PV}"
>  
>  do_install() {
>      install -d ${D}/${base_libdir}/modules/${KERNEL_VERSION}/extra
> -- 
> 1.9.1
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

