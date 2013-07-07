Return-Path: <rpjday@crashcourse.ca>
Received: from astoria.ccjclearline.com (astoria.ccjclearline.com
	[64.235.106.9])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 43851E01534
	for <meta-ti@yoctoproject.org>; Sun,  7 Jul 2013 05:00:13 -0700 (PDT)
Received: from [174.115.5.73] (port=46405 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:DHE-RSA-AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1UvndT-0000zI-8H
	for meta-ti@yoctoproject.org; Sun, 07 Jul 2013 08:00:11 -0400
Date: Sun, 7 Jul 2013 08:00:05 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: meta-ti mailing list <meta-ti@yoctoproject.org>
Message-ID: <alpine.DEB.2.02.1307070755370.23001@oneiric>
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
Subject: proper recipe to build for BBB using the meta-ti layer?
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
X-List-Received-Date: Sun, 07 Jul 2013 12:00:16 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


  until recently, i was using the meta-beagleboard layer to build
artifacts for my beaglebone black but i just switched over to using
meta-ti to sync up with a colleague and was wondering if there's a
posted recipe for building a bootable SD card as i ran into trouble.

  on my attempt last night, i got what looked like a good build
creating a core-image-minimal, copied just the MLO and u-boot.img
files to my SD card, and booted from it to verify at least the proper
creation of the bootloader, but got this:

U-Boot SPL 2013.01.01 (Jul 06 2013 - 18:41:10)
OMAP SD/MMC: 0
** Partition 1 not valid on device 0 **
spl: fat register err - -1
### ERROR ### Please RESET the board ###

  this is exactly the same SD card i was using with meta-beagleboard
generated image files. everything else about the build seemed fine.
can someone verify a known good recipe for this? is there
something different about the creation of the SD card? i'm currently
doing another build from scratch to see if i messed anything up.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

