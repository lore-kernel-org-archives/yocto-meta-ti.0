Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2B553E00973; Mon, 21 Mar 2016 08:10:27 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CAC84E00948
	for <meta-ti@yoctoproject.org>; Mon, 21 Mar 2016 08:10:25 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id u2LFAOi0018194
	for <meta-ti@yoctoproject.org>; Mon, 21 Mar 2016 10:10:24 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u2LFAOgg023604
	for <meta-ti@yoctoproject.org>; Mon, 21 Mar 2016 10:10:24 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 21 Mar 2016 10:10:24 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id u2LFAOnK031261;
	Mon, 21 Mar 2016 10:10:24 -0500
Date: Mon, 21 Mar 2016 11:10:08 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20160321151007.GD3298@edge>
References: <1458571873-12889-1-git-send-email-j-stiffler@ti.com>
	<1458571873-12889-8-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
In-Reply-To: <1458571873-12889-8-git-send-email-j-stiffler@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH 07/10] sa-lld: Upgrade to version 3.0.0.13
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
X-List-Received-Date: Mon, 21 Mar 2016 15:10:27 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Mar 21, 2016 at 10:51:10AM -0400, Jacob Stiffler wrote:
> * Update license with TI_TFL license
> 
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>  recipes-bsp/sa-lld/sa-lld.inc | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/recipes-bsp/sa-lld/sa-lld.inc b/recipes-bsp/sa-lld/sa-lld.inc
> index 3746a1e..99e2638 100644
> --- a/recipes-bsp/sa-lld/sa-lld.inc
> +++ b/recipes-bsp/sa-lld/sa-lld.inc
> @@ -1,21 +1,21 @@
> -LICENSE = "BSD-3-Clause"
> +LICENSE = "BSD-3-Clause & TI_TFL"

Same comment


>  COMPATIBLE_MACHINE = "keystone"
>  
> -LIC_FILES_CHKSUM = "file://${WORKDIR}/git/ti/drv/sa/COPYING.txt;md5=4709d353574a9569e129ebdf20e732dd"
> +LIC_FILES_CHKSUM = "file://${WORKDIR}/git/ti/drv/sa/COPYING.txt;md5=cd04fb087063a2a82c4ce61983836871"
>  
>  SA_LLD_GIT_URI = "git://git.ti.com/keystone-rtos/sa-lld.git"
>  SA_LLD_GIT_PROTOCOL = "git"
>  SA_LLD_GIT_BRANCH = "master"
>  SA_LLD_GIT_DESTSUFFIX = "git/ti/drv/sa"
>  
> -# Following commit DEV.SA_LLD.03.00.00.12
> -SA_LLD_SRCREV = "b3bd2741126230b397ca827def5fcf6e6f019574"
> +# Following commit DEV.SA_LLD.03.00.00.13
> +SA_LLD_SRCREV = "ddde4d990482c8f727411a014512bc7959ab2c05"
>  
>  BRANCH = "${SA_LLD_GIT_BRANCH}"
>  SRC_URI = "${SA_LLD_GIT_URI};destsuffix=${SA_LLD_GIT_DESTSUFFIX};protocol=${SA_LLD_GIT_PROTOCOL};branch=${BRANCH}"
>  SRCREV = "${SA_LLD_SRCREV}"
>  
> -PV = "03.00.00.12"
> +PV = "03.00.00.13"
>  INC_PR = "r0"
>  
>  S = "${WORKDIR}/${SA_LLD_GIT_DESTSUFFIX}"
> -- 
> 1.9.1
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

