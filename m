Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 787FCE003D7
	for <meta-ti@yoctoproject.org>; Mon, 27 Jan 2014 17:09:23 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s0S19MOw017039
	for <meta-ti@yoctoproject.org>; Mon, 27 Jan 2014 19:09:22 -0600
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0S19Mnd007959
	for <meta-ti@yoctoproject.org>; Mon, 27 Jan 2014 19:09:22 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 27 Jan 2014 19:09:21 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0S19LHD025833;
	Mon, 27 Jan 2014 19:09:21 -0600
Date: Mon, 27 Jan 2014 20:09:21 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Sam Nelson <sam.nelson@ti.com>
Message-ID: <20140128010920.GW6814@edge>
References: <1390870196-10990-1-git-send-email-sam.nelson@ti.com>
MIME-Version: 1.0
In-Reply-To: <1390870196-10990-1-git-send-email-sam.nelson@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH v2] boot-monitor: keystone-evm: update to latest version
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
X-List-Received-Date: Tue, 28 Jan 2014 01:09:24 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Jan 27, 2014 at 07:49:56PM -0500, Sam Nelson wrote:
> - Update SRC URL
> - Update Revision string
> - Update SRCREV commit id
> 
> Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> 
> -----
> Updated Revision numbers
> -----
> ---
>  recipes-bsp/boot-monitor/boot-monitor_git.bb |    9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/recipes-bsp/boot-monitor/boot-monitor_git.bb b/recipes-bsp/boot-monitor/boot-monitor_git.bb
> index 895de6c..e75c8f3 100644
> --- a/recipes-bsp/boot-monitor/boot-monitor_git.bb
> +++ b/recipes-bsp/boot-monitor/boot-monitor_git.bb
> @@ -11,16 +11,17 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=25fe219a6febf6e5bb45beda1b2eb315"
>  
>  COMPATIBLE_MACHINE = "keystone-evm"
>  
> -SRC_URI = "git://arago-project.org/git/projects/boot-monitor.git;protocol=git;branch=${BRANCH}"
> +SRC_URI = "git://git.ti.com/keystone-linux/boot-monitor.git;protocol=git;branch=${BRANCH}"
>  
> -PV = "1.0"
> -PR = "r2+gitr${SRCREV}"
> +PV = "2.0"
> +PR = "r3+gitr${SRCPV}"

Ok, I'll take it. But usually, when you bump PV (package version), you also 
reset PR (package revision). Similar to how major/minor versions are handled:

1.0-r2 -> 2.0-r0
1.0.2 -> 2.0.0

This time I'll correct it myself when pushing... Thanks.


>  BRANCH = "master"
>  
>  S = "${WORKDIR}/git"
>  
> -SRCREV = "94cab20c4a4725a014d6f815704557d28fec9610"
> +#Tag "K2_BM_13.11"
> +SRCREV = "ba597d183423971e63295cdd59d3c90245e9170a"
>  
>  do_compile () {
>  	unset LDFLAGS
> -- 
> 1.7.9.5
> 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

