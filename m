Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1EE7EE006D3
	for <meta-ti@yoctoproject.org>; Mon, 27 Jan 2014 16:44:19 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s0S0iIxm030663
	for <meta-ti@yoctoproject.org>; Mon, 27 Jan 2014 18:44:18 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0S0iIAF001836
	for <meta-ti@yoctoproject.org>; Mon, 27 Jan 2014 18:44:18 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 27 Jan 2014 18:44:18 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0S0iIsk025623;
	Mon, 27 Jan 2014 18:44:18 -0600
Date: Mon, 27 Jan 2014 19:44:17 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Sam Nelson <sam.nelson@ti.com>
Message-ID: <20140128004417.GV6814@edge>
References: <1390869671-10709-1-git-send-email-sam.nelson@ti.com>
MIME-Version: 1.0
In-Reply-To: <1390869671-10709-1-git-send-email-sam.nelson@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] boot-monitor: keystone-evm: update to latest version
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
X-List-Received-Date: Tue, 28 Jan 2014 00:44:22 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Jan 27, 2014 at 07:41:11PM -0500, Sam Nelson wrote:
> - Update SRC URL
> - Update Revision string
> - Update SRCREV commit id
> 
> Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> ---
>  recipes-bsp/boot-monitor/boot-monitor_git.bb |    7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/recipes-bsp/boot-monitor/boot-monitor_git.bb b/recipes-bsp/boot-monitor/boot-monitor_git.bb
> index 895de6c..47527be 100644
> --- a/recipes-bsp/boot-monitor/boot-monitor_git.bb
> +++ b/recipes-bsp/boot-monitor/boot-monitor_git.bb
> @@ -11,16 +11,17 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=25fe219a6febf6e5bb45beda1b2eb315"
>  
>  COMPATIBLE_MACHINE = "keystone-evm"
>  
> -SRC_URI = "git://arago-project.org/git/projects/boot-monitor.git;protocol=git;branch=${BRANCH}"
> +SRC_URI = "git://git.ti.com/keystone-linux/boot-monitor.git;protocol=git;branch=${BRANCH}"
>  
>  PV = "1.0"
> -PR = "r2+gitr${SRCREV}"
> +PR = "r2+gitr${SRCPV}"

You do want to bump either PR or even PV in this case to ensure the updated 
version gets used.


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

