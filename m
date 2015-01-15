Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2F13EE008CD; Wed, 14 Jan 2015 18:22:25 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 938F1E003E3
	for <meta-ti@yoctoproject.org>; Wed, 14 Jan 2015 18:22:17 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t0F2MGfZ028643
	for <meta-ti@yoctoproject.org>; Wed, 14 Jan 2015 20:22:16 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t0F2MGaX007301
	for <meta-ti@yoctoproject.org>; Wed, 14 Jan 2015 20:22:16 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 14 Jan 2015 20:22:16 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t0F2MGAe004851;
	Wed, 14 Jan 2015 20:22:16 -0600
Date: Wed, 14 Jan 2015 21:22:15 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Sam Nelson <sam.nelson@ti.com>
Message-ID: <20150115022215.GO4759@edge>
References: <1421189057-5330-1-git-send-email-sam.nelson@ti.com>
MIME-Version: 1.0
In-Reply-To: <1421189057-5330-1-git-send-email-sam.nelson@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] demo-image-proc: Add recipe for TI Image processing demo for keystone 2
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
X-List-Received-Date: Thu, 15 Jan 2015 02:22:25 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

This probably belongs to meta-arago...


On Tue, Jan 13, 2015 at 05:44:17PM -0500, Sam Nelson wrote:
> - Provides Binaries for Image processing demo
> - Demo Plugs into Matrix gui
> 
> Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> ---
>  recipes-ti/demo-image-proc/demo-image-proc_git.bb |   32 +++++++++++++++++++++
>  1 file changed, 32 insertions(+)
>  create mode 100644 recipes-ti/demo-image-proc/demo-image-proc_git.bb
> 
> diff --git a/recipes-ti/demo-image-proc/demo-image-proc_git.bb b/recipes-ti/demo-image-proc/demo-image-proc_git.bb
> new file mode 100644
> index 0000000..60b5d17
> --- /dev/null
> +++ b/recipes-ti/demo-image-proc/demo-image-proc_git.bb
> @@ -0,0 +1,32 @@
> +DESCRIPTION = "TI Image Processing Demo for KeyStone 2"
> +HOMEPAGE = "http://git.ti.com/cgit/cgit.cgi/keystone-demos/image-proc.git"
> +LICENSE = "BSD & MIT"
> +LIC_FILES_CHKSUM = "file://Makefile;beginline=1;endline=29;md5=ada2acff673fad7c53cbfd2598525f2a"
> +SECTION = "console"
> +COMPATIBLE_MACHINE = "keystone"
> +
> +DEPENDS = "ti-ipc"
> +
> +BRANCH = "master"
> +SRC_URI = "git://git.ti.com/keystone-demos/image-proc.git;protocol=git;branch=${BRANCH}"
> +#Commit corresponds to DEV.DEMO_IMAGE_PROC-01.00.00.01
> +SRCREV = "1745725128929f6d57a3e8e8ed0ca02fe4b28b51"
> +PV = "1.0.0.1"
> +
> +S = "${WORKDIR}/git"
> +
> +MATRIX_BASE_DIR = "${datadir}/matrix-gui-2.0"
> +MATRIX_WEB_DIR = "${MATRIX_BASE_DIR}"
> +MATRIX_APP_DIR = "${MATRIX_WEB_DIR}/apps"
> +MATRIX_IPD_DIR = "${MATRIX_APP_DIR}/demo_imageproc"
> +MATRIX_CGI_DIR = "${MATRIX_IPD_DIR}/cgi-bin"
> +
> +FILES_${PN} = "${MATRIX_IPD_DIR}/demo_imageproc.html"
> +FILES_${PN} += "${MATRIX_CGI_DIR}/image_processing_master.out"
> +
> +do_install() {
> +	install -d ${D}${MATRIX_IPD_DIR}
> +	install -d ${D}${MATRIX_CGI_DIR}
> +	install -c -m 755 ${S}/ipc/master/image_processing_master.out ${D}${MATRIX_CGI_DIR}
> +	install -c -m 755 ${S}/webpage/demo_imageproc.html ${D}${MATRIX_IPD_DIR}
> +}
> -- 
> 1.7.9.5
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

