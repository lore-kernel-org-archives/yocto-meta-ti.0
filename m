Return-Path: <denis@denix.org>
Received: from vms173009pub.verizon.net (vms173009pub.verizon.net
	[206.46.173.9])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D384FE00596
	for <meta-ti@lists.yoctoproject.org>;
	Tue, 28 Feb 2012 07:22:25 -0800 (PST)
Received: from gandalf.denix.org ([unknown] [71.178.225.66])
	by vms173009.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0M0400JXY00TBQN0@vms173009.mailsrvcs.net> for
	meta-ti@lists.yoctoproject.org; Tue, 28 Feb 2012 09:22:06 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 99451202F4; Tue,
	28 Feb 2012 10:22:05 -0500 (EST)
Date: Tue, 28 Feb 2012 10:22:05 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Koen Kooi <koen@dominion.thruhere.net>
Message-id: <20120228152205.GC10713@denix.org>
References: <1330442197-10408-1-git-send-email-koen@dominion.thruhere.net>
MIME-version: 1.0
In-reply-to: <1330442197-10408-1-git-send-email-koen@dominion.thruhere.net>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@lists.yoctoproject.org
Subject: Re: [PATCH] linux-davinci: quoting fixes
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
X-List-Received-Date: Tue, 28 Feb 2012 15:22:26 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, Feb 28, 2012 at 04:16:37PM +0100, Koen Kooi wrote:
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>

Thanks, I've started cleaning up missing quotes in other places too.

Denys


> ---
>  recipes-kernel/linux/linux-davinci_git.bb |    8 ++++----
>  1 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/recipes-kernel/linux/linux-davinci_git.bb b/recipes-kernel/linux/linux-davinci_git.bb
> index 1fda1ee..e4b85d6 100644
> --- a/recipes-kernel/linux/linux-davinci_git.bb
> +++ b/recipes-kernel/linux/linux-davinci_git.bb
> @@ -22,13 +22,13 @@ ARAGO_L1_BR  = "master"
>  ARAGO_L1_PV  = "2.6.32+2.6.33-rc4-${PR}+gitr${SRCREV}"
>  ARAGO_L1_URI = "git://arago-project.org/git/projects/linux-omapl1.git;protocol=git;branch=${BRANCH} "
>  
> -SRCREV_hawkboard                  = ${ARAGO_L1_REV}
> +SRCREV_hawkboard                  = "${ARAGO_L1_REV}"
>  
> -PV_omapl138             = ${ARAGO_L1_PV}
> +PV_omapl138             = "${ARAGO_L1_PV}"
>  
> -BRANCH_omapl138         = ${ARAGO_L1_BR}
> +BRANCH_omapl138         = "${ARAGO_L1_BR}"
>  
> -SRC_URI_append_omapl138 = ${ARAGO_L1_URI}
> +SRC_URI_append_omapl138 = "${ARAGO_L1_URI}"
>  
>  SRC_URI_append_omapl138 = " file://logo_linux_clut224.ppm \
>                                       file://0001-ahci-ti-Fix-currently-harmless-typo-in-SATA-PHY.patch \
> -- 
> 1.7.2.5
> 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
> 

