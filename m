Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B7D12E00DD9; Wed, 29 Jun 2016 06:57:21 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.153 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E2617E0088C
	for <meta-ti@yoctoproject.org>; Wed, 29 Jun 2016 06:57:17 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id u5TDu98Z012401
	for <meta-ti@yoctoproject.org>; Wed, 29 Jun 2016 08:56:09 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u5TDvHfS014109
	for <meta-ti@yoctoproject.org>; Wed, 29 Jun 2016 08:57:17 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 29 Jun 2016 08:57:16 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id u5TDvGpw005525;
	Wed, 29 Jun 2016 08:57:16 -0500
Date: Wed, 29 Jun 2016 09:57:16 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20160629135715.GE24597@edge>
References: <1467136114-24642-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
In-Reply-To: <1467136114-24642-1-git-send-email-j-stiffler@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] openmp-rtos: bump SRCREV to version 2.3.1.0
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
X-List-Received-Date: Wed, 29 Jun 2016 13:57:21 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Ack


On Tue, Jun 28, 2016 at 01:48:34PM -0400, Jacob Stiffler wrote:
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>  recipes-ti/openmp-rtos/openmp-rtos_git.bb | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/recipes-ti/openmp-rtos/openmp-rtos_git.bb b/recipes-ti/openmp-rtos/openmp-rtos_git.bb
> index 7c781a2..6893179 100644
> --- a/recipes-ti/openmp-rtos/openmp-rtos_git.bb
> +++ b/recipes-ti/openmp-rtos/openmp-rtos_git.bb
> @@ -4,8 +4,8 @@ LICENSE = "BSD"
>  
>  require recipes-ti/includes/ti-paths.inc
>  
> -PV = "2_02_01_03"
> -PR = "r1"
> +PV = "2_03_01_00"
> +PR = "r0"
>  
>  OPENMP_RTOS_GIT_URI = "git://git.ti.com/openmp/ti-openmp-dsp-runtime.git"
>  OPENMP_RTOS_GIT_PROTOCOL = "git"
> @@ -15,7 +15,7 @@ BRANCH = "${OPENMP_RTOS_GIT_BRANCH}"
>  SRC_URI = "${OPENMP_RTOS_GIT_URI};protocol=${OPENMP_RTOS_GIT_PROTOCOL};branch=${BRANCH} \
>  "
>  
> -SRCREV = "9bf371e9618297f8783113bff05995800535c27d"
> +SRCREV = "a73b7b5a79a6ca9390388079b09a1cf5795bd7fc"
>  
>  LIC_FILES_CHKSUM = "file://docs/license/omp_manifest_template.html;md5=61a6972303c0447b7c056195d7ebafee"
>  
> -- 
> 2.7.4
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

