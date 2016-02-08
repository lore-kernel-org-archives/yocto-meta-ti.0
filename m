Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1CE2AE00D95; Mon,  8 Feb 2016 09:31:00 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 395D8E00DA3
	for <meta-ti@yoctoproject.org>; Mon,  8 Feb 2016 09:30:57 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id E133552AC2; Mon,  8 Feb 2016 17:30:55 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160208173055.E133552AC2@arago-project.org>
Date: Mon,  8 Feb 2016 17:30:55 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : k2hk-evm: increase max_leb_cnt
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
X-List-Received-Date: Mon, 08 Feb 2016 17:31:00 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 9ec00aa9413602d9e4f6851d3a246560a46c2542
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=9ec00aa9413602d9e4f6851d3a246560a46c2542

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Mon Feb  8 00:03:26 2016 +0000

k2hk-evm: increase max_leb_cnt

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 conf/machine/k2hk-evm.conf |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/conf/machine/k2hk-evm.conf b/conf/machine/k2hk-evm.conf
index 0ef6ad0..3c09a7e 100644
--- a/conf/machine/k2hk-evm.conf
+++ b/conf/machine/k2hk-evm.conf
@@ -20,7 +20,7 @@ SYSVINIT_ENABLED_GETTYS = ""
 # UBI: logical eraseblock size:    126976 bytes
 # from ubiattach stdout:
 # UBI device number 0, total 3856 LEBs
-MKUBIFS_ARGS = "-F -m 2048 -e 126976 -c 3856"
+MKUBIFS_ARGS = "-F -m 2048 -e 126976 -c 3900"
 
 # do ubiattach /dev/ubi_ctrl -m 4
 # from dmesg:


