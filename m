Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6D8EFE008A7; Wed, 21 Jan 2015 12:37:18 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.41 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7C3F4E0084E
	for <meta-ti@yoctoproject.org>; Wed, 21 Jan 2015 12:37:06 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t0LKb6MS016304
	for <meta-ti@yoctoproject.org>; Wed, 21 Jan 2015 14:37:06 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t0LKb5El011252
	for <meta-ti@yoctoproject.org>; Wed, 21 Jan 2015 14:37:06 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 21 Jan 2015 14:37:05 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t0LKb5CM014062;
	Wed, 21 Jan 2015 14:37:05 -0600
Date: Wed, 21 Jan 2015 15:37:04 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Sam Nelson <sam.nelson@ti.com>
Message-ID: <20150121203704.GH21328@edge>
References: <1421434233-395-1-git-send-email-sam.nelson@ti.com>
MIME-Version: 1.0
In-Reply-To: <1421434233-395-1-git-send-email-sam.nelson@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] ti-softhsmv2: Add recipe for ti customised softhsm package
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
X-List-Received-Date: Wed, 21 Jan 2015 20:37:18 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Jan 16, 2015 at 01:50:33PM -0500, Sam Nelson wrote:
> - Provide library, deamon and util for ti customised softhsm
> 
> Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> ---
>  recipes-ti/ti-softhsmv2/ti-softhsmv2_git.bb |   44 +++++++++++++++++++++++++++
>  1 file changed, 44 insertions(+)
>  create mode 100644 recipes-ti/ti-softhsmv2/ti-softhsmv2_git.bb
> 
> diff --git a/recipes-ti/ti-softhsmv2/ti-softhsmv2_git.bb b/recipes-ti/ti-softhsmv2/ti-softhsmv2_git.bb
> new file mode 100644
> index 0000000..fef6500
> --- /dev/null
> +++ b/recipes-ti/ti-softhsmv2/ti-softhsmv2_git.bb
> @@ -0,0 +1,44 @@
> +DESCRIPTION = "TI softhsmv2 package"
> +LICENSE = "BSD-2-Clause | BSD-3-Clause | Others"

Can you clarify the license here? It doesn't seem right.


> +LIC_FILES_CHKSUM = "file://LICENSE;md5=55144a048ba54f211a1aaa38c7fd2424"
> +SECTION = "libs"
> +PRIORITY = "optional"

There's no PRIORITY field anymore, drop it.


> +
> +mntdir = "/mnt"
> +
> +inherit autotools pkgconfig
> +
> +DEPENDS = "openssl libdaemon"
> +COMPATIBLE_MACHINE = "(tci6614-evm|keystone)"
> +
> +BRANCH="master"
> +SRC_URI = "git://git.ti.com/keystone-linux/ti-softhsmv2.git;protocol=git;branch=${BRANCH}"
> +#Following commit corresponds to tag DEV.SOFTHSM-01.03.00.01
> +SRCREV = "c79d93ac2a326567a7245dda1b903ef340b5650c"
> +PV = "1.3.0.1"
> +
> +S = "${WORKDIR}/git"
> +
> +CFLAGS += " -mno-unaligned-access"
> +CPPFLAGS += " -mno-unaligned-access"
> +
> +INITSCRIPT_NAME = "softhsm-daemon.sh"
> +INITSCRIPT_PARAMS = "defaults 10"
> +
> +inherit update-rc.d
> +
> +SELECTED_OPTIMIZATION := "${@d.getVar("SELECTED_OPTIMIZATION", True).replace("-O2", "-O3")}"
> +SELECTED_OPTIMIZATION := "${@d.getVar("SELECTED_OPTIMIZATION", True).replace("-ggdb2", "")}"
> +
> +FILES_${PN} += "${libdir}/softhsm/lib*.so.* ${mntdir}/*"
> +FILES_${PN}-dbg += "${libdir}/softhsm/.debug"
> +FILES_${PN}-staticdev += "${libdir}/softhsm/*.a "
> +FILES_${PN}-dev += "${libdir}/softhsm/*.la ${libdir}/softhsm/lib*.so"
> +
> +do_install_append() {
> +	install -d ${D}${mntdir}/securedbv0
> +	install -d ${D}${mntdir}/securedbv1
> +
> +	install -d ${D}${sysconfdir}/init.d/
> +	install -c -m 755 ${S}/src/bin/daemon/softhsm-daemon.sh ${D}${sysconfdir}/init.d/${INITSCRIPT_NAME}
> +}
> -- 
> 1.7.9.5
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

