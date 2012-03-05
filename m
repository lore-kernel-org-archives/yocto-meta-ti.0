Return-Path: <marc@plastictigers.com>
Received: from plastictigers.com (li158-162.members.linode.com
	[173.230.148.162])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8A137E01374
	for <meta-ti@yoctoproject.org>; Mon,  5 Mar 2012 12:26:19 -0800 (PST)
Received: by plastictigers.com (Postfix, from userid 1000)
	id 850EF207DD; Mon,  5 Mar 2012 15:26:18 -0500 (EST)
Date: Mon, 5 Mar 2012 15:26:18 -0500
From: Marc Butler <marc@plastictigers.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Message-ID: <20120305202618.GA3911@plastictigers.com>
References: <EF446FF9DAC93B479C74AB9153DE173F0C154A32@SMUCM08V.europe.bmw.corp>
	<329D2F11-A3FF-4029-8F3D-EC6A7587D138@dominion.thruhere.net>
	<EF446FF9DAC93B479C74AB9153DE173F0C154AC2@SMUCM08V.europe.bmw.corp>
	<EF446FF9DAC93B479C74AB9153DE173F0C280116@SMUCM08V.europe.bmw.corp>
	<alpine.DEB.2.02.1203050730440.30632@oneiric>
	<EF446FF9DAC93B479C74AB9153DE173F0C2806AF@SMUCM08V.europe.bmw.corp>
	<alpine.DEB.2.02.1203051138060.14598@oneiric>
	<4F54ED21.9000208@mlbassoc.com> <20120305165844.GE14417@denix.org>
	<alpine.DEB.2.02.1203051212100.15878@oneiric>
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.02.1203051212100.15878@oneiric>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: Building Yocto for Pandaboard
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
Reply-To: marc@plastictigers.com
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Mon, 05 Mar 2012 20:26:19 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 05, 2012 at 12:13:59PM -0500, Robert P. J. Day wrote:
> On Mon, 5 Mar 2012, Denys Dmytriyenko wrote:
> 
> > On Mon, Mar 05, 2012 at 09:43:13AM -0700, Gary Thomas wrote:
> > > On 2012-03-05 09:39, Robert P. J. Day wrote:
> > > >On Mon, 5 Mar 2012, Christian.Schulenberg@bmw.de wrote:
> > > >
> > > >>Hi,
> > > >>
> > > >>I'm using a Pandaboard Rev A4, so it is in fact an OMAP4430 board.
> > > >>
> > > >>You can change to u-boot bootloader in /meta-ti/conf/machine/omap4430-panda.conf:
> > > >
> > > >   i noticed that koen just submitted a sizable patch that gets rid of
> > > >that conf file for the panda, and standardizes on the pandaboard.conf
> > > >file (at least that's what it looked like).
> > > >
> > > >   under the circumstances, it might be worth just waiting until that
> > > >patch works its way through the system and start testing all over
> > > >again when it hits.
> > >
> > > Yes, you'll also get a newer kernel (3.0.2 last I looked, not 2.6.35)
> >
> > FYI, there is already 3.1 for Panda in meta-ti with -1 D_P...
> 
>   ok, i can see the new content and i just pulled into meta-ti and
> meta-openembedded.  so, starting all over again, is there now a
> known recipe for building for the panda with a minimum of
> customziation?
> 
>   i think i'm going to start a new wiki page. :-)

If this works for you, I would be eager to know the process. And happy
to verify in another environment.

-m

