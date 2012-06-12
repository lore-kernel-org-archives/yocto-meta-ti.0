Return-Path: <denis@denix.org>
Received: from vms173003pub.verizon.net (vms173003pub.verizon.net
	[206.46.173.3])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 20A83E0044A
	for <meta-ti@yoctoproject.org>; Tue, 12 Jun 2012 09:47:13 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [108.48.117.33])
	by vms173003.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0M5I00M68JY6BS27@vms173003.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Tue, 12 Jun 2012 11:46:56 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 5CA5E200AC; Tue,
	12 Jun 2012 12:46:53 -0400 (EDT)
Date: Tue, 12 Jun 2012 12:46:53 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Koen Kooi <koen@dominion.thruhere.net>
Message-id: <20120612164653.GA32573@denix.org>
References: <20120612011706.GD30300@denix.org>
	<DD1A526D-B7EE-45D1-9DED-C2FB40897FBA@dominion.thruhere.net>
MIME-version: 1.0
In-reply-to: <DD1A526D-B7EE-45D1-9DED-C2FB40897FBA@dominion.thruhere.net>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: RFC: creating "extras" layer
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
X-List-Received-Date: Tue, 12 Jun 2012 16:47:14 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, Jun 12, 2012 at 08:44:59AM -0500, Koen Kooi wrote:
> 
> Op 11 jun. 2012, om 20:17 heeft Denys Dmytriyenko het volgende geschreven:
> 
> > Koen, et al,
> > 
> > This is a RFC for creating an additional "extras" layer inside meta-ti to 
> > contain pieces and components that are either slightly outdated (i.e. old 
> > Davinci boards, hawk/crane etc.) or have best-effort status (TI81x, anything 
> > DSP-related, etc.) or require non-standard dependencies besides OE-Core 
> > (systemd?) with the possibility of moving them back to "main" meta-ti in the 
> > future, once they become "first-class citizens", i.e. gain current and 
> > continuing support.
> 
> If it's going to be split this way I'd like to move all beagleboard.org 
> related things out of meta-ti and into it's own seperate repo. If the beagle 
> recipes are demoted to 2nd class citizens we have no incentive anymore to be 
> in meta-ti.

Disclaimer: no beagles were harmed in the making of this film...

Seriously though, none of the beagle recipes (requiring systemd or not) were 
moved yet for several reasons:

1. As done with some other recipes, it's possible to have systemd services w/o 
inheriting systemd.bbclass, i.e. do it manually - I was planning on looking 
into this option in the near future.

2. There was a recent discussion about systemd work being started in OE-Core 
and it was confirmed on today's call that the new Intel team in Romania is 
gearing up to integrate systemd into OE-Core in the very near future.

3. And, of course, a separate systemd layer in meta-oe might help, if done 
properly and allowing easily target both systemd and sysvinit from the same 
recipe...

Anyway, it is not my intention to demote beagle support to 2nd class citizens. 
After all, beagles are the most supported platforms in meta-ti right now and a 
very good example for other platforms to follow...

I hope you are not just looking for any excuse to move out of meta-ti - we 
just need to work on a better positioning of meta-ti...

-- 
Denys

