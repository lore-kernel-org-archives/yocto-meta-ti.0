Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A871EE00A48; Fri, 29 May 2015 12:34:11 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 67F66E00A5B
	for <meta-ti@yoctoproject.org>; Fri, 29 May 2015 12:34:02 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t4TJY0Uu012047
	for <meta-ti@yoctoproject.org>; Fri, 29 May 2015 14:34:00 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t4TJY0Nr031082
	for <meta-ti@yoctoproject.org>; Fri, 29 May 2015 14:34:00 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 29 May 2015 14:34:00 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t4TJY0aH014650;
	Fri, 29 May 2015 14:34:00 -0500
Date: Fri, 29 May 2015 15:34:00 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: <hzhang@ti.com>
Message-ID: <20150529193359.GN16418@edge>
References: <1432823060-6595-1-git-send-email-hzhang@ti.com>
MIME-Version: 1.0
In-Reply-To: <1432823060-6595-1-git-send-email-hzhang@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] linux-keystone: update to new kernel version 3.10.72
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
X-List-Received-Date: Fri, 29 May 2015 19:34:11 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Ack

On Thu, May 28, 2015 at 10:24:20AM -0400, hzhang@ti.com wrote:
> From: Hao Zhang <hzhang@ti.com>
> 
> Branch name changed to release specific branch
> 
> Signed-off-by: Hao Zhang <hzhang@ti.com>
> ---
>  recipes-kernel/linux/linux-keystone-rt_3.10.bb |    8 ++++----
>  recipes-kernel/linux/linux-keystone_3.10.bb    |    8 ++++----
>  2 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/recipes-kernel/linux/linux-keystone-rt_3.10.bb b/recipes-kernel/linux/linux-keystone-rt_3.10.bb
> index 7ce45b5..51e18d3 100644
> --- a/recipes-kernel/linux/linux-keystone-rt_3.10.bb
> +++ b/recipes-kernel/linux/linux-keystone-rt_3.10.bb
> @@ -19,11 +19,11 @@ KERNEL_DEVICETREE_k2l-evm = "k2l-evm.dtb"
>  
>  KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT}"
>  
> -#This commit corresponds to "K2_RT_LINUX_03.10.61_15.02"
> -SRCREV = "e2e31a1d996d2ed8dd06dab1221e159033432b72"
> -PV = "3.10.61+git${SRCPV}"
> +#This commit corresponds to "K2_RT_LINUX_03.10.72_15.##"
> +SRCREV = "d607d75a2de99b3723cf9a2ba56f839debbee3c8"
> +PV = "3.10.72+git${SRCPV}"
>  
> -BRANCH = "v3.10.61/master-rt"
> +BRANCH = "v3.10.72/master-rt"
>  SRC_URI = "git://git.ti.com/keystone-linux/linux.git;protocol=git;branch=${BRANCH}\
>             file://defconfig\
>             "
> diff --git a/recipes-kernel/linux/linux-keystone_3.10.bb b/recipes-kernel/linux/linux-keystone_3.10.bb
> index 78d5a0e..01573ca 100644
> --- a/recipes-kernel/linux/linux-keystone_3.10.bb
> +++ b/recipes-kernel/linux/linux-keystone_3.10.bb
> @@ -19,11 +19,11 @@ KERNEL_DEVICETREE_k2l-evm = "k2l-evm.dtb"
>  
>  KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT}"
>  
> -#This commit corresponds to "K2_LINUX_03.10.61_15.02"
> -SRCREV = "a17b4c3fd6c93f908daf032786f90c0321296957"
> -PV = "3.10.61+git${SRCPV}"
> +#This commit corresponds to "K2_LINUX_03.10.72_15.##"
> +SRCREV = "b9bad8fccc5f9c6bcd78363982b3249a15f193fb"
> +PV = "3.10.72+git${SRCPV}"
>  
> -BRANCH = "v3.10.61/master"
> +BRANCH = "v3.10.72/master"
>  SRC_URI = "git://git.ti.com/keystone-linux/linux.git;protocol=git;branch=${BRANCH}\
>             file://defconfig\
>             "
> -- 
> 1.7.9.5
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

