Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 43ACFE009A1; Fri, 10 Apr 2015 15:17:41 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.153 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0C4B5E00961
	for <meta-ti@yoctoproject.org>; Fri, 10 Apr 2015 15:17:38 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t3AMHbe5003114;
	Fri, 10 Apr 2015 17:17:37 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t3AMHa0c026374;
	Fri, 10 Apr 2015 17:17:36 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 10 Apr 2015 17:17:35 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t3AMHZ22000723;
	Fri, 10 Apr 2015 17:17:35 -0500
Date: Fri, 10 Apr 2015 18:17:35 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Gary Thomas <gary@mlbassoc.com>
Message-ID: <20150410221735.GD9147@edge>
References: <1428702884-23501-1-git-send-email-sam.nelson@ti.com>
	<20150410220458.GC9147@edge> <552849DC.1000406@mlbassoc.com>
MIME-Version: 1.0
In-Reply-To: <552849DC.1000406@mlbassoc.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] mmap-lld: Update to new version 2.0.0.4
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
X-List-Received-Date: Fri, 10 Apr 2015 22:17:41 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Apr 10, 2015 at 04:08:28PM -0600, Gary Thomas wrote:
> On 2015-04-10 16:04, Denys Dmytriyenko wrote:
> >On Fri, Apr 10, 2015 at 05:54:44PM -0400, Sam Nelson wrote:
> >>Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> >>---
> >>  recipes-bsp/mmap-lld/mmap-lld.inc |    8 ++++----
> >>  1 file changed, 4 insertions(+), 4 deletions(-)
> >>
> >>diff --git a/recipes-bsp/mmap-lld/mmap-lld.inc b/recipes-bsp/mmap-lld/mmap-lld.inc
> >>index b8a5b32..7c19ee8 100644
> >>--- a/recipes-bsp/mmap-lld/mmap-lld.inc
> >>+++ b/recipes-bsp/mmap-lld/mmap-lld.inc
> >>@@ -7,10 +7,10 @@ LIC_FILES_CHKSUM = "file://COPYING.txt;md5=b3315b8190036fe1c6a8263d02e15606"
> >>
> >>  BRANCH="master"
> >>  SRC_URI = "git://git.ti.com/keystone-rtos/mmap-lld.git;destsuffix=git/ti/runtime/mmap;protocol=git;branch=${BRANCH}"
> >>-# Commit correspond to DEV.MMAP.02.00.00.03
> >>-SRCREV = "601f9284c392f67bb7f69ed1a5df5231a43c3137"
> >>+# Commit correspond to DEV.MMAP.02.00.00.04
> >>+SRCREV = "306895eb2d5decd14a760e70d273946958ff716f"
> >>
> >>-PV="2.0.0"
> >>-PR = "r0"
> >>+PV = "2.0.0.4"
> >>+PR = "r1"
> >>
> >>  S = "${WORKDIR}/git/ti/runtime/mmap"
> >>\ No newline at end of file
> >
> >^^^ This is usually not a good sign.
> 
> Also current practice is to not change PR values, but let
> the PR Service handle that.

Not in the code base that this goes to... Moreover, it's not as simple and 
requires careful considerations and setup on the distro side to ensure proper 
upgrade path, etc. In this particular case above, the PR shouldn't have been 
changed at all, but in general, it's just safer to bump PR for some of the 
old releases this goes to.

-- 
Denys

