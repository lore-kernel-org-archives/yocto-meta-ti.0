Return-Path: <rpjday@crashcourse.ca>
Received: from astoria.ccjclearline.com (astoria.ccjclearline.com
	[64.235.106.9])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 053C3E0034C
	for <meta-ti@yoctoproject.org>; Mon,  4 Feb 2013 17:12:15 -0800 (PST)
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([174.115.5.73]:45744 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:DHE-RSA-AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1U2X53-0000Sj-Oy; Mon, 04 Feb 2013 20:12:14 -0500
Date: Mon, 4 Feb 2013 20:12:05 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: "Cooper Jr., Franklin" <fcooper@ti.com>
In-Reply-To: <8F29D6B095ED194EA1980491A5E029710C385D25@DFLE09.ent.ti.com>
Message-ID: <alpine.DEB.2.02.1302042010430.4687@oneiric>
References: <alpine.DEB.2.02.1301311735390.5243@oneiric>
	<CABxcv=k1fECXBLowDJ1_5zjEJCnw5t9BOTH_-6e-_MLBS3xf1Q@mail.gmail.com>
	<alpine.DEB.2.02.1302011749020.4566@oneiric>
	<8F29D6B095ED194EA1980491A5E029710C385D25@DFLE09.ent.ti.com>
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
Cc: meta-ti mailing list <meta-ti@yoctoproject.org>
Subject: Re: i *really* want a bootable OE image for my pdlogic am1808 experimenter kit
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
X-List-Received-Date: Tue, 05 Feb 2013 01:12:16 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Tue, 5 Feb 2013, Cooper Jr., Franklin wrote:

> Robert,

> I am currently working on porting am180x to the latest Sitara Linux
> SDK
> (http://processors.wiki.ti.com/index.php/Sitara_Linux_Software_Developer%E2%80%99s_Guide).
> Our Sitara SDK is based on the Arago distribution
> (http://arago-project.org/git/?p=meta-arago.git;a=summary)
>
> Meta-Arago has the following restrictions:
> 1. We use a prebuilt toolchain for our oe-core builds (http://software-dl.ti.com/sdoemb/sdoemb_public_sw/arago_toolchain/2011_09/index_FDS.html). You probably can use the tool chain built with oe-core but you have to make a tweak to use the "internal" built tool chain instead of the expected "external" tool chain.
> 2. Meta-Arago master is based on the latest meta-oe, meta-ti, oe-core maintenance branch. This means you will need to use meta-oe, meta-ti and oe-core danny/denzil branches for things to work without a problem. We just started work on transitioning to danny from denzil.
> 3. My work for am18 hasn't been pushed to meta-arago or meta-ti yet. But you can see my hacks in the Sitara SDK integration branches.
>
> http://arago-project.org/git/projects/?p=meta-arago-amsdk.git;a=summary Branch: amsdk-05.07.00.00-integration
> http://arago-project.org/git/projects/?p=meta-ti-amsdk.git;a=summary Branch: amsdk-05.07.00.00-integration
>
> If you build tisdk-rootfs-image (full SDK root filesystem) or
> arago-base-image (minimal root filesystem) you should get what you
> need to get the board booted up.
>
> If you have issues we do have a script that configures everything
> you need to get up and running and building with our Arago
> distribution in no time.

  cool, i'll give this a shot in the next day or two, i appreciate it.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

