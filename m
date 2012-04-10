Return-Path: <denis@denix.org>
Received: from vms173005pub.verizon.net (vms173005pub.verizon.net
	[206.46.173.5])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 501A3E00596
	for <meta-ti@yoctoproject.org>; Tue, 10 Apr 2012 13:11:19 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [71.178.225.66])
	by vms173005.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0M2A00KDV5E1MGY0@vms173005.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Tue, 10 Apr 2012 15:10:50 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 2B01A20137; Tue,
	10 Apr 2012 16:10:48 -0400 (EDT)
Date: Tue, 10 Apr 2012 16:10:48 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Koen Kooi <koen@dominion.thruhere.net>
Message-id: <20120410201048.GA23477@denix.org>
References: <1334063833-9235-1-git-send-email-eric@eukrea.com>
	<6C2C4B59-3AD6-4C69-8534-D5E32BEACBA4@dominion.thruhere.net>
MIME-version: 1.0
In-reply-to: <6C2C4B59-3AD6-4C69-8534-D5E32BEACBA4@dominion.thruhere.net>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] u-boot-git: add COMPATIBLE_MACHINE
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
X-List-Received-Date: Tue, 10 Apr 2012 20:11:19 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, Apr 10, 2012 at 03:28:41PM +0200, Koen Kooi wrote:
> 
> Op 10 apr. 2012, om 15:17 heeft Eric B?nard het volgende geschreven:
> 
> > so that an other BSP layer can also provide a u-boot_git recipe
> 
> ah right, we talked about this earlier and were going to namespace our uboot 
> recipes instead. COMPATIBLE_MACHINE is just too dang hard to grasp for 
> customers adding their machine.

We can just list all the SoC families in COMPATIBLE_MACHINES - that would 
solve the issues with other non-TI-derived BSP layers. Won't help meta-ettus 
or meta-gumstix or meta-openpandora, though...

-- 
Denys

