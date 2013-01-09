Return-Path: <rpjday@crashcourse.ca>
Received: from astoria.ccjclearline.com (astoria.ccjclearline.com
	[64.235.106.9])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6DF47E011AF
	for <meta-ti@yoctoproject.org>; Wed,  9 Jan 2013 07:48:06 -0800 (PST)
Received: from cpebcc81008dd2c-cmbcc81008dd29.cpe.net.cable.rogers.com
	([99.253.156.71]:39312 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:DHE-RSA-AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1Tsxsr-0006jI-Jp
	for meta-ti@yoctoproject.org; Wed, 09 Jan 2013 10:48:05 -0500
Date: Wed, 9 Jan 2013 10:48:02 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: meta-ti mailing list <meta-ti@yoctoproject.org>
Message-ID: <alpine.DEB.2.02.1301091044250.12880@oneiric>
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
Subject: MODULES_IMAGE_BASE_NAME mismatch between meta-ti and oe-core
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
X-List-Received-Date: Wed, 09 Jan 2013 15:48:06 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


  just built images for beaglebone and noticed this in images/ dir:

-rw-rw-r-- 1 rpjday rpjday 7118258 Jan  9 10:13 modules--3.2.28-r0-beaglebone-20130109143542.tgz
lrwxrwxrwx 1 rpjday rpjday      32 Jan  9 10:13 modules-beaglebone.tgz -> modules-3.2.28-r0-beaglebone.tgz

note the obviously broken symlink, which has been set to link to a
name which does not exist.  the problem is that meta-ti uses this:

MODULES_IMAGE_BASE_NAME = "modules-${PV}-${PR}-${MACHINE}"

while oe-core uses:

MODULE_TARBALL_BASE_NAME ?= "modules-${PE}-${PV}-${PR}-${MACHINE}-${DATETIME}.tgz"

or something like that.  i'm off to the gym so can't dig deeper but i
suspect someone here will immediately have a solution.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

