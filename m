Return-Path: <denis@denix.org>
Received: from vms173015pub.verizon.net (vms173015pub.verizon.net
	[206.46.173.15])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 30FBCE00736
	for <meta-ti@yoctoproject.org>; Mon,  4 Feb 2013 21:06:15 -0800 (PST)
Received: from gandalf.denix.org ([unknown] [71.191.205.12])
	by vms173015.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MHQ00G03E5ZQDE4@vms173015.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Mon, 04 Feb 2013 23:06:04 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 4B2F720031; Tue,
	05 Feb 2013 00:05:59 -0500 (EST)
Date: Tue, 05 Feb 2013 00:05:59 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Message-id: <20130205050559.GC27526@denix.org>
References: <alpine.DEB.2.02.1301310653100.25130@oneiric>
MIME-version: 1.0
In-reply-to: <alpine.DEB.2.02.1301310653100.25130@oneiric>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti mailing list <meta-ti@yoctoproject.org>
Subject: Re: objections to replacing git SRCREV tag names with actual hash IDs?
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
X-List-Received-Date: Tue, 05 Feb 2013 05:06:15 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, Jan 31, 2013 at 06:58:37AM -0500, Robert P. J. Day wrote:
> 
>   surely, some of you saw this discussion on the oe-core list last
> night, but would there be any objection to replacing the small number
> of git SRCREV settings of tag names with their actual hash IDs?  the
> motivation should be obvious -- avoid network traffic to parse those
> tag names, even when that recipe isn't even being used in the image
> being built.

Yes, I've had occasional issues with "git ls-remote" during parse time on 
resolving those tags into commit IDs and was planning on eventually replacing 
them.


>   here's the entire list of SRCREV assignments in all of meta-ti, so
> you can see there are only four related to git tag names:
> 
>   i'm currently spending some time at a site that doesn't allow git
> access so those tag names are fatal for doing any sort of OE building.
> and only one of those appears to *prefer* to use the tag name --
> 
> recipes-kernel/linux/linux-keystone_3.6.6.bb:
> 
> # The tree tends to rebase, use literal stable tags
> SRCREV = "DEV.MCSDK-03.06.06.07"

And that's what mainly was stopping me from doing it already...


>   but, really, you shouldn't be rebasing published commits, anyway.
> so ... thoughts?

And _we_ are not rebasing published commits, but there are some things _we_ 
cannot control, unfortunately. I can talk to other teams to ask them to stop 
rebasing their trees, but in some cases the tree is specifically meant to be 
staging and is supposed to rebase from release to release. There are ways to 
do it differently, so I'll talk to those teams and see what we can do...

-- 
Denys

