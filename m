Return-Path: <denis@denix.org>
Received: from vms173007pub.verizon.net (vms173007pub.verizon.net
	[206.46.173.7])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B27E2E00344
	for <meta-ti@yoctoproject.org>; Thu, 16 Aug 2012 19:22:16 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [72.66.25.115])
	by vms173007.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0M8V0032HNW6T140@vms173007.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Thu, 16 Aug 2012 21:21:57 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id EF231201B8; Thu,
	16 Aug 2012 22:21:41 -0400 (EDT)
Date: Thu, 16 Aug 2012 22:21:41 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Cliff Brake <cliff.brake@gmail.com>
Message-id: <20120817022141.GA14556@denix.org>
References: <CAOd_LFyjs=9C3Y2rO8R1A7GX0JO_iS+Vq7=k5m2FLFF7jdgivQ@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <CAOd_LFyjs=9C3Y2rO8R1A7GX0JO_iS+Vq7=k5m2FLFF7jdgivQ@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: io CPU usage high
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
X-List-Received-Date: Fri, 17 Aug 2012 02:22:16 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, Aug 16, 2012 at 06:11:59PM -0400, Cliff Brake wrote:
> I've noticed with recent Angstrom images running on OMAP class CPUs, it
> seems the IO CPU usage is very high when running from SD cards.  When there
> is a lot of disk activity, the system becomes fairly unresponsive, and CPU
> io usage is usually pegged.  Is this expected?  I don't recall seeing this
> with older kernels such as 2.6.39 which I'm using on an older project.

Cliff,

Do you use kernel-mainline_3.2 from meta-ti that is crafted for beagleboard or 
something else?

Denys

