Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2E46BE006F1; Thu, 31 Jul 2014 16:30:50 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E4A15E004E0
	for <meta-ti@yoctoproject.org>; Thu, 31 Jul 2014 16:30:33 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id E01A252A8C; Thu, 31 Jul 2014 23:30:32 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20140731233032.E01A252A8C@arago-project.org>
Date: Thu, 31 Jul 2014 23:30:32 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : linux-ti-staging: add Darren' s SGX patches to make graphics work with 3.14
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
X-List-Received-Date: Thu, 31 Jul 2014 23:30:50 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: fb9ad0c920f5a4a1cae624f468df77c3dc1ccf2e
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=fb9ad0c920f5a4a1cae624f468df77c3dc1ccf2e

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Wed Jul 30 07:35:12 2014 +0000

linux-ti-staging: add Darren's SGX patches to make graphics work with 3.14

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
Acked-by: Franklin Cooper Jr. <fcooper@ti.com>

---

 recipes-kernel/linux/linux-ti-staging-3.14/sgx.cfg |   24 +++++
 ...HACK-drm-fb_helper-enable-panning-support.patch |   51 ++++++++++
 ...lcdc-add-vsync-callback-for-use-in-omaplf.patch |   96 +++++++++++++++++++
 ...fix-the-ping-pong-dma-tearing-issue-seen-.patch |   97 ++++++++++++++++++++
 ...se-pdata-quirks-for-sgx-deassert_hardrese.patch |   86 +++++++++++++++++
 .../sgx/0005-ARM-dts-am437x-add-SGX-node.patch     |   41 ++++++++
 .../0006-ARM-dts-am33xx-add-DT-node-for-gpu.patch  |   42 +++++++++
 recipes-kernel/linux/linux-ti-staging_3.14.bb      |   20 +++-
 8 files changed, 452 insertions(+), 5 deletions(-)

Diff:   http://arago-project.org/git/meta-ti.git?a=commitdiff;h=fb9ad0c920f5a4a1cae624f468df77c3dc1ccf2e

