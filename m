Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 21FBCE00B7C
	for <meta-ti@yoctoproject.org>; Thu, 24 Apr 2014 10:49:05 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id DDD8252AB5; Thu, 24 Apr 2014 17:49:04 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20140424174904.DDD8252AB5@arago-project.org>
Date: Thu, 24 Apr 2014 17:49:04 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : am437x-evm: increase LEB count to fit full rootfs
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
X-List-Received-Date: Thu, 24 Apr 2014 17:49:05 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: dora
Commit: ceb91a69d1b647a8d35874f3ad2bc7c03063b92c
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=ceb91a69d1b647a8d35874f3ad2bc7c03063b92c

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Thu Apr 24 07:49:17 2014 +0000

am437x-evm: increase LEB count to fit full rootfs

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
Acked-by: Chase Maupin <chase.maupin@ti.com>

---

 conf/machine/am437x-evm.conf |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/conf/machine/am437x-evm.conf b/conf/machine/am437x-evm.conf
index 266f1fd..15e5f53 100644
--- a/conf/machine/am437x-evm.conf
+++ b/conf/machine/am437x-evm.conf
@@ -24,7 +24,7 @@ SERIAL_CONSOLE = "115200 ttyO0"
 # UBI: logical eraseblock size:    253952 bytes
 # from ubiattach stdout:
 # UBI device number 0, total 994 LEBs
-MKUBIFS_ARGS = "-F -m 4096 -e 253952 -c 994"
+MKUBIFS_ARGS = "-F -m 4096 -e 253952 -c 1918"
 
 # do ubiattach /dev/ubi_ctrl -m 11 -O 4096
 # from dmesg:


