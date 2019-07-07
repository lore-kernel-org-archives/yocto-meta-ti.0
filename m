Return-Path: <nikhil.nd@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A3B8FE00D5D; Sun,  7 Jul 2019 07:00:57 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [198.47.23.248 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 13B76E00D53
	for <meta-ti@yoctoproject.org>; Sun,  7 Jul 2019 07:00:55 -0700 (PDT)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x67E0tf3028257
	for <meta-ti@yoctoproject.org>; Sun, 7 Jul 2019 09:00:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1562508055;
	bh=kL+wMcacrTYcALDzzQdujV2Mv/Dwhkq1Peq+A18Lr9s=;
	h=From:To:Subject:Date:References:In-Reply-To;
	b=vmSrYb9uRSsPd2CZAy8islYzuQLs+ZsRGni/beTeeoOJLGkU6O1WEKOG61vsDEZcF
	xEd+eQ9C51VOtsOD7gNgyGtc2GEkl33tLjB4jWnVEIhSlG8zLZqIQPR3/Vhf3g0Ykj
	DKOlOk7KkxEkryQMMd2WBufj/GxZS/QS/lTMHGeg=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x67E0tos057885
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Sun, 7 Jul 2019 09:00:55 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Sun, 7 Jul 2019 09:00:55 -0500
Received: from DFLE108.ent.ti.com ([fe80::c18:99ac:4a4:2ceb]) by
	DFLE108.ent.ti.com ([fe80::c18:99ac:4a4:2ceb%17]) with mapi id
	15.01.1713.004; Sun, 7 Jul 2019 09:00:55 -0500
From: "Devshatwar, Nikhil" <nikhil.nd@ti.com>
To: "Paul, Subhajit" <subhajit_paul@ti.com>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] [EXTERNAL] [ thud PATCH v2] jailhouse: add recipe for
	Jailhouse module, FW, cells, inmates and basic demo
Thread-Index: AQHVNKdBFzKSyfUqK0GLWJ2SkY2lqaa/LrBw
Date: Sun, 7 Jul 2019 14:00:55 +0000
Message-ID: <8e782511d83845469e528927fc0bde47@ti.com>
References: <1562339000-19082-1-git-send-email-nikhil.nd@ti.com>
	<5496bc2b-ec16-7645-4056-2235bc0854f7@ti.com>
In-Reply-To: <5496bc2b-ec16-7645-4056-2235bc0854f7@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.250.133.234]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
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
X-List-Received-Date: Sun, 07 Jul 2019 14:00:57 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



-----Original Message-----
From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-bounces@yoctoproject=
.org] On Behalf Of Paul, Subhajit
Sent: Sunday, July 7, 2019 3:04 PM
To: meta-ti@yoctoproject.org
Subject: Re: [meta-ti] [EXTERNAL] [ thud PATCH v2] jailhouse: add recipe fo=
r Jailhouse module, FW, cells, inmates and basic demo

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
>   recipes-bsp/jailhouse/jailhouse_git.bb   | 141 ++++++++++++++++++++++++=
+++++++
>   2 files changed, 161 insertions(+)
>   create mode 100644 recipes-bsp/jailhouse/jailhouse-arch.inc
>   create mode 100644 recipes-bsp/jailhouse/jailhouse_git.bb
>
> diff --git a/recipes-bsp/jailhouse/jailhouse-arch.inc b/recipes-bsp/jailh=
ouse/jailhouse-arch.inc
> new file mode 100644
> index 0000000..e06ec23
> --- /dev/null
> +++ b/recipes-bsp/jailhouse/jailhouse-arch.inc
> @@ -0,0 +1,20 @@
> +# Set jailhouse architecture JH_ARCH variable
> +#
> +# return value must match one of architectures supported by jailhouse
> +#
> +valid_jh_archs =3D "x86 arm"
> +
> +def map_jh_arch(a, d):
> +    import re
> +
> +    valid_jh_archs =3D d.getVar('valid_jh_archs', True).split()
> +
> +    if   re.match('(i.86|athlon|x86.64)$', a):  return 'x86'
> +    elif re.match('armeb$', a):                 return 'arm'
> +    elif re.match('aarch64$', a):               return 'arm64'
> +    elif re.match('aarch64_be$', a):            return 'arm64'
> +    elif a in valid_jh_archs:                   return a
> +    else:
> +        bb.error("cannot map '%s' to a jailhouse supported architecture"=
 % a)
