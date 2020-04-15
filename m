Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.21047.1586974994336609242
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 15 Apr 2020 11:23:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=WC+ev8sP;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: denys@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 03FIND0h052157
	for <meta-ti@lists.yoctoproject.org>; Wed, 15 Apr 2020 13:23:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1586974993;
	bh=cia9dTAERtaczf6G2QYXauw+uvAL8ag0CYKkWUNS6cM=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=WC+ev8sPw4N18E5ia1o/JDF2/2WfUDepOAd+f3+IuDqxwoyrpzQFjP0qF5NoZXvVv
	 6hedSQOsrftojyvquqfwIRqCzVnHGEEa1h3ZCkDgLI2Wjp63LT3nt+VeIeHJHx3uJU
	 s3J+psHqXJ8sFk06xsgf/fVdQ3gPA2MqPcxR6t8o=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 03FINDhD079636
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Wed, 15 Apr 2020 13:23:13 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 15
 Apr 2020 13:23:13 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 15 Apr 2020 13:23:13 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03FINChc092702;
	Wed, 15 Apr 2020 13:23:12 -0500
Date: Wed, 15 Apr 2020 14:23:12 -0400
From: "Denys Dmytriyenko" <denys@ti.com>
To: <angelabaker@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <sam.nelson@ti.com>,
        <m-radhakrishnan2@ti.com>
Subject: Re: [meta-ti][zeus/master][PATCH] ipc-lld: Update examples to build only select examples
Message-ID: <20200415182312.GC3604@beryl>
References: <20200415181356.6970-1-angelabaker@ti.com>
MIME-Version: 1.0
In-Reply-To: <20200415181356.6970-1-angelabaker@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Thanks, merged to zeus-next for testing.

On Wed, Apr 15, 2020 at 01:13:56PM -0500, Angela Stegmaier via lists.yoctoproject.org wrote:
> Full build of all examples is not needed. Update the
> recipe to build only selected examples.
> 
> Signed-off-by: Angela Stegmaier <angelabaker@ti.com>
> ---
>  .../ipc-lld/ipc-lld-examples-rtos_git.bb      | 21 +++++++++++++++++--
>  recipes-bsp/ipc-lld/ipc-lld.inc               |  2 +-
>  2 files changed, 20 insertions(+), 3 deletions(-)
> 
> diff --git a/recipes-bsp/ipc-lld/ipc-lld-examples-rtos_git.bb b/recipes-bsp/ipc-lld/ipc-lld-examples-rtos_git.bb
> index 8defbac1..b9958f1d 100644
> --- a/recipes-bsp/ipc-lld/ipc-lld-examples-rtos_git.bb
> +++ b/recipes-bsp/ipc-lld/ipc-lld-examples-rtos_git.bb
> @@ -12,6 +12,7 @@ REMOTE_FWB_BIN_DIR = "${REMOTE_FW_DIR}/ipc_echo_testb/bin"
>  RTOS_ALL_CORES_BIN_DIR = "${REMOTE_FW_DIR}/ex02_bios_multicore_echo_test/bin"
>  RTOS_2_CORES_BIN_DIR = "${REMOTE_FW_DIR}/ex01_bios_2core_echo_test/bin"
>  LINUX_2_CORES_BIN_DIR = "${REMOTE_FW_DIR}/ex03_linux_bios_2core_echo_test/bin"
> +LINUX_2_CORES_BAREMETAL_BIN_DIR = "${REMOTE_FW_DIR}/ex04_linux_baremetal_2core_echo_test/bin"
>  
>  DST_BIN_PATH = "${base_libdir}/firmware/pdk-ipc"
>  
> @@ -20,9 +21,21 @@ TI_PDK_LIMIT_BOARDS_j7-evm = "j721e_evm"
>  do_configure[noexec] = "1"
>  
>  do_compile() {
> -    cd ${S}
> +    cd "${PDK_INSTALL_PATH}/ti/build"
>  
> -    oe_runmake apps LIMIT_BOARDS="${TI_PDK_LIMIT_BOARDS}" LIMIT_CORES="${TI_PDK_LIMIT_CORES}" DEST_ROOT=${REMOTE_FW_DIR}
> +    for board in ${TI_PDK_LIMIT_BOARDS}
> +    do
> +        for core in ${TI_PDK_LIMIT_CORES}
> +        do
> +            oe_runmake ipc_echo_test BOARD="$board" CORE="$core" DEST_ROOT=${REMOTE_FW_DIR}
> +            oe_runmake ex02_bios_multicore_echo_test BOARD="$board" CORE="$core" DEST_ROOT=${REMOTE_FW_DIR}
> +            oe_runmake ex01_bios_2core_echo_test BOARD="$board" CORE="$core" DEST_ROOT=${REMOTE_FW_DIR}
> +            oe_runmake ex03_linux_bios_2core_echo_test BOARD="$board" CORE="$core" DEST_ROOT=${REMOTE_FW_DIR}
> +            oe_runmake ex04_linux_baremetal_2core_echo_test BOARD="$board" CORE="$core" DEST_ROOT=${REMOTE_FW_DIR}
> +            oe_runmake ipc_echo_testb BOARD="$board" CORE="$core" DEST_ROOT=${REMOTE_FW_DIR}
> +        done
> +
> +    done
>  }
>  
>  do_install() {
> @@ -66,6 +79,9 @@ do_install_append_j7-evm() {
>      install -m 0644 ${REMOTE_FWB_BIN_DIR}/$board/ipc_echo_testb_mcu3_1_release_strip.xer5f ${D}${DST_BIN_PATH}
>  }
>  
> +do_install_append_am65xx-evm() {
> +    cp ${CP_ARGS} ${REMOTE_FW_DIR}/ex04_linux_baremetal_2core_echo_test/bin -d ${D}/ex04_linux_baremetal_2core_echo_test
> +}
>  
>  # Set up names for the firmwares
>  ALTERNATIVE_${PN}_am65xx = "\
> @@ -138,6 +154,7 @@ FILES_${PN} += "${base_libdir}/firmware"
>  FILES_${PN}-rtos += "ex02_bios_multicore_echo_test"
>  FILES_${PN}-rtos += "ex01_bios_2core_echo_test"
>  FILES_${PN}-rtos += "ex03_linux_bios_2core_echo_test"
> +FILES_${PN}-rtos += "ex04_linux_baremetal_2core_echo_test"
>  
>  INSANE_SKIP_${PN} = "arch ldflags file-rdeps"
>  INSANE_SKIP_${PN}-rtos = "arch ldflags file-rdeps"
> diff --git a/recipes-bsp/ipc-lld/ipc-lld.inc b/recipes-bsp/ipc-lld/ipc-lld.inc
> index f271f31d..2aea055f 100644
> --- a/recipes-bsp/ipc-lld/ipc-lld.inc
> +++ b/recipes-bsp/ipc-lld/ipc-lld.inc
> @@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=7eae093f2b09fd39307f30028a068b91"
>  COMPATIBLE_MACHINE = "k3"
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
> -PR = "r3"
> +PR = "r4"
>  
>  # Build with make instead of XDC
>  TI_PDK_XDCMAKE = "0"
> -- 
> 2.17.1
> 

> 

