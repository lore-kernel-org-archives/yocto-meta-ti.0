Return-Path: <denis@denix.org>
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1F05CE011AC
	for <meta-ti@yoctoproject.org>; Mon, 24 Oct 2011 11:37:46 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [71.191.138.237])
	by vms173019.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LTL00I3P2EFL350@vms173019.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Mon, 24 Oct 2011 13:37:34 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 92C5814AF5D; Mon,
	24 Oct 2011 14:37:27 -0400 (EDT)
Date: Mon, 24 Oct 2011 14:37:27 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Message-id: <20111024183727.GF9156@denix.org>
References: <4EA1364A.8000605@ts.fujitsu.com>
	<2599D0DD-7A48-409A-95A5-CDA103E7E974@dominion.thruhere.net>
	<4EA5266C.4080002@ts.fujitsu.com>
	<F51F67A3-60BD-4D93-9D45-25A1ADA36C54@dominion.thruhere.net>
	<4EA52A6E.2090904@ts.fujitsu.com>
	<A9FC6A94-E05C-4396-807B-A71CC08B9B40@dominion.thruhere.net>
MIME-version: 1.0
In-reply-to: <A9FC6A94-E05C-4396-807B-A71CC08B9B40@dominion.thruhere.net>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: Building for TI 8148 EVM
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
X-List-Received-Date: Mon, 24 Oct 2011 18:37:47 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Mon, Oct 24, 2011 at 01:22:54PM +0200, Koen Kooi wrote:
> 
> Op 24 okt. 2011, om 11:05 heeft Rainer Koenig het volgende geschreven:
> 
> > Koen,
> > Am 24.10.2011 10:58, schrieb Koen Kooi:
> >>> Tried this over the weekend on my home PC. Yes, works. But I was just
> >>> able to build a console image. The build of systemd-gnome-image fails
> >>> with the error that nothing provides "DRI". MACHINE=dm8148-evm.
> >> 
> >> I'm not seeing that with this set of metadata:
> >> Could you please share your version of that so we can see if there are 
> >> fixes missing?
> > 
> > Difficult at the moment because now I'm back to work and the data is at
> > home. :-) But I will setup this again on my work machine and see that I
> > get the firewall-issues solved, so I should be able to reproduce my
> > results.
> 
> Roger provided a log with a related looking bug, which should get solved 
> Real Soon(TM) when the following gets applied:
> 
> http://patchwork.openembedded.org/patch/13783/
> 
> In the mean time you should be able to get around it by doing 'bitbake 
> mesa-dri' manually.

Yep, I can confirm this issue. I had it fixed locally by adding mesa-dri to 
DEPENDS in xorg-xserver... Didn't have time to submit either a patch or a 
bugreport though.

-- 
Denys

