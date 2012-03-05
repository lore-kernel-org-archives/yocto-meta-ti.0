Return-Path: <denis@denix.org>
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8B6FEE013BA
	for <meta-ti@yoctoproject.org>; Sun,  4 Mar 2012 21:12:19 -0800 (PST)
Received: from gandalf.denix.org ([unknown] [71.178.225.66])
	by vms173017.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0M0E002EUBS8V1U0@vms173017.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Sun, 04 Mar 2012 23:12:09 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 2F5A620370; Mon,
	05 Mar 2012 00:12:08 -0500 (EST)
Date: Mon, 05 Mar 2012 00:12:08 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Message-id: <20120305051208.GD14417@denix.org>
References: <4F514EC8.8000606@ti.com> <4F515551.50708@mlbassoc.com>
	<20120304061843.GN24667@denix.org>
	<alpine.DEB.2.02.1203040716190.496@oneiric>
	<4F5361B6.8040908@mlbassoc.com>
	<alpine.DEB.2.02.1203041310220.20388@oneiric>
	<20120304192728.GO24667@denix.org> <4F53C63D.1000305@mlbassoc.com>
	<20120304200405.GP24667@denix.org>
	<alpine.DEB.2.02.1203041618190.20150@oneiric>
MIME-version: 1.0
In-reply-to: <alpine.DEB.2.02.1203041618190.20150@oneiric>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [yocto] proper recipe for building for beagle xM? meta-ti?
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
X-List-Received-Date: Mon, 05 Mar 2012 05:12:19 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Sun, Mar 04, 2012 at 04:18:54PM -0500, Robert P. J. Day wrote:
> On Sun, 4 Mar 2012, Denys Dmytriyenko wrote:
> 
> > One of the issues:
> >
> > https://lists.yoctoproject.org/pipermail/meta-ti/2012-February/000491.html
> >
> > I haven't tried if either 3.0 or a pending 3.1 update for Panda
> > (from omapzoom/ti-ubuntu), resolve this gcc-4.6 build issue. But
> > either way I believe there was something else with one of our
> > components not building with gcc-4.6 - SGX or multimedia, don't
> > remember exactly.
> 
>   taking koen's advice to heart, should this discussion be happening
> on the meta-ti list?

Sure, let's switch to meta-ti...

Here's another report of gcc-4.6 failing on u-boot, due to wrong optimization 
used, which should be easy to fix, though:

https://lists.yoctoproject.org/pipermail/meta-ti/2012-February/000614.html

-- 
Denys

