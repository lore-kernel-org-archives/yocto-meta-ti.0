Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 27684E00824; Thu, 29 Jan 2015 17:49:54 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 49D34E00782
	for <meta-ti@yoctoproject.org>; Thu, 29 Jan 2015 17:49:52 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t0U1npS3012334
	for <meta-ti@yoctoproject.org>; Thu, 29 Jan 2015 19:49:51 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t0U1noSm003961
	for <meta-ti@yoctoproject.org>; Thu, 29 Jan 2015 19:49:50 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 29 Jan 2015 19:49:49 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t0U1nnCW032659;
	Thu, 29 Jan 2015 19:49:50 -0600
Date: Thu, 29 Jan 2015 20:49:49 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Sam Nelson <sam.nelson@ti.com>
Message-ID: <20150130014949.GD21328@edge>
References: <1422566008-4449-1-git-send-email-sam.nelson@ti.com>
MIME-Version: 1.0
In-Reply-To: <1422566008-4449-1-git-send-email-sam.nelson@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] udma: Add recipe for user space library for udma kernel driver
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
X-List-Received-Date: Fri, 30 Jan 2015 01:49:54 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Jan 29, 2015 at 04:13:28PM -0500, Sam Nelson wrote:
> - Provides zero copy access from user-space to packet dma channels
>   via udma kernel driver
> 
> Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> ---
>  recipes-ti/udma/udma_git.bb |   29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
>  create mode 100644 recipes-ti/udma/udma_git.bb
> 
> diff --git a/recipes-ti/udma/udma_git.bb b/recipes-ti/udma/udma_git.bb
> new file mode 100644
> index 0000000..0578647
> --- /dev/null
> +++ b/recipes-ti/udma/udma_git.bb
> @@ -0,0 +1,29 @@
> +DESCRIPTION = "Provides zero copy access from user-space to packet dma channels via udma kernel driver"
> +LICENSE = "BSD-3-Clause"
> +
> +COMPATIBLE_MACHINE = "keystone"
> +LIC_FILES_CHKSUM = "file://include/udma.h;startline=1;endline=39;md5=ba3c7f91f970afe073b759ced61d0f27"
> +
> +BRANCH = "master"
> +SRC_URI = "git://git.ti.com/keystone-linux/udma.git;protocol=git;branch=${BRANCH}"
> +S = "${WORKDIR}/git"
> +# Commit corresponds to UDMA.01.00.00.00
> +SRCREV = "53d09fb0bc98c41c5eb43623097e363c497d6fd8"
> +
> +PACKAGES =+ "${PN}-test"
> +
> +FILES_${PN}-test = "${bindir}/udma_test"
> +
> +do_install_append() {
> +	install -d ${D}${bindir}/
> +	install -d ${D}${libdir}/
> +	install -d ${D}${includedir}/
> +	install -c -m 755 ${S}/udma_test ${D}${bindir}/
> +	install -c -m 755 ${S}/libudma.a ${D}${libdir}/
> +	install -c -m 755 ${S}/libudma.so ${D}${libdir}/
> +	cd ${D}${libdir}/
> +	mv libudma.so libudma.so.1.0.0

Can you make it w/o "mv"? You can install libudma.so directly into .so.1.0.0 
and then do the symlinking.


> +	ln -sf libudma.so.1.0.0 libudma.so.1
> +	ln -sf libudma.so.1.0.0 libudma.so
> +	install -c -m 755 ${S}/include/* ${D}${includedir}/
> +}
> -- 
> 1.7.9.5
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

