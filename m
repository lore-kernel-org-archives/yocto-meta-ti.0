Return-Path: <denis@denix.org>
Received: from vms173005pub.verizon.net (vms173005pub.verizon.net
	[206.46.173.5])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7FDD1E0123C
	for <meta-ti@lists.yoctoproject.org>;
	Thu, 22 Dec 2011 09:47:59 -0800 (PST)
Received: from gandalf.denix.org ([unknown] [71.163.124.23])
	by vms173005.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LWM009QU9FIP3B2@vms173005.mailsrvcs.net> for
	meta-ti@lists.yoctoproject.org; Thu, 22 Dec 2011 11:47:48 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 8DDCB20334; Thu,
	22 Dec 2011 12:47:42 -0500 (EST)
Date: Thu, 22 Dec 2011 12:47:42 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Koen Kooi <koen@dominion.thruhere.net>
Message-id: <20111222174742.GB17606@denix.org>
References: <1324543230-17994-1-git-send-email-koen@dominion.thruhere.net>
MIME-version: 1.0
In-reply-to: <1324543230-17994-1-git-send-email-koen@dominion.thruhere.net>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@lists.yoctoproject.org
Subject: Re: [PATCH] ti-linuxutils: fix LICENSE syntax
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Thu, 22 Dec 2011 17:48:00 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, Dec 22, 2011 at 09:40:30AM +0100, Koen Kooi wrote:
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>

Acked-by: Denys Dmytriyenko <denys@ti.com>

> ---
>  recipes-ti/linuxutils/ti-linuxutils.inc |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes-ti/linuxutils/ti-linuxutils.inc b/recipes-ti/linuxutils/ti-linuxutils.inc
> index 0c0ebe3..d6cd18c 100644
> --- a/recipes-ti/linuxutils/ti-linuxutils.inc
> +++ b/recipes-ti/linuxutils/ti-linuxutils.inc
> @@ -1,6 +1,6 @@
>  DESCRIPTION = "MFP Linux utils for TI ARM/DSP processors"
>  SECTION = "devel"
> -LICENSE = "GPLv2,BSD"
> +LICENSE = "GPLv2 & BSD"
>  
>  BASE_SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/linuxutils/${PV}/exports"
>  SRC_URI = "${BASE_SRC_URI}/linuxutils_${PV}.tar.gz "
> @@ -15,7 +15,7 @@ require recipes-ti/includes/ti-staging.inc
>  PR = "${MACHINE_KERNEL_PR}"
>  
>  #This is a kernel module, don't set PR directly
> -MACHINE_KERNEL_PR_append = "d"
> +MACHINE_KERNEL_PR_append = "e"
>  
>  inherit module
>  
> -- 
> 1.7.2.5
> 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
> 

