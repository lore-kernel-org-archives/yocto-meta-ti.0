Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 33C00E00A1E; Fri, 29 May 2015 13:12:11 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 03C0AE009A3
	for <meta-ti@yoctoproject.org>; Fri, 29 May 2015 13:12:08 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t4TKC7fT025137
	for <meta-ti@yoctoproject.org>; Fri, 29 May 2015 15:12:07 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t4TKC7Cp028099
	for <meta-ti@yoctoproject.org>; Fri, 29 May 2015 15:12:07 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 29 May 2015 15:12:07 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t4TKC7Y3003691;
	Fri, 29 May 2015 15:12:07 -0500
Date: Fri, 29 May 2015 16:12:06 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20150529201206.GG16418@edge>
References: <1432743617-24000-1-git-send-email-j-stiffler@ti.com>
	<1432743617-24000-3-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
In-Reply-To: <1432743617-24000-3-git-send-email-j-stiffler@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH 2/3] edma3-lld: Update to version 2.12.01.21.
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
X-List-Received-Date: Fri, 29 May 2015 20:12:11 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Ack

On Wed, May 27, 2015 at 12:20:16PM -0400, Jacob Stiffler wrote:
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>  recipes-bsp/edma3-lld/edma3-lld.inc |    8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/recipes-bsp/edma3-lld/edma3-lld.inc b/recipes-bsp/edma3-lld/edma3-lld.inc
> index e6dd92b..28c49e3 100644
> --- a/recipes-bsp/edma3-lld/edma3-lld.inc
> +++ b/recipes-bsp/edma3-lld/edma3-lld.inc
> @@ -3,8 +3,8 @@ LICENSE = "BSD-3-Clause"
>  LIC_FILES_CHKSUM = "file://COPYING.txt;md5=5bdceac872dffdec915b819654ee23ea"
>  
>  BRANCH = "master"
> -SRC_URI = "git://git.ti.com/keystone-rtos/edma3_lld.git"
> -# The following commit corresponds to tag DEV_EDMA3_LLD_02_11_13_17
> -SRCREV = "8c27e548fa53ca8472404ef347b8f6b6e2588d46"
> +SRC_URI = "git://git.ti.com/keystone-rtos/edma3_lld.git;protocol=git;branch=${BRANCH}"
> +# The following commit corresponds to tag DEV_EDMA3_LLD_02_12_01_21_RC1
> +SRCREV = "562cba36ccd53e89e6979e99a58374513b543f93"
>  
> -PV = "2.11.13"
> +PV = "2.12.01.21"
> -- 
> 1.7.9.5
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

