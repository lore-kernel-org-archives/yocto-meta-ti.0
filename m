Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3BBA1E00A1A; Fri, 29 May 2015 13:10:48 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.40 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 550CEE00988
	for <meta-ti@yoctoproject.org>; Fri, 29 May 2015 13:10:46 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t4TKAiLs013829
	for <meta-ti@yoctoproject.org>; Fri, 29 May 2015 15:10:44 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t4TKAiqZ027013
	for <meta-ti@yoctoproject.org>; Fri, 29 May 2015 15:10:44 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 29 May 2015 15:10:44 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t4TKAibK002631;
	Fri, 29 May 2015 15:10:44 -0500
Date: Fri, 29 May 2015 16:10:44 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20150529201043.GE16418@edge>
References: <1432735838-7207-1-git-send-email-j-stiffler@ti.com>
	<1432735838-7207-5-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
In-Reply-To: <1432735838-7207-5-git-send-email-j-stiffler@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH 4/4] common-csl-ip-rtos: Add CSL RTOS package.
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
X-List-Received-Date: Fri, 29 May 2015 20:10:48 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Ack

Are all the dependencies ready for this?

Should all the files be added to ${PN}-dev?


On Wed, May 27, 2015 at 10:10:38AM -0400, Jacob Stiffler wrote:
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>  .../common-csl-ip/common-csl-ip-rtos_git.bb        |   33 ++++++++++++++++++++
>  1 file changed, 33 insertions(+)
>  create mode 100644 recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bb
> 
> diff --git a/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bb b/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bb
> new file mode 100644
> index 0000000..5d4a552
> --- /dev/null
> +++ b/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bb
> @@ -0,0 +1,33 @@
> +require common-csl-ip.inc
> +
> +require recipes-ti/includes/ti-paths.inc
> +require recipes-ti/includes/ti-staging.inc
> +
> +DEPENDS = "ti-xdctools ti-cgt6x-native ti-sysbios"
> +
> +S = "${WORKDIR}/ti/csl"
> +
> +export C6X_GEN_INSTALL_PATH="${STAGING_DIR_NATIVE}/usr"
> +export XDCCGROOT="${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x"
> +export XDCPATH="${XDCCGROOT}/include;${XDC_INSTALL_DIR}/packages;${SYSBIOS_INSTALL_DIR}/packages"
> +
> +do_configure() {
> +    sed -i "s/\ \"\.\\\\\\\\\"\ +//" src/Module.xs
> +    find -name "*.xs" -exec sed -i "s/ofd6x\.exe/ofd6x/" {} \;
> +    find -name "*.xs" -exec sed -i "s/sectti\.exe/sectti/" {} \;
> +    find -name "*.xs" -exec sed -i "/\.chm/d" {} \;
> +    find -name "*.xs" -exec sed -i "s/pasm\_dos/pasm\_linux/" {} \;
> +}
> +
> +do_compile() {
> +    ${XDC_INSTALL_DIR}/xdc .make
> +    ${XDC_INSTALL_DIR}/xdc clean
> +    ${XDC_INSTALL_DIR}/xdc release
> +}
> +
> +do_install () {
> +    install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages
> +    find -name "*.tar" -exec tar xf {} -C ${D}${PDK_INSTALL_DIR_RECIPE}/packages \;
> +}
> +
> +FILES_${PN} += "${PDK_INSTALL_DIR_RECIPE}/packages"
> -- 
> 1.7.9.5
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

