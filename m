Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 37212E00A7F; Mon, 20 Jun 2016 13:57:01 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2470BE009F4
	for <meta-ti@yoctoproject.org>; Mon, 20 Jun 2016 13:56:55 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 7412652AA6; Mon, 20 Jun 2016 20:56:53 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160620205653.7412652AA6@arago-project.org>
Date: Mon, 20 Jun 2016 20:56:53 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : linux-ti-staging: update to 4.4.13, use new defconfig builder
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
X-List-Received-Date: Mon, 20 Jun 2016 20:57:01 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: krogoth
Commit: f71f4fd821696bd9e16df932d7d22a1819799d87
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=f71f4fd821696bd9e16df932d7d22a1819799d87

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Tue Jun 21 02:05:09 2016 +0000

linux-ti-staging: update to 4.4.13, use new defconfig builder

Convert to using tisdk configs from defconfig_map processed by defconfig_builder.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 .../linux/linux-ti-staging-4.4/defconfig           |    2 +-
 .../linux/linux-ti-staging-4.4/dra7xx/defconfig    |    1 +
 .../linux/linux-ti-staging-4.4/k2g-evm/defconfig   |    1 +
 .../linux/linux-ti-staging-4.4/keystone/defconfig  |    2 +-
 .../linux/linux-ti-staging-4.4/ti33x/defconfig     |    1 +
 .../linux/linux-ti-staging-4.4/ti43x/defconfig     |    1 +
 .../linux/linux-ti-staging-rt-4.4/defconfig        |    2 +-
 .../linux/linux-ti-staging-rt-4.4/dra7xx/defconfig |    1 +
 .../linux-ti-staging-rt-4.4/k2g-evm/defconfig      |    1 +
 .../linux-ti-staging-rt-4.4/keystone/defconfig     |    2 +-
 .../linux/linux-ti-staging-rt-4.4/ti33x/defconfig  |    1 +
 .../linux/linux-ti-staging-rt-4.4/ti43x/defconfig  |    1 +
 recipes-kernel/linux/linux-ti-staging-rt_4.4.bb    |    2 +-
 .../linux/linux-ti-staging-systest-4.4/defconfig   |    2 +-
 .../linux-ti-staging-systest-4.4/dra7xx/defconfig  |    1 +
 .../linux-ti-staging-systest-4.4/k2g-evm/defconfig |    1 +
 .../keystone/defconfig                             |    2 +-
 .../linux-ti-staging-systest-4.4/ti33x/defconfig   |    1 +
 .../linux-ti-staging-systest-4.4/ti43x/defconfig   |    1 +
 recipes-kernel/linux/linux-ti-staging_4.4.bb       |   15 +----
 recipes-kernel/linux/setup-defconfig.inc           |   66 +++++++++++---------
 21 files changed, 58 insertions(+), 49 deletions(-)

Diff:   http://arago-project.org/git/meta-ti.git?a=commitdiff;h=f71f4fd821696bd9e16df932d7d22a1819799d87

