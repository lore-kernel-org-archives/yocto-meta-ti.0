Return-Path: <denis@denix.org>
Received: from vms173003pub.verizon.net (vms173003pub.verizon.net
	[206.46.173.3])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BBDB5E01341
	for <meta-ti@yoctoproject.org>; Fri, 21 Oct 2011 00:23:11 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [71.191.138.237])
	by vms173003.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LTE0047QN6C95U1@vms173003.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Fri, 21 Oct 2011 02:23:01 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 89A9114AF5D; Fri,
	21 Oct 2011 03:23:00 -0400 (EDT)
Date: Fri, 21 Oct 2011 03:23:00 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Message-id: <20111021072300.GC9156@denix.org>
References: <CABcw_OkvmcUUt63dHUr_uWtp+vU76vcuQH-A5NdyB2O5bWSq+g@mail.gmail.com>
	<E1A150A5-1416-445E-8699-A059623DDF3F@dominion.thruhere.net>
MIME-version: 1.0
In-reply-to: <E1A150A5-1416-445E-8699-A059623DDF3F@dominion.thruhere.net>
User-Agent: Mutt/1.5.16 (2007-06-09)
Cc: jdk@ti.com
Subject: Re: [Angstrom-devel] ti-cgt6x_6.1.17 md5 hash
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
X-List-Received-Date: Fri, 21 Oct 2011 07:23:11 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Fri, Oct 21, 2011 at 09:16:44AM +0200, Koen Kooi wrote:
> 
> Op 21 okt. 2011, om 05:01 heeft Chris Whittenburg het volgende geschreven:
> 
> > Not sure if this is the right place to report this issue, but I've run
> > into it a couple times lately...
> > 
> > I think the md5 hash for ti_cgt_c6000_6.1.17_setup_linux_x86.bin has
> > changed from the one in the recipe cgt6x_6.1.17.bb
> > 
> > Perhaps TI changed the install file?
> 
> TI did in fact change the file :( Updating the checksums will cause people 
> who already downloaded the old file (e.g. me) to go thru pains without a 
> guarantee that TI won't change the file again.

[switch to meta-ti]

Was this discussed with CGT people? Can we ensure it doesn't happen in the 
future?

-- 
Denys

