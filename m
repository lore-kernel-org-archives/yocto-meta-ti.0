Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 56758E0049B; Mon, 19 Oct 2015 14:07:41 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9DA03E00343
	for <meta-ti@yoctoproject.org>; Mon, 19 Oct 2015 14:07:39 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t9JL7dHU005865
	for <meta-ti@yoctoproject.org>; Mon, 19 Oct 2015 16:07:39 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t9JL7dUn008117
	for <meta-ti@yoctoproject.org>; Mon, 19 Oct 2015 16:07:39 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 19 Oct 2015 16:07:39 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t9JL7cb4025716;
	Mon, 19 Oct 2015 16:07:38 -0500
Date: Mon, 19 Oct 2015 17:07:23 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Sam Nelson <sam.nelson@ti.com>
Message-ID: <20151019210723.GI5620@edge>
References: <1445283096-9288-1-git-send-email-sam.nelson@ti.com>
MIME-Version: 1.0
In-Reply-To: <1445283096-9288-1-git-send-email-sam.nelson@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] sa-lld: Update to new version 3.0.0.11
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
X-List-Received-Date: Mon, 19 Oct 2015 21:07:41 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Oct 19, 2015 at 03:31:36PM -0400, Sam Nelson wrote:
> - Add device independent symbolic link for dynamic library

Same comment for libs, as with libpa...


> - Add utils to test build
> 
> Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> ---
>  recipes-bsp/sa-lld/sa-lld-test_git.bb |    2 +-
>  recipes-bsp/sa-lld/sa-lld.inc         |    7 +++----
>  recipes-bsp/sa-lld/sa-lld_git.bb      |    5 +++++
>  3 files changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/recipes-bsp/sa-lld/sa-lld-test_git.bb b/recipes-bsp/sa-lld/sa-lld-test_git.bb
> index 2069d41..7cb0ac7 100644
> --- a/recipes-bsp/sa-lld/sa-lld-test_git.bb
> +++ b/recipes-bsp/sa-lld/sa-lld-test_git.bb
> @@ -15,7 +15,7 @@ do_compile () {
>  		make -f makefile_armv7 clean PDK_INSTALL_PATH=${STAGING_INCDIR} DEVICE="$device" SA_SRC_DIR=${S}
>  		for choice in ${CHOICELIST}
>  		do
> -			make -f makefile_armv7 examples PDK_INSTALL_PATH=${STAGING_INCDIR} DEVICE="$device" SA_SRC_DIR=${S} USEDYNAMIC_LIB="$choice"
> +			make -f makefile_armv7 examples utils PDK_INSTALL_PATH=${STAGING_INCDIR} DEVICE="$device" SA_SRC_DIR=${S} USEDYNAMIC_LIB="$choice"
>  		done
>  	done
>  }
> diff --git a/recipes-bsp/sa-lld/sa-lld.inc b/recipes-bsp/sa-lld/sa-lld.inc
> index 6dc8566..8066279 100644
> --- a/recipes-bsp/sa-lld/sa-lld.inc
> +++ b/recipes-bsp/sa-lld/sa-lld.inc
> @@ -5,10 +5,9 @@ LIC_FILES_CHKSUM = "file://${WORKDIR}/git/ti/drv/sa/COPYING.txt;md5=4709d353574a
>  
>  BRANCH = "master"
>  SRC_URI = "git://git.ti.com/keystone-rtos/sa-lld.git;destsuffix=git/ti/drv/sa;protocol=git;branch=${BRANCH}"
> -# Following commit DEV.SA_LLD.03.00.00.10
> -SRCREV = "533aec7ef0e28c3faff4ee64a861c8935262dc33"
> -PV = "03.00.00.10"
> -PR = "r1"
> +# Following commit DEV.SA_LLD.03.00.00.11A
> +SRCREV = "bf5b097e868b20d23d386abc34a1902903d7d9ea"
> +PV = "03.00.00.11"
>  
>  BASEDIR = "${WORKDIR}/git"
>  S = "${BASEDIR}/ti/drv/sa"
> diff --git a/recipes-bsp/sa-lld/sa-lld_git.bb b/recipes-bsp/sa-lld/sa-lld_git.bb
> index f345895..c6ad7be 100644
> --- a/recipes-bsp/sa-lld/sa-lld_git.bb
> +++ b/recipes-bsp/sa-lld/sa-lld_git.bb
> @@ -11,4 +11,9 @@ do_compile () {
>  
>  do_install () {
>  	make -f makefile_armv7 install PDK_INSTALL_PATH=${STAGING_INCDIR} INSTALL_INC_BASE_DIR=${D}/${includedir} INSTALL_LIB_BASE_DIR=${D}${libdir}
> +
> +#   Set the generic device library symbolic link
> +	cd ${D}${libdir}
> +	ln -sf libsa.so.1.0.0 libsa_device.so.1
> +	ln -sf libsa_device.so.1 libsa_device.so
>  }
> -- 
> 1.7.9.5
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

