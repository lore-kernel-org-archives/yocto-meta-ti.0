Return-Path: <denis@denix.org>
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 924C9E0044D
	for <meta-ti@yoctoproject.org>; Thu,  3 May 2012 10:16:06 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [108.48.117.33])
	by vms173019.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0M3G0096AIMK2050@vms173019.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Thu, 03 May 2012 12:16:02 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 99A02201AF; Thu,
	03 May 2012 13:15:56 -0400 (EDT)
Date: Thu, 03 May 2012 13:15:56 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Koen Kooi <koen@dominion.thruhere.net>
Message-id: <20120503171556.GJ2681@denix.org>
References: <1335899212-29869-1-git-send-email-koen@dominion.thruhere.net>
MIME-version: 1.0
In-reply-to: <1335899212-29869-1-git-send-email-koen@dominion.thruhere.net>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [RFC][PATCH 1/5] linux-mainline 3.2: kernel recipe based on mainline 3.2.16 with additional patches for e.g. beagleboard on top
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
X-List-Received-Date: Thu, 03 May 2012 17:16:06 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

It's a heavy patch, but my question is - how is it different from linux-3.0 we 
already have, besides the version upgrade to 3.2? Why is it called 
linux-mainline, the old linux recipe is also mainline with beagle patches.

Basically, I'm trying to understand 2 things here:
- what's the difference between this beagle patch set and the one applied on 
top of e.g. 3.0.28? Is it a different dev model, goals, owner or anything else
- why the name change with -mainline suffix?

Other than that it looks fine.

-- 
Denys

