Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BF9F8E00973; Mon, 21 Mar 2016 08:09:46 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 41C61E00948
	for <meta-ti@yoctoproject.org>; Mon, 21 Mar 2016 08:09:44 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id u2LF9ilS026560
	for <meta-ti@yoctoproject.org>; Mon, 21 Mar 2016 10:09:44 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u2LF9iD2022686
	for <meta-ti@yoctoproject.org>; Mon, 21 Mar 2016 10:09:44 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 21 Mar 2016 10:09:43 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id u2LF9hCr011448;
	Mon, 21 Mar 2016 10:09:43 -0500
Date: Mon, 21 Mar 2016 11:09:27 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20160321150927.GC3298@edge>
References: <1458571873-12889-1-git-send-email-j-stiffler@ti.com>
	<1458571873-12889-7-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
In-Reply-To: <1458571873-12889-7-git-send-email-j-stiffler@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH 06/10] pa-lld: Upgrade to version 3.0.1.8
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
X-List-Received-Date: Mon, 21 Mar 2016 15:09:46 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Mar 21, 2016 at 10:51:09AM -0400, Jacob Stiffler wrote:
> * Update license to add TI_TFL license
> 
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>  recipes-bsp/pa-lld/pa-lld.inc | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/recipes-bsp/pa-lld/pa-lld.inc b/recipes-bsp/pa-lld/pa-lld.inc
> index 7b09ceb..9fe9cf5 100644
> --- a/recipes-bsp/pa-lld/pa-lld.inc
> +++ b/recipes-bsp/pa-lld/pa-lld.inc
> @@ -1,5 +1,5 @@
> -LICENSE = "BSD-3-Clause"
> -LIC_FILES_CHKSUM = "file://${WORKDIR}/git/ti/drv/pa/COPYING.txt;md5=e8f6789acdcda76d02ed9203fc2e603d"
> +LICENSE = "BSD-3-Clause & TI_TFL"

Same comment as #3


> +LIC_FILES_CHKSUM = "file://${WORKDIR}/git/ti/drv/pa/COPYING.txt;md5=cd04fb087063a2a82c4ce61983836871"
>  
>  COMPATIBLE_MACHINE = "keystone"
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
> @@ -9,15 +9,15 @@ PA_LLD_GIT_PROTOCOL = "git"
>  PA_LLD_GIT_BRANCH = "master"
>  PA_LLD_GIT_DESTSUFFIX = "git/ti/drv/pa"
>  
> -# Below Commit ID corresponds to "DEV.PA_LLD.03.00.01.07"
> -PA_LLD_SRCREV = "cad5bc0b422a7ac3c6fa013fc2288447318329a0"
> +# Below Commit ID corresponds to "DEV.PA_LLD.03.00.01.08"
> +PA_LLD_SRCREV = "43badac6ff6269e9449fb03fb7af985e61ab723c"
>  
>  BRANCH = "${PA_LLD_GIT_BRANCH}"
>  SRC_URI = "${PA_LLD_GIT_URI};destsuffix=${PA_LLD_GIT_DESTSUFFIX};protocol=${PA_LLD_GIT_PROTOCOL};branch=${BRANCH} \
>              file://0001-makefile_armv7-fix-missing-separator-error.patch"
>  SRCREV = "${PA_LLD_SRCREV}"
>  
> -PV = "03.00.01.07"
> +PV = "03.00.01.08"
>  INC_PR = "r0"
>  
>  S = "${WORKDIR}/${PA_LLD_GIT_DESTSUFFIX}"
> -- 
> 1.9.1
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

