Return-Path: <denis@denix.org>
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D2DC0E00596
	for <meta-ti@yoctoproject.org>; Mon, 27 Feb 2012 10:56:18 -0800 (PST)
Received: from gandalf.denix.org ([unknown] [71.178.225.66])
	by vms173017.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0M0200L1QF9J3OD0@vms173017.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Mon, 27 Feb 2012 12:56:08 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 5CD4120264; Mon,
	27 Feb 2012 13:56:07 -0500 (EST)
Date: Mon, 27 Feb 2012 13:56:07 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: William Mills <wmills@ti.com>
Message-id: <20120227185607.GB10713@denix.org>
References: <EF446FF9DAC93B479C74AB9153DE173F0C0D32FF@SMUCM08V.europe.bmw.corp>
	<3BC330F9-CE58-4C4F-A473-B0F40D0A2777@dominion.thruhere.net>
	<4F4BA9EE.8030908@balister.org>
	<3A03FCB1-56B0-42C4-9260-24B10EF4531E@dominion.thruhere.net>
	<4F4BB801.3090108@ti.com>
MIME-version: 1.0
In-reply-to: <4F4BB801.3090108@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: Building Yocto for Pandaboard
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
X-List-Received-Date: Mon, 27 Feb 2012 18:56:19 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Mon, Feb 27, 2012 at 12:06:09PM -0500, William Mills wrote:
> >>The README contains instructions for building Angstrom, which is not the
> >>right answer for everyone trying to use meta-ti.
> >Since the recipe in question break with gcc 4.6 and/or binutils 2.22 *and* you need SOC_FAMILY in overrides angstrom is the only "out of the box" option. Other routes will involve heavy patching. I agree that needs to be addressed, but it doesn't change the solution *right now*.
> >
> >And the instructions in the README set things for 'yocto', which is what people are asking for. If they asked for 'poky', that would be a totally different thing.
> 
> Denis or Koen:  Before today is over please modify the README.txt to
> describe where we are going and what is possible right now.  If
> Angstrom is the only thing possible right now it should say that
> until we can build with other layer stacks.  However it should also
> say that we are working toward a solution that will build with
> multiple layer stacks including poky.

Sure, will do.

-- 
Denys

