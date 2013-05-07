Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DCFB5E0127D
	for <meta-ti@yoctoproject.org>; Tue,  7 May 2013 14:38:05 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r47Lc5OX003998
	for <meta-ti@yoctoproject.org>; Tue, 7 May 2013 16:38:05 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r47Lc5iZ016201
	for <meta-ti@yoctoproject.org>; Tue, 7 May 2013 16:38:05 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 7 May 2013 16:38:05 -0500
Received: from localhost ([158.218.102.158])	by dlelxv22.itg.ti.com
	(8.13.8/8.13.8) with ESMTP id r47Lc5j4031193;
	Tue, 7 May 2013 16:38:05 -0500
Date: Tue, 7 May 2013 17:38:04 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Murali Karicheri <m-karicheri2@ti.com>
Message-ID: <20130507213804.GE12982@edge>
References: <1367961859-6243-1-git-send-email-m-karicheri2@ti.com>
MIME-Version: 1.0
In-Reply-To: <1367961859-6243-1-git-send-email-m-karicheri2@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [RESEND: PATCH 1/3] keystone2: boot-monitor: update to pull code from tip of the master
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
X-List-Received-Date: Tue, 07 May 2013 21:38:06 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, May 07, 2013 at 05:24:17PM -0400, Murali Karicheri wrote:
> This patch is needed to switch between release tag (when doing release
> build) and tip of the master (when building nightly)
> 
> Signed-off-by: Murali Karicheri <m-karicheri2@ti.com>
> ---
>  recipes-bsp/boot-monitor/boot-monitor_git.bb |    6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes-bsp/boot-monitor/boot-monitor_git.bb b/recipes-bsp/boot-monitor/boot-monitor_git.bb
> index c8a022a..a892720 100644
> --- a/recipes-bsp/boot-monitor/boot-monitor_git.bb
> +++ b/recipes-bsp/boot-monitor/boot-monitor_git.bb
> @@ -11,7 +11,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=25fe219a6febf6e5bb45beda1b2eb315"
>  
>  COMPATIBLE_MACHINE = "keystone-evm"
>  
> -SRC_URI = "git://arago-project.org/git/projects/boot-monitor.git;protocol=git;branch=${BRANCH}"
> +#SRC_URI = "git://arago-project.org/git/projects/boot-monitor.git;protocol=git;branch=${BRANCH}"
> +SRC_URI = "git://gtgit01.gt.design.ti.com/git/projects/boot-monitor.git;protocol=git;branch=${BRANCH}"
>  
>  PV = "1.0"
>  PR = "r1+gitr${SRCPV}"
> @@ -20,7 +21,8 @@ BRANCH = "master"
>  
>  S = "${WORKDIR}/git"
>  
> -SRCREV = "DEV.MCSDK-03.00.00.07"
> +#SRCREV = "DEV.MCSDK-03.00.00.10"
> +SRCREV = "${AUTOREV}"

Please, no AUTOREV in meta-ti, only pinned versions. Also, it is better to use 
commit ID hash for SRCREV and specify what tag it corresponds to in a comment 
next to it. There are too many issues with AUTOREV and needing to resolve tags 
to commit IDs during parsing in current version of Bitbake...

-- 
Denys

