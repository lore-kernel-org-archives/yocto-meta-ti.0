Return-Path: <denis@denix.org>
Received: from vms173015pub.verizon.net (vms173015pub.verizon.net
	[206.46.173.15])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 29A02E0030F
	for <meta-ti@yoctoproject.org>; Fri, 27 Jan 2012 15:39:32 -0800 (PST)
Received: from gandalf.denix.org ([unknown] [71.163.124.23])
	by vms173015.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LYH00CW0DP3GV14@vms173015.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Fri, 27 Jan 2012 17:39:04 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id CC0CF202E0; Fri,
	27 Jan 2012 18:39:02 -0500 (EST)
Date: Fri, 27 Jan 2012 18:39:02 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Philip Balister <philip@balister.org>
Message-id: <20120127233902.GJ8707@denix.org>
References: <7D46E86EC0A8354091174257B2FED1010BF9BA72@DLEE12.ent.ti.com>
	<4F22E41B.8070708@ti.com>
	<7D46E86EC0A8354091174257B2FED1010BF9D77A@DLEE12.ent.ti.com>
	<4F2304E7.7070809@ti.com>
	<7D46E86EC0A8354091174257B2FED1010BF9D879@DLEE12.ent.ti.com>
	<20120127202150.GE8707@denix.org> <4F230803.1070503@ti.com>
	<4F230E21.9010405@balister.org> <20120127205717.GI8707@denix.org>
	<4F2327E7.5050205@balister.org>
MIME-version: 1.0
In-reply-to: <4F2327E7.5050205@balister.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH 1/3] matrix-gui-browser: port from arago overlay
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
X-List-Received-Date: Fri, 27 Jan 2012 23:39:33 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Fri, Jan 27, 2012 at 05:40:39PM -0500, Philip Balister wrote:
> On 01/27/2012 03:57 PM, Denys Dmytriyenko wrote:
> > On Fri, Jan 27, 2012 at 03:50:41PM -0500, Philip Balister wrote:
> >> On 01/27/2012 03:24 PM, William Mills wrote:
> ....
> 
> 
> >>> Chase: your right.  I do not want to follow intel's example of layer per
> >>> BSP.
> >>
> >> I build stuff for the USRP E100 (based on a gumstic overo). I use my own
> >> later for BSP that provides kernel, u-boot, and image recipes.
> >>
> >> I still need a TI BSP layer for DSP stuff (we do not care about SGX,
> >> although it is possible customers could).
> >>
> >> Do forget your customers using all this to ship products.
> >>
> > Philip,
> > 
> > I don't understand what you are arguing here about or against? :)
> > 
> > It won't change much for you, maybe just setup step a little.
> > 
> > The proposal above is to split meta-ti and meta-arago repositories into 
> > multiple layers inside those repositories, like meta-oe already does.
> > 
> > Your example above is a good one - having BSP, DSP and SGX in 3 separate 
> > layers allows you to enable first two w/o the need to get the second one 
> > parsed or used.
> > 
> 
> Mostly I am saying keep your customers in mind, I very much like the
> story of oe-core as the foundation, adding meta-oe to build images that
> can be tested in qemu, using the TI BSP to support SOC specific features
> and as an example to create my own BSP with my image definitions.
> Finally I can use the Angstrom layer to provide some sanity to package
> versions and as a source for binary feeds. I'm not sure where Arago fits
> in this story.

If you are worried about how Arago distribution fits in your use case, you 
shouldn't - we are definitely not trying to force our distribution on you, if 
you are happy with Angstrom. Moreover, that's the reason we propose to split 
meta-arago repository to separate apps from distro/TISDK configs, in case you 
want to use those apps with your own distro.

> It would be really nice to get all this sorted out so we can clearly
> explain this to other users of TI products and OE users.

Hence the heated discussion of today :)

-- 
Denys

