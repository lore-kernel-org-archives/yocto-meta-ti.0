Return-Path: <denis@denix.org>
Received: from vms173011pub.verizon.net (vms173011pub.verizon.net
	[206.46.173.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A8B4CE00599
	for <meta-ti@yoctoproject.org>; Fri, 27 Jan 2012 12:22:03 -0800 (PST)
Received: from gandalf.denix.org ([unknown] [71.163.124.23])
	by vms173011.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LYH00IJN4KF4F41@vms173011.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Fri, 27 Jan 2012 14:21:51 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 630C8202E0; Fri,
	27 Jan 2012 15:21:50 -0500 (EST)
Date: Fri, 27 Jan 2012 15:21:50 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: "Maupin, Chase" <chase.maupin@ti.com>
Message-id: <20120127202150.GE8707@denix.org>
References: <1327603585-5599-1-git-send-email-Chase.Maupin@ti.com>
	<4F21D735.5000303@ti.com>
	<27324814-C581-4BD9-92DF-68FC5CB4CECF@dominion.thruhere.net>
	<7D46E86EC0A8354091174257B2FED1010BF9BA72@DLEE12.ent.ti.com>
	<4F22E41B.8070708@ti.com>
	<7D46E86EC0A8354091174257B2FED1010BF9D77A@DLEE12.ent.ti.com>
	<4F2304E7.7070809@ti.com>
	<7D46E86EC0A8354091174257B2FED1010BF9D879@DLEE12.ent.ti.com>
MIME-version: 1.0
In-reply-to: <7D46E86EC0A8354091174257B2FED1010BF9D879@DLEE12.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH 1/3] matrix-gui-browser: port from arago	overlay
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
X-List-Received-Date: Fri, 27 Jan 2012 20:22:03 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Fri, Jan 27, 2012 at 08:17:42PM +0000, Maupin, Chase wrote:
> > -----Original Message-----
> > From: Mills, William
> > Sent: Friday, January 27, 2012 2:11 PM
> > To: Maupin, Chase
> > Cc: Koen Kooi; meta-ti@yoctoproject.org
> > Subject: Re: [meta-ti] [PATCH 1/3] matrix-gui-browser: port from
> > arago overlay
> > 
> > 
> > On 01/27/2012 02:46 PM, Maupin, Chase wrote:
> > > I guess we have a difference of opinion on how we see meta-arago.
> > I
> > > don?t separate that layer into distro and non-distro. I was
> > really
> > > planning on meta-arago being all the stuff related to the
> > arago/SDK
> > > distribution. Meta-ti is for TI packages that can be used by
> > other
> > > distros. That being said I'm OK with meta-ti being split into a
> > BSP
> > > layer and everthing else, but I don't know exactly what that buys
> > us.
> > > Does it particularly hurt someone that pulls in meta-ti to have
> > access
> > > to matrix if they don't use it? I pull in things from meta-oe or
> > > oe-core that I don?t "need" but they are there anyway.
> > 
> > Do you know that everything you are putting in meta-ti today only
> > depends on oe-core?  I don't think you do as we are not testing
> > that
> > today.  Yes, in the old days a recipie collection had tons of stuff
> > that
> > would be present but just fail if you actually tried to use it.
> > The
> > point of layers was to clean that up.
> 
> Not sure what your comment about only needing oe-core is.  For example I use 
> lmbench but I don?t see that in oe-core.  I get that from meta-oe.  I can 
> agree to spliting meta-ti into two layers, a HW layer for our devices and a 
> layer containing all of the TI recipes.
> 
> But if we wanted to match the meta-intel layer way would you also propose 
> making a layer per device?  I personally find that more confusing.

I don't think that was Bill's message. It was simplicity. BSP only layer, no 
supplemental apps, if not absolutely required.

Your example with lmbench is not correct - BSP layer should be simple enough 
to be used with OE-Core alone to produce a console rootfs image with nothing 
but busybox.

How about splitting meta-ti into:
* BSP only
* SGX graphics
* DSP tools
* WiFi etc.

And then splitting meta-arago into:
* Arago distro for TI SDKs
* Supplemental apps

-- 
Denys

