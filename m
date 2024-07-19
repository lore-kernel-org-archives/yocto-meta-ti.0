Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AB07C3DA5D
	for <webhook@archiver.kernel.org>; Fri, 19 Jul 2024 23:16:43 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.1754.1721430998585794886
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 19 Jul 2024 16:16:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=wuXu0IAI;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 46JNGXPQ018930;
	Fri, 19 Jul 2024 18:16:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1721430993;
	bh=lt5SQlHdQzjB+ybo7xB361KMbGnxAs3WVaT0yN+uPZc=;
	h=From:To:Subject:Date;
	b=wuXu0IAIAqgYQJhacsaMb6gEfom0Rkn1Ogu17ZuPNL8mgKYKJzfdvqPt1FoSD4oju
	 Ntg7FM3Mlr4X4oNU+TvljWTXdYw1VU358PNmB/0dRMoVCvDBBZRcdo0Z9Riyc9Qobn
	 Q0F9yk2MSoEKWR97iqjg+Teo0NM8d0VykCrpeOAY=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 46JNGXPK127314
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 19 Jul 2024 18:16:33 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 19
 Jul 2024 18:16:33 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 19 Jul 2024 18:16:33 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 46JNGX3q037457;
	Fri, 19 Jul 2024 18:16:33 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1sUwq1-00016U-9R; Fri, 19 Jul 2024 18:16:33 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] ti-ipc-rtos: Fix "buildpaths" QA error
Date: Fri, 19 Jul 2024 18:16:33 -0500
Message-ID: <20240719231633.4202-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 19 Jul 2024 23:16:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17897

The older TI compilers do not have a mechanism for replacing paths in
the obj files they create.  So replace the string we want to remove with
an equally sized replacement string that does not contain the path.

Additionally, fix the generated documentation to not contain the paths
as well.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-ti-extras/recipes-ti/ipc/ti-ipc-rtos_git.bb | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/meta-ti-extras/recipes-ti/ipc/ti-ipc-rtos_git.bb b/meta-ti-extras/recipes-ti/ipc/ti-ipc-rtos_git.bb
index 999993ea..00039213 100644
--- a/meta-ti-extras/recipes-ti/ipc/ti-ipc-rtos_git.bb
+++ b/meta-ti-extras/recipes-ti/ipc/ti-ipc-rtos_git.bb
@@ -2,7 +2,7 @@ require recipes-ti/ipc/ti-ipc.inc
 require recipes-ti/ipc/ti-ipc-common.inc
 require ti-ipc-rtos.inc
 
-DEPENDS = "ti-xdctools-native ti-sysbios doxygen-native zip-native"
+DEPENDS = "ti-xdctools-native ti-sysbios doxygen-native zip-native perl-native"
 
 PACKAGES =+ "${PN}-fw"
 FILES:${PN}-fw = "${nonarch_base_libdir}/firmware/*"
@@ -61,6 +61,10 @@ do_compile() {
   fi
 }
 
+# Variables to assist in searching/replacing the WORKDIR in binary files.
+TMPDIR_FIX_SEARCH = "${WORKDIR}"
+TMPDIR_FIX_REPLACE = "${@'_'*(len(d.getVar('WORKDIR'))-7)+"workdir"}"
+
 do_install() {
   CP_ARGS="-Prf --preserve=mode,timestamps --no-preserve=ownership"
   IPC_VERSION=`echo ${PV}${RELEASE_SUFFIX} | sed -e 's|\.|_|g'`
@@ -68,8 +72,14 @@ do_install() {
   install -d ${D}${IPC_INSTALL_DIR_RECIPE}
   cp ${CP_ARGS} ${IPC_PACKAGE_DIR}/* -d ${D}${IPC_INSTALL_DIR_RECIPE}
 
+  # Update doxygen generated documentation to remove build host paths
+  find ${D}${IPC_INSTALL_DIR_RECIPE} -type f -exec sed -i -e "s,${WORKDIR},,g" {} \;
+
   install -d ${D}${nonarch_base_libdir}/firmware/ipc
   cp ${CP_ARGS} ${S}/packages/ti/ipc/tests/bin/* ${D}${nonarch_base_libdir}/firmware/ipc || true
+
+  # Update compiled files to remove build host paths
+  find ${D}${nonarch_base_libdir}/firmware/ipc -type f -exec perl -pi -e 's#${TMPDIR_FIX_SEARCH}#${TMPDIR_FIX_REPLACE}#g' {} \;
 }
 
 KFDSPNUM = "0"
-- 
2.17.1


