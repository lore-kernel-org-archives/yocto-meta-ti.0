Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E354AE007C1; Tue,  7 Oct 2014 14:38:47 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D3567E0076C
	for <meta-ti@yoctoproject.org>; Tue,  7 Oct 2014 14:38:35 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s97LcZe4003451
	for <meta-ti@yoctoproject.org>; Tue, 7 Oct 2014 16:38:35 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s97LcZQn002115
	for <meta-ti@yoctoproject.org>; Tue, 7 Oct 2014 16:38:35 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 7 Oct 2014 16:38:35 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id s97LcY67016685;
	Tue, 7 Oct 2014 16:38:34 -0500
Date: Tue, 7 Oct 2014 17:38:34 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Sam Nelson <sam.nelson@ti.com>
Message-ID: <20141007213833.GK1731@edge>
References: <1412717489-29990-1-git-send-email-sam.nelson@ti.com>
	<1412717489-29990-2-git-send-email-sam.nelson@ti.com>
MIME-Version: 1.0
In-Reply-To: <1412717489-29990-2-git-send-email-sam.nelson@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH 2/3] rm-lld: rename recipe
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
X-List-Received-Date: Tue, 07 Oct 2014 21:38:48 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Sam,

Please combine #2 and #3 patches. Plus, use -M flag when you generate the 
patch, so it won't be presented as adding new and removing old, but just as a 
simple rename.

-- 
Denys


