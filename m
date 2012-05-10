Return-Path: <denis@denix.org>
Received: from vms173003pub.verizon.net (vms173003pub.verizon.net
	[206.46.173.3])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C332DE0044A
	for <meta-ti@yoctoproject.org>; Thu, 10 May 2012 13:42:05 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [108.48.117.33])
	by vms173003.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0M3T00JAJQTABGF0@vms173003.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Thu, 10 May 2012 15:41:50 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id B173F200B8; Thu,
	10 May 2012 16:41:34 -0400 (EDT)
Date: Thu, 10 May 2012 16:41:34 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Koen Kooi <koen@dominion.thruhere.net>
Message-id: <20120510204134.GA26492@denix.org>
References: <1336640375-20418-1-git-send-email-koen@dominion.thruhere.net>
	<1336640375-20418-11-git-send-email-koen@dominion.thruhere.net>
MIME-version: 1.0
In-reply-to: <1336640375-20418-11-git-send-email-koen@dominion.thruhere.net>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH v3 11/13] linux-ti33x-psp 3.2: bump SRCREV for 2 CPPI1.4 fixes
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
X-List-Received-Date: Thu, 10 May 2012 20:42:05 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

FYI, with this patchset and all the latest master branches on other layers I'm 
seeing bunch of these errors when building beaglebone kernel with gcc-4.7 and 
binutils-2.22:

| arm-angstrom-linux-gnueabi-ld: internal error in thumb_branch_common, at /OE/angstrom/build/tmp-angstrom_v2012_x-eglibc/work/armv7a-angstrom-linux-gnueabi/binutils-cross-2.22-r6/binutils-2.22/gold/arm.cc:4149

I haven't had time to debug it further for now.

-- 
Denys


On Thu, May 10, 2012 at 10:59:33AM +0200, Koen Kooi wrote:
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
>  recipes-kernel/linux/linux-ti33x-psp_3.2.bb |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes-kernel/linux/linux-ti33x-psp_3.2.bb b/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
> index 458248e..593d6e7 100644
> --- a/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
> +++ b/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
> @@ -11,8 +11,8 @@ S = "${WORKDIR}/git"
>  MULTI_CONFIG_BASE_SUFFIX = ""
>  
>  BRANCH = "v3.2-staging"
> -SRCREV = "31944a82681a0e7ab6cc3e069c30eddc5042e3e8"
> -MACHINE_KERNEL_PR_append = "f+gitr${SRCREV}"
> +SRCREV = "baaa0c0425528486efcc70b7696dd6359f10b5bd"
> +MACHINE_KERNEL_PR_append = "g+gitr${SRCREV}"
>  
>  COMPATIBLE_MACHINE = "(ti33x)"
>  
> -- 
> 1.7.10
> 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
> 

