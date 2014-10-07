Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4B174E007C1; Tue,  7 Oct 2014 14:45:14 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.41 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 93078E0076C
	for <meta-ti@yoctoproject.org>; Tue,  7 Oct 2014 14:45:08 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s97Lj8jk020656
	for <meta-ti@yoctoproject.org>; Tue, 7 Oct 2014 16:45:08 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s97Lj8Rg027169
	for <meta-ti@yoctoproject.org>; Tue, 7 Oct 2014 16:45:08 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 7 Oct 2014 16:45:08 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s97Lj8QB006385;
	Tue, 7 Oct 2014 16:45:08 -0500
Date: Tue, 7 Oct 2014 17:45:07 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Sam Nelson <sam.nelson@ti.com>
Message-ID: <20141007214507.GM1731@edge>
References: <1412717489-29990-1-git-send-email-sam.nelson@ti.com>
	<1412717489-29990-3-git-send-email-sam.nelson@ti.com>
MIME-Version: 1.0
In-Reply-To: <1412717489-29990-3-git-send-email-sam.nelson@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH 3/3] rm-lld: Update to new version 2.1.0.6
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
X-List-Received-Date: Tue, 07 Oct 2014 21:45:14 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Oct 07, 2014 at 05:31:29PM -0400, Sam Nelson wrote:
> - Add dependency on libdaemon
> - Remove device dependency
> 
> Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> ---
>  recipes-bsp/rm-lld/rm-lld_git.bb |   24 ++++++++----------------
>  1 file changed, 8 insertions(+), 16 deletions(-)
> 
> diff --git a/recipes-bsp/rm-lld/rm-lld_git.bb b/recipes-bsp/rm-lld/rm-lld_git.bb
> index 276c01e..e3646cf 100644
> --- a/recipes-bsp/rm-lld/rm-lld_git.bb
> +++ b/recipes-bsp/rm-lld/rm-lld_git.bb
> @@ -4,14 +4,14 @@ LIC_FILES_CHKSUM = "file://${WORKDIR}/git/ti/drv/rm/COPYING.txt;md5=dc61631b6536
>  
>  BRANCH="master"
>  SRC_URI = "git://git.ti.com/keystone-rtos/rm-lld.git;destsuffix=git/ti/drv/rm;protocol=git;branch=${BRANCH}"
> -# Below commit ID corresponds to DEV.RM_LLD.02.01.00.04
> -SRCREV = "59e3bf5fca3995dd0f79bbdd1af988d278a2a049"
> -PR = "r0"
> -PV = "02.01.00.04"
> +# Below commit ID corresponds to DEV.RM_LLD.02.01.00.06
> +SRCREV = "dc0dba4a6b0358efcb861d50b3dae21beb5281a8"
> +PR = "r1"
> +PV = "02.01.00.06"

A very minor nitpick - when you update PV, you usually reset PR.


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

