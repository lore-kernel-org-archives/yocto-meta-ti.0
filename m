Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 43B91E00B23; Thu, 30 Jul 2015 08:26:20 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=5.0 tests=BAYES_00,RDNS_DYNAMIC,
	TO_NO_BRKTS_PCNT autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  1.0 RDNS_DYNAMIC Delivered to internal network by host with
	*      dynamic-looking rDNS
	*  2.2 TO_NO_BRKTS_PCNT To: misformatted + percentage
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 70890E00ABE
	for <meta-ti@yoctoproject.org>; Thu, 30 Jul 2015 08:26:12 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id B691F52A9F; Thu, 30 Jul 2015 15:26:11 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150730152611.B691F52A9F@arago-project.org>
Date: Thu, 30 Jul 2015 15:26:11 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : am33x-cm3: move into cm3-pm-firmware folder
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
X-List-Received-Date: Thu, 30 Jul 2015 15:26:20 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 5648801d02487560a577a7f1fd0eb3d185d5043e
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=5648801d02487560a577a7f1fd0eb3d185d5043e

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Wed Jul 29 23:11:26 2015 -0400

am33x-cm3: move into cm3-pm-firmware folder

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 .../am33x-cm3_git.bb                               |    0
 1 files changed, 0 insertions(+), 0 deletions(-)

diff --git a/recipes-bsp/am33x-cm3/am33x-cm3_git.bb b/recipes-bsp/cm3-pm-firmware/am33x-cm3_git.bb
similarity index 100%
rename from recipes-bsp/am33x-cm3/am33x-cm3_git.bb
rename to recipes-bsp/cm3-pm-firmware/am33x-cm3_git.bb


