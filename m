Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3175CE00CB9; Mon, 14 Oct 2019 20:16:20 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D49C6E0091A
	for <meta-ti@yoctoproject.org>; Mon, 14 Oct 2019 20:16:18 -0700 (PDT)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9F3GIHk090796
	for <meta-ti@yoctoproject.org>; Mon, 14 Oct 2019 22:16:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1571109378;
	bh=FTzFvxHK+jz/roIuscVbgUiux4kpFhaRZdm3+BxWkw4=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=OSTyeviDcz2zmvoiNjBZHuC+ncl3jblXC2lidKFouVe6zXx8tZ7M7wCb773m4+juL
	35oDVGaiK9cGzEgHOUgxaAup1qxIWs/4etIvouPn3RVanuRjMuC+feqAOAFKakHYqe
	x873IaaAU+FQecBLHJEtWdbwh5QwX0DWbqncWuM8=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9F3GIaU014752
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Mon, 14 Oct 2019 22:16:18 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Mon, 14 Oct 2019 22:16:11 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE102.ent.ti.com
	(10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Mon, 14 Oct 2019 22:16:18 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9F3GHdq080849;
	Mon, 14 Oct 2019 22:16:17 -0500
Date: Mon, 14 Oct 2019 23:16:17 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Santosh Jha <sjha@ti.com>
Message-ID: <20191015031617.GJ14271@beryl>
References: <20191011180215.4082-1-sjha@ti.com>
MIME-Version: 1.0
In-Reply-To: <20191011180215.4082-1-sjha@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-ti@yoctoproject.org
Subject: Re: [thud/master][PATCH 1] ipc-lld: inherit update-alternatives for softlink
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
X-List-Received-Date: Tue, 15 Oct 2019 03:16:20 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Oct 11, 2019 at 01:02:15PM -0500, Santosh Jha wrote:
> - Fixed softlink  - inherit update-alternatives
> - Added alli-bios binaries in install

What is alli-bios?


> ---

What version is this? It says [PATCH 1], which should be v2, v3, etc.


BTW, what's "allrtos" package down there?


> Changes:
>  - Removed 'inherit deploy'
>  - Updated Commit message
>  - Removed deploy appends
> ---
> 
> Signed-off-by: Santosh Jha <sjha@ti.com>
> 
> Signed-off-by: Santosh Jha <sjha@ti.com>
> ---
>  .../ipc-lld/ipc-lld-examples-rtos_git.bb      | 45 +++++++------------
>  recipes-bsp/ipc-lld/ipc-lld.inc               |  2 +-
>  2 files changed, 17 insertions(+), 30 deletions(-)
> 
> diff --git a/recipes-bsp/ipc-lld/ipc-lld-examples-rtos_git.bb b/recipes-bsp/ipc-lld/ipc-lld-examples-rtos_git.bb
> index 75db2162..e4e8f09f 100644
> --- a/recipes-bsp/ipc-lld/ipc-lld-examples-rtos_git.bb
> +++ b/recipes-bsp/ipc-lld/ipc-lld-examples-rtos_git.bb
> @@ -2,11 +2,16 @@ SUMMARY = "echo_test for IPC-LLD"
>  
>  require ipc-lld.inc
>  
> +inherit update-alternatives
> +
>  DEPENDS += " ipc-lld-rtos common-csl-ip-rtos sciclient-rtos board-rtos"
>  
> -REMOTE_FW_DIR = "${S}/examples/echo_test/yocto_bin"
> +REMOTE_FW_DIR = "${S}/examples/yocto_bin"
>  REMOTE_FW_BIN_DIR = "${REMOTE_FW_DIR}/ipc_echo_test/bin"
>  REMOTE_FWB_BIN_DIR = "${REMOTE_FW_DIR}/ipc_echo_testb/bin"
> +RTOS_ALL_CORES_BIN_DIR = "${REMOTE_FW_DIR}/ex02_bios_multicore_echo_test/bin"
> +RTOS_2_CORES_BIN_DIR = "${REMOTE_FW_DIR}/ex01_bios_2core_echo_test/bin"
> +LINUX_2_CORES_BIN_DIR = "${REMOTE_FW_DIR}/ex03_linux_bios_2core_echo_test/bin"
>  
>  DST_BIN_PATH = "${base_libdir}/firmware/pdk-ipc"
>  
> @@ -116,37 +121,19 @@ ALTERNATIVE_TARGET[j7-c71_0-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test
>  
>  ALTERNATIVE_PRIORITY = "10"
>  
> -# copy the executables into the deploy directory
> -
> -do_deploy() {
> -    :
> -}
> -
> -do_deploy_am65xx() {
> -    install ${REMOTE_FW_BIN_DIR}/ipc_echo_test_mcu1_0_release.xer5f ${DEPLOYDIR}/
> -    install ${REMOTE_FW_BIN_DIR}/ipc_echo_test_mcu1_1_release.xer5f ${DEPLOYDIR}/
> -}
> +#add source and all rtos binaries package
> +PACKAGES =+ "${PN}-src"
> +PACKAGES =+ "${PN}-allrtos"
>  
> -do_deploy_j7-evm() {
> -    install ${REMOTE_FW_BIN_DIR}/ipc_echo_test_mcu1_0_release.xer5f ${DEPLOYDIR}/
> -    install ${REMOTE_FWB_BIN_DIR}/ipc_echo_testb_mcu1_0_release.xer5f ${DEPLOYDIR}/
> -    install ${REMOTE_FW_BIN_DIR}/ipc_echo_test_mcu1_1_release.xer5f ${DEPLOYDIR}/
> -    install ${REMOTE_FWB_BIN_DIR}/ipc_echo_testb_mcu1_1_release.xer5f ${DEPLOYDIR}/
> -    install ${REMOTE_FW_BIN_DIR}/ipc_echo_test_mcu2_0_release.xer5f ${DEPLOYDIR}/
> -    install ${REMOTE_FWB_BIN_DIR}/ipc_echo_testb_mcu2_0_release.xer5f ${DEPLOYDIR}/
> -    install ${REMOTE_FW_BIN_DIR}/ipc_echo_test_mcu2_1_release.xer5f ${DEPLOYDIR}/
> -    install ${REMOTE_FWB_BIN_DIR}/ipc_echo_testb_mcu2_1_release.xer5f ${DEPLOYDIR}/
> -    install ${REMOTE_FW_BIN_DIR}/ipc_echo_test_mcu3_0_release.xer5f ${DEPLOYDIR}/
> -    install ${REMOTE_FWB_BIN_DIR}/ipc_echo_testb_mcu3_0_release.xer5f ${DEPLOYDIR}/
> -    install ${REMOTE_FW_BIN_DIR}/ipc_echo_test_mcu3_1_release.xer5f ${DEPLOYDIR}/
> -    install ${REMOTE_FWB_BIN_DIR}/ipc_echo_testb_mcu3_1_release.xer5f ${DEPLOYDIR}/
> -    install ${REMOTE_FW_BIN_DIR}/ipc_echo_test_c66xdsp_1_release.xe66 ${DEPLOYDIR}/
> -    install ${REMOTE_FW_BIN_DIR}/ipc_echo_test_c66xdsp_2_release.xe66 ${DEPLOYDIR}/
> -    install ${REMOTE_FW_BIN_DIR}/ipc_echo_test_c7x_1_release.xe71 ${DEPLOYDIR}/
> -}
>  # make sure that lib/firmware, and all its contents are part of the package
>  FILES_${PN} += "${base_libdir}/firmware"
> -FILES_${PN} += "${PDK_INSTALL_DIR_RECIPE}/packages"
> +FILES_${PN}-src += "${PDK_INSTALL_DIR_RECIPE}/packages"
> +FILES_${PN}-allrtos_append_am65xx += "${RTOS_ALL_CORES_BIN_DIR}/am65xx_evm"
> +FILES_${PN}-allrtos_append_j7-evm += "${RTOS_ALL_CORES_BIN_DIR}/j721e_evm"
> +FILES_${PN}-allrtos_append_am65xx += "${RTOS_2_CORES_BIN_DIR}/am65xx_evm"
> +FILES_${PN}-allrtos_append_j7-evm += "${RTOS_2_CORES_BIN_DIR}/j721e_evm"
> +FILES_${PN}-allrtos_append_am65xx += "${LINUX_2_CORES_BIN_DIR}/am65xx_evm"
> +FILES_${PN}-allrtos_append_j7-evm += "${LINUX_2_CORES_BIN_DIR}/j721e_evm"
>  
>  INSANE_SKIP_${PN} = "arch ldflags file-rdeps"
>  
> diff --git a/recipes-bsp/ipc-lld/ipc-lld.inc b/recipes-bsp/ipc-lld/ipc-lld.inc
> index 06683a06..243678f4 100644
> --- a/recipes-bsp/ipc-lld/ipc-lld.inc
> +++ b/recipes-bsp/ipc-lld/ipc-lld.inc
> @@ -18,7 +18,7 @@ SRC_URI = "${IPCLLD_GIT_URI};protocol=${IPCLLD_GIT_PROTOCOL};branch=${BRANCH}"
>  
>  SRCREV = "${IPCLLD_SRCREV}"
>  PV = "01.00.00.00"
> -PR = "r1"
> +PR = "r2"
>  
>  # Build with make instead of XDC
>  TI_PDK_XDCMAKE = "0"
> -- 
> 2.17.1
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

