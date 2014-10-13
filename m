Return-Path: <karthik.ramanan@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 544CBE0084E; Mon, 13 Oct 2014 08:17:58 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at http://www.dnswl.org/,
	high *      trust
	*      [192.94.94.41 listed in list.dnswl.org]
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1B81FE0076C
	for <meta-ti@yoctoproject.org>; Mon, 13 Oct 2014 08:17:48 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s9DFHlvf010553
	for <meta-ti@yoctoproject.org>; Mon, 13 Oct 2014 10:17:47 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s9DFHlSb005082
	for <meta-ti@yoctoproject.org>; Mon, 13 Oct 2014 10:17:47 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 13 Oct 2014 10:17:47 -0500
Received: from zubuntu.apr.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s9DFHknu018900;	Mon, 13 Oct 2014 10:17:46 -0500
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 13 Oct 2014 20:42:58 +0530
Message-ID: <1413213179-7250-1-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [master PATCH v2 0/1] Updating IPUMM recipes to the latest
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
X-List-Received-Date: Mon, 13 Oct 2014 15:17:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Here is the link to the latest IPUMM recipe on meta-ti : http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/tree/recipes-bsp/ipumm-fw/ipumm-fw_3.00.04.02.bb
Here is the link to the patchworks for version v1 of new recipe: http://dflvsu0004.dal.design.ti.com/patch/10880/

* The recipe today supports both dra7xx and omap5.
* But GLSDK has dropped the support for omap5, starting from the 6.10.00.01 release. 
* Am assuming that the ipumm-fw recipe should continue to provide atleast the last supported firmware binary for OMAP5 which is why the older OMAP5 firmware binary is still referenced in the recipe.
* The firmware binaries have always been different. So we had this earlier approach of having two different recipes and then we decided to have a single recipe supporting both.
Link to the older recipe approach: http://arago-project.org/git/projects/meta-ti-glsdk.git?p=projects/meta-ti-glsdk.git;a=tree;f=recipes-ti/ipumm-fw;h=bcba55d8ac71890c5e53cda25c1d2b2eebe675b7;hb=6b80942da01d63a46567f3fe7b50bb1e945de1ba

Things to do:

* Add am57xx as compatible machine at a later time.
* Discuss about the python function that checks for the MMIP being defined in the MACHINE_FEATURES. Doesn’t this make it a two level indirection to support ipumm-fw?
What is the reason for introducing this? I would like to understand this further.


Karthik Ramanan (1):
  ipumm-fw: Updated ipumm firmware for latest IPC version

 ...umm-fw_3.00.04.02.bb => ipumm-fw_3.00.06.00.bb} |   25 ++++++++++----------
 1 file changed, 12 insertions(+), 13 deletions(-)
 rename recipes-bsp/ipumm-fw/{ipumm-fw_3.00.04.02.bb => ipumm-fw_3.00.06.00.bb} (53%)

-- 
1.7.9.5


