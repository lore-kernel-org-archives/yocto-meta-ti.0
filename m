Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4268C3DA61
	for <webhook@archiver.kernel.org>; Sun, 21 Jul 2024 15:44:31 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.26935.1721576668401893740
 for <meta-ti@lists.yoctoproject.org>;
 Sun, 21 Jul 2024 08:44:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Ok6Fb/zf;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 46LFiRa4013620;
	Sun, 21 Jul 2024 10:44:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1721576667;
	bh=kvxImJ0mhqZLpUozP4LkvBTOxMP7UMOuThjkcxeDkkI=;
	h=From:To:Subject:Date;
	b=Ok6Fb/zfyZcxSAO2cKJNngiIUXxpdF88cjEzXjKOErAZTL6p57xC/Hzoqt6QDGA3C
	 2Z2QmdlQdsBVMVol0tlmBWR04IiNMbXigjkaLDdlKKGYhCi0PctXBjd5+aycPFxqJV
	 llApfR9ZNe8C6gYRfcM3p2QHLiz/Z9jgPNgdykBQ=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 46LFiRfD026914
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 21 Jul 2024 10:44:27 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sun, 21
 Jul 2024 10:44:26 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sun, 21 Jul 2024 10:44:26 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 46LFiQ7t095175;
	Sun, 21 Jul 2024 10:44:26 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1sVYja-0003Bm-Na; Sun, 21 Jul 2024 10:44:26 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] gdbserver-c6x: Fix "buildpaths" QA error
Date: Sun, 21 Jul 2024 10:44:26 -0500
Message-ID: <20240721154426.12219-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Sun, 21 Jul 2024 15:44:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17903

The older TI compilers do not have a mechanism for replacing paths in
the obj files they create.  So replace the string we want to remove with
an equally sized replacement string that does not contain the path.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../recipes-devtools/gdbc6x/gdbserver-c6x_git.bb         | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta-ti-extras/recipes-devtools/gdbc6x/gdbserver-c6x_git.bb b/meta-ti-extras/recipes-devtools/gdbc6x/gdbserver-c6x_git.bb
index 3460eadb..0a31c67d 100644
--- a/meta-ti-extras/recipes-devtools/gdbc6x/gdbserver-c6x_git.bb
+++ b/meta-ti-extras/recipes-devtools/gdbc6x/gdbserver-c6x_git.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "TI gdb-server to be used with c6xgdb."
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://../debian/copyright;md5=82c616b6c8f9c11c46feaaf8f9a11495"
 
-DEPENDS = "ti-xdais ti-framework-components ti-cgt6x-native ti-sysbios ti-xdctools-native"
+DEPENDS = "ti-xdais ti-framework-components ti-cgt6x-native ti-sysbios ti-xdctools-native perl-native"
 
 PR = "${INC_PR}.0"
 
@@ -26,11 +26,18 @@ do_configure() {
     :
 }
 
+# Variables to assist in searching/replacing the WORKDIR in binary files.
+TMPDIR_FIX_SEARCH = "${WORKDIR}"
+TMPDIR_FIX_REPLACE = "${@'_'*(len(d.getVar('WORKDIR'))-7)+"workdir"}"
+
 do_install() {
     install -d ${D}${datadir}/ti/gdbc6x/include
     install -d ${D}${datadir}/ti/gdbc6x/lib
     cp -f ../include/* ${D}${datadir}/ti/gdbc6x/include
     cp -f ../lib/* ${D}${datadir}/ti/gdbc6x/lib
+
+    # Update compiled files to remove build host paths
+    find ${D}${datadir}/ti/gdbc6x/lib -type f -exec perl -pi -e 's#${TMPDIR_FIX_SEARCH}#${TMPDIR_FIX_REPLACE}#g' {} \;
 }
 
 COMPATIBLE_MACHINE = "dra7xx"
-- 
2.17.1


