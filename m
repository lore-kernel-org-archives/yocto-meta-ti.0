Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id ADDBEE00CC4; Tue, 26 Sep 2017 11:15:48 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 66747E00C3A
	for <meta-ti@yoctoproject.org>; Tue, 26 Sep 2017 11:15:46 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v8QIFk6T027357
	for <meta-ti@yoctoproject.org>; Tue, 26 Sep 2017 13:15:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1506449746;
	bh=bmoYYJNRgGwAYOQBfPI9kYM8IaOv1XPI2z/pMRCzWPc=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=CeEDyW17szBZdguxzkDUmVII7f25RXdkrUZY2MLfvFxUvAxKJXLhwDN7Eu6xmN56u
	EsyjWDayQy6QpH5Nk5Pru/PxmmpA2/2f1FZLhwb2HH/+wx4Qwt8uVcGIR3R7QRYXFo
	7SriOGVXPlgRskSPPurWEeAUCrBm13V7b2ztioKc=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8QIFk0S025179
	for <meta-ti@yoctoproject.org>; Tue, 26 Sep 2017 13:15:46 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE102.ent.ti.com
	(157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Tue, 26 Sep 2017 13:15:46 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Tue, 26 Sep 2017 13:15:45 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8QIFjIw022964;
	Tue, 26 Sep 2017 13:15:45 -0500
Date: Tue, 26 Sep 2017 14:15:30 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Radhakrishnan, Mahesh" <m-radhakrishnan2@ti.com>
Message-ID: <20170926181530.GD26843@edge>
References: <1500419028-3361-1-git-send-email-m-radhakrishnan2@ti.com>
	<1500419028-3361-25-git-send-email-m-radhakrishnan2@ti.com>
	<20170824195159.GH28233@edge>
	<5130E41A1BA9D145BA0F3B18D5CFB0A7437F42A1@DFLE12.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <5130E41A1BA9D145BA0F3B18D5CFB0A7437F42A1@DFLE12.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH v2 25/37] pm-lld-rtos: Adding rtos recipe for pm-lld
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
X-List-Received-Date: Tue, 26 Sep 2017 18:15:48 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Sep 18, 2017 at 02:03:18PM -0400, Radhakrishnan, Mahesh wrote:
>    Denys,
> 
>    Submitted a new patch for pm-lld (attached). Responses linline.
> 
>    Please let me know if it looks okay now.
> 
>     
> 
>    Regards
> 
>    Mahesh
> 
>    -----Original Message-----
>    From: Dmytriyenko, Denys
>    Sent: Thursday, August 24, 2017 3:52 PM
>    To: Radhakrishnan, Mahesh
>    Cc: meta-ti@yoctoproject.org
>    Subject: Re: [meta-ti] [PATCH v2 25/37] pm-lld-rtos: Adding rtos recipe
>    for pm-lld
> 
>     
> 
>    On Tue, Jul 18, 2017 at 07:03:36PM -0400, Mahesh Radhakrishnan wrote:
> 
>    > Upstreaming TI RTOS low level driver for Power Management module (PM)
> 
>    > Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
> 
>    > ---
> 
>    >
> 
>    > v2 - Added summary & merged in to a single recipe
> 
>    >
> 
>    >  recipes-bsp/pm-lld/pm-lld-rtos_git.bb | 95
> 
>    > +++++++++++++++++++++++++++++++++++
> 
>    >  1 file changed, 95 insertions(+)
> 
>    >  create mode 100644 recipes-bsp/pm-lld/pm-lld-rtos_git.bb
> 
>    >
> 
>    > diff --git a/recipes-bsp/pm-lld/pm-lld-rtos_git.bb
> 
>    > b/recipes-bsp/pm-lld/pm-lld-rtos_git.bb
> 
>    > new file mode 100644
> 
>    > index 0000000..c976deb
> 
>    > --- /dev/null
> 
>    > +++ b/recipes-bsp/pm-lld/pm-lld-rtos_git.bb
> 
>    > @@ -0,0 +1,95 @@
> 
>    > +SUMMARY = "TI RTOS driver for Power Management module (PM)"
> 
>    > +
> 
>    > +require recipes-ti/includes/ti-paths.inc
> 
>    > +
> 
>    > +LICENSE = "BSD-3-Clause"
> 
>    > +LIC_FILES_CHKSUM =
>    "file://Power.h;beginline=1;endline=31;md5=527b91fdcd26cd19ac07a754f45dedbe"
> 
>    > +
> 
>    > +COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|k2g"
> 
>    > +PACKAGE_ARCH = "${MACHINE_ARCH}"
> 
>    > +
> 
>    > +
> 
>    > +PM_LLD_GIT_URI = "git://git.ti.com/keystone-rtos/pm-lld.git"
> 
>    > +PM_LLD_GIT_PROTOCOL = "git"
> 
>    > +PM_LLD_GIT_BRANCH = "int_pm_am335x"
> 
>    > +PM_LLD_GIT_BRANCH_dra7xx-evm = "master"
> 
>     
> 
>    ^^^
> 
>     
> 
>     
> 
>    > +PM_LLD_GIT_DESTSUFFIX = "git/ti/drv/pm"
> 
>    > +
> 
>    > +# Below commit ID corresponds to "DEV.PM_LLD.01.04.00.01"
> 
>    > +PM_LLD_SRCREV = "c4908f94b3e655e6298aa9bfe9bbffbbc5d16111"
> 
>    > +
> 
>    > +# Below commit ID corresponds to "REL.PDK.TDA.01.07.00.06"
> 
>    > +PM_LLD_SRCREV_dra7xx-evm = "46ea13503d2991f636197edb206a9f62cea398d4"
> 
>     
> 
>    ^^^
> 
>     
> 
>    In some places here you use more generic "omap-a15" SOC family, but in
>    these 2 places I highlighted, you use very specific "dra7xx-evm", which
>    will exclude platforms like "dra7xx-hs-evm" as well as "am57xx-evm" and
>    use "int_pm_am335x"
> 
>    branch for those. Please confirm you actually want to do that.
> 
>    Yes. I have confirmed with automotive team that we use specific versions
>    for dra7xx-evm. This module is not used for dra7xx-hs-evm.

