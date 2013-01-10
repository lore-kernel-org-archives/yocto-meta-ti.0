Return-Path: <rpjday@crashcourse.ca>
Received: from astoria.ccjclearline.com (astoria.ccjclearline.com
	[64.235.106.9])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 810E2E006C2
	for <meta-ti@yoctoproject.org>; Thu, 10 Jan 2013 06:49:04 -0800 (PST)
Received: from cpebcc81008dd2c-cmbcc81008dd29.cpe.net.cable.rogers.com
	([99.253.156.71]:38409 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:DHE-RSA-AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1TtJRH-0005Mf-5z
	for meta-ti@yoctoproject.org; Thu, 10 Jan 2013 09:49:03 -0500
Date: Thu, 10 Jan 2013 09:48:58 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: meta-ti mailing list <meta-ti@yoctoproject.org>
Message-ID: <alpine.DEB.2.02.1301100943340.32462@oneiric>
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
Subject: has anyone actually tested sdcard_image.bbclass?
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
X-List-Received-Date: Thu, 10 Jan 2013 14:49:04 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


  testing SD card image creation under meta-ti for the first time and
the first issue seems to be that this is necessary:

diff --git a/classes/sdcard_image.bbclass b/classes/sdcard_image.bbclass
index f9b8d46..45374e2 100644
--- a/classes/sdcard_image.bbclass
+++ b/classes/sdcard_image.bbclass
@@ -1,4 +1,4 @@
-inherit image
+inherit image_types

 # Add the fstypes we need
 IMAGE_FSTYPES_append = " tar.bz2 sdimg"

  also, even after i make that change, i get:

===== start =====
... big snip ...
| /etc/fstab entries need to be created with the user flag for the
loop devices like:
| /dev/loop2
/home/rpjday/oe/builds/ti/bone/tmp-eglibc/work/beaglebone-oe-linux-gnueabi/core-image-minimal/1.0-r0/tmp-mnt-boot
vfat user 0 0
| ERROR: Function failed: do_rootfs (see
/home/rpjday/oe/builds/ti/bone/tmp-eglibc/work/beaglebone-oe-linux-gnueabi/core-image-minimal/1.0-r0/temp/log.do_rootfs.1938
for further information)
ERROR: Task 7
(/home/rpjday/oe/dist/layers/oe-core/meta/recipes-core/images/core-image-minimal.bb,
do_rootfs) failed with exit code '1'
NOTE: Tasks Summary: Attempted 1922 tasks of which 1901 didn't need to
be rerun and 1 failed.
No currently running tasks (1922 of 1923)

Summary: 1 task failed:

/home/rpjday/oe/dist/layers/oe-core/meta/recipes-core/images/core-image-minimal.bb,
do_rootfs
===== end =====

but i'm willing to believe that's something i did stupidly so i'll
look at it further.

  thoughts?  all i did for a test was add this to local.conf:

IMAGE_CLASSES += "sdcard_image"

and run:

$ bitbake core-image-minimal

the previous build worked fine without trying to create the SD card
image.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

