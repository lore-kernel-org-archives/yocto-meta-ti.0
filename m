Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1207BE006F3; Wed,  2 Jul 2014 13:03:25 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,RDNS_DYNAMIC
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  1.0 RDNS_DYNAMIC Delivered to internal network by host with
	*      dynamic-looking rDNS
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B63D5E00342
	for <meta-ti@yoctoproject.org>; Wed,  2 Jul 2014 13:03:16 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 7E7F352A72; Wed,  2 Jul 2014 20:03:15 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20140702200315.7E7F352A72@arago-project.org>
Date: Wed,  2 Jul 2014 20:03:15 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Cody P Schafer : libgles-omap3: add already-stripped to INSANE_SKIP to fix build in poky
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
X-List-Received-Date: Wed, 02 Jul 2014 20:03:25 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: af07567111c7a9dc6bb63f19a3d7c9363b774752
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=af07567111c7a9dc6bb63f19a3d7c9363b774752

Author: Cody P Schafer <dev@codyps.com>
Date:   Fri Jun 27 05:48:05 2014 +0000

libgles-omap3: add already-stripped to INSANE_SKIP to fix build in poky

Signed-off-by: Cody P Schafer <dev@codyps.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-graphics/libgles/libgles-omap3-no-x.inc |   64 +++++++++---------
 recipes-graphics/libgles/libgles-omap3-x11.inc  |   44 +++++++-------
 recipes-graphics/libgles/libgles-omap3.inc      |   78 +++++++++++-----------
 3 files changed, 93 insertions(+), 93 deletions(-)

Diff:   http://arago-project.org/git/meta-ti.git?a=commitdiff;h=af07567111c7a9dc6bb63f19a3d7c9363b774752

