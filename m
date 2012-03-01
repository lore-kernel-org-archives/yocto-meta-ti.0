Return-Path: <denis@denix.org>
Received: from vms173013pub.verizon.net (vms173013pub.verizon.net
	[206.46.173.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3D613E0059A
	for <meta-ti@yoctoproject.org>; Thu,  1 Mar 2012 09:03:08 -0800 (PST)
Received: from gandalf.denix.org ([unknown] [71.178.225.66])
	by vms173013.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0M0700G0FU0PCTD0@vms173013.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Thu, 01 Mar 2012 11:02:55 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id BF1BB2016E; Thu,
	01 Mar 2012 12:02:48 -0500 (EST)
Date: Thu, 01 Mar 2012 12:02:48 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Chris Whittenburg <whittenburg@gmail.com>
Message-id: <20120301170248.GA24667@denix.org>
References: <CABcw_On04+-qN7e50u_7LDYzAhyXX_ACYaoXnQbp3m80p7rbuQ@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <CABcw_On04+-qN7e50u_7LDYzAhyXX_ACYaoXnQbp3m80p7rbuQ@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] add missing quotes around PLATFORM_XDC
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
X-List-Received-Date: Thu, 01 Mar 2012 17:03:08 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, Mar 01, 2012 at 10:57:09AM -0600, Chris Whittenburg wrote:
> Had trouble building gstreamer-ti today, and it turned out to be these
> missing quotes, I believe.

Thanks, Chris. Please update your copy of meta-ti, as it has been fixed 
yesterday:

http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/commit/?id=f581b98514272f49c7a4a210a062ee0122b1908f

Also, please subscribe to the mailing list at 
https://lists.yoctoproject.org/listinfo/meta-ti, as normally non-subscribers 
are not allowed to post. Thanks.

-- 
Denys


> Signed-off-by: Chris Whittenburg <whittenburg@gmail.com>
> ---
>  recipes-ti/gstreamer-ti/gstreamer-ti.inc |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/recipes-ti/gstreamer-ti/gstreamer-ti.inc
> b/recipes-ti/gstreamer-ti/gstreamer-ti.inc
> index 401ee26..05b4d28 100644
> --- a/recipes-ti/gstreamer-ti/gstreamer-ti.inc
> +++ b/recipes-ti/gstreamer-ti/gstreamer-ti.inc
> @@ -60,7 +60,7 @@ export PLATFORM
>  export GST_TI_PLATFORM
>  export XDC_PLATFORM
>  export XDC_TARGET      = "gnu.targets.arm.GCArmv5T"
> -export PLATFORM_XDC    = ${XDC_PLATFORM}
> +export PLATFORM_XDC    = "${XDC_PLATFORM}"
>  export CSTOOL_DIR      = "${TOOLCHAIN_PATH}"
>  export MVTOOL_DIR      = "${TOOLCHAIN_PATH}"
>  export MVTOOL_PREFIX   = "${TARGET_PREFIX}"
> -- 
> 1.7.1
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
> 

