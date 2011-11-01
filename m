Return-Path: <denis@denix.org>
Received: from vms173013pub.verizon.net (vms173013pub.verizon.net
	[206.46.173.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EFEB7E0054F
	for <meta-ti@yoctoproject.org>; Mon, 31 Oct 2011 17:57:02 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [96.240.135.93])
	by vms173013.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LTY00JG9IN15932@vms173013.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Mon, 31 Oct 2011 19:57:01 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 25D6614AF5D; Mon,
	31 Oct 2011 20:57:01 -0400 (EDT)
Date: Mon, 31 Oct 2011 20:57:01 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Andreas M??ller <schnitzeltony@gmx.de>
Message-id: <20111101005701.GT15391@denix.org>
References: <1320105166-11309-1-git-send-email-schnitzeltony@gmx.de>
MIME-version: 1.0
In-reply-to: <1320105166-11309-1-git-send-email-schnitzeltony@gmx.de>
User-Agent: Mutt/1.5.16 (2007-06-09)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] netbase: follow oe-core update to 4.46
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
X-List-Received-Date: Tue, 01 Nov 2011 00:57:03 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, Nov 01, 2011 at 12:52:46AM +0100, Andreas M??ller wrote:
> 
> Signed-off-by: Andreas M??ller <schnitzeltony@gmx.de>

Thanks, applied.

> ---
>  .../beagleboard/interfaces                         |    0
>  ...netbase_4.45.bbappend => netbase_4.46.bbappend} |    0
>  2 files changed, 0 insertions(+), 0 deletions(-)
>  rename recipes-core/netbase/{netbase-4.45 => netbase-4.46}/beagleboard/interfaces (100%)
>  rename recipes-core/netbase/{netbase_4.45.bbappend => netbase_4.46.bbappend} (100%)
> 
> diff --git a/recipes-core/netbase/netbase-4.45/beagleboard/interfaces b/recipes-core/netbase/netbase-4.46/beagleboard/interfaces
> similarity index 100%
> rename from recipes-core/netbase/netbase-4.45/beagleboard/interfaces
> rename to recipes-core/netbase/netbase-4.46/beagleboard/interfaces
> diff --git a/recipes-core/netbase/netbase_4.45.bbappend b/recipes-core/netbase/netbase_4.46.bbappend
> similarity index 100%
> rename from recipes-core/netbase/netbase_4.45.bbappend
> rename to recipes-core/netbase/netbase_4.46.bbappend
> -- 
> 1.7.4.4
> 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

