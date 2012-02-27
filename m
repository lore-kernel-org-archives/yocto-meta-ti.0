Return-Path: <denis@denix.org>
Received: from vms173001pub.verizon.net (vms173001pub.verizon.net
	[206.46.173.1])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D5F77E0074A
	for <meta-ti@lists.yoctoproject.org>;
	Mon, 27 Feb 2012 06:12:56 -0800 (PST)
Received: from gandalf.denix.org ([unknown] [71.178.225.66])
	by vms173001.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0M0200A6I257TYR4@vms173001.mailsrvcs.net> for
	meta-ti@lists.yoctoproject.org; Mon, 27 Feb 2012 08:12:44 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 44C4020323; Mon,
	27 Feb 2012 09:12:43 -0500 (EST)
Date: Mon, 27 Feb 2012 09:12:43 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Koen Kooi <koen@dominion.thruhere.net>
Message-id: <20120227141243.GA10713@denix.org>
References: <1330350029-29100-1-git-send-email-koen@dominion.thruhere.net>
MIME-version: 1.0
In-reply-to: <1330350029-29100-1-git-send-email-koen@dominion.thruhere.net>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@lists.yoctoproject.org
Subject: Re: [BeagleBone][PATCH v3 01/11] linux-ti33x-psp 3.2: fix ehrPWM polarity inversion
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
X-List-Received-Date: Mon, 27 Feb 2012 14:12:57 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Mon, Feb 27, 2012 at 02:40:19PM +0100, Koen Kooi wrote:
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>

Thanks, applied.

> ---
>  recipes-kernel/linux/linux-ti33x-psp_3.2.bb |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes-kernel/linux/linux-ti33x-psp_3.2.bb b/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
> index a25d503..f2ba8e0 100644
> --- a/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
> +++ b/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
> @@ -10,8 +10,8 @@ S = "${WORKDIR}/git"
>  MULTI_CONFIG_BASE_SUFFIX = ""
>  
>  BRANCH = "v3.2-staging"
> -SRCREV = "21ef5e1fa530eb8f23bfe18650e3915d7c291ca9"
> -MACHINE_KERNEL_PR_append = "e+gitr${SRCREV}"
> +SRCREV = "09e9651bcf2ee8d86685f2a8075bc6557b1d3b91"
> +MACHINE_KERNEL_PR_append = "f+gitr${SRCREV}"
>  
>  COMPATIBLE_MACHINE = "(ti33x)"
>  
> -- 
> 1.7.2.5
> 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
> 

