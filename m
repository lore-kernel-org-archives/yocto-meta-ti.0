Return-Path: <rpjday@crashcourse.ca>
Received: from astoria.ccjclearline.com (astoria.ccjclearline.com
	[64.235.106.9])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8E50CE006D2
	for <meta-ti@yoctoproject.org>; Thu, 24 Jan 2013 10:46:18 -0800 (PST)
Received: from cpebcc81008dd2c-cmbcc81008dd29.cpe.net.cable.rogers.com
	([99.253.156.71]:32828 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:DHE-RSA-AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1TyRoX-0006US-3o; Thu, 24 Jan 2013 13:46:17 -0500
Date: Thu, 24 Jan 2013 13:46:11 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: Denys Dmytriyenko <denys@ti.com>
In-Reply-To: <20130124184115.GC23977@denix.org>
Message-ID: <alpine.DEB.2.02.1301241343530.5921@oneiric>
References: <alpine.DEB.2.02.1301231543150.17865@oneiric>
	<20130124184115.GC23977@denix.org>
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
X-List-Received-Date: Thu, 24 Jan 2013 18:46:18 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Thu, 24 Jan 2013, Denys Dmytriyenko wrote:

> On Wed, Jan 23, 2013 at 03:49:21PM -0500, Robert P. J. Day wrote:
>
> >   next, just for the purposes of bringing up the board, i see the
> > recipe for ti-hw-bringup-image.bb, but i notice that some of those
> > image recipe files refer to angstrom components.  however, the meta-ti
> > layer definition doesn't list meta-angstrom as a dependency.  what's
> > the procotol for specifying layer dependencies?
>
> You need to either have meta-angstrom in the layer stack, or use
> another image recipe. There's been tons of heated discussions on
> this topic, so I won't go into further details...

  yup, i've run across most of that in the last couple hours of
snooping so i have a much better idea of how those recipes work,
thanks.

  and, predictably, i ran into the same issue jack mitchell reported a
few days ago:

https://lists.yoctoproject.org/pipermail/meta-ti/2013-January/002015.html

so i'll kick back and watch for a resolution.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


