Return-Path: <denis@denix.org>
Received: from vms173013pub.verizon.net (vms173013pub.verizon.net
	[206.46.173.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2E1EFE0144E
	for <meta-ti@yoctoproject.org>; Thu, 15 Aug 2013 11:49:00 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173013.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MRL00BVG5L5YTT1@vms173013.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Thu, 15 Aug 2013 13:48:41 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 46D572009B; Thu,
	15 Aug 2013 14:48:41 -0400 (EDT)
Date: Thu, 15 Aug 2013 14:48:41 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Kovesdi Gyorgy <kgy@teledigit.eu>
Message-id: <20130815184841.GB15578@denix.org>
References: <1554710.Rp68v4FIpQ@kgy-pc> <20130810173820.GC27433@edge>
	<20130810175429.GF27433@edge> <19123784.q32VqNnUcT@kgy-pc>
MIME-version: 1.0
In-reply-to: <19123784.q32VqNnUcT@kgy-pc>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti mailing list <meta-ti@yoctoproject.org>
Subject: Re: Problem compiling libgles-omap3_4.09.00.01
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
X-List-Received-Date: Thu, 15 Aug 2013 18:49:03 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, Aug 15, 2013 at 09:53:30AM +0200, Kovesdi Gyorgy wrote:
> > Here's a pointer:
> > http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta-yocto/conf/distro/p
> > oky.conf#n102
> > # QA check settings - a little stricter than the OE-Core defaults
> > And "already-stripped" should be in WARN_QA instead of ERROR_QA.
> Just a question: How can i set it locally? Is it necessary to modify poky.conf 
> itself? Putting it to local.conf seems not enough.

Well, poky.conf is a distro configuration and distro config overwrites local 
config (build/local.conf) by default. So you have to use _forcevariable 
override to force it:

WARN_QA_forcevariable = "..."
ERROR_QA_forcevariable = "..."

Another option is for libgles in meta-ti to add "already-stripped" into the 
appropriate INSANE_SKIP. This was not available in Dylan and is new for the 
master - I'll try to take a look at it soon, as I need to make other fixes for 
libgles recipes anyway...

-- 
Denys

