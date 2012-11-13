Return-Path: <rpjday@crashcourse.ca>
Received: from astoria.ccjclearline.com (astoria.ccjclearline.com
	[64.235.106.9])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3E50FE0032E
	for <meta-ti@yoctoproject.org>; Tue, 13 Nov 2012 07:43:20 -0800 (PST)
Received: from cpebcc8100fb8db-cmbcc8100fb8d8.cpe.net.cable.rogers.com
	([174.116.196.46]:60865 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.77) (envelope-from <rpjday@crashcourse.ca>)
	id 1TYIdy-0006BA-T8; Tue, 13 Nov 2012 10:43:19 -0500
Date: Tue, 13 Nov 2012 10:43:05 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: Tomas Frydrych <tf+lists.yocto@r-finger.com>
In-Reply-To: <50A26971.40908@r-finger.com>
Message-ID: <alpine.DEB.2.02.1211131041310.4591@oneiric>
References: <CAFNBfte2-bE2o2XCu_nVUcFXukfbvd5fujvoB59fYZHOWyGtdw@mail.gmail.com>
	<50A26410.5030405@r-finger.com> <20121113152237.GA12650@edge>
	<50A26971.40908@r-finger.com>
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
Subject: Re: Help with building gstreamer-ti on beagleboard
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
X-List-Received-Date: Tue, 13 Nov 2012 15:43:20 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Tue, 13 Nov 2012, Tomas Frydrych wrote:

> On 13/11/12 15:22, Denys Dmytriyenko wrote:
> >> For Denzil it is not possible to arrange meta-yocto and meta-ti layers
> >> in a way that would work; this has been fixed in Danny (in
> >> meta-yocto-bsp). If you want to stick with Denzil, there are different
> >> ways to work around it, easiest should be to delete the offending
> >> beagleboard.conf from meta-yocto.
> >
> > Why can't you put meta-ti in front of meta-yocto in Denzil? Works just fine.
>
> Because meta-yocto layer.conf does:
>
>   BBPATH := "${LAYERDIR}:${BBPATH}"
>
> While meta-ti layer.conf does:
>
>   BBPATH .= ":${LAYERDIR}"
>
> So regardless how you order it, you get BBPATH that looks like:
>
>   meta-yocto:meta:meta-ti
>
> Which guarantees you the beagleboard.conf from meta-yocto.

  once upon a time, i pointed out on the yocto list the inconsistency
of how different layer.conf files set BBPATH:

https://lists.yoctoproject.org/pipermail/yocto/2012-March/007660.html

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

