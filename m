Return-Path: <denis@denix.org>
Received: from vms173005pub.verizon.net (vms173005pub.verizon.net
	[206.46.173.5])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1B8B8E0072A
	for <meta-ti@yoctoproject.org>; Fri, 27 Jan 2012 12:57:19 -0800 (PST)
Received: from gandalf.denix.org ([unknown] [71.163.124.23])
	by vms173005.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LYH002IG67IYUC2@vms173005.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Fri, 27 Jan 2012 14:57:18 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 3153C202E0; Fri,
	27 Jan 2012 15:57:17 -0500 (EST)
Date: Fri, 27 Jan 2012 15:57:17 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Philip Balister <philip@balister.org>
Message-id: <20120127205717.GI8707@denix.org>
References: <4F21D735.5000303@ti.com>
	<27324814-C581-4BD9-92DF-68FC5CB4CECF@dominion.thruhere.net>
	<7D46E86EC0A8354091174257B2FED1010BF9BA72@DLEE12.ent.ti.com>
	<4F22E41B.8070708@ti.com>
	<7D46E86EC0A8354091174257B2FED1010BF9D77A@DLEE12.ent.ti.com>
	<4F2304E7.7070809@ti.com>
	<7D46E86EC0A8354091174257B2FED1010BF9D879@DLEE12.ent.ti.com>
	<20120127202150.GE8707@denix.org> <4F230803.1070503@ti.com>
	<4F230E21.9010405@balister.org>
MIME-version: 1.0
In-reply-to: <4F230E21.9010405@balister.org>
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
X-List-Received-Date: Fri, 27 Jan 2012 20:57:20 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Fri, Jan 27, 2012 at 03:50:41PM -0500, Philip Balister wrote:
> On 01/27/2012 03:24 PM, William Mills wrote:
> > 
> .....
> 
> 
> >>> can
> >>> agree to spliting meta-ti into two layers, a HW layer for our devices
> >>> and a
> >>> layer containing all of the TI recipes.
> >>>
> >>> But if we wanted to match the meta-intel layer way would you also
> >>> propose
> >>> making a layer per device?  I personally find that more confusing.
> >> I don't think that was Bill's message. It was simplicity. BSP only
> >> layer, no
> >> supplemental apps, if not absolutely required.
> >>
> >> Your example with lmbench is not correct - BSP layer should be simple
> >> enough
> >> to be used with OE-Core alone to produce a console rootfs image with
> >> nothing
> >> but busybox.
> >>
> >> How about splitting meta-ti into:
> >> * BSP only
> >> * SGX graphics
> >> * DSP tools
> >> * WiFi etc.
> >>
> >> And then splitting meta-arago into:
> >> * Arago distro for TI SDKs
> >> * Supplemental apps
> >>
> > 
> > Need to get my "YES!" in here before everyone barfs all over the
> > proposal :)
> > 
> > Chase: your right.  I do not want to follow intel's example of layer per
> > BSP.
> 
> I build stuff for the USRP E100 (based on a gumstic overo). I use my own
> later for BSP that provides kernel, u-boot, and image recipes.
> 
> I still need a TI BSP layer for DSP stuff (we do not care about SGX,
> although it is possible customers could).
> 
> Do forget your customers using all this to ship products.
> 
Philip,

I don't understand what you are arguing here about or against? :)

It won't change much for you, maybe just setup step a little.

The proposal above is to split meta-ti and meta-arago repositories into 
multiple layers inside those repositories, like meta-oe already does.

Your example above is a good one - having BSP, DSP and SGX in 3 separate 
layers allows you to enable first two w/o the need to get the second one 
parsed or used.

-- 
Denys

