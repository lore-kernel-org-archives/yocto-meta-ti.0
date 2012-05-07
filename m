Return-Path: <denis@denix.org>
Received: from vms173001pub.verizon.net (vms173001pub.verizon.net
	[206.46.173.1])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 58173E01206
	for <meta-ti@yoctoproject.org>; Mon,  7 May 2012 08:56:08 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [108.48.117.33])
	by vms173001.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0M3N00MCMTL0SGD0@vms173001.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Mon, 07 May 2012 10:55:49 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 4A2182009F; Mon,
	07 May 2012 11:55:48 -0400 (EDT)
Date: Mon, 07 May 2012 11:55:48 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Koen Kooi <koen@dominion.thruhere.net>
Message-id: <20120507155548.GB10566@denix.org>
References: <1336211713-2588-1-git-send-email-koen@dominion.thruhere.net>
MIME-version: 1.0
In-reply-to: <1336211713-2588-1-git-send-email-koen@dominion.thruhere.net>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org, denys@ti.com
Subject: Re: [PATCH] ti33x.inc: add missing MACHINE_KERNEL_PR bump for the 3.2.14 -> 3.2.16 upgrade
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
X-List-Received-Date: Mon, 07 May 2012 15:56:08 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Sat, May 05, 2012 at 11:55:13AM +0200, Koen Kooi wrote:
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
> 
> Denys, since the 3.2.16 update patch isn't in yet do you want me to squash 
> this into that and resend as v2?

Sure, send me v2 please.

>  conf/machine/include/ti33x.inc |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/conf/machine/include/ti33x.inc b/conf/machine/include/ti33x.inc
> index c5926a8..e04da03 100644
> --- a/conf/machine/include/ti33x.inc
> +++ b/conf/machine/include/ti33x.inc
> @@ -4,7 +4,7 @@ require conf/machine/include/soc-family.inc
>  require conf/machine/include/tune-cortexa8.inc
>  PREFERRED_PROVIDER_virtual/kernel = "linux-ti33x-psp"
>  # Increase this everytime you change something in the kernel
> -MACHINE_KERNEL_PR = "r10"
> +MACHINE_KERNEL_PR = "r11"
>  
>  KERNEL_IMAGETYPE = "uImage"
>  
> -- 
> 1.7.10
> 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
> 