> +
> +export JH_ARCH =3D "${@map_jh_arch(d.getVar('TARGET_ARCH', True), d)}"
> diff --git a/recipes-bsp/jailhouse/jailhouse_git.bb b/recipes-bsp/jailhou=
se/jailhouse_git.bb
> new file mode 100644
> index 0000000..18b984f
> --- /dev/null
> +++ b/recipes-bsp/jailhouse/jailhouse_git.bb
> @@ -0,0 +1,141 @@
> +SUMMARY =3D "Linux-based partitioning hypervisor"
> +DESCRIPTION =3D "Jailhouse is a partitioning Hypervisor based on Linux. =
It is able to run bare-metal applications or (adapted) \
> +operating systems besides Linux. For this purpose, it configures CPU and=
 device virtualization features of the hardware \
> +platform in a way that none of these domains, called 'cells' here, can i=
nterfere with each other in an unacceptable way."
> +HOMEPAGE =3D "https://github.com/siemens/jailhouse"
> +SECTION =3D "jailhouse"
> +LICENSE =3D "GPL-2.0 & BSD-2-Clause"
> +
> +LIC_FILES_CHKSUM =3D " \
> +    file://COPYING;md5=3D9fa7f895f96bde2d47fd5b7d95b6ba4d \
> +"
> +
> +PV =3D "0.10+git${SRCPV}"
> +SRCREV =3D "5c6aa2b78c6485e9455d9d1441df3d695e1a8b4e"
> +BRANCH =3D "ti-jailhouse-0.10"
> +
> +SRC_URI =3D " \
> +    git://git.ti.com/jailhouse/ti-jailhouse.git;protocol=3Dgit;branch=3D=
${BRANCH} \
> +"
> +
> +DEPENDS =3D "virtual/kernel dtc-native python-mako-native python-mako ma=
ke-native"
> +RDEPENDS_${PN} +=3D "\
> +	python-curses\
> +	python-datetime\
> +	python-argparse\
> +	python-mmap\
> +"
> +
> +S =3D "${WORKDIR}/git"
> +
> +require jailhouse-arch.inc
> +inherit module pythonnative bash-completion deploy
> +
> +PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> +
> +JH_DATADIR ?=3D "${datadir}/jailhouse"
> +JH_EXEC_DIR ?=3D "${libexecdir}/jailhouse"
> +CELL_DIR ?=3D "${JH_DATADIR}/cells"
> +CELLCONF_DIR ?=3D "${JH_DATADIR}/configs"
> +INMATES_DIR ?=3D "${JH_DATADIR}/inmates"
> +
> +JH_CONFIG ?=3D "${S}/ci/jailhouse-config-x86.h"
> +JH_CONFIG_k3 ?=3D "${S}/ci/jailhouse-config-k3.h"
> +
> +JH_CELL_FILES ?=3D "*.cell"
> +JH_CELL_FILES_k3 ?=3D "k3-*.cell"
> +
> +JH_INMATE_DTB ?=3D ""
> +JH_INMATE_DTB_am65xx-evm ?=3D "inmate-k3-am654.dtb"
> +JH_INMATE_DTB_j7-evm ?=3D "inmate-k3-j721e-evm.dtb"
> +
> +JH_LINUX_DEMO_CELL ?=3D ""
> +JH_LINUX_DEMO_CELL_am65xx-evm ?=3D "k3-am654-linux-demo.cell"
> +JH_LINUX_DEMO_CELL_j7-evm ?=3D "k3-j721e-evm-linux-demo.cell"
> +
> +JH_SYSCONFIG_CELL ?=3D ""
> +JH_SYSCONFIG_CELL_am65xx-evm ?=3D "k3-am654.cell"
> +JH_SYSCONFIG_CELL_j7-evm ?=3D "k3-j721e-evm.cell"
> +
> +JH_CMDLINE ?=3D ""
> +JH_CMDLINE_k3 ?=3D "console=3DttyS1,115200n8 root=3D/dev/mmcblk0p2 rw ro=
otfstype=3Dext4 rootwait earlycon=3Dns16550a,mmio32,0x2810000"
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
> +USER_SPACE_CFLAGS =3D '${CFLAGS} -DLIBEXECDIR=3D\\\"${libexecdir}\\\" \
> +                    -DJAILHOUSE_VERSION=3D\\\"$JAILHOUSE_VERSION\\\" \
> +                    -Wall -Wextra -Wmissing-declarations -Wmissing-proto=
types -Werror \
> +                    -I../driver'
> +
> +TOOLS_SRC_DIR =3D "${S}/tools"
> +TOOLS_OBJ_DIR =3D "${S}/tools"
> +
> +do_compile() {
> +	oe_runmake V=3D1 ARCH=3D${JH_ARCH} CROSS_COMPILE=3D${TARGET_PREFIX} KDI=
R=3D${STAGING_KERNEL_BUILDDIR}
> +}
> +
> +python __anonymous () {
> +	d.appendVarFlag('do_install', 'depends', ' virtual/kernel:do_deploy')
> +	initrd =3D d.getVar('INITRAMFS_IMAGE', True)
> +	if initrd:
> +		d.appendVarFlag('do_install', 'depends', ' ${INITRAMFS_IMAGE}:do_image=
_complete')
> +}
> +
> +do_install() {
> +	oe_runmake ARCH=3D${JH_ARCH} CROSS_COMPILE=3D${TARGET_PREFIX} KDIR=3D${=
STAGING_KERNEL_BUILDDIR} DESTDIR=3D${D} install
> +
> +	install -d ${D}${CELL_DIR}
> +	install -m 0644 ${B}/configs/${JH_ARCH}/${JH_CELL_FILES} ${D}${CELL_DIR=
}/
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
> +		echo "jailhouse enable ${CELL_DIR}/${JH_SYSCONFIG_CELL}" >> ${D}${JH_D=
ATADIR}/linux-demo.sh
> +		./jailhouse-cell-linux -w ${D}${JH_DATADIR}/${JH_INMATE_DTB} \
> +			-a ${JH_ARCH} -c "${JH_CMDLINE}" \
> +			-d ../configs/${JH_ARCH}/dts/${JH_INMATE_DTB} \
> +			${D}${CELL_DIR}/${JH_LINUX_DEMO_CELL} \
> +			${DEPLOY_DIR_IMAGE}/Image \
> +			| tr -cd '\11\12\15\40-\176' \
> +			>> ${D}${JH_DATADIR}/linux-demo.sh
> +
> +		sed -i -e 's,^Modified device tree written.*,,g' ${D}${JH_DATADIR}/lin=
ux-demo.sh
> +		sed -i -e 's,\${D},,g' ${D}${JH_DATADIR}/linux-demo.sh
> +		sed -i -e 's, linux-loader.bin, ${JH_EXEC_DIR}/linux-loader.bin,g' ${D=
}${JH_DATADIR}/linux-demo.sh
> +		sed -i -e 's,\${DEPLOY_DIR_IMAGE},/boot,g' ${D}${JH_DATADIR}/linux-dem=
o.sh
> +		sed -i -e '/^\s*$/d' ${D}${JH_DATADIR}/linux-demo.sh
> +		chmod +x ${D}${JH_DATADIR}/linux-demo.sh
> +	fi
> +}
> +
> +
> +PACKAGE_BEFORE_PN =3D "kernel-module-jailhouse"
> +FILES_${PN} =3D "${base_libdir}/firmware ${libexecdir} ${sbindir} ${JH_D=
ATADIR} /boot"
> +
> +INSANE_SKIP_${PN} =3D "ldflags"
> +
> +KERNEL_MODULE_AUTOLOAD +=3D "jailhouse"

I think we should not autoload this.
This only autloads the kernel module, Jailhouse is not installed yet.
The Root cell Linux continues to run in non virtualized environment.

- Subhajit

> +
> +# Any extra cells/inmates from external recipes/packages
> +CELLS =3D ""
> +
> +python __anonymous () {
> +    # Setup DEPENDS and RDEPENDS to included cells"
> +    cells =3D d.getVar('CELLS', True) or ""
> +    for cell in cells.split():
> +        d.appendVar('DEPENDS', ' ' + cell)
> +        d.appendVar('RDEPENDS_${PN}', ' ' + cell)
> +}
--=20
_______________________________________________
meta-ti mailing list
meta-ti@yoctoproject.org
https://lists.yoctoproject.org/listinfo/meta-ti

