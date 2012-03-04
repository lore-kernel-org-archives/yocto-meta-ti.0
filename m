Return-Path: <denis@denix.org>
Received: from vms173007pub.verizon.net (vms173007pub.verizon.net
	[206.46.173.7])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9E548E0070C
	for <meta-ti@lists.yoctoproject.org>;
	Sat,  3 Mar 2012 21:50:39 -0800 (PST)
Received: from gandalf.denix.org ([unknown] [71.178.225.66])
	by vms173007.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0M0C00B06IVXF470@vms173007.mailsrvcs.net> for
	meta-ti@lists.yoctoproject.org; Sat, 03 Mar 2012 23:50:27 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 7F1CB2016D; Sun,
	04 Mar 2012 00:50:21 -0500 (EST)
Date: Sun, 04 Mar 2012 00:50:21 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-id: <20120304055021.GK24667@denix.org>
References: <1330771988-13742-1-git-send-email-koen@dominion.thruhere.net>
	<20120303135523.GJ24667@denix.org>
	<95AEAC88-7C37-41CD-B0FA-DF85BE77D2FC@dominion.thruhere.net>
	<1330834220.3949.7.camel@ted>
MIME-version: 1.0
In-reply-to: <1330834220.3949.7.camel@ted>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@lists.yoctoproject.org
Subject: Re: [PATCH 1/3] SOC_FAMILY: add to MACHINE_OVERRIDES locally
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
X-List-Received-Date: Sun, 04 Mar 2012 05:50:39 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Sat, Mar 03, 2012 at 08:10:20PM -0800, Richard Purdie wrote:
> On Sat, 2012-03-03 at 20:01 +0100, Koen Kooi wrote:
> > Op 3 mrt. 2012, om 14:55 heeft Denys Dmytriyenko het volgende geschreven:
> > 
> > > On Sat, Mar 03, 2012 at 11:53:06AM +0100, Koen Kooi wrote:
> > >> This breaks the hard dependency on Angstrom for getting a sane set of 
> > >> recipes.
> > >> 
> > >> The variable name is kept the same and the actual code moved from 
> > >> angstrom.inc to soc-family.inc to make it clear what it is doing and how.
> > > 
> > > Ah, nice workaround until/if it gets accepted upstream to OE-Core! Thanks, 
> > > Koen.
> > 
> > The consensus at ELC was that these kind of tweaks should be done at
> > the machine level now that we have MACHINE_OVERRIDES seperated out. If
> > a lot of BSPs are going to use SOC_FAMILY we can try to push it into
> > OE-core again. But currently we wouldn't stand a chance.
> 
> MACHINE_OVERRIDES was added to give people a generic way of extending
> overrides from a machine context. This works for various situations such
> as the "x86" override that made more sense than the previous 386|486|
> 586|xxx madness as well as providing a mechanism for SOC_FAMILY and
> other uses.
> 
> I guess the .inc file could make it into OE-Core but I don't see much
> value in adding SOC_FAMILY directly as a standard variable at this
> point.

Thanks, Richard! That's a suitable compromise. I'll send a patch to OE-Core.

-- 
Denys

