Return-Path: <rpjday@crashcourse.ca>
Received: from astoria.ccjclearline.com (astoria.ccjclearline.com
	[64.235.106.9])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DBF17E01458
	for <meta-ti@yoctoproject.org>; Thu,  6 Dec 2012 05:26:43 -0800 (PST)
Received: from cpebcc81008dd2c-cmbcc81008dd29.cpe.net.cable.rogers.com
	([99.253.156.71]:40998 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:DHE-RSA-AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1TgbTM-0001mg-LU; Thu, 06 Dec 2012 08:26:40 -0500
Date: Thu, 6 Dec 2012 08:26:37 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: Gary Thomas <gary@mlbassoc.com>
In-Reply-To: <50C09C0C.3030001@mlbassoc.com>
Message-ID: <alpine.DEB.2.02.1212060826200.20364@oneiric>
References: <alpine.DEB.2.02.1212060806010.20056@oneiric>
	<50C09C0C.3030001@mlbassoc.com>
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
Subject: Re: why does omap3.inc include "x-load" but omap4.inc not?
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
X-List-Received-Date: Thu, 06 Dec 2012 13:26:44 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Thu, 6 Dec 2012, Gary Thomas wrote:

> On 2012-12-06 06:12, Robert P. J. Day wrote:
> >
> >    almost certainly a simple answer to this but in grepping through the
> > meta-ti layer for an unrelated reason, i came across this:
> >
> > conf/machine/include/omap4.inc:EXTRA_IMAGEDEPENDS += "u-boot"
> > conf/machine/include/omap3.inc:EXTRA_IMAGEDEPENDS += "u-boot x-load"
> >
> > which i thought was odd, since i have both a beagle and panda, and
> > both of them use TI's x-loader.  so why would omap3.inc specifically
> > add x-load as an extra dependency, but not omap4.inc?
>
> Because U-Boot for the OMAP4 contains support for both MLO and
> U-Boot using the new "SPL" mode.  Building u-boot will end up
> building both the MLO image as well as u-boot.img

  ah, i knew there was a simple answer to that, thanks.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

