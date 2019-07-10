Return-Path: <raj.khem@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3F2FFE00D68; Tue,  9 Jul 2019 21:11:28 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (raj.khem[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.160.194 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1AFA2E00C46
	for <meta-ti@yoctoproject.org>; Tue,  9 Jul 2019 21:11:26 -0700 (PDT)
Received: by mail-qt1-f194.google.com with SMTP id j19so977521qtr.12
	for <meta-ti@yoctoproject.org>; Tue, 09 Jul 2019 21:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=DhTH9CfYGUsN2sru0oNCa4qoCtgrJcCrSLAWio2THFg=;
	b=QFmQU4PbjWHnvjkNVESLFPVN4DVONnoI+n1Vh5k0uoBvOs2MqUT1f4XNLknlO7CRLF
	nt8FLAS8AUS/v9dqnY8nkIVDlsFGMVuQdVDqtiqxbBgyt6jrLXd5cyae/hUhHRhCp2cu
	Cx2RjNE6fNid0gS4Ue1Yu/v9phgW9H7Nc1iFama2PoBfyM5ax8RMZgByOgTQP2oMqgmM
	DwMlzzx7f4mJrVv1vWUiznWXRtLi3IKsI1Jp7g3rxV9NmNrbmKE6ZocBzRr80MMuVR+K
	TV1+Fafp2GNstl/WLzHdWqqqjyQDY1rMMIHPmazIc7qsLxnqWt6pX3P5M2QVgs13GI7p
	niSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=DhTH9CfYGUsN2sru0oNCa4qoCtgrJcCrSLAWio2THFg=;
	b=crxGVgCqApziGL7Yuk2dsKL93/TblwNGAXPm6bD8bPuEvwSISIH9tvIn4ccTHzgXgp
	NF4Ja+xafW0i8a86YNKMLYfR5whbglzWL+vHt2n6zmZzm6MXzjmdZL5OlwzCtbkYWSOq
	zUJuXBPnfr2K7BXnFU2ySoflCtaTI4ADFfcG6k5Xh66hsLoXmbq4bV+PUvQhBPGbf2+n
	nw6k91LYUkUKC/8ur4ARLMxDXIaTpho+ps4/7hdfEvuMEFaxUNW2a26Nj6c8ckp+546+
	4cHoAvyanZvd/RJTvIwYTtrnsZaEBFHvXlLwmbfpPWU4K/W/qP8wn5HD/q9/mgrv+2K3
	BWiw==
X-Gm-Message-State: APjAAAXeLQsC77D1QXsoFDM+jsxkiN2ittY5zwPhetifFyeNno9rBk14
	q9pTwgMS8p3VAFIYsA5C2GyC8oqc7BFxKAFWyU8=
X-Google-Smtp-Source: APXvYqyyntERWJhweDzKF18Z/Hg3KTQsVrU/5nVJWkR+qTL2fqFtOkkXNC9WbS7LCkF0IqB8k+DtYExq81L/GvZ3WGk=
X-Received: by 2002:ac8:764f:: with SMTP id i15mr16284451qtr.194.1562731886040;
	Tue, 09 Jul 2019 21:11:26 -0700 (PDT)
MIME-Version: 1.0
References: <1562316898-151844-1-git-send-email-nikhil.nd@ti.com>
In-Reply-To: <1562316898-151844-1-git-send-email-nikhil.nd@ti.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 9 Jul 2019 21:11:11 -0700
Message-ID: <CAMKF1sqXKij3hBmMfs-AZ9inZ99N7ojqk8RPGkNNP0UVi5LySA@mail.gmail.com>
To: Nikhil Devshatwar <nikhil.nd@ti.com>
Cc: meta-ti@yoctoproject.org, karthik.ramanan@ti.com
Subject: Re: [thud PATCH v1] jailhouse: add recipe for Jailhouse module, FW, cells, inmates and basic demo
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
X-List-Received-Date: Wed, 10 Jul 2019 04:11:28 -0000
Content-Type: text/plain; charset="UTF-8"

Can we make this arm specific or ti soc specific whatever is relevant ?

This fails to build for mips arch see

https://errors.yoctoproject.org/Errors/Details/251212/

On Fri, Jul 5, 2019 at 1:57 AM Nikhil Devshatwar <nikhil.nd@ti.com> wrote:
>
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
>  recipes-bsp/jailhouse/jailhouse-arch.inc           |  20 +++
>  .../jailhouse/0001-Makefile-fixes-for-yocto.patch  |  84 ++++++++++++
>  recipes-bsp/jailhouse/jailhouse_git.bb             | 144 +++++++++++++++++++++
>  3 files changed, 248 insertions(+)
>  create mode 100644 recipes-bsp/jailhouse/jailhouse-arch.inc
>  create mode 100644 recipes-bsp/jailhouse/jailhouse/0001-Makefile-fixes-for-yocto.patch
>  create mode 100644 recipes-bsp/jailhouse/jailhouse_git.bb
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
> diff --git a/recipes-bsp/jailhouse/jailhouse/0001-Makefile-fixes-for-yocto.patch b/recipes-bsp/jailhouse/jailhouse/0001-Makefile-fixes-for-yocto.patch
> new file mode 100644
> index 0000000..3f71761
> --- /dev/null
> +++ b/recipes-bsp/jailhouse/jailhouse/0001-Makefile-fixes-for-yocto.patch
> @@ -0,0 +1,84 @@
> +From a079feba07435c73b294202fb56b2d425d107ca5 Mon Sep 17 00:00:00 2001
> +From: Nikhil Devshatwar <nikhil.nd@ti.com>
> +Date: Fri, 5 Jul 2019 13:35:25 +0530
> +Subject: [PATCH] Makefile fixes for yocto
> +
> +Fix some LDFLAG in the toplevel Kbuild
> +
> +Avoid building and installing tools.
> +It has many dependencies on python, pyjailhouse, man pages,
> +bash completion, etc
> +
> +Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
> +---
> + Kbuild         | 2 +-
> + Makefile       | 4 ----
> + tools/Makefile | 8 ++++----
> + 3 files changed, 5 insertions(+), 9 deletions(-)
> +
> +diff --git a/Kbuild b/Kbuild
> +index 7cbde52..054e068 100644
> +--- a/Kbuild
> ++++ b/Kbuild
> +@@ -51,7 +51,7 @@ GEN_PCI_DEFS_PY := $(obj)/pyjailhouse/pci_defs.py
> + $(GEN_PCI_DEFS_PY): $(src)/scripts/gen_pci_defs.sh
> +       $(call if_changed,gen_pci_defs)
> +
> +-subdir-y := driver hypervisor configs inmates tools
> ++subdir-y := driver hypervisor configs inmates
> +
> + subdir-ccflags-y := -Werror
> +
> +diff --git a/Makefile b/Makefile
> +index 7401739..546be35 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -53,10 +53,6 @@ tool_inmates_install: $(DESTDIR)$(libexecdir)/jailhouse
> +       $(INSTALL_DATA) inmates/tools/$(ARCH)/*.bin $<
> +
> + install: modules_install firmware_install tool_inmates_install
> +-      $(Q)$(MAKE) -C tools $@ src=.
> +-ifeq ($(strip $(PYTHON_PIP_USABLE)), yes)
> +-      $(PIP) install --upgrade --force-reinstall $(PIP_ROOT) .
> +-endif
> +
> + .PHONY: modules_install install clean firmware_install modules tools docs \
> +       docs_clean
> +diff --git a/tools/Makefile b/tools/Makefile
> +index 08fd361..b5c117d 100644
> +--- a/tools/Makefile
> ++++ b/tools/Makefile
> +@@ -23,7 +23,6 @@ KBUILD_CFLAGS := -g -O3 -DLIBEXECDIR=\"$(libexecdir)\" \
> +       -D__LINUX_COMPILER_TYPES_H \
> +       -DJAILHOUSE_VERSION=\"$(shell cat $(src)/../VERSION)\" $(EXTRA_CFLAGS)
> + # prior to 4.19
> +-LDFLAGS :=
> + # since 4.19
> + KBUILD_LDFLAGS :=
> +
> +@@ -101,7 +100,7 @@ endef
> + targets += jailhouse.o
> +
> + $(obj)/jailhouse: $(obj)/jailhouse.o
> +-      $(call if_changed,ld)
> ++      $(LD) $(LDFLAGS) -o $@ $^
> +
> + CFLAGS_jailhouse-gcov-extract.o       := -I$(src)/../hypervisor/include \
> +       -I$(src)/../hypervisor/arch/$(SRCARCH)/include
> +@@ -112,10 +111,11 @@ targets += jailhouse-gcov-extract.o
> + always += jailhouse-gcov-extract
> +
> + $(obj)/jailhouse-gcov-extract: $(obj)/jailhouse-gcov-extract.o
> +-      $(call if_changed,ld)
> ++      $(LD) $(LDFLAGS) -o $@ $^
> +
> + $(obj)/jailhouse-config-collect: $(src)/jailhouse-config-create $(src)/jailhouse-config-collect.tmpl
> +-      $(call if_changed,gen_collect)
> ++      $< -g $@; \
> ++      chmod +x $@
> +
> + targets += $(MAN8_PAGES)
> + always +=  $(MAN8_PAGES)
> +--
> +2.7.4
> +
> diff --git a/recipes-bsp/jailhouse/jailhouse_git.bb b/recipes-bsp/jailhouse/jailhouse_git.bb
> new file mode 100644
> index 0000000..78eb801
> --- /dev/null
> +++ b/recipes-bsp/jailhouse/jailhouse_git.bb
> @@ -0,0 +1,144 @@
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
> +    file://0001-Makefile-fixes-for-yocto.patch \
> +"
> +
> +DEPENDS = "virtual/kernel dtc-native python-mako-native python-mako make-native"
> +RDEPENDS_${PN} += "\
> +       python-curses\
> +       python-datetime\
> +       python-argparse\
> +       python-mmap\
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
> +       if [ -d ${STAGING_DIR_HOST}/${CELLCONF_DIR} ];
> +       then
> +               cp ${STAGING_DIR_HOST}/${CELLCONF_DIR}/*.c ${S}/configs/
> +       fi
> +
> +       cp -av ${JH_CONFIG} ${S}/include/jailhouse/config.h
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
> +       unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
> +       oe_runmake V=1 ARCH=${JH_ARCH} CROSS_COMPILE=${TARGET_PREFIX} KDIR=${STAGING_KERNEL_BUILDDIR} CC="${KERNEL_CC}" LD="${KERNEL_LD}"
> +}
> +
> +python __anonymous () {
> +       d.appendVarFlag('do_install', 'depends', ' virtual/kernel:do_deploy')
> +       initrd = d.getVar('INITRAMFS_IMAGE', True)
> +       if initrd:
> +               d.appendVarFlag('do_install', 'depends', ' ${INITRAMFS_IMAGE}:do_image_complete')
> +}
> +
> +do_install() {
> +       unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
> +       oe_runmake ARCH=${JH_ARCH} CROSS_COMPILE=${TARGET_PREFIX} KDIR=${STAGING_KERNEL_BUILDDIR} CC="${KERNEL_CC}" LD="${KERNEL_LD}" DESTDIR=${D} install
> +
> +       install -d ${D}${CELL_DIR}
> +       install -m 0644 ${B}/configs/${JH_ARCH}/${JH_CELL_FILES} ${D}${CELL_DIR}/
> +
> +       install -d ${D}${INMATES_DIR}
> +       install -m 0644 ${B}/inmates/demos/${JH_ARCH}/*.bin ${D}${INMATES_DIR}
> +
> +       install -d ${D}/boot
> +
> +       if [ -n "${JH_INMATE_DTB}" -a -n "${JH_LINUX_DEMO_CELL}" ]; then
> +               cd ${TOOLS_SRC_DIR}
> +
> +               echo "#! /bin/sh" > ${D}${JH_DATADIR}/linux-demo.sh
> +               echo "jailhouse enable ${CELL_DIR}/${JH_SYSCONFIG_CELL}" >> ${D}${JH_DATADIR}/linux-demo.sh
> +               ./jailhouse-cell-linux -w ${D}${JH_DATADIR}/${JH_INMATE_DTB} \
> +                       -a ${JH_ARCH} -c ${JH_CMDLINE} \
> +                       -d ../configs/${JH_ARCH}/dts/${JH_INMATE_DTB} \
> +                       ${D}${CELL_DIR}/${JH_LINUX_DEMO_CELL} \
> +                       ${DEPLOY_DIR_IMAGE}/Image \
> +                       | tr -cd '\11\12\15\40-\176' \
> +                       >> ${D}${JH_DATADIR}/linux-demo.sh
> +
> +               sed -i -e 's,^Modified device tree written.*,,g' ${D}${JH_DATADIR}/linux-demo.sh
> +               sed -i -e 's,\${D},,g' ${D}${JH_DATADIR}/linux-demo.sh
> +               sed -i -e 's, linux-loader.bin, ${JH_EXEC_DIR}/linux-loader.bin,g' ${D}${JH_DATADIR}/linux-demo.sh
> +               sed -i -e 's,\${DEPLOY_DIR_IMAGE},/boot,g' ${D}${JH_DATADIR}/linux-demo.sh
> +               sed -i -e '/^\s*$/d' ${D}${JH_DATADIR}/linux-demo.sh
> +               chmod +x ${D}${JH_DATADIR}/linux-demo.sh
> +       fi
> +}
> +
> +
> +PACKAGE_BEFORE_PN = "kernel-module-jailhouse"
> +FILES_${PN} = "${base_libdir}/firmware ${libexecdir} ${sbindir} ${JH_DATADIR} /boot"
> +
> +INSANE_SKIP_${PN} = "ldflags"
> +
> +KERNEL_MODULE_AUTOLOAD += "jailhouse"
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
> --
> 1.9.1
>
> --
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

