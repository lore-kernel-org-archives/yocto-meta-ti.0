Return-Path: <denis@denix.org>
Received: from vms173013pub.verizon.net (vms173013pub.verizon.net
	[206.46.173.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AC16AE014FD
	for <meta-ti@yoctoproject.org>; Thu, 24 Jan 2013 10:41:42 -0800 (PST)
Received: from gandalf.denix.org ([unknown] [71.191.205.12])
	by vms173013.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MH500C6C7WRSDC1@vms173013.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Thu, 24 Jan 2013 12:41:26 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id B5EEC200E5; Thu,
	24 Jan 2013 13:41:15 -0500 (EST)
Date: Thu, 24 Jan 2013 13:41:15 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Message-id: <20130124184115.GC23977@denix.org>
References: <alpine.DEB.2.02.1301231543150.17865@oneiric>
MIME-version: 1.0
In-reply-to: <alpine.DEB.2.02.1301231543150.17865@oneiric>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti mailing list <meta-ti@yoctoproject.org>
Subject: Re: current support for zoom am1808 experimenter kit?
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Thu, 24 Jan 2013 18:41:42 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, Jan 23, 2013 at 03:49:21PM -0500, Robert P. J. Day wrote:
> 
>   i may shortly have my hands on one of these:
> 
> http://www.logicpd.com/products/system-on-modules/zoom-am1808/
> 
> so a couple quick questions.  first, has anyone built a standard image
> using OE and meta-ti for precisely that board?  i can see meta-ti
> contains the machine config file am180x-evm.conf, but there is a more
> expensive board that is the EVM:
> 
> http://www.logicpd.com/products/system-on-modules/zoom-am1808-evm/
> 
> so is that machine conf file still relevant for the cheaper
> experimenter kit?

The difference is the addition of a daughter (UI) card with character LCD, 
extra Flash storage and bunch of Video interfaces. The main board is the same 
and is supported by am180x-evm machine config in meta-ti BSP layer. The 
supported kernel for this platform is still 2.6.37 for now...


>   next, just for the purposes of bringing up the board, i see the
> recipe for ti-hw-bringup-image.bb, but i notice that some of those
> image recipe files refer to angstrom components.  however, the meta-ti
> layer definition doesn't list meta-angstrom as a dependency.  what's
> the procotol for specifying layer dependencies?

You need to either have meta-angstrom in the layer stack, or use another image 
recipe. There's been tons of heated discussions on this topic, so I won't go 
into further details...


>   finally, the bringup recipe includes:
> 
> # This doesn't work with the current genext2fs in oe-core
> # inherit sdcard_image
> 
> is that still the case?
> 
>   sorry if these are simple questions, i don't have access to my dev
> system right now or i'd just do a build and see what happened.

-- 
Denys

