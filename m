Return-Path: <subhajit_paul@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 99E23E00D6C; Sun,  7 Jul 2019 02:34:42 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [198.47.23.249 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D4F80E00C40
	for <meta-ti@yoctoproject.org>; Sun,  7 Jul 2019 02:34:41 -0700 (PDT)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x679YfE3053786
	for <meta-ti@yoctoproject.org>; Sun, 7 Jul 2019 04:34:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1562492081;
	bh=Ky/UosqTeeh8Prly+sn326dr+OA0StRxlj5ET5RhSa4=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=aGYIDKcCPxYVVoROEylqTSR+GZbUtQDiyCFzKKDDW2RevT99/R3j6ravZB5QBLFQp
	QB8Hd/bt2uY3yRtltWEBCDeN+wxuK682RYa1tXMEvjN0O/b8jGGyeCDtEWcBf2XTvd
	UXnnOrV7F8lmJW12hoEmc13/zqdimv0+8swjxckA=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x679Yfn4067135
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Sun, 7 Jul 2019 04:34:41 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Sun, 7 Jul 2019 04:34:40 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE102.ent.ti.com
	(157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Sun, 7 Jul 2019 04:34:40 -0500
Received: from [172.24.145.210] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x679Yd7C082482
	for <meta-ti@yoctoproject.org>; Sun, 7 Jul 2019 04:34:40 -0500
To: <meta-ti@yoctoproject.org>
References: <1562339000-19082-1-git-send-email-nikhil.nd@ti.com>
From: Subhajit Paul <subhajit_paul@ti.com>
Message-ID: <5496bc2b-ec16-7645-4056-2235bc0854f7@ti.com>
Date: Sun, 7 Jul 2019 15:04:14 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1562339000-19082-1-git-send-email-nikhil.nd@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [ thud PATCH v2] jailhouse: add recipe for Jailhouse module, FW, cells, inmates and basic demo
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
X-List-Received-Date: Sun, 07 Jul 2019 09:34:42 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

On 05/07/19 8:33 PM, Nikhil Devshatwar wrote:
> From: Denys Dmytriyenko <denys@ti.com>
>
> Builds the Jailhouse kernel module, hypervisor binaries
> and all the cell configs for root cell and other demos.
> Generate the linux-demo loader script without initramfs.
>
> Supports am65x and j7-evm machines
>
> [nikhil.nd@ti.com: Update for public trees]
>
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
> ---
> Changes from v1:
> * Fix issues with building tools
> * Remove the makefile patch
>
>   recipes-bsp/jailhouse/jailhouse-arch.inc |  20 +++++
>   recipes-bsp/jailhouse/jailhouse_git.bb   | 141 +++++++++++++++++++++++++++++++
>   2 files changed, 161 insertions(+)
>   create mode 100644 recipes-bsp/jailhouse/jailhouse-arch.inc
>   create mode 100644 recipes-bsp/jailhouse/jailhouse_git.bb
>
> diff --git a/recipes-bsp/jailhouse/jailhouse-arch.inc b/recipes-bsp/jailhouse/jailhouse-arch.inc
> new file mode 100644
> index 0000000..e06ec23
> --- /dev/null
> +++ b/recipes-bsp/jailhouse/jailhouse-arch.inc
> @@ -0,0 +1,20 @@
> +# Set jailhouse architecture JH_ARCH variable
> +#
> +# return value must match one of architectures supported by jailhouse
> +#
> +valid_jh_archs = "x86 arm"
> +
> +def map_jh_arch(a, d):
> +    import re
> +
> +    valid_jh_archs = d.getVar('valid_jh_archs', True).split()
> +
> +    if   re.match('(i.86|athlon|x86.64)$', a):  return 'x86'
> +    elif re.match('armeb$', a):                 return 'arm'
> +    elif re.match('aarch64$', a):               return 'arm64'
> +    elif re.match('aarch64_be$', a):            return 'arm64'
> +    elif a in valid_jh_archs:                   return a
> +    else:
> +        bb.error("cannot map '%s' to a jailhouse supported architecture" % a)
> +
> +export JH_ARCH = "${@map_jh_arch(d.getVar('TARGET_ARCH', True), d)}"
> diff --git a/recipes-bsp/jailhouse/jailhouse_git.bb b/recipes-bsp/jailhouse/jailhouse_git.bb
> new file mode 100644
> index 0000000..18b984f
> --- /dev/null
> +++ b/recipes-bsp/jailhouse/jailhouse_git.bb
> @@ -0,0 +1,141 @@
> +SUMMARY = "Linux-based partitioning hypervisor"
> +DESCRIPTION = "Jailhouse is a partitioning Hypervisor based on Linux. It is able to run bare-metal applications or (adapted) \
> +operating systems besides Linux. For this purpose, it configures CPU and device virtualization features of the hardware \
> +platform in a way that none of these domains, called 'cells' here, can interfere with each other in an unacceptable way."
> +HOMEPAGE = "https://github.com/siemens/jailhouse"
> +SECTION = "jailhouse"
> +LICENSE = "GPL-2.0 & BSD-2-Clause"
> +
> +LIC_FILES_CHKSUM = " \
> +    file://COPYING;md5=9fa7f895f96bde2d47fd5b7d95b6ba4d \
> +"
> +
> +PV = "0.10+git${SRCPV}"
> +SRCREV = "5c6aa2b78c6485e9455d9d1441df3d695e1a8b4e"
> +BRANCH = "ti-jailhouse-0.10"
> +
> +SRC_URI = " \
> +    git://git.ti.com/jailhouse/ti-jailhouse.git;protocol=git;branch=${BRANCH} \
> +"
> +
> +DEPENDS = "virtual/kernel dtc-native python-mako-native python-mako make-native"
> +RDEPENDS_${PN} += "\
> +	python-curses\
> +	python-datetime\
> +	python-argparse\
> +	python-mmap\
> +"
> +
> +S = "${WORKDIR}/git"
> +
> +require jailhouse-arch.inc
> +inherit module pythonnative bash-completion deploy
> +
> +PACKAGE_ARCH = "${MACHINE_ARCH}"
> +
> +JH_DATADIR ?= "${datadir}/jailhouse"
> +JH_EXEC_DIR ?= "${libexecdir}/jailhouse"
> +CELL_DIR ?= "${JH_DATADIR}/cells"
> +CELLCONF_DIR ?= "${JH_DATADIR}/configs"
> +INMATES_DIR ?= "${JH_DATADIR}/inmates"
> +
> +JH_CONFIG ?= "${S}/ci/jailhouse-config-x86.h"
> +JH_CONFIG_k3 ?= "${S}/ci/jailhouse-config-k3.h"
> +
> +JH_CELL_FILES ?= "*.cell"
> +JH_CELL_FILES_k3 ?= "k3-*.cell"
> +
> +JH_INMATE_DTB ?= ""
> +JH_INMATE_DTB_am65xx-evm ?= "inmate-k3-am654.dtb"
> +JH_INMATE_DTB_j7-evm ?= "inmate-k3-j721e-evm.dtb"
> +
> +JH_LINUX_DEMO_CELL ?= ""
> +JH_LINUX_DEMO_CELL_am65xx-evm ?= "k3-am654-linux-demo.cell"
> +JH_LINUX_DEMO_CELL_j7-evm ?= "k3-j721e-evm-linux-demo.cell"
> +
> +JH_SYSCONFIG_CELL ?= ""
> +JH_SYSCONFIG_CELL_am65xx-evm ?= "k3-am654.cell"
> +JH_SYSCONFIG_CELL_j7-evm ?= "k3-j721e-evm.cell"
> +
> +JH_CMDLINE ?= ""
> +JH_CMDLINE_k3 ?= "console=ttyS1,115200n8 root=/dev/mmcblk0p2 rw rootfstype=ext4 rootwait earlycon=ns16550a,mmio32,0x2810000"
> +
> +do_configure() {
> +	if [ -d ${STAGING_DIR_HOST}/${CELLCONF_DIR} ];
> +	then
> +		cp ${STAGING_DIR_HOST}/${CELLCONF_DIR}/*.c ${S}/configs/
> +	fi
> +
> +	cp -av ${JH_CONFIG} ${S}/include/jailhouse/config.h
> +}
> +
> +USER_SPACE_CFLAGS = '${CFLAGS} -DLIBEXECDIR=\\\"${libexecdir}\\\" \
> +                    -DJAILHOUSE_VERSION=\\\"$JAILHOUSE_VERSION\\\" \
> +                    -Wall -Wextra -Wmissing-declarations -Wmissing-prototypes -Werror \
> +                    -I../driver'
> +
> +TOOLS_SRC_DIR = "${S}/tools"
> +TOOLS_OBJ_DIR = "${S}/tools"
> +
> +do_compile() {
> +	oe_runmake V=1 ARCH=${JH_ARCH} CROSS_COMPILE=${TARGET_PREFIX} KDIR=${STAGING_KERNEL_BUILDDIR}
> +}
> +
> +python __anonymous () {
> +	d.appendVarFlag('do_install', 'depends', ' virtual/kernel:do_deploy')
> +	initrd = d.getVar('INITRAMFS_IMAGE', True)
> +	if initrd:
> +		d.appendVarFlag('do_install', 'depends', ' ${INITRAMFS_IMAGE}:do_image_complete')
> +}
> +
> +do_install() {
> +	oe_runmake ARCH=${JH_ARCH} CROSS_COMPILE=${TARGET_PREFIX} KDIR=${STAGING_KERNEL_BUILDDIR} DESTDIR=${D} install
> +
> +	install -d ${D}${CELL_DIR}
> +	install -m 0644 ${B}/configs/${JH_ARCH}/${JH_CELL_FILES} ${D}${CELL_DIR}/
> +
> +	install -d ${D}${INMATES_DIR}
> +	install -m 0644 ${B}/inmates/demos/${JH_ARCH}/*.bin ${D}${INMATES_DIR}
> +
> +	install -d ${D}/boot
> +
> +	if [ -n "${JH_INMATE_DTB}" -a -n "${JH_LINUX_DEMO_CELL}" ]; then
> +		cd ${TOOLS_SRC_DIR}
> +
> +		echo "#! /bin/sh" > ${D}${JH_DATADIR}/linux-demo.sh
> +		echo "jailhouse enable ${CELL_DIR}/${JH_SYSCONFIG_CELL}" >> ${D}${JH_DATADIR}/linux-demo.sh
> +		./jailhouse-cell-linux -w ${D}${JH_DATADIR}/${JH_INMATE_DTB} \
> +			-a ${JH_ARCH} -c "${JH_CMDLINE}" \
> +			-d ../configs/${JH_ARCH}/dts/${JH_INMATE_DTB} \
> +			${D}${CELL_DIR}/${JH_LINUX_DEMO_CELL} \
> +			${DEPLOY_DIR_IMAGE}/Image \
> +			| tr -cd '\11\12\15\40-\176' \
> +			>> ${D}${JH_DATADIR}/linux-demo.sh
> +
> +		sed -i -e 's,^Modified device tree written.*,,g' ${D}${JH_DATADIR}/linux-demo.sh
> +		sed -i -e 's,\${D},,g' ${D}${JH_DATADIR}/linux-demo.sh
> +		sed -i -e 's, linux-loader.bin, ${JH_EXEC_DIR}/linux-loader.bin,g' ${D}${JH_DATADIR}/linux-demo.sh
> +		sed -i -e 's,\${DEPLOY_DIR_IMAGE},/boot,g' ${D}${JH_DATADIR}/linux-demo.sh
> +		sed -i -e '/^\s*$/d' ${D}${JH_DATADIR}/linux-demo.sh
> +		chmod +x ${D}${JH_DATADIR}/linux-demo.sh
> +	fi
> +}
> +
> +
> +PACKAGE_BEFORE_PN = "kernel-module-jailhouse"
> +FILES_${PN} = "${base_libdir}/firmware ${libexecdir} ${sbindir} ${JH_DATADIR} /boot"
> +
> +INSANE_SKIP_${PN} = "ldflags"
> +
> +KERNEL_MODULE_AUTOLOAD += "jailhouse"

I think we should not autoload this.

- Subhajit

> +
> +# Any extra cells/inmates from external recipes/packages
> +CELLS = ""
> +
> +python __anonymous () {
> +    # Setup DEPENDS and RDEPENDS to included cells"
> +    cells = d.getVar('CELLS', True) or ""
> +    for cell in cells.split():
> +        d.appendVar('DEPENDS', ' ' + cell)
> +        d.appendVar('RDEPENDS_${PN}', ' ' + cell)
> +}

