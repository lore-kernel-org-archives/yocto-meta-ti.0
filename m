Return-Path: <rpjday@crashcourse.ca>
Received: from astoria.ccjclearline.com (astoria.ccjclearline.com
	[64.235.106.9])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2990FE002AB
	for <meta-ti@yoctoproject.org>; Wed, 23 Jan 2013 12:49:25 -0800 (PST)
Received: from cpebcc81008dd2c-cmbcc81008dd29.cpe.net.cable.rogers.com
	([99.253.156.71]:53512 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:DHE-RSA-AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1Ty7G8-00048r-CR
	for meta-ti@yoctoproject.org; Wed, 23 Jan 2013 15:49:24 -0500
Date: Wed, 23 Jan 2013 15:49:21 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: meta-ti mailing list <meta-ti@yoctoproject.org>
Message-ID: <alpine.DEB.2.02.1301231543150.17865@oneiric>
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
Subject: current support for zoom am1808 experimenter kit?
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
X-List-Received-Date: Wed, 23 Jan 2013 20:49:25 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


  i may shortly have my hands on one of these:

http://www.logicpd.com/products/system-on-modules/zoom-am1808/

so a couple quick questions.  first, has anyone built a standard image
using OE and meta-ti for precisely that board?  i can see meta-ti
contains the machine config file am180x-evm.conf, but there is a more
expensive board that is the EVM:

http://www.logicpd.com/products/system-on-modules/zoom-am1808-evm/

so is that machine conf file still relevant for the cheaper
experimenter kit?

  next, just for the purposes of bringing up the board, i see the
recipe for ti-hw-bringup-image.bb, but i notice that some of those
image recipe files refer to angstrom components.  however, the meta-ti
layer definition doesn't list meta-angstrom as a dependency.  what's
the procotol for specifying layer dependencies?

  finally, the bringup recipe includes:

# This doesn't work with the current genext2fs in oe-core
# inherit sdcard_image

is that still the case?

  sorry if these are simple questions, i don't have access to my dev
system right now or i'd just do a build and see what happened.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

