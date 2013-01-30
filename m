Return-Path: <rpjday@crashcourse.ca>
Received: from astoria.ccjclearline.com (astoria.ccjclearline.com
	[64.235.106.9])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D5C7DE00721
	for <meta-ti@yoctoproject.org>; Wed, 30 Jan 2013 15:21:19 -0800 (PST)
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([174.115.5.73]:55230 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:DHE-RSA-AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1U0gxy-0008R6-Jq
	for meta-ti@yoctoproject.org; Wed, 30 Jan 2013 18:21:18 -0500
Date: Wed, 30 Jan 2013 18:21:15 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: meta-ti mailing list <meta-ti@yoctoproject.org>
Message-ID: <alpine.DEB.2.02.1301301812590.3879@oneiric>
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
Subject: couple issues trying to build ti-hw-bringup-image.bb for AM1808 exp kit
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
X-List-Received-Date: Wed, 30 Jan 2013 23:21:20 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


  i want to build a stock ti-hw-bringup-image.bb for am180x-evm, so if
anyone else has done that, here are the two issues i've run into.
first, i dropped the connman packages from the meta-angstrom layer:

diff --git a/recipes-images/angstrom/systemd-image.bb b/recipes-images/angstrom/systemd-image.bb
index c3232d9..b1cc338 100644
--- a/recipes-images/angstrom/systemd-image.bb
+++ b/recipes-images/angstrom/systemd-image.bb
@@ -14,7 +14,6 @@ CONMANPKGS_libc-uclibc = ""
 IMAGE_INSTALL += " \
        angstrom-packagegroup-boot \
        packagegroup-basic \
-       ${CONMANPKGS} \
        ${ROOTFS_PKGMANAGE_PKGS} \
        timestamp-service \
 "

as that was causing a failure due to a missing "ofono.service" file,
which i didn't really care about so it was just easier to delete that
line to get the build to finish.

  at that point, i was so close, and then this when trying to build
the rootfs:

... snip ...
| Configuring packagegroup-ti-test.
| Configuring alsa-utils-aseqnet.
| Configuring alsa-utils-aseqdump.
| Configuring alsa-utils.
| Collected errors:
|  * satisfy_dependencies_for: Cannot satisfy the following dependencies for angstrom-packagegroup-boot:
|  * 	systemd *
|  * opkg_install_cmd: Cannot install package angstrom-packagegroup-boot.
|  * satisfy_dependencies_for: Cannot satisfy the following dependencies for packagegroup-basic:
|  * 	systemd * 	systemd * 	systemd *
|  * opkg_install_cmd: Cannot install package packagegroup-basic.
|  * satisfy_dependencies_for: Cannot satisfy the following dependencies for timestamp-service:
|  * 	systemd *
|  * opkg_install_cmd: Cannot install package timestamp-service.
| ERROR: Function failed: do_rootfs (see /home/rpjday/oe/builds/ti/arago/tmp-eglibc/work/am180x_evm-oe-linux-gnueabi/ti-hw-bringup-image/1.0-r0/temp/log.do_rootfs.2444 for further information)
ERROR: Task 7 (/home/rpjday/oe/dist/layers/meta-ti/recipes-misc/images/ti-hw-bringup-image.bb, do_rootfs) failed with exit code '1'
NOTE: Tasks Summary: Attempted 2679 tasks of which 2678 didn't need to be rerun and 1 failed.
No currently running tasks (2678 of 2680)

Summary: 1 task failed:
  /home/rpjday/oe/dist/layers/meta-ti/recipes-misc/images/ti-hw-bringup-image.bb, do_rootfs
Summary: There was 1 ERROR message shown, returning a non-zero exit code.
$

  has anyone actually built that HW bringup image?  and can explain
how to get around what happened above?  thanks.

rday

p.s.  here's the relevant part of my bblayers.conf file:

BBLAYERS ?= " \
  /home/rpjday/oe/dist/layers/oe-core/meta \
  /home/rpjday/oe/dist/layers/meta-ti \
  /home/rpjday/oe/dist/layers/meta-angstrom \
  /home/rpjday/oe/dist/layers/meta-openembedded/meta-systemd \
  /home/rpjday/oe/dist/layers/meta-openembedded/meta-oe \
  "


-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