Understood, but since you specify "omap-a15" in the COMPATIBLE_MACHINE, the 
recipe might get included for another platform in this family (AM5 or HS), 
that is not exactly "dra7xx-evm" and fail to build, because you don't have 
BRANCH and SRCREV defined properly... You might want to fix COMPATIBLE_MACHINE 
to avoid any accidents in the future.


> 
>    > +
> 
>    > +BRANCH = "${PM_LLD_GIT_BRANCH}"
> 
>    > +SRC_URI =
>    "${PM_LLD_GIT_URI};destsuffix=${PM_LLD_GIT_DESTSUFFIX};protocol=${PM_LLD_GIT_PROTOCOL};branch=${BRANCH}"
> 
>    > +
> 
>    > +#PATCHTOOL = "git"
> 
>    > +#SRC_URI_append = " \
> 
>    > +#    file://.patch \
> 
>    > +#"
> 
>     
> 
>    Leftovers ^^^
> 
>    Yes. They have been removed in the latest patch.
> 
>     
> 
>     
> 
>    > +SRCREV = "${PM_LLD_SRCREV}"
> 
>    > +PV = "01.04.00.01"
> 
>    > +PR = "r0"
> 
>    > +
> 
>    > +S = "${WORKDIR}/${PM_LLD_GIT_DESTSUFFIX}"
> 
>    > +
> 
>    > +DEPENDS = " ti-sysbios \
> 
>    > +            gcc-arm-none-eabi-native \
> 
>    > +            osal-rtos \
> 
>    > +            ca-certificates-native \
> 
>    > +            ti-pdk-setup \
> 
>    > +"
> 
>    > +DEPENDS_append_omap-a15 = " ti-cgt-arm-native \
> 
>    > +                            ti-cgt6x-native \
> 
>    > +                            common-csl-ip-rtos \ "
> 
>    > +DEPENDS_append_ti33x = " starterware-rtos \ "
> 
>    > +DEPENDS_append_ti43x = " starterware-rtos \ "
> 
>    > +DEPENDS_append_k2g = " common-csl-ip-rtos \
> 
>    > +                       ti-cgt6x-native \ "
> 
>    > +
> 
>    > +# Fetch task cannot be completed until after ca-certificates-native
> 
>    > +populates sysroot with the SSL certificates do_fetch[depends] =
>    "ca-certificates-native:do_populate_sysroot"
> 
>     
> 
>    Why? Shouldn't be a problem accessing git.ti.com over git protocol.
> 
>    Yes. They have been removed in the latest patch.
> 
>     
> 
>     
> 
>    > +export TOOLCHAIN_PATH_A15 = "${GCC_ARM_NONE_TOOLCHAIN}"
> 
>    > +export TOOLCHAIN_PATH_A8 = "${GCC_ARM_NONE_TOOLCHAIN}"
> 
>    > +export TOOLCHAIN_PATH_A9 = "${GCC_ARM_NONE_TOOLCHAIN}"
> 
>    > +export FPULIB_PATH =
>    "${GCC_ARM_NONE_TOOLCHAIN}/lib/gcc/arm-none-eabi/4.9.3/fpu/"
> 
>    > +export TOOLCHAIN_PATH_M4 = "${M4_TOOLCHAIN_INSTALL_DIR}"
> 
>    > +export C6X_GEN_INSTALL_PATH =
>    "${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x"
> 
>    > +export PDK_INSTALL_PATH = "${PDK_INSTALL_DIR}/packages"
> 
>    > +export BIOS_INSTALL_PATH = "${SYSBIOS_INSTALL_DIR}"
> 
>    > +export XDC_INSTALL_PATH = "${XDC_INSTALL_DIR}"
> 
>     
> 
>    Aren't those already defined in a .inc file?
> 
>    In the latest patch submitted, ti-pdk.bbclass has been used and the above
>    are removed.
> 
>     
> 
>    > +export PDK_PM_ROOT_PATH = "${WORKDIR}/git"
> 
>    > +
> 
>    > +# Used by DEST_ROOT to redirect binary and obj files away from
> 
>    > +sysroot PDK tree OBJ_DIR = "${WORKDIR}/git/ti/binary"
> 
>    > +
> 
>    > +do_compile() {
> 
>    > +    make clean lib xdc_meta doxygen LIMIT_SOCS="${TI_PDK_LIMIT_SOCS}"
> 
>    > +LIMIT_BOARDS="${TI_PDK_LIMIT_BOARDS}" DEST_ROOT=${OBJ_DIR}
> 
>     
> 
>    BTW, doxygen is not available in meta-ti nor in the only other dependent
>    layer which is oe-core.
> 
>    The doxygen target is no longer built with the latest patch.
> 
>     
> 
>    > +    # Remove unnecessary files from packaging
> 
>    > +    rm -rf patches/
> 
>    > +
> 
>    > +    # Cleanup docs
> 
>    > +    rm -rf docs/ReleaseNotes_PM_LLD.doc
> 
>    > +    rm -rf internal/
> 
>    > +
> 
>    > +    #archive
> 
>    > +    tar -cf pm_lld.tar --exclude='*.tar' ./*
> 
>    > +}
> 
>    > +
> 
>    > +do_install() {
> 
>    > +    install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/drv/pm
> 
>    > +    find -name "*.tar" -exec tar xf {} --no-same-owner -C
>    ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/drv/pm \;
> 
>     
> 
>    Is it necessary to tar-up everything at the end of do_compile and then
>    un-tar
> 
>    in do_install?
> 
>     
> 
>    The latest patch uses ti-pdk.bbclass and the do_Compile has been appended
>    by generating a tar file    which the do_install of ti-pdk.bbclass will
>    untar.
> 
>    > +}
> 
>    > +
> 
>    > +FILES_${PN} += "${PDK_INSTALL_DIR_RECIPE}/packages"
> 
>    > +
> 
>    > +INSANE_SKIP_${PN} = "arch staticdev"
> 
>    > --
> 
>    > 1.9.1
> 
>    >
> 
>    > --
> 
>    > _______________________________________________
> 
>    > meta-ti mailing list
> 
>    > meta-ti@yoctoproject.org
> 
>    > https://lists.yoctoproject.org/listinfo/meta-ti

Received: from DFLE103.ent.ti.com (10.64.6.24) by DLEE70.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (TLS) id 14.3.294.0; Mon, 18 Sep
 2017 12:54:32 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34; Mon, 18
 Sep 2017 12:54:32 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_0,
 cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend Transport;
 Mon, 18 Sep 2017 12:54:32 -0500
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
 v8IHsWeb012844;	Mon, 18 Sep 2017 12:54:32 -0500
From: "Radhakrishnan, Mahesh" <m-radhakrishnan2@ti.com>
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
CC: "Radhakrishnan, Mahesh" <m-radhakrishnan2@ti.com>
Subject: [PATCH v4] pm-lld-rtos: Adding rtos recipe for pm-lld
Thread-Topic: [PATCH v4] pm-lld-rtos: Adding rtos recipe for pm-lld
Thread-Index: AQHTMKcuRYaJYc9W/UitrntDyLPAnw==
Date: Mon, 18 Sep 2017 13:54:28 -0400
Message-ID: <1505757268-4687-1-git-send-email-m-radhakrishnan2@ti.com>
Content-Language: en-US
X-MS-Exchange-Organization-AuthMechanism: 10
X-MS-Exchange-Organization-AuthSource: DFLE108.ent.ti.com
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
> 
> TI RTOS low level driver for Power Management module (PM)
> Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
> ---
> 
>  v4 - Modified to use ti-pdk.bbclass and addressed review comments
>  v3 - Removed the intermediate tar-untar for install
>  v2 - Added summary & merged in to a single recipe
> 
> 
>  recipes-bsp/pm-lld/pm-lld-rtos_git.bb | 56 +++++++++++++++++++++++++++++++++++
>  1 file changed, 56 insertions(+)
>  create mode 100644 recipes-bsp/pm-lld/pm-lld-rtos_git.bb
> 
> diff --git a/recipes-bsp/pm-lld/pm-lld-rtos_git.bb b/recipes-bsp/pm-lld/pm-lld-rtos_git.bb
> new file mode 100644
> index 0000000..6fedc80
> --- /dev/null
> +++ b/recipes-bsp/pm-lld/pm-lld-rtos_git.bb
> @@ -0,0 +1,56 @@
> +SUMMARY = "TI RTOS driver for Power Management module (PM)"
> +
> +require recipes-ti/includes/ti-paths.inc
> +inherit ti-pdk
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
> +DEPENDS_append = " ti-sysbios \
> +            osal-rtos \
> +"
> +DEPENDS_append_ti33x = " starterware-rtos \
> +"
> +DEPENDS_append_ti43x = " starterware-rtos \
> +"
> +export PDK_PM_ROOT_PATH = "${WORKDIR}/build"
> +export DEST_ROOT="${S}"
> +
> +# Build with make instead of XDC
> +TI_PDK_XDCMAKE = "0"
> +
> +do_compile_append() {
> +    # Delete archive created by XDC release command since it does not contain all content
> +    find -name "*.tar" -exec rm -f {} \;
> +
> +    # Archive from build/ to capture ti/drv/pm/ in archive
> +    cd ${B}
> +    tar -cf pm_lld.tar --exclude='*.tar' ./*
> +}
> +
> +INSANE_SKIP_${PN} = "arch staticdev"
> --
> 1.9.1
> 


