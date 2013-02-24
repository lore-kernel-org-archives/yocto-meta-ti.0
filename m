Return-Path: <denis@denix.org>
Received: from vms173015pub.verizon.net (vms173015pub.verizon.net
	[206.46.173.15])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id ADBDEE00457
	for <meta-ti@yoctoproject.org>; Sat, 23 Feb 2013 18:34:33 -0800 (PST)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173015.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MIP00A5QDSP39A0@vms173015.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Sat, 23 Feb 2013 20:34:17 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 700952039F; Sat,
	23 Feb 2013 21:34:00 -0500 (EST)
Date: Sat, 23 Feb 2013 21:34:00 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Tom Rini <tom.rini@gmail.com>
Message-id: <20130224023400.GA6725@denix.org>
References: <alpine.DEB.2.02.1301290502200.12960@oneiric>
	<20130217205130.GB2174@denix.org>
	<CA+M6bXnmJsD2xrwi_CbbuPW4408ph3nbPiyUv6b6F37JOgLdOQ@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <CA+M6bXnmJsD2xrwi_CbbuPW4408ph3nbPiyUv6b6F37JOgLdOQ@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti mailing list <meta-ti@yoctoproject.org>
Subject: Re: is there a newer u-boot for omapl138?
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
X-List-Received-Date: Sun, 24 Feb 2013 02:34:33 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Sat, Feb 23, 2013 at 08:48:09PM -0500, Tom Rini wrote:
> On Sun, Feb 17, 2013 at 3:51 PM, Denys Dmytriyenko <denys@ti.com> wrote:
> > On Tue, Jan 29, 2013 at 05:05:23AM -0500, Robert P. J. Day wrote:
> >>
> >>   just got me a pdlogic zoom am1808 experimenter kit:
> >>
> >> http://www.logicpd.com/products/system-on-modules/zoom-am1808/
> >>
> >> and building for am108x-evm, i notice the version of u-boot that's
> >> pulled in is really pretty ancient:
> >>
> >> SRC_URI_omapl138 = "git://arago-project.org/git/projects/u-boot-omapl1.git;protocol=http"
> >> SRCREV_pn-${PN}_omapl138  = "5f16b8551b125f16cd8d58f278cb25b94272fd9f"
> >> PV_omapl138      = "2009.11+${PR}+gitr${SRCREV}"
> >>
> >>   is there any obstacle in trying to update the version of u-boot for
> >> that particular board?
> >
> > There is a slightly newer u-boot 2010.12 for omapl138:
> > http://arago-project.org/git/?p=meta-ti.git;a=commitdiff;h=201b231d721e27ac1d7a88a540b0b2fbbb86ed1e
> >
> > But currently there are no immediate plans to update it further for this
> > platform, unfortunately. If you happen to test and/or patch the latest
> > mainline u-boot for it, please let us know - I wouldn't mind adding it to
> > meta-ti as an alternative, even if it's not complete... Thanks.
> 
> Good news, mainline U-Boot works reasonably well on am1808 (build for
> da850_am18xxevm) and a few other variations on the platform.

That's great news! Should I wait for the next release tag or would the last 
2013.02 work already "reasonably well"?

-- 
Denys

