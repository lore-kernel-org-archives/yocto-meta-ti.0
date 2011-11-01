Return-Path: <denis@denix.org>
Received: from vms173011pub.verizon.net (vms173011pub.verizon.net
	[206.46.173.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5EB7CE00559
	for <meta-ti@yoctoproject.org>; Mon, 31 Oct 2011 19:37:23 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [96.240.135.93])
	by vms173011.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LTY00FR8N9ZFL70@vms173011.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Mon, 31 Oct 2011 21:37:11 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 14EE114AF5D; Mon,
	31 Oct 2011 22:37:11 -0400 (EDT)
Date: Mon, 31 Oct 2011 22:37:11 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Joel A Fernandes <joelagnel@ti.com>
Message-id: <20111101023711.GW15391@denix.org>
References: <1320111122-9374-1-git-send-email-joelagnel@ti.com>
MIME-version: 1.0
In-reply-to: <1320111122-9374-1-git-send-email-joelagnel@ti.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] beaglebone-tester: Update with latest fixes
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
X-List-Received-Date: Tue, 01 Nov 2011 02:37:23 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Mon, Oct 31, 2011 at 08:32:01PM -0500, Joel A Fernandes wrote:
> Fixes:
>  * 100% CPU usage when no test is running
>  * Turn on USB host session before checking for usb-serial device
> 
> Signed-off-by: Joel A Fernandes <joelagnel@ti.com>

Thanks, applied.

> ---
>  recipes-ti/beagleboard/beaglebone-tester.bb |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes-ti/beagleboard/beaglebone-tester.bb b/recipes-ti/beagleboard/beaglebone-tester.bb
> index 9e49e87..6284ff2 100644
> --- a/recipes-ti/beagleboard/beaglebone-tester.bb
> +++ b/recipes-ti/beagleboard/beaglebone-tester.bb
> @@ -7,11 +7,11 @@ LIC_FILES_CHKSUM="file://gpl.txt;md5=5b122a36d0f6dc55279a0ebc69f3c60b"
>  # only scripts and data
>  inherit allarch
>  
> -PR = "r3"
> +PR = "r4"
>  
>  SRC_URI = "git://github.com/joelagnel/validation-scripts.git;protocol=git \
>            "
> -SRCREV = "c6faf47c9e73da7d256cd226bc9eb2a3e4a19aaa"
> +SRCREV = "53cc6b3d8f46814d0aa2daedfbc380ba64059a97"
>  
>  S = "${WORKDIR}/git"
>  
> -- 
> 1.7.0.4
> 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
> 

