Return-Path: <rpjday@crashcourse.ca>
Received: from astoria.ccjclearline.com (astoria.ccjclearline.com
	[64.235.106.9])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2B671E01373
	for <meta-ti@yoctoproject.org>; Mon,  5 Mar 2012 09:14:12 -0800 (PST)
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([99.241.91.63] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <rpjday@crashcourse.ca>)
	id 1S4bU9-0004J6-N4; Mon, 05 Mar 2012 12:14:09 -0500
Date: Mon, 5 Mar 2012 12:13:59 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: Denys Dmytriyenko <denis@denix.org>
In-Reply-To: <20120305165844.GE14417@denix.org>
Message-ID: <alpine.DEB.2.02.1203051212100.15878@oneiric>
References: <3A03FCB1-56B0-42C4-9260-24B10EF4531E@dominion.thruhere.net>
	<4F4BB801.3090108@ti.com>
	<EF446FF9DAC93B479C74AB9153DE173F0C154A32@SMUCM08V.europe.bmw.corp>
	<329D2F11-A3FF-4029-8F3D-EC6A7587D138@dominion.thruhere.net>
	<EF446FF9DAC93B479C74AB9153DE173F0C154AC2@SMUCM08V.europe.bmw.corp>
	<EF446FF9DAC93B479C74AB9153DE173F0C280116@SMUCM08V.europe.bmw.corp>
	<alpine.DEB.2.02.1203050730440.30632@oneiric>
	<EF446FF9DAC93B479C74AB9153DE173F0C2806AF@SMUCM08V.europe.bmw.corp>
	<alpine.DEB.2.02.1203051138060.14598@oneiric>
	<4F54ED21.9000208@mlbassoc.com> <20120305165844.GE14417@denix.org>
User-Agent: Alpine 2.02 (DEB 1266 2009-07-14)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - yoctoproject.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
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
X-List-Received-Date: Mon, 05 Mar 2012 17:14:12 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Mon, 5 Mar 2012, Denys Dmytriyenko wrote:

> On Mon, Mar 05, 2012 at 09:43:13AM -0700, Gary Thomas wrote:
> > On 2012-03-05 09:39, Robert P. J. Day wrote:
> > >On Mon, 5 Mar 2012, Christian.Schulenberg@bmw.de wrote:
> > >
> > >>Hi,
> > >>
> > >>I'm using a Pandaboard Rev A4, so it is in fact an OMAP4430 board.
> > >>
> > >>You can change to u-boot bootloader in /meta-ti/conf/machine/omap4430-panda.conf:
> > >
> > >   i noticed that koen just submitted a sizable patch that gets rid of
> > >that conf file for the panda, and standardizes on the pandaboard.conf
> > >file (at least that's what it looked like).
> > >
> > >   under the circumstances, it might be worth just waiting until that
> > >patch works its way through the system and start testing all over
> > >again when it hits.
> >
> > Yes, you'll also get a newer kernel (3.0.2 last I looked, not 2.6.35)
>
> FYI, there is already 3.1 for Panda in meta-ti with -1 D_P...

  ok, i can see the new content and i just pulled into meta-ti and
meta-openembedded.  so, starting all over again, is there now a
known recipe for building for the panda with a minimum of
customziation?

  i think i'm going to start a new wiki page. :-)

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

