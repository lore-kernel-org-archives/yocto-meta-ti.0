Return-Path: <denis@denix.org>
Received: from vms173009pub.verizon.net (vms173009pub.verizon.net
	[206.46.173.9])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 10AFDE00502
	for <meta-ti@yoctoproject.org>; Tue, 12 Feb 2013 11:23:23 -0800 (PST)
Received: from gandalf.denix.org ([unknown] [71.191.205.12])
	by vms173009.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MI400GYWGINZDB5@vms173009.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Tue, 12 Feb 2013 13:23:22 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 92AA82008D; Tue,
	12 Feb 2013 14:23:11 -0500 (EST)
Date: Tue, 12 Feb 2013 14:23:11 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Message-id: <20130212192311.GB1858@denix.org>
References: <alpine.DEB.2.02.1302081518540.3793@oneiric>
MIME-version: 1.0
In-reply-to: <alpine.DEB.2.02.1302081518540.3793@oneiric>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti mailing list <meta-ti@yoctoproject.org>
Subject: Re: opinion of ti's am335x starter kit?
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
X-List-Received-Date: Tue, 12 Feb 2013 19:23:23 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Fri, Feb 08, 2013 at 03:23:39PM -0500, Robert P. J. Day wrote:
> 
>   in addition to my beaglebone, i was interested in picking up a more
> complete am335x-based starter kit, and a quick google brought me to
> this:
> 
>   http://processors.wiki.ti.com/index.php/AM335x_Starter_Kit
> 
> a couple hundred dollars strikes me as pretty reasonable for that and
> obviously i'd want to be able to start building boot images for it
> using OE and meta-ti.
> 
>   any opinions on that particular kit?  better alternatives?  i'm
> pretty sure i could get $200 worth of enlightenment out of that
> system.

I'm not sure what opinion you want... :)

AM335-SK is a great kit and sits nicely between a Beaglebone and a full EVM - 
it's slightly more expensive than Bone, but is still affordable, and it comes 
with integrated LCD. It should be supported out of meta-ti and is part of TI's 
official Sitara SDK products.

-- 
Denys

