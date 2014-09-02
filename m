Return-Path: <pab@pabigot.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DD8A7E0078A; Mon,  1 Sep 2014 20:11:36 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [173.201.192.107 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from p3plsmtpa06-06.prod.phx3.secureserver.net
	(p3plsmtpa06-06.prod.phx3.secureserver.net [173.201.192.107])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9EAF4E0074B
	for <meta-ti@yoctoproject.org>; Mon,  1 Sep 2014 20:11:35 -0700 (PDT)
Received: from llc.pab ([66.41.60.82])
	by p3plsmtpa06-06.prod.phx3.secureserver.net with 
	id m3BZ1o00E1mTNtu013BZHY; Mon, 01 Sep 2014 20:11:34 -0700
From: "Peter A. Bigot" <pab@pabigot.com>
To: meta-ti@yoctoproject.org
Date: Mon,  1 Sep 2014 22:11:30 -0500
Message-Id: <1409627490-28337-1-git-send-email-pab@pabigot.com>
X-Mailer: git-send-email 1.8.5.5
In-Reply-To: <5405349A.4050207@pabigot.com>
References: <5405349A.4050207@pabigot.com>
Subject: [ti-uboot][PATCH] mmc: restore capacity when switching to partition 0
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
X-List-Received-Date: Tue, 02 Sep 2014 03:11:36 -0000

The capacity and lba for an MMC device with part_num 0 reflects the
whole device.  When mmc_switch_part() successfully switches to a
partition, the capacity is changed to that partition.  As partition 0
does not physically exist, attempts to switch back to the whole device
will indicate an error, but should still restore the capacity setting.

Signed-off-by: Peter A. Bigot <pab@pabigot.com>
---
 drivers/mmc/mmc.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/mmc/mmc.c b/drivers/mmc/mmc.c
index b5477b1..b05c6ee 100644
--- a/drivers/mmc/mmc.c
+++ b/drivers/mmc/mmc.c
@@ -596,10 +596,11 @@ int mmc_switch_part(int dev_num, unsigned int part_num)
 	ret = mmc_switch(mmc, EXT_CSD_CMD_SET_NORMAL, EXT_CSD_PART_CONF,
 			 (mmc->part_config & ~PART_ACCESS_MASK)
 			 | (part_num & PART_ACCESS_MASK));
-	if (ret)
-		return ret;
 
-	return mmc_set_capacity(mmc, part_num);
+	if ((0 == ret) || ((-ENODEV == ret) && (0 == part_num)))
+		ret = mmc_set_capacity(mmc, part_num);
+
+	return ret;
 }
 
 int mmc_getcd(struct mmc *mmc)
-- 
1.8.5.5


