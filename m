Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1991AE006B7; Thu, 31 Jul 2014 16:30:48 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E84F0E00572
	for <meta-ti@yoctoproject.org>; Thu, 31 Jul 2014 16:30:36 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 16EBA52A9F; Thu, 31 Jul 2014 23:30:36 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20140731233036.16EBA52A9F@arago-project.org>
Date: Thu, 31 Jul 2014 23:30:36 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : omap3-sgx-modules 5.01.01.01: add Darren' s patches to work with 3.14 kernel
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
X-List-Received-Date: Thu, 31 Jul 2014 23:30:48 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: daisy
Commit: e5eaf3bef458936b02ddfd649f474e07d1c79336
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=e5eaf3bef458936b02ddfd649f474e07d1c79336

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Fri Aug  1 03:33:46 2014 +0000

omap3-sgx-modules 5.01.01.01: add Darren's patches to work with 3.14 kernel

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 ...SDK-Make-5_01_01_01-work-against-3.14-LTS.patch |   52 +++++++
 ...x-use-platform-data-to-provide-reset-info.patch |  121 ++++++++++++++++
 ...class-am335x-am437x-fix-mutex-deadlock-wa.patch |  153 ++++++++++++++++++++
 ...-make-it-building-against-ti-linux-3.14.y.patch |   45 ++++++
 .../omap3-sgx-modules_5.01.01.01.bb                |    7 +-
 5 files changed, 377 insertions(+), 1 deletions(-)

Diff:   http://arago-project.org/git/meta-ti.git?a=commitdiff;h=e5eaf3bef458936b02ddfd649f474e07d1c79336