On Tue, Oct 07, 2014 at 05:31:28PM -0400, Sam Nelson wrote:
> - removed ti-prefix based on review
> 
> Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> ---
>  recipes-bsp/rm-lld/rm-lld_git.bb |   49 ++++++++++++++++++++++++++++++++++++++
>  recipes-bsp/rm-lld/ti-rm_git.bb  |   49 --------------------------------------
>  2 files changed, 49 insertions(+), 49 deletions(-)
>  create mode 100644 recipes-bsp/rm-lld/rm-lld_git.bb
>  delete mode 100644 recipes-bsp/rm-lld/ti-rm_git.bb
> 
> diff --git a/recipes-bsp/rm-lld/rm-lld_git.bb b/recipes-bsp/rm-lld/rm-lld_git.bb
> new file mode 100644
> index 0000000..276c01e
> --- /dev/null
> +++ b/recipes-bsp/rm-lld/rm-lld_git.bb
> @@ -0,0 +1,49 @@
> +DESCRIPTION = "TI Resource Manager Low Level Driver"
> +LICENSE = "TI BSD"
> +LIC_FILES_CHKSUM = "file://${WORKDIR}/git/ti/drv/rm/COPYING.txt;md5=dc61631b65360e6beb73b6c337800afc"
> +
> +BRANCH="master"
> +SRC_URI = "git://git.ti.com/keystone-rtos/rm-lld.git;destsuffix=git/ti/drv/rm;protocol=git;branch=${BRANCH}"
> +# Below commit ID corresponds to DEV.RM_LLD.02.01.00.04
> +SRCREV = "59e3bf5fca3995dd0f79bbdd1af988d278a2a049"
> +PR = "r0"
> +PV = "02.01.00.04"
> +
> +COMPATIBLE_MACHINE = "keystone"
> +
> +DEPENDS = "ti-ipc"
> +
> +PACKAGES =+ "${PN}-test"
> +
> +FILES_${PN}-test = "${bindir}/rmDspClientTest_*.out \
> +                    ${bindir}/rmLinuxClientTest_*.out \
> +                    ${bindir}/ti/drv/rm/test/dts_files/*.dtb"
> +
> +DEVICELIST = "k2h k2k"
> +
> +CHOICELIST = "yes no"
> +
> +BASEDIR = "${WORKDIR}/git"
> +S = "${BASEDIR}/ti/drv/rm"
> +
> +do_compile () {
> +#   Now build the lld
> +    make -f makefile_armv7 clean lib PDK_INSTALL_PATH=${STAGING_INCDIR} RM_SRC_DIR=${S}
> +    for device in ${DEVICELIST}
> +    do
> +      for choice in ${CHOICELIST}
> +      do
> +        make -f makefile_armv7 tests IPC_DEVKIT_INSTALL_PATH=${STAGING_INCDIR} PDK_INSTALL_PATH=${BASEDIR} DEVICE="$device" USEDYNAMIC_LIB="$choice"
> +      done
> +    done
> +}
> +
> +do_install () {
> +    install -d ${D}${includedir}/ti/drv/rm
> +    install -d ${D}${libdir}
> +    install -d ${D}${bindir}
> +    for device in ${DEVICELIST}
> +    do
> +      make -f makefile_armv7 install installbin installbin_test INSTALL_INC_BASE_DIR=${D}${includedir} INSTALL_LIB_BASE_DIR=${D}${libdir} INSTALL_BIN_BASE_DIR=${D}${bindir} DEVICE="$device"
> +    done
> +}
> diff --git a/recipes-bsp/rm-lld/ti-rm_git.bb b/recipes-bsp/rm-lld/ti-rm_git.bb
> deleted file mode 100644
> index 276c01e..0000000
> --- a/recipes-bsp/rm-lld/ti-rm_git.bb
> +++ /dev/null
> @@ -1,49 +0,0 @@
> -DESCRIPTION = "TI Resource Manager Low Level Driver"
> -LICENSE = "TI BSD"
> -LIC_FILES_CHKSUM = "file://${WORKDIR}/git/ti/drv/rm/COPYING.txt;md5=dc61631b65360e6beb73b6c337800afc"
> -
> -BRANCH="master"
> -SRC_URI = "git://git.ti.com/keystone-rtos/rm-lld.git;destsuffix=git/ti/drv/rm;protocol=git;branch=${BRANCH}"
> -# Below commit ID corresponds to DEV.RM_LLD.02.01.00.04
> -SRCREV = "59e3bf5fca3995dd0f79bbdd1af988d278a2a049"
> -PR = "r0"
> -PV = "02.01.00.04"
> -
> -COMPATIBLE_MACHINE = "keystone"
> -
> -DEPENDS = "ti-ipc"
> -
> -PACKAGES =+ "${PN}-test"
> -
> -FILES_${PN}-test = "${bindir}/rmDspClientTest_*.out \
> -                    ${bindir}/rmLinuxClientTest_*.out \
> -                    ${bindir}/ti/drv/rm/test/dts_files/*.dtb"
> -
> -DEVICELIST = "k2h k2k"
> -
> -CHOICELIST = "yes no"
> -
> -BASEDIR = "${WORKDIR}/git"
> -S = "${BASEDIR}/ti/drv/rm"
> -
> -do_compile () {
> -#   Now build the lld
> -    make -f makefile_armv7 clean lib PDK_INSTALL_PATH=${STAGING_INCDIR} RM_SRC_DIR=${S}
> -    for device in ${DEVICELIST}
> -    do
> -      for choice in ${CHOICELIST}
> -      do
> -        make -f makefile_armv7 tests IPC_DEVKIT_INSTALL_PATH=${STAGING_INCDIR} PDK_INSTALL_PATH=${BASEDIR} DEVICE="$device" USEDYNAMIC_LIB="$choice"
> -      done
> -    done
> -}
> -
> -do_install () {
> -    install -d ${D}${includedir}/ti/drv/rm
> -    install -d ${D}${libdir}
> -    install -d ${D}${bindir}
> -    for device in ${DEVICELIST}
> -    do
> -      make -f makefile_armv7 install installbin installbin_test INSTALL_INC_BASE_DIR=${D}${includedir} INSTALL_LIB_BASE_DIR=${D}${libdir} INSTALL_BIN_BASE_DIR=${D}${bindir} DEVICE="$device"
> -    done
> -}
> -- 
> 1.7.9.5
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

