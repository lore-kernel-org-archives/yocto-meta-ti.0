Return-Path: <denis@denix.org>
Received: from vms173009pub.verizon.net (vms173009pub.verizon.net
	[206.46.173.9])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C12CEE006B4
	for <meta-ti@yoctoproject.org>; Wed, 26 Oct 2011 10:17:03 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [96.240.135.93])
	by vms173009.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LTO001P4NZX39Z0@vms173009.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Wed, 26 Oct 2011 12:16:52 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id BAED414AF5D; Wed,
	26 Oct 2011 13:16:45 -0400 (EDT)
Date: Wed, 26 Oct 2011 13:16:45 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Joel A Fernandes <joelagnel@ti.com>
Message-id: <20111026171645.GF15391@denix.org>
References: <1319588057-11213-1-git-send-email-joelagnel@ti.com>
MIME-version: 1.0
In-reply-to: <1319588057-11213-1-git-send-email-joelagnel@ti.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH meta-ti] beaglebone-tester: Update to latest, bump PR
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
X-List-Received-Date: Wed, 26 Oct 2011 17:17:03 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, Oct 25, 2011 at 07:14:16PM -0500, Joel A Fernandes wrote:
> Added:
> - Output test status to USB serial port
> - Made more verbose
> 
> Signed-off-by: Joel A Fernandes <joelagnel@ti.com>

Applied, thanks.

> ---
>  recipes-ti/beagleboard/beaglebone-tester.bb |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes-ti/beagleboard/beaglebone-tester.bb b/recipes-ti/beagleboard/beaglebone-tester.bb
> index 9e65d65..9e49e87 100644
> --- a/recipes-ti/beagleboard/beaglebone-tester.bb
> +++ b/recipes-ti/beagleboard/beaglebone-tester.bb
> @@ -7,11 +7,11 @@ LIC_FILES_CHKSUM="file://gpl.txt;md5=5b122a36d0f6dc55279a0ebc69f3c60b"
>  # only scripts and data
>  inherit allarch
>  
> -PR = "r2"
> +PR = "r3"
>  
>  SRC_URI = "git://github.com/joelagnel/validation-scripts.git;protocol=git \
>            "
> -SRCREV = "fdeaf580e553a0968b777e75306aac3f6a73519e"
> +SRCREV = "c6faf47c9e73da7d256cd226bc9eb2a3e4a19aaa"
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

