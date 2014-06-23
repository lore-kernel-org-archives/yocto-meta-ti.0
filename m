Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 03E73E00511; Mon, 23 Jun 2014 15:15:11 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=5.0 tests=RDNS_DYNAMIC, TO_NO_BRKTS_DYNIP
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.4 RDNS_DYNAMIC Delivered to internal network by host
	with *      dynamic-looking rDNS
	*  1.1 TO_NO_BRKTS_DYNIP To: misformatted and dynamic rDNS
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 988A6E003D2
	for <meta-ti@yoctoproject.org>; Mon, 23 Jun 2014 15:15:09 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 17E9F52974; Mon, 23 Jun 2014 22:15:08 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20140623221509.17E9F52974@arago-project.org>
Date: Mon, 23 Jun 2014 22:15:08 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : libgles-omap3, omap3-sgx-modules: remove old 4.8. x and 5.x versions
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
X-List-Received-Date: Mon, 23 Jun 2014 22:15:11 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 171d3312e50793281d99f06d4248478d5777aa7c
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=171d3312e50793281d99f06d4248478d5777aa7c

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Sat Jun 21 03:54:18 2014 +0000

libgles-omap3, omap3-sgx-modules: remove old 4.8.x and 5.x versions

Leave 4.9 as the last release providing softfp binaries and x11 support.
Leave 4.5 for now as being widely used on legacy omap3 devices.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 .../omap3-sgx-modules_4.08.00.01.bb                |   54 -------
 .../omap3-sgx-modules_4.08.00.02.bb                |   54 -------
 .../omap3-sgx-modules_5.00.00.01.bb                |   67 ---------
 .../omap3-sgx-modules_5.01.00.01.bb                |   67 ---------
 .../libgles/libgles-omap3-4.08.00.01/rc.pvr        |  124 -----------------
 .../libgles/libgles-omap3-4.08.00.01/rc_dri.pvr    |  136 ------------------
 .../libgles/libgles-omap3-4.08.00.02/rc.pvr        |  124 -----------------
 .../libgles/libgles-omap3-4.08.00.02/rc_dri.pvr    |  136 ------------------
 .../libgles/libgles-omap3-5.00.00.01/rc.pvr        |  134 ------------------
 .../libgles/libgles-omap3-5.00.00.01/rc_dri.pvr    |  145 --------------------
 .../libgles/libgles-omap3-5.01.00.01/rc.pvr        |  134 ------------------
 .../libgles/libgles-omap3-5.01.00.01/rc_dri.pvr    |  145 --------------------
 .../libgles/libgles-omap3_4.08.00.01.bb            |   74 ----------
 .../libgles/libgles-omap3_4.08.00.02.bb            |   74 ----------
 .../libgles/libgles-omap3_5.00.00.01.bb            |   50 -------
 .../libgles/libgles-omap3_5.01.00.01.bb            |   50 -------
 16 files changed, 0 insertions(+), 1568 deletions(-)

Diff:   http://arago-project.org/git/meta-ti.git?a=commitdiff;h=171d3312e50793281d99f06d4248478d5777aa7c

