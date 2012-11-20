Return-Path: <denis@denix.org>
Received: from vms173003pub.verizon.net (vms173003pub.verizon.net
	[206.46.173.3])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E4AA3E0141C
	for <meta-ti@yoctoproject.org>; Tue, 20 Nov 2012 10:13:58 -0800 (PST)
Received: from gandalf.denix.org ([unknown] [71.191.205.12])
	by vms173003.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MDS004UATAXZEG1@vms173003.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Tue, 20 Nov 2012 12:13:47 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id C8F05201CF; Tue,
	20 Nov 2012 13:13:45 -0500 (EST)
Date: Tue, 20 Nov 2012 13:13:45 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Nicolas Dechesne <ndec13@gmail.com>
Message-id: <20121120181345.GC19309@denix.org>
References: <CAOT3miJT7PUO5_PRSjMwg9razGMxCzV6785Wkq2OkqO78X4pcQ@mail.gmail.com>
	<CAOT3mi+325AfgZqaP4D0Ky3M1T-zhdjadRDB_PsVFzgXPvv=Kw@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <CAOT3mi+325AfgZqaP4D0Ky3M1T-zhdjadRDB_PsVFzgXPvv=Kw@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: xf86-video-omap and libdrm for OMAP
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
X-List-Received-Date: Tue, 20 Nov 2012 18:13:59 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, Nov 20, 2012 at 06:10:17PM +0100, Nicolas Dechesne wrote:
> well.. obviously, with the libdrm update, and our .bbappend in meta-ti
> things are even worse than I had thought... and the tree doesn't even build
> anymore, at least for panda, as we have:
> 
> COMPATIBLE_MACHINE = "omap4|omap5"
> 
> in the .bbappend
> 
> so now that brings another question... should we start a 'danny' branch on
> meta-ti? if we remove the libdrm and xf86-video-omap recipes from
> meta-ti/master, then we break meta-ti/master with poky/danny...

Yes, creating danny branch was on my list - was waiting for any specific 
requirements like this one... :)

-- 
Denys


> On Tue, Nov 20, 2012 at 5:50 PM, Nicolas Dechesne <ndec13@gmail.com> wrote:
> 
> > hi
> >
> > i just noticed that the recipe for xf86-video-omap was just merged into
> > poky/master, and that libdrm was updated as well (and OMAP experimental
> > support was enabled too):
> >
> > 0ed7c53 xf86-video-omap: add new recipe to follow the maintained repo
> > cb758f9 libdrm: upgrade to 2.4.40
> >
> > from a quick review, i believe this should supersede the recipes from
> > meta-ti that got merged recently:
> >
> > 410dc02 xf86-video-omap: add new recipe for OMAP4/5 X11 video driver
> > cce5a7a libdrm: enable omap experimental api support
> >
> > i won't be able to get that tested in the next couple of days, very
> > likely, so i wanted to know:
> >
> > - if anyone tested poky/master (or oe-core as this came from oe-core) on
> > panda and/or beagle?
> > - what is the policy in this situation? should we simply remove our
> > recipes from meta-ti?
> >
> > cheers
> >
> > nicolas
> >
> >
> >
> >

> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti


