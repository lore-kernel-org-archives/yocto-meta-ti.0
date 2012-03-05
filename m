Return-Path: <denis@denix.org>
Received: from vms173005pub.verizon.net (vms173005pub.verizon.net
	[206.46.173.5])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DE801E01373
	for <meta-ti@yoctoproject.org>; Mon,  5 Mar 2012 08:58:47 -0800 (PST)
Received: from gandalf.denix.org ([unknown] [71.178.225.66])
	by vms173005.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0M0F007FZ8HYTJJ1@vms173005.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Mon, 05 Mar 2012 10:58:47 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id E587220466; Mon,
	05 Mar 2012 11:58:44 -0500 (EST)
Date: Mon, 05 Mar 2012 11:58:44 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Gary Thomas <gary@mlbassoc.com>
Message-id: <20120305165844.GE14417@denix.org>
References: <3A03FCB1-56B0-42C4-9260-24B10EF4531E@dominion.thruhere.net>
	<4F4BB801.3090108@ti.com>
	<EF446FF9DAC93B479C74AB9153DE173F0C154A32@SMUCM08V.europe.bmw.corp>
	<329D2F11-A3FF-4029-8F3D-EC6A7587D138@dominion.thruhere.net>
	<EF446FF9DAC93B479C74AB9153DE173F0C154AC2@SMUCM08V.europe.bmw.corp>
	<EF446FF9DAC93B479C74AB9153DE173F0C280116@SMUCM08V.europe.bmw.corp>
	<alpine.DEB.2.02.1203050730440.30632@oneiric>
	<EF446FF9DAC93B479C74AB9153DE173F0C2806AF@SMUCM08V.europe.bmw.corp>
	<alpine.DEB.2.02.1203051138060.14598@oneiric>
	<4F54ED21.9000208@mlbassoc.com>
MIME-version: 1.0
In-reply-to: <4F54ED21.9000208@mlbassoc.com>
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
X-List-Received-Date: Mon, 05 Mar 2012 16:58:48 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Mon, Mar 05, 2012 at 09:43:13AM -0700, Gary Thomas wrote:
> On 2012-03-05 09:39, Robert P. J. Day wrote:
> >On Mon, 5 Mar 2012, Christian.Schulenberg@bmw.de wrote:
> >
> >>Hi,
> >>
> >>I'm using a Pandaboard Rev A4, so it is in fact an OMAP4430 board.
> >>
> >>You can change to u-boot bootloader in /meta-ti/conf/machine/omap4430-panda.conf:
> >
> >   i noticed that koen just submitted a sizable patch that gets rid of
> >that conf file for the panda, and standardizes on the pandaboard.conf
> >file (at least that's what it looked like).
> >
> >   under the circumstances, it might be worth just waiting until that
> >patch works its way through the system and start testing all over
> >again when it hits.
> 
> Yes, you'll also get a newer kernel (3.0.2 last I looked, not 2.6.35)

FYI, there is already 3.1 for Panda in meta-ti with -1 D_P...

-- 
Denys

