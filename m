Return-Path: <denis@denix.org>
Received: from vms173009pub.verizon.net (vms173009pub.verizon.net
	[206.46.173.9])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4E8DFE0070C
	for <meta-ti@yoctoproject.org>; Thu, 17 May 2012 11:28:24 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [108.48.117.33])
	by vms173009.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0M4600EGNJATQHG0@vms173009.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Thu, 17 May 2012 13:28:05 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 2E2D9201CA; Thu,
	17 May 2012 14:28:05 -0400 (EDT)
Date: Thu, 17 May 2012 14:28:05 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Koen Kooi <koen@dominion.thruhere.net>
Message-id: <20120517182805.GJ6829@denix.org>
References: <1337249227-9151-1-git-send-email-koen@dominion.thruhere.net>
	<1337249227-9151-2-git-send-email-koen@dominion.thruhere.net>
MIME-version: 1.0
In-reply-to: <1337249227-9151-2-git-send-email-koen@dominion.thruhere.net>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org, denys@ti.com
Subject: Re: [PATCH 2/2] linux-ti33x-psp 3.2: correct PV for non-tipsp distros
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
X-List-Received-Date: Thu, 17 May 2012 18:28:24 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, May 17, 2012 at 12:07:07PM +0200, Koen Kooi wrote:
> The patchset updates the kernel to 3.2.x, so make PV match.
> This doesn't need PR or MACHINE_KERNEL_PR bumps since the both the kernel ABI and file locations remain the same.
> 
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
>  recipes-kernel/linux/linux-ti33x-psp_3.2.bb |    4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/recipes-kernel/linux/linux-ti33x-psp_3.2.bb b/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
> index 0fe3d4f..efc5adb 100644
> --- a/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
> +++ b/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
> @@ -10,6 +10,10 @@ S = "${WORKDIR}/git"
>  
>  MULTI_CONFIG_BASE_SUFFIX = ""
>  
> +# the PATCHES_OVER_PSP updates it to 3.2.x, so adjust PV to match
> +PV = "${@base_contains('DISTRO_FEATURES', 'tipspkernel', "3.2", "3.2.16", d)}"
> +FILESPATH =. "${FILE_DIRNAME}/${PN}-3.2:${FILE_DIRNAME}/${PN}-3.2/${MACHINE}:"

Are you planning to use ${PN}-3.2.16 in FILESPATH for patches or defconfigs? 
If not, I'd like to try to fix it differently...

-- 
Denys

> +
>  BRANCH = "v3.2-staging"
>  SRCREV = "720e07b4c1f687b61b147b31c698cb6816d72f01"
>  MACHINE_KERNEL_PR_append = "l+gitr${SRCREV}"
> -- 
> 1.7.10
> 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
> 

