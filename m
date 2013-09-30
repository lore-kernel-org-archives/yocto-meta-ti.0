Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4BE66E015DA
	for <meta-ti@yoctoproject.org>; Sun, 29 Sep 2013 20:38:14 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r8U3cDfK028874;
	Sun, 29 Sep 2013 22:38:13 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r8U3cCt3014762;
	Sun, 29 Sep 2013 22:38:13 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Sun, 29 Sep 2013 22:38:12 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id r8U3cCS6025727;
	Sun, 29 Sep 2013 22:38:12 -0500
Date: Sun, 29 Sep 2013 23:38:11 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Denys Dmytriyenko <denis@denix.org>
Message-ID: <20130930033811.GA24472@edge>
References: <1380408845-18316-1-git-send-email-denis@denix.org>
	<1380408845-18316-8-git-send-email-denis@denix.org>
MIME-Version: 1.0
In-Reply-To: <1380408845-18316-8-git-send-email-denis@denix.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH 7/8] linux-ti-staging: update to 3.12-rc2 with rpmsg, connectivity, audio and display merged
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
X-List-Received-Date: Mon, 30 Sep 2013 03:38:18 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Sat, Sep 28, 2013 at 06:54:04PM -0400, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@ti.com>
> 
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  recipes-kernel/linux/linux-ti-staging_git.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes-kernel/linux/linux-ti-staging_git.bb b/recipes-kernel/linux/linux-ti-staging_git.bb
> index 778ea7f..b28667e 100644
> --- a/recipes-kernel/linux/linux-ti-staging_git.bb
> +++ b/recipes-kernel/linux/linux-ti-staging_git.bb
> @@ -28,8 +28,8 @@ S = "${WORKDIR}/git"
>  
>  BRANCH = "ti-linux-3.12.y"
>  
> -SRCREV = "351da8b4c2ff277b2d816a2108ada357a63fadbe"
> -PV = "3.11+3.12-rc1"
> +SRCREV = "28e479fa1267cc065b8a2d1a421f2bc1daefabfb"
> +PV = "3.11+3.12-rc2"

Ok, 3.12-rc3 got merged - I'll update the patch tomorrow:

SRCREV = "ad0611b8881792d2ea945444601b647bba8767e1"
PV = "3.11+3.12-rc3"


>  # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
>  MACHINE_KERNEL_PR_append = "a+gitr${SRCPV}"
> -- 
> 1.8.3.2
> 

