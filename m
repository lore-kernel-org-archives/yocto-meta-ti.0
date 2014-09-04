Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 515B7E007C1; Thu,  4 Sep 2014 09:20:22 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EEE8DE0079E
	for <meta-ti@yoctoproject.org>; Thu,  4 Sep 2014 09:20:10 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 73BAD52A75; Thu,  4 Sep 2014 16:20:10 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20140904162010.73BAD52A75@arago-project.org>
Date: Thu,  4 Sep 2014 16:20:10 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : linux-ti-staging: merge audio/display changes, drop local SGX-related patches
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
X-List-Received-Date: Thu, 04 Sep 2014 16:20:22 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: a52b0f6c8a7bbc739657f232897045a58bc1b3c5
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=a52b0f6c8a7bbc739657f232897045a58bc1b3c5

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Thu Sep  4 21:40:50 2014 +0000

linux-ti-staging: merge audio/display changes, drop local SGX-related patches

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 ...HACK-drm-fb_helper-enable-panning-support.patch |   51 ----------
 ...lcdc-add-vsync-callback-for-use-in-omaplf.patch |   96 -------------------
 ...fix-the-ping-pong-dma-tearing-issue-seen-.patch |   97 --------------------
 recipes-kernel/linux/linux-ti-staging_3.14.bb      |   12 +--
 4 files changed, 2 insertions(+), 254 deletions(-)

Diff:   http://arago-project.org/git/meta-ti.git?a=commitdiff;h=a52b0f6c8a7bbc739657f232897045a58bc1b3c5

