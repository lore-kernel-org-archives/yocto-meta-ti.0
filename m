Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9C58BE00BBF; Fri,  4 Mar 2016 13:57:41 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id ED145E00B89
	for <meta-ti@yoctoproject.org>; Fri,  4 Mar 2016 13:57:39 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id u24LvcfM017193
	for <meta-ti@yoctoproject.org>; Fri, 4 Mar 2016 15:57:38 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u24Lvcxw006434
	for <meta-ti@yoctoproject.org>; Fri, 4 Mar 2016 15:57:38 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 4 Mar 2016 15:57:38 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id u24Lvc4k025530;
	Fri, 4 Mar 2016 15:57:38 -0600
Date: Fri, 4 Mar 2016 16:57:22 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20160304215722.GJ7505@edge>
References: <1457128326-25975-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
In-Reply-To: <1457128326-25975-1-git-send-email-j-stiffler@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] multiprocmgr: Add SRCREV
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
X-List-Received-Date: Fri, 04 Mar 2016 21:57:41 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Thanks a bunch! Pushing now.


On Fri, Mar 04, 2016 at 04:52:06PM -0500, Jacob Stiffler wrote:
> * This commit corresponds to the tag DEV.MPM-3.00.01.00
> 
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>  recipes-ti/multiprocmgr/multiprocmgr.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/recipes-ti/multiprocmgr/multiprocmgr.inc b/recipes-ti/multiprocmgr/multiprocmgr.inc
> index 915ac7a..9c134c4 100644
> --- a/recipes-ti/multiprocmgr/multiprocmgr.inc
> +++ b/recipes-ti/multiprocmgr/multiprocmgr.inc
> @@ -9,7 +9,7 @@ MULTIPROCMGR_GIT_PROTOCOL = "git"
>  MULTIPROCMGR_GIT_BRANCH = "master"
>  
>  # The following commits correspond to DEV.MPM-3.00.01.00
> -MULTIPROCMGR_SRCREV = ""
> +MULTIPROCMGR_SRCREV = "6c2c0f7d14d34eb9074c6d6a6bd112da3751fb7e"
>  
>  PV = "3.0.1.0"
>  INC_PR = "r0"
> -- 
> 1.9.1
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

