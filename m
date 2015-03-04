Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 05B6DE00853; Wed,  4 Mar 2015 06:52:28 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BC440E0076F
	for <meta-ti@yoctoproject.org>; Wed,  4 Mar 2015 06:52:20 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t24EqK4i006502
	for <meta-ti@yoctoproject.org>; Wed, 4 Mar 2015 08:52:20 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t24EqJD3026870
	for <meta-ti@yoctoproject.org>; Wed, 4 Mar 2015 08:52:19 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 4 Mar 2015 08:52:18 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t24EqIIR031915;
	Wed, 4 Mar 2015 08:52:18 -0600
Date: Wed, 4 Mar 2015 09:52:18 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20150304145218.GF6052@edge>
References: <1425470120-18627-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
In-Reply-To: <1425470120-18627-1-git-send-email-j-stiffler@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] sitara-linux-ti-staging: Update commit to fix touchscreen issues on AM335x SK
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
X-List-Received-Date: Wed, 04 Mar 2015 14:52:28 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

BTW, is this fix in main linux-ti-staging?


On Wed, Mar 04, 2015 at 06:55:20AM -0500, Jacob Stiffler wrote:
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>  .../linux/sitara-linux-ti-staging_3.14.bb          |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes-kernel/linux/sitara-linux-ti-staging_3.14.bb b/recipes-kernel/linux/sitara-linux-ti-staging_3.14.bb
> index 8cd2c3f..31c1223 100644
> --- a/recipes-kernel/linux/sitara-linux-ti-staging_3.14.bb
> +++ b/recipes-kernel/linux/sitara-linux-ti-staging_3.14.bb
> @@ -35,11 +35,11 @@ S = "${WORKDIR}/git"
>  
>  BRANCH = "sitara-ti-linux-3.14.y"
>  
> -SRCREV = "99b50bfb0f3fb0e43de31a6735989d31660b0835"
> +SRCREV = "2489c022b2932432606f897741a71b712e6dbe77"
>  PV = "3.14.26"
>  
>  # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
> -MACHINE_KERNEL_PR_append = "g+gitr${SRCPV}"
> +MACHINE_KERNEL_PR_append = "h+gitr${SRCPV}"
>  PR = "${MACHINE_KERNEL_PR}"
>  
>  MULTI_CONFIG_BASE_SUFFIX = ""
> -- 
> 1.7.9.5
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

