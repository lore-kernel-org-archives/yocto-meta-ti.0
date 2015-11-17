Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 37BF3E0086A; Mon, 16 Nov 2015 21:45:58 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.40 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BCB5FE00803
	for <meta-ti@yoctoproject.org>; Mon, 16 Nov 2015 21:45:53 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id tAH5jqEu010916
	for <meta-ti@yoctoproject.org>; Mon, 16 Nov 2015 23:45:52 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id tAH5jq8g029941
	for <meta-ti@yoctoproject.org>; Mon, 16 Nov 2015 23:45:52 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 16 Nov 2015 23:45:52 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id tAH5jpp2009144;
	Mon, 16 Nov 2015 23:45:52 -0600
Date: Tue, 17 Nov 2015 00:45:36 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Sam Nelson <sam.nelson@ti.com>
Message-ID: <20151117054535.GG3272@edge>
References: <1447738663-32314-1-git-send-email-sam.nelson@ti.com>
MIME-Version: 1.0
In-Reply-To: <1447738663-32314-1-git-send-email-sam.nelson@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] ti-ipc-rtos: Update to new version of IPC 3.41.0.3_eng
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
X-List-Received-Date: Tue, 17 Nov 2015 05:45:58 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Thanks, Sam!

Few comments:

1. It's not just ipc-rtos, you are also updating Linux side, so commit should 
reflect that.

2. If you set PV as 3.41.00.03_eng, you'll have issues when the real 
3.41.00.03 gets released. And not even PR bump will help. So there are 2 ways 
around - you either call this one 3.41.00.03 and when updating for GA bump PR; 
or you call this one as 3.41.00.02+3.41.00.03_eng and then GA can get it's 
proper version number.

-- 
Denys


