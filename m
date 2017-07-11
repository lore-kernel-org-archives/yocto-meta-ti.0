Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E9C66E00C35; Tue, 11 Jul 2017 04:17:41 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [198.47.19.16 listed in list.dnswl.org]
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AC0D5E00B31
	for <meta-ti@yoctoproject.org>; Tue, 11 Jul 2017 04:17:37 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v6BBHQwm030115
	for <meta-ti@yoctoproject.org>; Tue, 11 Jul 2017 06:17:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1499771846;
	bh=K49czuJ7JWPtJxAB8HmweWFsAq1YmBfP4QAapjPTaww=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=GhiH9P3DvdRKhUluK/TrRkxXYr9LKB9aLax8/DMDkaIgJMnX4b+Yj3mxkOH/I2CHq
	6/0hGhT1SyFqMztdsKF3FQfFHtLhuanPQUEEQY9U+Kju1V0JDLhM3P1pTmuw70L/me
	2N5QQD5MIHCKcWnm5xZlKPEK3tQMnomrZdFC/zXg=
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v6BBHLDn020484
	for <meta-ti@yoctoproject.org>; Tue, 11 Jul 2017 06:17:21 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 11 Jul 2017 06:17:21 -0500
Received: from [10.218.109.201] (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v6BBHLTO008381;
	Tue, 11 Jul 2017 06:17:21 -0500
To: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>, <meta-ti@yoctoproject.org>
References: <1499455017-44492-1-git-send-email-m-radhakrishnan2@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <c16df0cc-0f0c-6bd3-52eb-cf42fcd10a73@ti.com>
Date: Tue, 11 Jul 2017 07:17:21 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1499455017-44492-1-git-send-email-m-radhakrishnan2@ti.com>
Subject: Re: [PATCH] pm-lld-rtos: Adding rtos recipe for pm-lld
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
X-List-Received-Date: Tue, 11 Jul 2017 11:17:42 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Redefining "LIMSOCS" and "LIMBOARDS" was pointed out in a previous patch.

Please use TI_PDK_LIMIT_SOCS and TI_PDK_LIMIT_BOARDS as set in the 
machine configuration.


And please do not include ti-staging.inc, but take only the necessary 
configurations from this file.


On 7/7/2017 3:16 PM, Mahesh Radhakrishnan wrote:
> Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
> ---
>   recipes-bsp/pm-lld/pm-lld-rtos_git.bb | 105 ++++++++++++++++++++++++++++++++++
>   1 file changed, 105 insertions(+)
>   create mode 100644 recipes-bsp/pm-lld/pm-lld-rtos_git.bb
>
> diff --git a/recipes-bsp/pm-lld/pm-lld-rtos_git.bb b/recipes-bsp/pm-lld/pm-lld-rtos_git.bb
> new file mode 100644
> index 0000000..3aa7bda
> --- /dev/null
> +++ b/recipes-bsp/pm-lld/pm-lld-rtos_git.bb
> @@ -0,0 +1,105 @@
> +require recipes-ti/includes/ti-paths.inc
> +require recipes-ti/includes/ti-staging.inc
> +
> +LICENSE = "BSD-3-Clause"
> +LIC_FILES_CHKSUM = "file://Power.h;beginline=1;endline=31;md5=527b91fdcd26cd19ac07a754f45dedbe"
> +
> +COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|k2g"
> +PACKAGE_ARCH = "${MACHINE_ARCH}"
> +
> +PM_LLD_GIT_URI = "git://git.ti.com/keystone-rtos/pm-lld.git"
> +PM_LLD_GIT_PROTOCOL = "git"
> +PM_LLD_GIT_BRANCH = "int_pm_am335x"
> +PM_LLD_GIT_BRANCH_dra7xx-evm = "master"
> +PM_LLD_GIT_DESTSUFFIX = "git/ti/drv/pm"
> +
> +# Below commit ID corresponds to "DEV.PM_LLD.01.04.00.01"
> +PM_LLD_SRCREV = "c4908f94b3e655e6298aa9bfe9bbffbbc5d16111"
> +
> +# Below commit ID corresponds to "REL.PDK.TDA.01.07.00.06"
> +PM_LLD_SRCREV_dra7xx-evm = "46ea13503d2991f636197edb206a9f62cea398d4"
> +
> +BRANCH = "${PM_LLD_GIT_BRANCH}"
> +SRC_URI = "${PM_LLD_GIT_URI};destsuffix=${PM_LLD_GIT_DESTSUFFIX};protocol=${PM_LLD_GIT_PROTOCOL};branch=${BRANCH}"
> +
> +#PATCHTOOL = "git"
> +#SRC_URI_append = " \
> +#    file://.patch \
> +#"
> +
> +SRCREV = "${PM_LLD_SRCREV}"
> +PV = "01.04.00.01"
> +PR = "r0"
> +
> +S = "${WORKDIR}/${PM_LLD_GIT_DESTSUFFIX}"
> +
> +DEPENDS = " ti-sysbios \
> +            gcc-arm-none-eabi-native \
> +            osal-rtos \
> +            ca-certificates-native \
> +            ti-pdk-setup \
> +"
> +DEPENDS_append_omap-a15 = " ti-cgt-arm-native \
> +                            ti-cgt6x-native \
> +                            common-csl-ip-rtos \
> +"
> +DEPENDS_append_ti33x = " starterware-rtos \
> +"
> +DEPENDS_append_ti43x = " starterware-rtos \
> +"
> +DEPENDS_append_k2g = " common-csl-ip-rtos \
> +                       ti-cgt6x-native \
> +"
> +
> +# Fetch task cannot be completed until after ca-certificates-native populates sysroot with the SSL certificates
> +do_fetch[depends] = "ca-certificates-native:do_populate_sysroot"
> +
> +export TOOLCHAIN_PATH_A15 = "${GCC_ARM_NONE_TOOLCHAIN}"
> +export TOOLCHAIN_PATH_A8 = "${GCC_ARM_NONE_TOOLCHAIN}"
> +export TOOLCHAIN_PATH_A9 = "${GCC_ARM_NONE_TOOLCHAIN}"
> +export FPULIB_PATH = "${GCC_ARM_NONE_TOOLCHAIN}/lib/gcc/arm-none-eabi/4.9.3/fpu/"
> +export TOOLCHAIN_PATH_M4 = "${M4_TOOLCHAIN_INSTALL_DIR}"
> +export C6X_GEN_INSTALL_PATH = "${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x"
> +export PDK_INSTALL_PATH = "${PDK_INSTALL_DIR}/packages"
> +export BIOS_INSTALL_PATH = "${SYSBIOS_INSTALL_DIR}"
> +export XDC_INSTALL_PATH = "${XDC_INSTALL_DIR}"
> +
> +export PDK_PM_ROOT_PATH = "${WORKDIR}/git"
> +
> +LIMSOCS_ti33x = "am335x"
> +LIMSOCS_ti43x = "am437x"
> +LIMSOCS_am57xx-evm = "am571x am572x"
> +LIMSOCS_dra7xx-evm = "dra72x dra75x dra78x"
> +LIMSOCS_k2g = "k2g"
> +
> +LIMBOARDS_ti33x = "evmAM335x"
> +LIMBOARDS_ti43x = "evmAM437x"
> +LIMBOARDS_am57xx-evm = "idkAM571x idkAM572x evmAM572x"
> +LIMBOARDS_dra7xx-evm = "evmDRA72x evmDRA75x evmDRA78x"
> +LIMBOARDS_k2g = "evmK2G"
> +
> +# Used by DEST_ROOT to redirect binary and obj files away from sysroot PDK tree
> +OBJ_DIR = "${WORKDIR}/git/ti/binary"
> +
> +do_compile() {
> +    make clean lib xdc_meta doxygen LIMIT_SOCS="${LIMSOCS}" LIMIT_BOARDS="${LIMBOARDS}" DEST_ROOT=${OBJ_DIR}
> +
> +    # Remove unnecessary files from packaging
> +    rm -rf patches/
> +
> +    # Cleanup docs
> +    rm -rf docs/ReleaseNotes_PM_LLD.doc
> +    rm -rf internal/
> +
> +    #archive
> +    tar -cf pm_lld.tar --exclude='*.tar' ./*
> +}
> +
> +do_install() {
> +    install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/drv/pm
> +    find -name "*.tar" -exec tar xf {} --no-same-owner -C ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/drv/pm \;
> +}
> +
> +FILES_${PN} += "${PDK_INSTALL_DIR_RECIPE}/packages"
> +
> +INSANE_SKIP_${PN} = "arch staticdev"


