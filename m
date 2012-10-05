Return-Path: <denis@denix.org>
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7048DE00293
	for <meta-ti@yoctoproject.org>; Fri,  5 Oct 2012 15:03:49 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [72.66.25.115])
	by vms173021.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MBF00IO3X9ZSN91@vms173021.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Fri, 05 Oct 2012 17:03:36 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 8828220173; Fri,
	05 Oct 2012 18:03:35 -0400 (EDT)
Date: Fri, 05 Oct 2012 18:03:35 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Gary Thomas <gary@mlbassoc.com>
Message-id: <20121005220335.GD27533@denix.org>
References: <1349465081-10787-1-git-send-email-fcooper@ti.com>
	<506F2E82.8060906@mlbassoc.com>
	<CA+2YH7ucY8NoMMc28fxsVav2cCg=n_6mYvama9Ox4t0ZowVizA@mail.gmail.com>
	<6CF2DE49-0D65-4216-B374-805CE3754A17@ti.com>
	<506F57C5.7000400@mlbassoc.com>
MIME-version: 1.0
In-reply-to: <506F57C5.7000400@mlbassoc.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH] wl12xx-firmware: Port wl12xx-firmware recipe
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
X-List-Received-Date: Fri, 05 Oct 2012 22:03:49 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Fri, Oct 05, 2012 at 03:57:25PM -0600, Gary Thomas wrote:
> On 2012-10-05 13:20, Cooper Jr., Franklin wrote:
> >The custom git tree is wl12xx only not all the different components that linux-firmware provides. My understanding is that the team that works on wl12xx should be pushing it back to linux-firmware. But like I said this will contain the latest changes.
> 
> I still don't think it should be separate.  If the upstream (TI) stuff
> isn't being properly tracked (there should be an effort to make this so),
> just add a .bbappend that fixes things.  I use these packages and I don't
> want to have to track the "flavour of the week" to keep current.

That would require extracting individual commits from the git tree and listing 
them in .bbappend. I would not personally mind that approach, but it may 
require extra work for the wireless team. We need to check with them...

-- 
Denys


> >On Oct 5, 2012, at 2:09 PM, "Enrico" <ebutera@users.berlios.de> wrote:
> >
> >>On Fri, Oct 5, 2012 at 9:01 PM, Gary Thomas <gary@mlbassoc.com> wrote:
> >>>On 2012-10-05 13:24, Franklin S. Cooper Jr wrote:
> >>>>
> >>>>* Port wl12xx-firmware recipe from arago. This recipe was originally
> >>>>   named linux-firmware in arago.
> >>>>* Wl12xx-firmware provides the firmware files for use with the TI
> >>>>   Wi-Fi + Bluetooth module.
> >>>>
> >>>>Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> >>>
> >>>
> >>>Why not just keep the main linux-firmware recipe up to date instead of
> >>>duplicate
> >>>functionality?
> >>
> >>
> >>I made myself the same question at first, but the answer was there:
> >>
> >>
> >>>>+# This recipe provides the latest firmware files for wl12xx.
> >>>>+# Therefore, use the contents of this recipe instead of the contents
> >>>>+# of linux-firmware-wl12xx.
> >>
> >>>>+SRC_URI = "git://github.com/TI-ECS/ti-utils.git;protocol=git"
> >>
> >>
> >>Well one could ask why they are there and not in linux-firmware git
> >>(not polemic, just curious).
> >>
> >>Enrico
> >>_______________________________________________
> >>meta-ti mailing list
> >>meta-ti@yoctoproject.org
> >>https://lists.yoctoproject.org/listinfo/meta-ti
> 
> -- 
> ------------------------------------------------------------
> Gary Thomas                 |  Consulting for the
> MLB Associates              |    Embedded world
> ------------------------------------------------------------
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
> 

