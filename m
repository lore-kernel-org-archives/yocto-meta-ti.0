Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A117EE00A38; Thu, 31 Aug 2017 06:23:56 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.19.17 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C51C3E0091D
	for <meta-ti@yoctoproject.org>; Thu, 31 Aug 2017 06:23:55 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v7VDNsXo027601
	for <meta-ti@yoctoproject.org>; Thu, 31 Aug 2017 08:23:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1504185834;
	bh=vumIt/A2nbI4NOp5VAawbK2wqDDFyzKPfrNIeEGd2Og=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=el5HAtyJUztF2SRWENwJyaekFJ5XQWQVofs9DH7Q/z8lmZx//7Qv0JacGhtcy3SLL
	IHgPLgTxfKfM2BobelgVCQdBZ8yLXCeC4eWcvwSwoiqbxrsC6WUb784vMha7Yonh66
	HraWD/BU8SrS1IvKHdqXMRTTX3ZBzg0q5AopPrMI=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v7VDNsWb003147
	for <meta-ti@yoctoproject.org>; Thu, 31 Aug 2017 08:23:54 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE105.ent.ti.com
	(157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Thu, 31 Aug 2017 08:23:54 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Thu, 31 Aug 2017 08:23:54 -0500
Received: from [10.218.109.201] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v7VDNrPD013163;
	Thu, 31 Aug 2017 08:23:53 -0500
To: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>, <meta-ti@yoctoproject.org>
References: <1504132936-7725-1-git-send-email-m-radhakrishnan2@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <bd942918-b0ba-d2b3-a77e-95b78d9180a1@ti.com>
Date: Thu, 31 Aug 2017 09:23:53 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1504132936-7725-1-git-send-email-m-radhakrishnan2@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [PATCH v3 1/7] pm-lld-rtos: Adding rtos recipe for pm-lld
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
X-List-Received-Date: Thu, 31 Aug 2017 13:23:56 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 8/30/2017 6:42 PM, Mahesh Radhakrishnan wrote:
> Upstreaming TI RTOS low level driver for Power Management module (PM)
> Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
> ---
>
>   v3 - Removed the intermediate tar-untar for install
>   v2 - Added summary & merged in to a single recipe
>
>   recipes-bsp/pm-lld/pm-lld-rtos_git.bb | 89 +++++++++++++++++++++++++++++++++++
>   1 file changed, 89 insertions(+)
>   create mode 100644 recipes-bsp/pm-lld/pm-lld-rtos_git.bb
>
> diff --git a/recipes-bsp/pm-lld/pm-lld-rtos_git.bb b/recipes-bsp/pm-lld/pm-lld-rtos_git.bb
> new file mode 100644
> index 0000000..72166b0
> --- /dev/null
> +++ b/recipes-bsp/pm-lld/pm-lld-rtos_git.bb
> @@ -0,0 +1,89 @@
> +SUMMARY = "TI RTOS driver for Power Management module (PM)"
> +
> +require recipes-ti/includes/ti-paths.inc
> +
> +LICENSE = "BSD-3-Clause"
> +LIC_FILES_CHKSUM = "file://Power.h;beginline=1;endline=31;md5=527b91fdcd26cd19ac07a754f45dedbe"
> +
> +COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|k2g"
> +PACKAGE_ARCH = "${MACHINE_ARCH}"
> +
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

I dont think this is needed.

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
> +# Used by DEST_ROOT to redirect binary and obj files away from sysroot PDK tree
> +OBJ_DIR = "${WORKDIR}/git/ti/binary"
> +
> +do_compile() {
> +    make clean lib xdc_meta doxygen LIMIT_SOCS="${TI_PDK_LIMIT_SOCS}" LIMIT_BOARDS="${TI_PDK_LIMIT_BOARDS}" DEST_ROOT=${OBJ_DIR}

Could you use oe_runmake instead of directly calling make? And also pass 
LIMIT_SOCS, LIMIT_BOARDS, and DEST_ROOT in EXTRA_OEMAKE.

Without this there could be an issue in the do_configure stage when 
there is an attempt to clean the sources.

> +
> +    # Remove unnecessary files from packaging
> +    rm -rf patches/
> +
> +    # Cleanup docs
> +    rm -rf docs/ReleaseNotes_PM_LLD.doc
> +    rm -rf internal/
> +
> +    #  Clean up .tar files from the package
> +    find -name "*.tar" -exec rm -f {} \;
> +}
> +
> +do_install() {
> +    install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/drv/pm
> +    cp -r ${S}/*  ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/drv/pm
> +}
> +
> +FILES_${PN} += "${PDK_INSTALL_DIR_RECIPE}/packages"
> +
> +INSANE_SKIP_${PN} = "arch staticdev"


