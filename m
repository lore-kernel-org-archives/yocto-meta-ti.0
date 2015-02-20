Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id F2BEBE002F9; Fri, 20 Feb 2015 09:25:30 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9C084E00289
	for <meta-ti@yoctoproject.org>; Fri, 20 Feb 2015 09:25:27 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t1KHPRXZ009553
	for <meta-ti@yoctoproject.org>; Fri, 20 Feb 2015 11:25:27 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t1KHPQf9004637
	for <meta-ti@yoctoproject.org>; Fri, 20 Feb 2015 11:25:26 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 20 Feb 2015 11:25:26 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t1KHPPgj018584;
	Fri, 20 Feb 2015 11:25:26 -0600
Date: Fri, 20 Feb 2015 12:25:22 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20150220172522.GJ31287@edge>
References: <1423150109-9436-1-git-send-email-j-stiffler@ti.com>
	<1423150109-9436-2-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
In-Reply-To: <1423150109-9436-2-git-send-email-j-stiffler@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH v2 2/2] ti-cgt6x: Add verion 8.0.0
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
X-List-Received-Date: Fri, 20 Feb 2015 17:25:31 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Feb 05, 2015 at 10:28:29AM -0500, Jacob Stiffler wrote:
> * Supports native and nativesdk classes as well as target.
> 
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>  recipes-ti/devtools/ti-cgt6x_8.0.0.bb |   88 +++++++++++++++++++++++++++++++++
>  1 file changed, 88 insertions(+)
>  create mode 100644 recipes-ti/devtools/ti-cgt6x_8.0.0.bb
> 
> diff --git a/recipes-ti/devtools/ti-cgt6x_8.0.0.bb b/recipes-ti/devtools/ti-cgt6x_8.0.0.bb
> new file mode 100644
> index 0000000..c56a629
> --- /dev/null
> +++ b/recipes-ti/devtools/ti-cgt6x_8.0.0.bb
> @@ -0,0 +1,88 @@
> +DESCRIPTION = "TI DSP Code Generation Tools"
> +HOMEPAGE = "https://www-a.ti.com/downloads/sds_support/TICodegenerationTools/download.htm"
> +LICENSE = "TI TSPA with portions under Thai Open Source Software Center & BSD-3-Clause & BSL-1.0 & Hewlett-Packard & AFL-3.0 and MIT and BSD-2-Clause and Public Domain and other similar"

^^^ This is a very strange license. Have you consulted with OSRB? Should "and" 
be replaced with "&" at the end?


> +
> +LIC_FILES_CHKSUM = "file://ti-cgt-c6000_${PV}/LICENSE.txt;md5=b6311962635a4f15630e36ec2d875eca"
> +LIC_FILES_CHKSUM_class-target = "file://usr/share/doc/ti/cgt-c6x/LICENSE.txt;md5=b6311962635a4f15630e36ec2d875eca"
> +
> +PE = "1"
> +
> +require ../includes/ti-unpack.inc
> +
> +BINFILE = "ti_cgt_c6000_${PV}_linux_installer_x86.bin"
> +BINFILE_NAME = "cgt6x_x86_installer"
> +TI_BIN_UNPK_ARGS = "--prefix ${S}"
> +TI_BIN_UNPK_CMDS = ""
> +
> +BINFILE_class-target = "ti_cgt_c6000_${PV}_armlinuxa8hf_busybox_installer.sh"
> +BINFILE_NAME_class-target = "cgt6x_arm_installer"

Now, since target portion is very ARM specific, would be nice to add this:

COMPATIBLE_HOST_class-target = "arm.*-linux"

Also, you may want to copy the anonymous function that checks for hardfp from 
libgles recipes. You might want to modify it to only check the target case 
though, to not block native and nativesdk cases... Let me know if you have any 
issues here.


> +SRC_URI = "http://software-dl.ti.com/codegen/esd/cgt_public_sw/C6000/Production/${PV}/${BINFILE};name=${BINFILE_NAME}"
> +
> +SRC_URI[cgt6x_x86_installer.md5sum] = "ff83845672090bf0a669bba7b0cadf56"
> +SRC_URI[cgt6x_x86_installer.sha256sum] = "297f77a00b211b3c4afa23afe7319e98b2400b5d2eb0f8c8cfe3ef7d7aa4d709"
> +
> +SRC_URI[cgt6x_arm_installer.md5sum] = "13961e5a1da4c310ea8c8707ab981fff"
> +SRC_URI[cgt6x_arm_installer.sha256sum] = "cb24ae05baffbd44d6dedba68743be09fd883e04403e069c437c486533d8fffb"
> +
> +do_install() {
> +    install -d ${D}${bindir}
> +    for binfile in ${S}/ti-cgt-c6000_${PV}/bin/*; do
> +        install -m 755 ${binfile} ${D}${bindir}
> +    done
> +
> +    install -d ${D}${datadir}/ti/cgt-c6x/include
> +    for includefile in ${S}/ti-cgt-c6000_${PV}/include/*; do
> +        install -m 644 ${includefile} ${D}${datadir}/ti/cgt-c6x/include
> +    done
> +
> +    install -d ${D}${datadir}/ti/cgt-c6x/lib
> +    for libfile in ${S}/ti-cgt-c6000_${PV}/lib/*.a; do
> +        install -m 644 ${libfile} ${D}${datadir}/ti/cgt-c6x/lib
> +    done
> +
> +    for libfile in ${S}/ti-cgt-c6000_${PV}/lib/*.cmd; do
> +        install -m 644 ${libfile} ${D}${datadir}/ti/cgt-c6x/lib
> +    done
> +
> +    for libfile in ${S}/ti-cgt-c6000_${PV}/lib/*.lib; do
> +        install -m 644 ${libfile} ${D}${datadir}/ti/cgt-c6x/lib
> +    done
> +
> +    install -d ${D}${datadir}/ti/cgt-c6x/lib/src
> +    for srcfile in ${S}/ti-cgt-c6000_${PV}/lib/src/*; do
> +        install -m 644 ${srcfile} ${D}${datadir}/ti/cgt-c6x/lib/src
> +    done
> +
> +    install -d ${D}${datadir}/man/man1
> +    for manfile in ${S}/ti-cgt-c6000_${PV}/man/man1/*; do
> +        install -m 644 ${manfile} ${D}${datadir}/man/man1
> +    done
> +
> +    install -d ${D}${datadir}/doc/ti/cgt-c6x
> +    for docfile in ${S}/ti-cgt-c6000_${PV}/*.txt; do
> +        install -m 644 ${docfile} ${D}${datadir}/doc/ti/cgt-c6x
> +    done
> +
> +    for docfile in ${S}/ti-cgt-c6000_${PV}/*.htm; do
> +        install -m 644 ${docfile} ${D}${datadir}/doc/ti/cgt-c6x
> +    done
> +
> +    for docfile in ${S}/ti-cgt-c6000_${PV}/*.spdx; do
> +        install -m 644 ${docfile} ${D}${datadir}/doc/ti/cgt-c6x
> +    done
> +
> +    for docfile in ${S}/ti-cgt-c6000_${PV}/doc/*; do
> +        install -m 644 ${docfile} ${D}${datadir}/doc/ti/cgt-c6x
> +    done
> +
> +}
> +
> +do_install_class-target() {
> +    ${WORKDIR}/${BINFILE} --prefix ${D}
> +}
> +
> +FILES_${PN} += "${datadir}/ti/*"
> +
> +BBCLASSEXTEND = "native nativesdk"
> +
> -- 
> 1.7.9.5
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

