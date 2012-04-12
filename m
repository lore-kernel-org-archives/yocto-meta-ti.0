Return-Path: <denis@denix.org>
Received: from vms173005pub.verizon.net (vms173005pub.verizon.net
	[206.46.173.5])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 48529E0059A
	for <meta-ti@yoctoproject.org>; Thu, 12 Apr 2012 10:49:48 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [71.178.225.66])
	by vms173005.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0M2D00396O6GDOG3@vms173005.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Thu, 12 Apr 2012 12:49:29 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 63FEC20099; Thu,
	12 Apr 2012 13:49:27 -0400 (EDT)
Date: Thu, 12 Apr 2012 13:49:27 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Marco Monguzzi <marco.monguzzi@gmail.com>
Message-id: <20120412174927.GA13291@denix.org>
References: <86pqbmm4oe.fsf@coulee.tdb.com>
	<CAFZh4h9hFiRTRhVK_BfxfhFWhmZSinKjC5NJBq=ncubqboyvBg@mail.gmail.com>
	<4F7EF99A.7040700@mlbassoc.com>
	<CALKp9+bY6+mzJLSpBBmZNZZKmnh1QD+Hs8NCRt+XGLyF-N88AA@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <CALKp9+bY6+mzJLSpBBmZNZZKmnh1QD+Hs8NCRt+XGLyF-N88AA@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: building meta-ti + poky HOWTO?
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
X-List-Received-Date: Thu, 12 Apr 2012 17:49:48 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, Apr 12, 2012 at 04:42:19PM +0200, Marco Monguzzi wrote:
> Hi Gary,
> 
> this may work for me too.
> 
> Is there a way to stick with the TI recommended toolchain?
> (gcc-4.5 + Linaro patches and binutils-2.20.1)
> 
> Adding:
> 
> GCCVERSION = "4.5%"
> BINUVERSION = "2.20.1"
> 
> to my conf/local.conf appears being ignored (tried with a 1.2_M4.rc3
> snapshot).

You add those 2 lines to your local.conf when you use a distro-less setup 
(i.e. openembedded-core+meta-ti+toolchain-layer). Poky has own distribution 
configuration and that overwrites those variables. You can try forcing it:

GCCVERSION_forcevariable = "4.5%"
BINUVERSION_forcevariable = "2.20.1"

And don't forget to add toolchain-layer to your bblayers.conf

-- 
Denys


> > Workarounds:
> > * There is still one recipe in meta-ti that causes a parse error
> >    ERROR: ParseError at /home/local/poky-multi/meta-**
> > ti/recipes-misc/payload/bonesc**ript.bb:5 <http://bonescript.bb:5>: Could
> > not inherit file classes/systemd.bbclass
> >  To work around this, add this to your conf/local.conf
> >    BBMASK ?= ".*/meta-ti/recipes-misc/**payload/bonescript*"
> > * The beaglebone kernel can't be built with its default configuration
> > using the
> >  GCC-4.6.x/BINUTILS-2.22.  It will build with the attached patch which
> > disables
> >  THUMB2_KERNEL mode.  Simply apply it to your local copy of meta-ti
> > * If you want to build the TI kernel for the beagleboard, add this to
> > conf/local.conf
> >    PREFERRED_PROVIDER_virtual/**kernel ?= "linux-omap-psp"
> >
> >

> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti


