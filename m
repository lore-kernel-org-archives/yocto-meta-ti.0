Return-Path: <denis@denix.org>
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4BE3DE0070C
	for <meta-ti@yoctoproject.org>; Sat,  3 Mar 2012 22:04:33 -0800 (PST)
Received: from gandalf.denix.org ([unknown] [71.178.225.66])
	by vms173017.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0M0C007NRJJFE631@vms173017.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Sun, 04 Mar 2012 00:04:27 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 4038A2016D; Sun,
	04 Mar 2012 01:04:27 -0500 (EST)
Date: Sun, 04 Mar 2012 01:04:27 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: William Mills <wmills@ti.com>
Message-id: <20120304060427.GL24667@denix.org>
References: <20120301212837.C08F852A8A@arago-project.org>
	<50999BC3-EC35-4F51-BD1E-9F35FD9AD78C@dominion.thruhere.net>
	<7D46E86EC0A8354091174257B2FED1012F049DD6@DLEE12.ent.ti.com>
	<351DB87E-545E-479E-8183-C5072355906C@dominion.thruhere.net>
	<7D46E86EC0A8354091174257B2FED1012F04A6C0@DLEE12.ent.ti.com>
	<20120302221439.GD24667@denix.org> <20120303082350.GF24667@denix.org>
	<4F51FD84.7050101@ti.com>
MIME-version: 1.0
In-reply-to: <4F51FD84.7050101@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: Chase Maupin : linux-ti33x-psp: add am335x-evm support
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
X-List-Received-Date: Sun, 04 Mar 2012 06:04:33 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Sat, Mar 03, 2012 at 06:16:20AM -0500, William Mills wrote:
> On 03/03/2012 03:23 AM, Denys Dmytriyenko wrote:
> >As a side note, sstate seems to be really broken, as building the first
> >machine in a clean setup works fine, but then trying to build a second machine
> >in the same setup leads to weird breakages in perl, gcc-cross-initial,
> >gcc-cross-intermediate, then binutils etc. Even though both machines are
> >armv7a and supposed to share those packages w/o rebuilding them... Cleaning
> >sstate and/or entire build takes too much time and is really painful
> >switching between platforms.
> >
> 
> Please report this on oe-core list if you have not already.

I will, once I collect the logs and more details.

-- 
Denys

