Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B9735E0095F; Mon,  2 Feb 2015 12:39:05 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EAAC5E008FB
	for <meta-ti@yoctoproject.org>; Mon,  2 Feb 2015 12:39:02 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id A6C9252ABB; Mon,  2 Feb 2015 20:38:56 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150202203856.A6C9252ABB@arago-project.org>
Date: Mon,  2 Feb 2015 20:38:56 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Franklin S. Cooper Jr : Graphics SDK: Add 05.01.01.02
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
X-List-Received-Date: Mon, 02 Feb 2015 20:39:05 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: daisy
Commit: 2e39f3ee3eacda552e7b4874dd45d070b46cab2c
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=2e39f3ee3eacda552e7b4874dd45d070b46cab2c

Author: Franklin S. Cooper Jr <fcooper@ti.com>
Date:   Sat Jan 31 04:45:02 2015 +0000

Graphics SDK: Add 05.01.01.02

* This graphics sdk is a minor update to the 05.01.01.01 version but includes
  updates to support the 3.14 kernel.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 .../omap3-sgx-modules_5.01.01.02.bb                |   68 +++++++++
 .../libgles/libgles-omap3-5.01.01.02/rc.pvr        |  134 ++++++++++++++++++
 .../libgles/libgles-omap3-5.01.01.02/rc_dri.pvr    |  145 ++++++++++++++++++++
 .../libgles/libgles-omap3_5.01.01.02.bb            |   50 +++++++
 4 files changed, 397 insertions(+), 0 deletions(-)

Diff:   http://arago-project.org/git/meta-ti.git?a=commitdiff;h=2e39f3ee3eacda552e7b4874dd45d070b46cab2c

