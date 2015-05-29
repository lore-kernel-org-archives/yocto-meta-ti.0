Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 748A6E00A1E; Fri, 29 May 2015 13:12:30 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 08BC8E009A3
	for <meta-ti@yoctoproject.org>; Fri, 29 May 2015 13:12:28 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t4TKCRDU009238
	for <meta-ti@yoctoproject.org>; Fri, 29 May 2015 15:12:27 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t4TKCQ0G017480
	for <meta-ti@yoctoproject.org>; Fri, 29 May 2015 15:12:26 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 29 May 2015 15:12:26 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t4TKCQ8E024657;
	Fri, 29 May 2015 15:12:26 -0500
Date: Fri, 29 May 2015 16:12:26 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20150529201226.GH16418@edge>
References: <1432743617-24000-1-git-send-email-j-stiffler@ti.com>
	<1432743617-24000-2-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
In-Reply-To: <1432743617-24000-2-git-send-email-j-stiffler@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH 1/3] edma3-lld: Seperate source and version into include file.
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
X-List-Received-Date: Fri, 29 May 2015 20:12:30 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Ack

On Wed, May 27, 2015 at 12:20:15PM -0400, Jacob Stiffler wrote:
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>  recipes-bsp/edma3-lld/edma3-lld.inc    |   10 ++++++++++
>  recipes-bsp/edma3-lld/edma3-lld_git.bb |   11 +----------
>  2 files changed, 11 insertions(+), 10 deletions(-)
>  create mode 100644 recipes-bsp/edma3-lld/edma3-lld.inc
>  mode change 100755 => 100644 recipes-bsp/edma3-lld/edma3-lld_git.bb
> 
> diff --git a/recipes-bsp/edma3-lld/edma3-lld.inc b/recipes-bsp/edma3-lld/edma3-lld.inc
> new file mode 100644
> index 0000000..e6dd92b
> --- /dev/null
> +++ b/recipes-bsp/edma3-lld/edma3-lld.inc
> @@ -0,0 +1,10 @@
> +DESCRIPTION = "TI EDMA3 low level driver and test code"
> +LICENSE = "BSD-3-Clause"
> +LIC_FILES_CHKSUM = "file://COPYING.txt;md5=5bdceac872dffdec915b819654ee23ea"
> +
> +BRANCH = "master"
> +SRC_URI = "git://git.ti.com/keystone-rtos/edma3_lld.git"
> +# The following commit corresponds to tag DEV_EDMA3_LLD_02_11_13_17
> +SRCREV = "8c27e548fa53ca8472404ef347b8f6b6e2588d46"
> +
> +PV = "2.11.13"
> diff --git a/recipes-bsp/edma3-lld/edma3-lld_git.bb b/recipes-bsp/edma3-lld/edma3-lld_git.bb
> old mode 100755
> new mode 100644
> index 1ed4b93..913dd3e
> --- a/recipes-bsp/edma3-lld/edma3-lld_git.bb
> +++ b/recipes-bsp/edma3-lld/edma3-lld_git.bb
> @@ -1,13 +1,5 @@
> -DESCRIPTION = "TI EDMA3 low level driver and test code"
> -LICENSE = "BSD-3-Clause"
> -LIC_FILES_CHKSUM = "file://COPYING.txt;md5=5bdceac872dffdec915b819654ee23ea"
> +require edma3-lld.inc
>  
> -BRANCH = "master"
> -SRC_URI = "git://git.ti.com/keystone-rtos/edma3_lld.git"
> -# The following commit corresponds to tag DEV_EDMA3_LLD_02_11_13_17
> -SRCREV = "8c27e548fa53ca8472404ef347b8f6b6e2588d46"
> -
> -PV = "2.11.13"
>  PR = "r0"
>  
>  COMPATIBLE_MACHINE = "keystone"
> @@ -77,4 +69,3 @@ do_install () {
>  	install -c -m 755 ${S}/examples/edma3_user_space_driver/evmC66AK2E/bin/c66ak2e-evm/edma3_drv_c66ak2e_a15_sample_a15host_release.xa15fg \
>  		${D}/${bindir}/edma3_drv_c66ak2e_a15_sample_a15host_release.xa15fg
>  }
> -
> -- 
> 1.7.9.5
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

