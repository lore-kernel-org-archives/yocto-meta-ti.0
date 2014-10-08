Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 89045E0077F; Wed,  8 Oct 2014 10:46:21 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.152 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 43491E006DB
	for <meta-ti@yoctoproject.org>; Wed,  8 Oct 2014 10:46:19 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s98HkJWs029409
	for <meta-ti@yoctoproject.org>; Wed, 8 Oct 2014 12:46:19 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s98HkJiw004564
	for <meta-ti@yoctoproject.org>; Wed, 8 Oct 2014 12:46:19 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 8 Oct 2014 12:46:18 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id s98HkIF8023931;
	Wed, 8 Oct 2014 12:46:18 -0500
Date: Wed, 8 Oct 2014 13:46:18 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Sam Nelson <sam.nelson@ti.com>
Message-ID: <20141008174618.GQ1731@edge>
References: <1412764049-7074-1-git-send-email-sam.nelson@ti.com>
	<1412764049-7074-2-git-send-email-sam.nelson@ti.com>
MIME-Version: 1.0
In-Reply-To: <1412764049-7074-2-git-send-email-sam.nelson@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH v2 2/2] rm-lld: Rename recipe and update to new version
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
X-List-Received-Date: Wed, 08 Oct 2014 17:46:21 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Sam,

Thanks for addressing all the comments! This looks good and I'll push it to 
meta-ti today.

-- 
Denys


On Wed, Oct 08, 2014 at 06:27:29AM -0400, Sam Nelson wrote:
> - Removed ti-prefix based on review
> - Update to new version 2.1.0.6
> - Add dependency on libdaemon
> - Remove device dependency
> - Updated license to BSD-3-Clause
> 
> Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> ---
> Changes from previous patch
> - Combined two commits into one
> - Reset PR as PV is updated
> - Updated comments: Updated license to BSD-3-Clause
> ---
> ---
>  recipes-bsp/rm-lld/{ti-rm_git.bb => rm-lld_git.bb} |   24 +++++++-------------
>  1 file changed, 8 insertions(+), 16 deletions(-)
>  rename recipes-bsp/rm-lld/{ti-rm_git.bb => rm-lld_git.bb} (56%)
> 
> diff --git a/recipes-bsp/rm-lld/ti-rm_git.bb b/recipes-bsp/rm-lld/rm-lld_git.bb
> similarity index 56%
> rename from recipes-bsp/rm-lld/ti-rm_git.bb
> rename to recipes-bsp/rm-lld/rm-lld_git.bb
> index 276c01e..ed34478 100644
> --- a/recipes-bsp/rm-lld/ti-rm_git.bb
> +++ b/recipes-bsp/rm-lld/rm-lld_git.bb
> @@ -1,17 +1,17 @@
>  DESCRIPTION = "TI Resource Manager Low Level Driver"
> -LICENSE = "TI BSD"
> +LICENSE = "BSD-3-Clause"
>  LIC_FILES_CHKSUM = "file://${WORKDIR}/git/ti/drv/rm/COPYING.txt;md5=dc61631b65360e6beb73b6c337800afc"
>  
>  BRANCH="master"
>  SRC_URI = "git://git.ti.com/keystone-rtos/rm-lld.git;destsuffix=git/ti/drv/rm;protocol=git;branch=${BRANCH}"
> -# Below commit ID corresponds to DEV.RM_LLD.02.01.00.04
> -SRCREV = "59e3bf5fca3995dd0f79bbdd1af988d278a2a049"
> +# Below commit ID corresponds to DEV.RM_LLD.02.01.00.06
> +SRCREV = "dc0dba4a6b0358efcb861d50b3dae21beb5281a8"
> +PV = "02.01.00.06"
>  PR = "r0"
> -PV = "02.01.00.04"
>  
>  COMPATIBLE_MACHINE = "keystone"
>  
> -DEPENDS = "ti-ipc"
> +DEPENDS = "ti-ipc libdaemon"
>  
>  PACKAGES =+ "${PN}-test"
>  
> @@ -19,8 +19,6 @@ FILES_${PN}-test = "${bindir}/rmDspClientTest_*.out \
>                      ${bindir}/rmLinuxClientTest_*.out \
>                      ${bindir}/ti/drv/rm/test/dts_files/*.dtb"
>  
> -DEVICELIST = "k2h k2k"
> -
>  CHOICELIST = "yes no"
>  
>  BASEDIR = "${WORKDIR}/git"
> @@ -29,12 +27,9 @@ S = "${BASEDIR}/ti/drv/rm"
>  do_compile () {
>  #   Now build the lld
>      make -f makefile_armv7 clean lib PDK_INSTALL_PATH=${STAGING_INCDIR} RM_SRC_DIR=${S}
> -    for device in ${DEVICELIST}
> +    for choice in ${CHOICELIST}
>      do
> -      for choice in ${CHOICELIST}
> -      do
> -        make -f makefile_armv7 tests IPC_DEVKIT_INSTALL_PATH=${STAGING_INCDIR} PDK_INSTALL_PATH=${BASEDIR} DEVICE="$device" USEDYNAMIC_LIB="$choice"
> -      done
> +      make -f makefile_armv7 tests IPC_DEVKIT_INSTALL_PATH=${STAGING_INCDIR} PDK_INSTALL_PATH=${BASEDIR} USEDYNAMIC_LIB="$choice"
>      done
>  }
>  
> @@ -42,8 +37,5 @@ do_install () {
>      install -d ${D}${includedir}/ti/drv/rm
>      install -d ${D}${libdir}
>      install -d ${D}${bindir}
> -    for device in ${DEVICELIST}
> -    do
> -      make -f makefile_armv7 install installbin installbin_test INSTALL_INC_BASE_DIR=${D}${includedir} INSTALL_LIB_BASE_DIR=${D}${libdir} INSTALL_BIN_BASE_DIR=${D}${bindir} DEVICE="$device"
> -    done
> +    make -f makefile_armv7 install installbin installbin_test INSTALL_INC_BASE_DIR=${D}${includedir} INSTALL_LIB_BASE_DIR=${D}${libdir} INSTALL_BIN_BASE_DIR=${D}${bindir}
>  }
> -- 
> 1.7.9.5
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

