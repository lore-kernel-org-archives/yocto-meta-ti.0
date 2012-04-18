Return-Path: <denis@denix.org>
Received: from vms173011pub.verizon.net (vms173011pub.verizon.net
	[206.46.173.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E0F97E0044A
	for <meta-ti@yoctoproject.org>; Wed, 18 Apr 2012 10:24:12 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [71.178.225.66])
	by vms173011.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0M2O00J7JQZWF1D1@vms173011.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Wed, 18 Apr 2012 12:23:57 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id C07FD2009A; Wed,
	18 Apr 2012 13:23:56 -0400 (EDT)
Date: Wed, 18 Apr 2012 13:23:56 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Koen Kooi <koen@dominion.thruhere.net>
Message-id: <20120418172356.GA6343@denix.org>
References: <1334063340-21063-1-git-send-email-koen@dominion.thruhere.net>
	<20120412200941.GF13291@denix.org>
	<EB812FEE-EE00-4932-AF14-232F200EECD9@dominion.thruhere.net>
MIME-version: 1.0
In-reply-to: <EB812FEE-EE00-4932-AF14-232F200EECD9@dominion.thruhere.net>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] am33x-cm3: add firmware for am33x suspend/resume
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
X-List-Received-Date: Wed, 18 Apr 2012 17:24:13 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, Apr 12, 2012 at 10:21:14PM +0200, Koen Kooi wrote:
> 
> Op 12 apr. 2012, om 22:09 heeft Denys Dmytriyenko het volgende geschreven:
> 
> > It's not the most elegant solution either, but at least it gets around the 
> > need to keep the binary version of the firmware in the repository with the 
> > kernel recipe...
> > 
> > Do you want me to make similar changes to your patches? Or do you have any 
> > arguments against this approach?
> 
> Yes, you're not allowed to touch sysroots from inside do_install since that 
> will break sstate, which is why I added regular recipes first to get it 
> working and fix it properly later.
> 
> It's a bit academic at this point, since you need to get lucky in the 
> silicon bingo to have suspend/resume working on am335x anyway. I can disable 
> CONFIG_SUSPEND and remove the copying bits if you want.

Ok, I pushed it as is and will look into the staging issue...

-- 
Denys

