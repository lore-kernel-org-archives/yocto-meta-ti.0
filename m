Return-Path: <karthik.ramanan@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A603DE00786; Wed, 24 Sep 2014 04:46:55 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.152 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7603DE0034C
	for <meta-ti@yoctoproject.org>; Wed, 24 Sep 2014 04:46:52 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s8OBkpdp017976
	for <meta-ti@yoctoproject.org>; Wed, 24 Sep 2014 06:46:51 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s8OBkpbw002083
	for <meta-ti@yoctoproject.org>; Wed, 24 Sep 2014 06:46:51 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 24 Sep 2014 06:46:50 -0500
Received: from zubuntu.apr.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s8OBknnE018886;	Wed, 24 Sep 2014 06:46:49 -0500
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Wed, 24 Sep 2014 17:13:28 +0530
Message-ID: <1411559009-7951-1-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [for master] dspdce-fw: Updated dspdce-fw binaries
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
X-List-Received-Date: Wed, 24 Sep 2014 11:46:55 -0000
Content-Type: text/plain

Change summary:

1. Refactor the recipe to have inc file for common portions
2. Add the new firmware that is compatible with the latest IPC.
3. Incorporated review comments from previous patch set.
4. New binary contains minor bug fixes as well.

Karthik Ramanan (1):
  dspdce-fw: Updated dspdce firmware for latest IPC version

 recipes-bsp/dspdce-fw/dspdce-fw.inc           |   18 ++++++++++++++++++
 recipes-bsp/dspdce-fw/dspdce-fw_1.00.00.02.bb |   19 +++----------------
 recipes-bsp/dspdce-fw/dspdce-fw_1.00.00.04.bb |   11 +++++++++++
 3 files changed, 32 insertions(+), 16 deletions(-)
 create mode 100644 recipes-bsp/dspdce-fw/dspdce-fw.inc
 create mode 100644 recipes-bsp/dspdce-fw/dspdce-fw_1.00.00.04.bb

-- 
1.7.9.5


