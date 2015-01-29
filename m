Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9EFF0E00827; Wed, 28 Jan 2015 16:50:22 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 18198E006AF
	for <meta-ti@yoctoproject.org>; Wed, 28 Jan 2015 16:50:16 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t0T0oFig027609
	for <meta-ti@yoctoproject.org>; Wed, 28 Jan 2015 18:50:15 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t0T0oElc027051
	for <meta-ti@yoctoproject.org>; Wed, 28 Jan 2015 18:50:14 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 28 Jan 2015 18:50:14 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t0T0oE9N018645;
	Wed, 28 Jan 2015 18:50:14 -0600
Date: Wed, 28 Jan 2015 19:50:13 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Franklin S. Cooper Jr" <fcooper@ti.com>
Message-ID: <20150129005013.GB21328@edge>
References: <1422491258-4786-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
In-Reply-To: <1422491258-4786-1-git-send-email-fcooper@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] sitara-linux-ti-staging_3.14.bb: Update commit to pull in suspend/standby fix
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
X-List-Received-Date: Thu, 29 Jan 2015 00:50:22 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Jan 28, 2015 at 06:27:38PM -0600, Franklin S. Cooper Jr wrote:
> From: "Franklin S. Cooper Jr" <fcooper@ti.com>
> 
> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> ---
>  .../linux/sitara-linux-ti-staging_3.14.bb          |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/recipes-kernel/linux/sitara-linux-ti-staging_3.14.bb b/recipes-kernel/linux/sitara-linux-ti-staging_3.14.bb
> index f9c4641..991f694 100644
> --- a/recipes-kernel/linux/sitara-linux-ti-staging_3.14.bb
> +++ b/recipes-kernel/linux/sitara-linux-ti-staging_3.14.bb
> @@ -35,7 +35,7 @@ S = "${WORKDIR}/git"
>  
>  BRANCH = "sitara-ti-linux-3.14.y"
>  
> -SRCREV = "2d7148a3a95a2811604611f6c66a8826a61b8b12"
> +SRCREV = "99b50bfb0f3fb0e43de31a6735989d31660b0835"
>  PV = "3.14.26"

No PV or PR bump? Are you sure?

-- 
Denys

