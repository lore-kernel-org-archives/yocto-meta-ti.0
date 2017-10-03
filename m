Return-Path: <karthik.ramanan@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 28B6CE00D26; Tue,  3 Oct 2017 02:43:19 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.27.77 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A1796E00CB0
	for <meta-ti@yoctoproject.org>; Tue,  3 Oct 2017 02:43:18 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v939hH2i012709
	for <meta-ti@yoctoproject.org>; Tue, 3 Oct 2017 04:43:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1507023797;
	bh=PCkQ2TTRNOqv7xYEsa9F7xIr1FLR3FnVgfFErYYfcfw=;
	h=From:To:CC:Subject:Date;
	b=DWj+fp3AL29r2oojUxxtOGsTbORdru6nqx2vzlmNeDKL98nJva+8GxiyI7iRzgMMR
	AVDKbcRkEaUIjZpLof8pCN2ivQOSMKYZEd2NFU5/cp5zF4sI0jB/QSl4mus0Sa6j/+
	MXu9FtX7A1wNLPf9ItxjlVVxZ31GGlavhwIrGmf8=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v939hHQU032307
	for <meta-ti@yoctoproject.org>; Tue, 3 Oct 2017 04:43:17 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Tue, 3 Oct 2017 04:43:17 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE101.ent.ti.com
	(10.64.6.22) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Tue, 3 Oct 2017 04:43:17 -0500
Received: from swubn03.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v939hGXr004659;
	Tue, 3 Oct 2017 04:43:16 -0500
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 3 Oct 2017 15:13:14 +0530
Message-ID: <1507023794-83634-1-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [krogoth] ipumm-fw: Update new SRCREV on git repo
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
X-List-Received-Date: Tue, 03 Oct 2017 09:43:19 -0000
Content-Type: text/plain

The ipumm-fw repository had to undergo a forced commit update.
This was an unforeseen update and had to be done in urgency.
This recipe update takes care of fixing the new commit-id that
corresponds to the previous version that was being used.

There is no functional change.

Signed-off-by: Karthik Ramanan <a0393906@ti.com>
---
 recipes-bsp/ipumm-fw/ipumm-fw_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/ipumm-fw/ipumm-fw_git.bb b/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
index 1a5d285..1ec9896 100644
--- a/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
+++ b/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
@@ -17,12 +17,12 @@ RDEPENDS_${PN} = " libdce"
 
 SRC_URI = "git://git.ti.com/ivimm/ipumm.git;protocol=git"
 
-SRCREV = "fd441443a4289c801a0c8d9f00b6966f7fe3476c"
+SRCREV = "2aa80581cc7d1d82a1af9a46c37793b2fe8b9d42"
 
 S = "${WORKDIR}/git"
 
 PV = "3.00.13.00"
-PR = "r5"
+PR = "r6"
 
 require recipes-ti/includes/ti-paths.inc
 require recipes-ti/includes/ti-staging.inc
-- 
1.9.1


