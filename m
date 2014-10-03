Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E1220E007B9; Fri,  3 Oct 2014 15:19:24 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 955BCE00781
	for <meta-ti@yoctoproject.org>; Fri,  3 Oct 2014 15:19:19 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s93MJJ9C031871
	for <meta-ti@yoctoproject.org>; Fri, 3 Oct 2014 17:19:19 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s93MJJf7017745
	for <meta-ti@yoctoproject.org>; Fri, 3 Oct 2014 17:19:19 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 3 Oct 2014 17:19:18 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s93MJIUc027740;
	Fri, 3 Oct 2014 17:19:18 -0500
Date: Fri, 3 Oct 2014 18:19:18 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Sam Nelson <sam.nelson@ti.com>
Message-ID: <20141003221918.GA32107@edge>
References: <1412374480-29133-1-git-send-email-sam.nelson@ti.com>
	<1412374480-29133-2-git-send-email-sam.nelson@ti.com>
MIME-Version: 1.0
In-Reply-To: <1412374480-29133-2-git-send-email-sam.nelson@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH 2/2] common-csl-ip: Update to csl version 2.1.0.5
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
X-List-Received-Date: Fri, 03 Oct 2014 22:19:25 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Ack. Please also submit the patch to remove it from meta-arago.

On Fri, Oct 03, 2014 at 06:14:40PM -0400, Sam Nelson wrote:
> - Updated description
> - Updated LICENSE to BSD-3-Clause
> - Updated Commit id
> - Removed trailing whitespaces
> 
> Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> ---
>  recipes-bsp/common-csl-ip/common-csl-ip.bb |   12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/recipes-bsp/common-csl-ip/common-csl-ip.bb b/recipes-bsp/common-csl-ip/common-csl-ip.bb
> index fb5e6f8..1059357 100644
> --- a/recipes-bsp/common-csl-ip/common-csl-ip.bb
> +++ b/recipes-bsp/common-csl-ip/common-csl-ip.bb
> @@ -1,21 +1,21 @@
> -DESCRIPTION = "TI CSL"
> -LICENSE = "TI BSD"
> +DESCRIPTION = "Chip support library low level interface"
> +LICENSE = "BSD-3-Clause"
>  LIC_FILES_CHKSUM = "file://COPYING.txt;md5=5857833e20836213677fac33f9aded21"
>  
>  COMPATIBLE_MACHINE = "keystone"
>  ALLOW_EMPTY_${PN} = "1"
>  
> -PR = "r0"
> +PR = "r1"
>  BRANCH="master"
>  SRC_URI = "git://git.ti.com/keystone-rtos/common-csl-ip.git;protocol=git;branch=${BRANCH}"
> -# commit ID corresponds to DEV.CSL_KEYSTONE2.02.00.00.17
> -SRCREV = "f6f90144c14e1ee783c4b893b52e54830be8166e" 
> +# commit ID corresponds to DEV.CSL_KEYSTONE2.02.01.00.05A
> +SRCREV = "80d18dda4a76ce1a22cf2b5156f111390d75bea4"
>  
>  S = "${WORKDIR}/git"
>  
>  do_install () {
>      install -d ${D}${includedir}/ti/csl
> -    find . -name "*.h" -type f | xargs -I {} cp --parents {} ${D}${includedir}/ti/csl 
> +    find . -name "*.h" -type f | xargs -I {} cp --parents {} ${D}${includedir}/ti/csl
>      find ./src/ip/serdes_sb/V0 -name "*.c" -type f | xargs -I {} cp --parents {} ${D}${includedir}/ti/csl
>  }
>  
> -- 
> 1.7.9.5
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