On Tue, Nov 17, 2015 at 12:37:43AM -0500, Sam Nelson wrote:
> - Update to new version of IPC 3.41.0.3_eng
> - Add recipe to build ti-ipc-rtos from git repo
> - Remove K2G hack
> 
> Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> ---
>  recipes-ti/ipc/ti-ipc-rtos.inc           |  9 +++--
>  recipes-ti/ipc/ti-ipc-rtos_3.40.01.08.bb |  9 -----
>  recipes-ti/ipc/ti-ipc-rtos_git.bb        | 62 ++++++++++++++++++++++++++++++++
>  recipes-ti/ipc/ti-ipc_git.bb             | 10 +++---
>  4 files changed, 74 insertions(+), 16 deletions(-)
>  delete mode 100644 recipes-ti/ipc/ti-ipc-rtos_3.40.01.08.bb
>  create mode 100644 recipes-ti/ipc/ti-ipc-rtos_git.bb
> 
> diff --git a/recipes-ti/ipc/ti-ipc-rtos.inc b/recipes-ti/ipc/ti-ipc-rtos.inc
> index d14c756..56adcc8 100644
> --- a/recipes-ti/ipc/ti-ipc-rtos.inc
> +++ b/recipes-ti/ipc/ti-ipc-rtos.inc
> @@ -6,9 +6,14 @@ LICENSE = "BSD"
>  require recipes-ti/includes/ti-paths.inc
>  require recipes-ti/includes/ti-staging.inc
>  
> -SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/ipc/${PV}/exports/ipc_${PV}.zip;name=ipczip"
> +BRANCH = "ipc-next"
>  
> -S = "${WORKDIR}/ipc_${PV}"
> +SRC_URI = "git://git.ti.com/ipc/ipcdev.git;protocol=git;branch=${BRANCH}"
> +
> +#Corresponds to 3.41.00.03_eng
> +SRCREV = "354db7d3b6aa397e6ab4b86fdbd312746fd46a07"
> +
> +S = "${WORKDIR}/git"
>  
>  do_install() {
>      install -d ${D}${IPC_INSTALL_DIR_RECIPE}
> diff --git a/recipes-ti/ipc/ti-ipc-rtos_3.40.01.08.bb b/recipes-ti/ipc/ti-ipc-rtos_3.40.01.08.bb
> deleted file mode 100644
> index 7c93695..0000000
> --- a/recipes-ti/ipc/ti-ipc-rtos_3.40.01.08.bb
> +++ /dev/null
> @@ -1,9 +0,0 @@
> -require ti-ipc-rtos.inc
> -
> -PV = "3_40_01_08"
> -PR = "r0"
> -
> -LIC_FILES_CHKSUM = "file://${S}/ipc-linux.mak;beginline=1;endline=30;md5=7b327f9b710fd7c95e545b91cec79255"
> -
> -SRC_URI[ipczip.md5sum] = "738e1d54da9fab94899ad162f1ad78de"
> -SRC_URI[ipczip.sha256sum] = "8cc7d40ad7eab916eae109b355dc7e7876c6ab82e3b40bf5b6bf60474312d6cf"
> diff --git a/recipes-ti/ipc/ti-ipc-rtos_git.bb b/recipes-ti/ipc/ti-ipc-rtos_git.bb
> new file mode 100644
> index 0000000..d78bd63
> --- /dev/null
> +++ b/recipes-ti/ipc/ti-ipc-rtos_git.bb
> @@ -0,0 +1,62 @@
> +require recipes-ti/ipc/ti-ipc-rtos.inc
> +require recipes-ti/includes/ti-paths-append.inc
> +
> +PV = "3_41_00_03_eng"
> +PR = "r0"
> +
> +LIC_FILES_CHKSUM = "file://${S}/ipc-linux.mak;beginline=1;endline=30;md5=7b327f9b710fd7c95e545b91cec79255"
> +
> +SRC_URI[ipczip.md5sum] = "738e1d54da9fab94899ad162f1ad78de"
> +SRC_URI[ipczip.sha256sum] = "8cc7d40ad7eab916eae109b355dc7e7876c6ab82e3b40bf5b6bf60474312d6cf"
> +
> +PACKAGE_ARCH = "${MACHINE_ARCH}"
> +
> +PLATFORM = "UNKNOWN"
> +PLATFORM_omap5-evm = "OMAP54XX"
> +PLATFORM_dra7xx = "DRA7XX"
> +PLATFORM_k2hk-evm = "TCI6638"
> +PLATFORM_k2l-evm = "TCI6630"
> +PLATFORM_k2e-evm = "66AK2E"
> +PLATFORM_k2g-evm = "66AK2G"
> +
> +DEPENDS += "ti-cgt6x-native ti-xdctools ti-sysbios"
> +
> +IPC_TARGETS = ""
> +IPC_TARGETS_omap-a15 = "\
> +    gnu.targets.arm.A15F="${A15_TOOLCHAIN_INSTALL_DIR}" \
> +    ti.targets.elf.C66="${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x" \
> +    ti.targets.arm.elf.M4="${M4_TOOLCHAIN_INSTALL_DIR}" \
> +    ti.targets.arm.elf.M4F="${M4_TOOLCHAIN_INSTALL_DIR}" \
> +"
> +
> +IPC_TARGETS_keystone = " \
> +    gnu.targets.arm.A15F="${A15_TOOLCHAIN_INSTALL_DIR}" \
> +    ti.targets.elf.C66="${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x" \
> +"
> +
> +EXTRA_OEMAKE = "\
> +    PLATFORM=${PLATFORM} \
> +    XDC_INSTALL_DIR="${XDC_INSTALL_DIR}" \
> +    BIOS_INSTALL_DIR="${SYSBIOS_INSTALL_DIR}" \
> +    ${IPC_TARGETS} \
> +"
> +
> +do_compile() {
> +  oe_runmake -f ipc-bios.mak clean
> +  oe_runmake -f ipc-bios.mak all
> +}
> +
> +do_compile_append() {
> +  sourceipk_do_create_srcipk
> +}
> +
> +do_install_append() {
> +    install -d ${D}${libdir}/firmware
> +    find . -name "*.xe66" -type f | xargs -I {} install -m 0644 {} ${D}${libdir}/firmware/
> +}
> +
> +PACKAGES =+ "${PN}-fw"
> +FILES_${PN}-fw = "${libdir}/firmware/*"
> +
> +INSANE_SKIP_${PN}-fw += "arch"
> +INSANE_SKIP_${PN}-dev += "arch"
> diff --git a/recipes-ti/ipc/ti-ipc_git.bb b/recipes-ti/ipc/ti-ipc_git.bb
> index a6b6a90..00e05f8 100644
> --- a/recipes-ti/ipc/ti-ipc_git.bb
> +++ b/recipes-ti/ipc/ti-ipc_git.bb
> @@ -6,15 +6,15 @@ LIC_FILES_CHKSUM = "file://${S}/ipc-linux.mak;beginline=1;endline=30;md5=7b327f9
>  
>  DEPENDS += "virtual/kernel"
>  
> -PV = "3.41.00.02"
> +PV = "3.41.00.03_eng"
>  
>  BRANCH = "ipc-next"
>  SRC_URI = "git://git.ti.com/ipc/ipcdev.git;protocol=git;branch=${BRANCH} \
>             file://tiipclad-daemon.sh \
>             file://0001-Add-kernel-build-dir.patch \
>             "
> -# Commit corresponds to 3.41.00.02-eng
> -SRCREV = "b34c8ada4ed243cd52e504bf2c6fb3451dc730f8"
> +# Commit corresponds to 3.41.00.03-eng
> +SRCREV = "354db7d3b6aa397e6ab4b86fdbd312746fd46a07"
>  
>  S = "${WORKDIR}/git"
>  
> @@ -26,7 +26,7 @@ PLATFORM_dra7xx = "DRA7XX"
>  PLATFORM_k2hk-evm = "TCI6638"
>  PLATFORM_k2l-evm = "TCI6630"
>  PLATFORM_k2e-evm = "66AK2E"
> -PLATFORM_k2g-evm = "66AK2E"
> +PLATFORM_k2g-evm = "66AK2G"
>  
>  DAEMON = "UNKNOWN"
>  DAEMON_omap5-evm = "lad_omap54xx_smp"
> @@ -34,7 +34,7 @@ DAEMON_dra7xx = "lad_dra7xx"
>  DAEMON_k2hk-evm = "lad_tci6638"
>  DAEMON_k2l-evm = "lad_tci6630"
>  DAEMON_k2e-evm = "lad_66ak2e"
> -DAEMON_k2g-evm = "lad_66ak2e"
> +DAEMON_k2g-evm = "lad_66ak2g"
>  
>  inherit autotools-brokensep pkgconfig update-rc.d
>  
> -- 
> 1.9.1
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

