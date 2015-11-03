Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A5C6CE00B4F; Tue,  3 Nov 2015 12:57:48 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 824F9E007E4
	for <meta-ti@yoctoproject.org>; Tue,  3 Nov 2015 12:57:44 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 91A4352A80; Tue,  3 Nov 2015 20:57:43 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20151103205743.91A4352A80@arago-project.org>
Date: Tue,  3 Nov 2015 20:57:43 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : linux-ti-staging: remove unused patches/configs
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
X-List-Received-Date: Tue, 03 Nov 2015 20:57:48 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: fido
Commit: c88689f3e4a54cdb9b90c15803874e0d079c7eb7
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=c88689f3e4a54cdb9b90c15803874e0d079c7eb7

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Sat Oct 31 04:35:52 2015 +0000

linux-ti-staging: remove unused patches/configs

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 ...cache-flush-management-symbols-when-MULTI.patch |   36 -----
 .../0006-ARM-dts-am33xx-add-DT-node-for-gpu.patch  |  150 --------------------
 .../0007-ARM-dts-am437x-add-DT-node-for-gpu.patch  |  102 -------------
 ...se-pdata-quirks-for-sgx-deassert_hardrese.patch |   96 -------------
 recipes-kernel/linux/linux-ti-staging-4.1/sgx.cfg  |    1 -
 5 files changed, 0 insertions(+), 385 deletions(-)

Diff:   http://arago-project.org/git/meta-ti.git?a=commitdiff;h=c88689f3e4a54cdb9b90c15803874e0d079c7eb7

