Return-Path: <denis@denix.org>
Received: from vms173005pub.verizon.net (vms173005pub.verizon.net
	[206.46.173.5])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8F293E0027E
	for <meta-ti@yoctoproject.org>; Fri, 12 Oct 2012 12:19:54 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [72.66.25.115])
	by vms173005.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MBS003OJOCP99M0@vms173005.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Fri, 12 Oct 2012 14:19:38 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 65AE7200DD; Fri,
	12 Oct 2012 15:19:37 -0400 (EDT)
Date: Fri, 12 Oct 2012 15:19:37 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Enrico <ebutera@users.berlios.de>
Message-id: <20121012191937.GB32601@denix.org>
References: <1349912433-21880-1-git-send-email-ebutera@users.berlios.de>
	<1349912433-21880-4-git-send-email-ebutera@users.berlios.de>
	<CAOT3miJo3tMK8nAc0x3o=cFBOuoMrUjvSYR61LbH9oGDsa2fvg@mail.gmail.com>
	<CA+2YH7unzpCXz9+V2WZUEZeE-9r_yaft220BRyXkSc9eNesRCw@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <CA+2YH7unzpCXz9+V2WZUEZeE-9r_yaft220BRyXkSc9eNesRCw@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH 4/6] libdce: add version 1.6.5.3
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
X-List-Received-Date: Fri, 12 Oct 2012 19:19:54 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, Oct 11, 2012 at 12:53:21PM +0200, Enrico wrote:
> On Thu, Oct 11, 2012 at 10:17 AM, Nicolas Dechesne <ndec13@gmail.com> wrote:
> > On Thu, Oct 11, 2012 at 1:40 AM, Enrico Butera <ebutera@users.berlios.de> wrote:
> > libdce tree contains both the linux side lib, and the ducati side DCE
> > code for now (which can't be rebuild completely for now, as we aren't
> > releasing all the bits/pieces for ducati side).
> >
> > we have been discussing about spliting this tree into 2 for better
> > clarity, so that might happen at some point..
> 
> I learned it the hard way some time ago, at my first attempt to add gst-ducati!

Enrico,

You'd be surprised, but I still keep your first attempt patches in my queue, 
waiting for a better moment to integrate them! :) Now, that we have the 
corresponding TI team assisting us, we should be able to get it done quickly!


> >> +require ../includes/ti-paths.inc
> >> +require ../includes/ti-staging.inc
> >
> > what is this for?
> 
> some copy/paste leftovers :D
> will delete them

Yeah, those are kind of specific to the way other teams package their 
components and are not really needed here.


> >> +inherit autotools
> >> +
> >> +DEPENDS = "libdrm"
> >> +RDEPENDS = "libdrm ti-firmware-ipu-dce"
> >
> > i would hope that libdrm is not needed in RDEPENDS, as it should be
> > handled automagically by shlibdeps.
> 
> I really don't know, if you are sure about that i will just remove it.

Yes, he is correct here - if you have a build dependency in DEPENDS which 
links against a library, you automatically get that run-time dependency in 
RDEPENDS, so no need to list it explicitly.

-- 
Denys

