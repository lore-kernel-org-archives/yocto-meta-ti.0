Return-Path: <denis@denix.org>
Received: from vms173009pub.verizon.net (vms173009pub.verizon.net
	[206.46.173.9])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 234C8E006E3
	for <meta-ti@yoctoproject.org>; Fri, 22 Nov 2013 07:02:59 -0800 (PST)
Received: from gandalf.denix.org ([unknown] [96.231.138.104])
	by vms173009.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MWO00L1D73YQ850@vms173009.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Fri, 22 Nov 2013 09:02:40 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id A4C582004B; Fri,
	22 Nov 2013 10:02:19 -0500 (EST)
Date: Fri, 22 Nov 2013 10:02:19 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: "Franklin S. Cooper Jr" <fcooper@ti.com>
Message-id: <20131122150219.GE32354@denix.org>
References: <1385136047-15830-1-git-send-email-fcooper@ti.com>
	<1385136047-15830-2-git-send-email-fcooper@ti.com>
MIME-version: 1.0
In-reply-to: <1385136047-15830-2-git-send-email-fcooper@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH 2/3] linux-ti-staging_3.12: Pull in commit that includes SGX DT patches
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
X-List-Received-Date: Fri, 22 Nov 2013 15:03:02 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

That's in my tree already

On Fri, Nov 22, 2013 at 10:00:46AM -0600, Franklin S. Cooper Jr wrote:
> * Update the kernel git tree to use the latest commit.
> * The latest commit pulls in necessary patches to add SGX DT entry for AM43x and
>   AM335x.
> * These patches are required to properly support the latest Graphics SDK.
> 
> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> ---
>  recipes-kernel/linux/linux-ti-staging_3.12.bb |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes-kernel/linux/linux-ti-staging_3.12.bb b/recipes-kernel/linux/linux-ti-staging_3.12.bb
> index 3abc2f4..ebdefa8 100644
> --- a/recipes-kernel/linux/linux-ti-staging_3.12.bb
> +++ b/recipes-kernel/linux/linux-ti-staging_3.12.bb
> @@ -31,11 +31,11 @@ S = "${WORKDIR}/git"
>  
>  BRANCH = "ti-linux-3.12.y"
>  
> -SRCREV = "6a59302de4852678ccde5008ce531075c9b683d9"
> +SRCREV = "95cb8e7d94bdbc6cd26b6d2ab074343a8dd81b7a"
>  PV = "3.12"
>  
>  # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
> -MACHINE_KERNEL_PR_append = "a+gitr${SRCPV}"
> +MACHINE_KERNEL_PR_append = "b+gitr${SRCPV}"
>  PR = "${MACHINE_KERNEL_PR}"
>  
>  SRC_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git;protocol=git;branch=${BRANCH} \
> -- 
> 1.7.0.4
> 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
> 

