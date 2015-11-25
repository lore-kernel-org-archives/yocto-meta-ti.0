Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 37A4CE00985; Wed, 25 Nov 2015 14:17:00 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.153 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4B30EE007C9
	for <meta-ti@yoctoproject.org>; Wed, 25 Nov 2015 14:16:55 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id tAPMGtA6010024
	for <meta-ti@yoctoproject.org>; Wed, 25 Nov 2015 16:16:55 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id tAPMGtAl018566
	for <meta-ti@yoctoproject.org>; Wed, 25 Nov 2015 16:16:55 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 25 Nov 2015 16:16:54 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id tAPMGs1x010733;
	Wed, 25 Nov 2015 16:16:54 -0600
Date: Wed, 25 Nov 2015 17:16:39 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Sam Nelson <sam.nelson@ti.com>
Message-ID: <20151125221639.GE28188@edge>
References: <1448489243-26741-1-git-send-email-sam.nelson@ti.com>
MIME-Version: 1.0
In-Reply-To: <1448489243-26741-1-git-send-email-sam.nelson@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH 1/2] mpm-transport: Update to new version 2.0.0.0
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
X-List-Received-Date: Wed, 25 Nov 2015 22:17:00 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Nov 25, 2015 at 05:07:22PM -0500, Sam Nelson wrote:
> - Updates to work with kernel version 4.1 and other uio driver changes
> - Making the package machine specific and hence the dependencies
> according to the platform is updated
> - Add use of oe_runmake instead of direct call to make
> 
> Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> ---
>  recipes-ti/mpm-transport/mpm-transport_git.bb | 30 ++++++++++++++++-----------
>  1 file changed, 18 insertions(+), 12 deletions(-)
> 
> diff --git a/recipes-ti/mpm-transport/mpm-transport_git.bb b/recipes-ti/mpm-transport/mpm-transport_git.bb
> index 752ada5..cc211ce 100644
> --- a/recipes-ti/mpm-transport/mpm-transport_git.bb
> +++ b/recipes-ti/mpm-transport/mpm-transport_git.bb
> @@ -3,16 +3,27 @@ HOMEPAGE = "http://git.ti.com/cgit/cgit.cgi/keystone-linux/mpm-transport.git"
>  LICENSE = "BSD-3-Clause & MIT"
>  LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=122b7757f366f3f6fe11988715258fc9"
>  COMPATIBLE_MACHINE = "keystone"
> -DEPENDS = "common-csl-ip hyplnk-lld edma3-lld mmap-lld cmem rm-lld qmss-lld cppi-lld srio-lld"
> +
> +DEPENDS = "common-csl-ip edma3-lld mmap-lld cmem rm-lld qmss-lld cppi-lld uio-module-drv syslog-ng"

http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/tree/recipes-bsp/mmap-lld/mmap-lld.inc?h=fido#n3
Will fail for k2l and k2g...


> +DEPENDS_append_k2hk-evm += "hyplnk-lld srio-lld"
> +DEPENDS_append_k2e-evm += "hyplnk-lld"
> +
> +RDEPENDS_${PN} = "syslog-ng"
> +
> +PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
>  SRC_URI = "git://git.ti.com/keystone-linux/mpm-transport.git;protocol=git;branch=${BRANCH}"
>  
> -BRANCH = "master"
> -# This commit corresponds to tag DEV.MPM-TRANSPORT-01.00.08.03
> -SRCREV = "f6c5426d68c2be832903b6d215370c94e134167f"
> +BRANCH = "linux41"
> +# This commit corresponds to tag DEV.MPM-TRANSPORT-02.00.00.00_ENG
> +SRCREV = "892e93238b7f9f480ddceb7ade042026a4d178bd"
>  
> -PV = "1.0.8.3"
> -PR = "r1"
> +PV = "2.0.0.0"
> +PR = "r0"
> +
> +EXTRA_OEMAKE = "PDK_INSTALL_PATH=${STAGING_INCDIR}"
> +EXTRA_OEMAKE_append_k2hk-evm += "HYPLNK_TRANSPORT=true SRIO_TRANSPORT=true"
> +EXTRA_OEMAKE_append_k2e-evm += "HYPLNK_TRANSPORT=true"
>  
>  S = "${WORKDIR}/git"
>  
> @@ -25,13 +36,8 @@ FILES_${PN}-test = "${bindir}/mpm_transport_test.out \
>  					${bindir}/mpm_transport_qmss_arm_mt.out \
>  					${bindir}/mpm_transport_srio_arm_mt.out"
>  
> -do_compile () {
> -	cd ${S}
> -	make PDK_INSTALL_PATH=${STAGING_INCDIR}
> -}
> -
>  do_install() {
> -	make installbin BASE_DIR=${S} INSTALL_BIN_BASE_DIR=${D}/${bindir}
> +	oe_runmake installbin BASE_DIR=${S} INSTALL_BIN_BASE_DIR=${D}/${bindir}
>  
>  	install -d ${D}${includedir}/
>  	install -c -m 755 ${S}/include/* ${D}${includedir}/
> -- 
> 1.9.1
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

