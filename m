Return-Path: <denis@denix.org>
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6E311E00723
	for <meta-ti@yoctoproject.org>; Wed,  2 May 2012 23:09:56 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [108.48.117.33])
	by vms173017.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0M3F00AQKNRW69W0@vms173017.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Thu, 03 May 2012 01:09:37 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 56EEB2010D; Thu,
	03 May 2012 02:09:32 -0400 (EDT)
Date: Thu, 03 May 2012 02:09:32 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Koen Kooi <koen@dominion.thruhere.net>
Message-id: <20120503060932.GD2681@denix.org>
References: <20120503004302.E49A252A70@arago-project.org>
	<1DB7C838-80AE-47B8-9251-87253476B6F5@dominion.thruhere.net>
MIME-version: 1.0
In-reply-to: <1DB7C838-80AE-47B8-9251-87253476B6F5@dominion.thruhere.net>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org, Arago Project git <git@arago-project.org>
Subject: Re: Denys Dmytriyenko : beaglebone: disable THUMB2_KERNEL in defconfig for newer binutils
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
X-List-Received-Date: Thu, 03 May 2012 06:09:56 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, May 03, 2012 at 08:02:00AM +0200, Koen Kooi wrote:
> 
> Op 3 mei 2012, om 02:43 heeft Arago Project git het volgende geschreven:
> 
> > Module: meta-ti
> > Branch: master
> > Commit: 3c693c26087aa148b944166083b5336f05d1c15b
> > URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=3c693c26087aa148b944166083b5336f05d1c15b
> > 
> > Author: Denys Dmytriyenko <denys@ti.com>
> > Date:   Wed May  2 20:40:58 2012 -0400
> > 
> > beaglebone: disable THUMB2_KERNEL in defconfig for newer binutils
> 
> Wait, what? Can we actually send these changes for review first? T2 is 
> needed to meet the boot time goal, so please revert this one!

Have another solution to get it building under recent binutils? Especially 
considering removal of the old one fron meta-oe/toolchain-layer?

-- 
Denys

