Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A086FE00715
	for <meta-ti@yoctoproject.org>; Tue,  3 Sep 2013 09:42:25 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r83GgOrk018086;
	Tue, 3 Sep 2013 11:42:24 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r83GgOAd018070;
	Tue, 3 Sep 2013 11:42:24 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 3 Sep 2013 11:42:24 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id r83GgOL4028202;
	Tue, 3 Sep 2013 11:42:24 -0500
Date: Tue, 3 Sep 2013 12:42:23 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>
Message-ID: <20130903164223.GB22235@edge>
References: <1378005180-30928-1-git-send-email-denis@denix.org>
	<1378005180-30928-4-git-send-email-denis@denix.org>
	<7D46E86EC0A8354091174257B2FED101597012D4@DLEE11.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <7D46E86EC0A8354091174257B2FED101597012D4@DLEE11.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH 4/5] libgles-omap3: introduce INC_PR
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
X-List-Received-Date: Tue, 03 Sep 2013 16:42:29 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Sep 03, 2013 at 03:20:49PM +0000, Maupin, Chase wrote:
> General question is that I thought INC_PR was frowned on.

PRSERV is suggested as an alternative, but so far PR has not been removed 
completely and it would be nice to have a consistency.


> Aside from that 
> 
> Acked-by: Chase Maupin <chase.maupin@ti.com>
> 
> 
> 
> >-----Original Message-----
> >From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
> >bounces@yoctoproject.org] On Behalf Of Denys Dmytriyenko
> >Sent: Saturday, August 31, 2013 10:13 PM
> >To: meta-ti@yoctoproject.org
> >Subject: [meta-ti] [PATCH 4/5] libgles-omap3: introduce INC_PR
> >
> >From: Denys Dmytriyenko <denys@ti.com>
> >
> >Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> >---
> > recipes-graphics/libgles/libgles-omap3-no-x.inc          | 2 +-
> > recipes-graphics/libgles/libgles-omap3-x11.inc           | 2 +-
> > recipes-graphics/libgles/libgles-omap3-x11_4.09.00.01.bb | 2 ++
> > recipes-graphics/libgles/libgles-omap3_4.09.00.01.bb     | 2 ++
> > 4 files changed, 6 insertions(+), 2 deletions(-)
> >
> >diff --git a/recipes-graphics/libgles/libgles-omap3-no-x.inc
> >b/recipes-graphics/libgles/libgles-omap3-no-x.inc
> >index 727c422..83873d7 100644
> >--- a/recipes-graphics/libgles/libgles-omap3-no-x.inc
> >+++ b/recipes-graphics/libgles/libgles-omap3-no-x.inc
> >@@ -3,7 +3,7 @@ LICENSE = "proprietary-binary"
> > # 'TSPA.txt' might not be the best file to md5sum
> > LIC_FILES_CHKSUM =
> >"file://TSPA.txt;md5=c0d5d9c1e38b41677144c4e24d6ddee1"
> >
> >-PR = "r36"
> >+INC_PR = "r37"
> >
> > EXCLUDE_FROM_WORLD = "1"
> >
> >diff --git a/recipes-graphics/libgles/libgles-omap3-x11.inc
> >b/recipes-graphics/libgles/libgles-omap3-x11.inc
> >index abe6e6f..106a9bc 100644
> >--- a/recipes-graphics/libgles/libgles-omap3-x11.inc
> >+++ b/recipes-graphics/libgles/libgles-omap3-x11.inc
> >@@ -3,7 +3,7 @@ LICENSE = "proprietary-binary"
> > # 'TSPA.txt' might not be the best file to md5sum
> > LIC_FILES_CHKSUM =
> >"file://TSPA.txt;md5=c0d5d9c1e38b41677144c4e24d6ddee1"
> >
> >-PR = "r36"
> >+INC_PR = "r37"
> >
> > EXCLUDE_FROM_WORLD = "1"
> >
> >diff --git a/recipes-graphics/libgles/libgles-omap3-
> >x11_4.09.00.01.bb b/recipes-graphics/libgles/libgles-omap3-
> >x11_4.09.00.01.bb
> >index b7e6ce0..6b9c561 100644
> >--- a/recipes-graphics/libgles/libgles-omap3-x11_4.09.00.01.bb
> >+++ b/recipes-graphics/libgles/libgles-omap3-x11_4.09.00.01.bb
> >@@ -2,6 +2,8 @@ require libgles-omap3-x11.inc
> >
> > LICENSE = "TSPA"
> >
> >+PR = "${INC_PR}.0"
> >+
> > DEFAULT_PREFERENCE = "-1"
> >
> > BINLOCATION_omap3  = "${S}/gfx_rel_es3.x"
> >diff --git a/recipes-graphics/libgles/libgles-omap3_4.09.00.01.bb
> >b/recipes-graphics/libgles/libgles-omap3_4.09.00.01.bb
> >index b68b4c3..a4da2f9 100644
> >--- a/recipes-graphics/libgles/libgles-omap3_4.09.00.01.bb
> >+++ b/recipes-graphics/libgles/libgles-omap3_4.09.00.01.bb
> >@@ -2,6 +2,8 @@ require libgles-omap3-no-x.inc
> >
> > LICENSE = "TSPA"
> >
> >+PR = "${INC_PR}.0"
> >+
> > DEFAULT_PREFERENCE = "-1"
> >
> > BINLOCATION_omap3  = "${S}/gfx_rel_es3.x"
> >--
> >1.8.3.2
> >
> >_______________________________________________
> >meta-ti mailing list
> >meta-ti@yoctoproject.org
> >https://lists.yoctoproject.org/listinfo/meta-ti
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

