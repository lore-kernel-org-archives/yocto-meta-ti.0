Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A9FA4E00CE2; Mon, 28 Jan 2019 11:49:56 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at http://www.dnswl.org/,
	*      medium trust
	*      [198.47.19.142 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 29E3FE00CDF
	for <meta-ti@yoctoproject.org>; Mon, 28 Jan 2019 11:49:55 -0800 (PST)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x0SJntQn003312
	for <meta-ti@yoctoproject.org>; Mon, 28 Jan 2019 13:49:55 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1548704995;
	bh=hjZuIcHddzgWweg3pyVm9mpPz6rxBTfh6K61ET/8Dbg=;
	h=From:To:CC:Subject:Date;
	b=bStbtNzFLvRHMLL21FB3bcPTT7Hrg6uwrgM7trLl3NBX27984ziTR1MwXszMzGO93
	9kXle2/xMgLiQLVZrY5NmGiEP2nfJCt95gmLtJ7vWteEUrkpur6I/7vM9H9hJfofMc
	mdS3pLd4d9TzvJHFZ187sxXFqYyUD8OoP+FTTPeQ=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x0SJntCH048866
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Mon, 28 Jan 2019 13:49:55 -0600
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE110.ent.ti.com
	(157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Mon, 28 Jan 2019 13:49:55 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Mon, 28 Jan 2019 13:49:55 -0600
Received: from puget.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id x0SJns7Y028421;
	Mon, 28 Jan 2019 13:49:55 -0600
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 28 Jan 2019 19:42:10 +0000
Message-ID: <20190128194210.26263-1-denys@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master][PATCH] multiprocmgr: install both mpmsrv sysvinit initscript and systemd unit file
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
X-List-Received-Date: Mon, 28 Jan 2019 19:49:56 -0000
Content-Type: text/plain

Since both systemd and update-rc.d classes are inherited, not having a
corresponding file results in postinst function to fail, which is a hard
error now. Having both init files installed does not affect functionality.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-ti/multiprocmgr/multiprocmgr_git.bb | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/recipes-ti/multiprocmgr/multiprocmgr_git.bb b/recipes-ti/multiprocmgr/multiprocmgr_git.bb
index f37b97e3..6143341d 100644
--- a/recipes-ti/multiprocmgr/multiprocmgr_git.bb
+++ b/recipes-ti/multiprocmgr/multiprocmgr_git.bb
@@ -28,15 +28,11 @@ do_install() {
 	install -c -m 755 ${S}/bin/mpmsrv ${D}${bindir}/mpmsrv
 	install -c -m 755 ${S}/bin/mpmcl ${D}${bindir}/mpmcl
 
-	systemd_enabled=${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '1', '0', d)}
-	if [ ${systemd_enabled} -eq 1 ]
-	then
-		install -d ${D}${systemd_system_unitdir}
-		install -m 0644 ${WORKDIR}/mpmsrv-daemon.service ${D}${systemd_system_unitdir}
-	else
-		install -d ${D}${sysconfdir}/init.d/
-		install -c -m 755 ${S}/scripts/mpmsrv-daemon.sh ${D}${sysconfdir}/init.d/${INITSCRIPT_NAME}
-	fi
+	install -d ${D}${systemd_system_unitdir}
+	install -m 0644 ${WORKDIR}/mpmsrv-daemon.service ${D}${systemd_system_unitdir}
+	install -d ${D}${sysconfdir}/init.d/
+	install -c -m 755 ${S}/scripts/mpmsrv-daemon.sh ${D}${sysconfdir}/init.d/${INITSCRIPT_NAME}
+
 	install -d ${D}${sysconfdir}/mpm/
 	install -c -m 755 ${S}/scripts/crash_callback.sh ${D}${sysconfdir}/mpm/crash_callback.sh
 
-- 
2.17.1


