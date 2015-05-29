Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1A903E009A3; Fri, 29 May 2015 13:08:11 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 449FBE0086D
	for <meta-ti@yoctoproject.org>; Fri, 29 May 2015 13:08:07 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t4TK86f1012360
	for <meta-ti@yoctoproject.org>; Fri, 29 May 2015 15:08:06 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t4TK86ug024998
	for <meta-ti@yoctoproject.org>; Fri, 29 May 2015 15:08:06 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 29 May 2015 15:08:06 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t4TK862m008938;
	Fri, 29 May 2015 15:08:06 -0500
Date: Fri, 29 May 2015 16:08:06 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20150529200805.GC16418@edge>
References: <1432735838-7207-1-git-send-email-j-stiffler@ti.com>
	<1432735838-7207-3-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
In-Reply-To: <1432735838-7207-3-git-send-email-j-stiffler@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH 2/4] common-csl-ip: Seperate source and version into include file.
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
X-List-Received-Date: Fri, 29 May 2015 20:08:11 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Ack

On Wed, May 27, 2015 at 10:10:36AM -0400, Jacob Stiffler wrote:
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>  recipes-bsp/common-csl-ip/common-csl-ip.inc    |   10 ++++++++++
>  recipes-bsp/common-csl-ip/common-csl-ip_git.bb |   13 +++----------
>  2 files changed, 13 insertions(+), 10 deletions(-)
>  create mode 100644 recipes-bsp/common-csl-ip/common-csl-ip.inc
> 
> diff --git a/recipes-bsp/common-csl-ip/common-csl-ip.inc b/recipes-bsp/common-csl-ip/common-csl-ip.inc
> new file mode 100644
> index 0000000..1fa34f3
> --- /dev/null
> +++ b/recipes-bsp/common-csl-ip/common-csl-ip.inc
> @@ -0,0 +1,10 @@
> +DESCRIPTION = "Chip support library low level interface"
> +LICENSE = "BSD-3-Clause"
> +LIC_FILES_CHKSUM = "file://COPYING.txt;md5=5857833e20836213677fac33f9aded21"
> +
> +COMPATIBLE_MACHINE = "keystone"
> +
> +BRANCH="master"
> +SRC_URI = "git://git.ti.com/keystone-rtos/common-csl-ip.git;protocol=git;branch=${BRANCH}"
> +# commit ID corresponds to DEV.CSL_KEYSTONE2.02.01.00.07A
> +SRCREV = "c78867df9165fdf8042fb692fcea776fc0102326"
> diff --git a/recipes-bsp/common-csl-ip/common-csl-ip_git.bb b/recipes-bsp/common-csl-ip/common-csl-ip_git.bb
> index 01f7fc5..8f622a5 100644
> --- a/recipes-bsp/common-csl-ip/common-csl-ip_git.bb
> +++ b/recipes-bsp/common-csl-ip/common-csl-ip_git.bb
> @@ -1,15 +1,8 @@
> -DESCRIPTION = "Chip support library low level interface"
> -LICENSE = "BSD-3-Clause"
> -LIC_FILES_CHKSUM = "file://COPYING.txt;md5=5857833e20836213677fac33f9aded21"
> -
> -COMPATIBLE_MACHINE = "keystone"
> -ALLOW_EMPTY_${PN} = "1"
> +require common-csl-ip.inc
>  
>  PR = "r3"
> -BRANCH="master"
> -SRC_URI = "git://git.ti.com/keystone-rtos/common-csl-ip.git;protocol=git;branch=${BRANCH}"
> -# commit ID corresponds to DEV.CSL_KEYSTONE2.02.01.00.07A
> -SRCREV = "c78867df9165fdf8042fb692fcea776fc0102326"
> +
> +ALLOW_EMPTY_${PN} = "1"
>  
>  S = "${WORKDIR}/git"
>  
> -- 
> 1.7.9.5
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

