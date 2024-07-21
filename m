Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1908C3DA61
	for <webhook@archiver.kernel.org>; Sun, 21 Jul 2024 15:35:31 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.26797.1721576127564363561
 for <meta-ti@lists.yoctoproject.org>;
 Sun, 21 Jul 2024 08:35:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=JPXzkH7C;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 46LFZPOh009828;
	Sun, 21 Jul 2024 10:35:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1721576125;
	bh=ziRNvc3x7bl9QKZU1uBjCF96PTuoc+/Yz9N55O9++ok=;
	h=From:To:Subject:Date;
	b=JPXzkH7CpykvjhDDEAdRlRnhtdKclJyrSKHe0Q87HlR1wWRi5Sb6grRid7DE4r/+C
	 vU6Ie03oSYdTyqOd8ySdvqs2tGGtBN2eVgrxWTbouucFOcr+K6MfWF3riytYKDSCQF
	 0t/+OSMu3FAcGsrSSEs3ahoIKTF48xYJN0mn+qAA=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 46LFZPia023276
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 21 Jul 2024 10:35:25 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sun, 21
 Jul 2024 10:35:24 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sun, 21 Jul 2024 10:35:24 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 46LFZONq084821;
	Sun, 21 Jul 2024 10:35:24 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1sVYaq-0000or-OT; Sun, 21 Jul 2024 10:35:24 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] gdbc6x: Fix "buildpaths" QA error
Date: Sun, 21 Jul 2024 10:35:24 -0500
Message-ID: <20240721153524.3103-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Sun, 21 Jul 2024 15:35:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17902

The final binary contains paths on the host system.  Replace the string
we want to remove with an equally sized replacement string that does
not contain the path.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-ti-extras/recipes-devtools/gdbc6x/gdbc6x_git.bb | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta-ti-extras/recipes-devtools/gdbc6x/gdbc6x_git.bb b/meta-ti-extras/recipes-devtools/gdbc6x/gdbc6x_git.bb
index 1f296dc5..6a497e0f 100644
--- a/meta-ti-extras/recipes-devtools/gdbc6x/gdbc6x_git.bb
+++ b/meta-ti-extras/recipes-devtools/gdbc6x/gdbc6x_git.bb
@@ -3,7 +3,7 @@ SECTION = "devel"
 LICENSE = "GPL-3.0-or-later"
 LIC_FILES_CHKSUM = "file://debian/copyright;md5=bf0fe2872eb3dfeebb2cbe38206fe81f"
 
-DEPENDS = "ncurses bison-native texinfo flex-native gettext"
+DEPENDS = "ncurses bison-native texinfo flex-native gettext perl-native"
 
 COMPATIBLE_MACHINE = "dra7xx"
 
@@ -21,6 +21,10 @@ inherit gettext
 
 CFLAGS += "-fcommon -fpermissive"
 
+# Variables to assist in searching/replacing the WORKDIR in binary files.
+TMPDIR_FIX_SEARCH = "${WORKDIR}"
+TMPDIR_FIX_REPLACE = "${@'_'*(len(d.getVar('WORKDIR'))-7)+"workdir"}"
+
 do_configure () {
     cd ${S}
     ./configure --program-suffix=c6x --target=tic6x-elf-tirtos --host=${HOST_SYS} --prefix=${S}/install_gdb
@@ -33,6 +37,9 @@ do_install () {
     install -d ${D}${bindir}
     install -d ${D}${includedir}
     install -m 755  ${S}/install_gdb/bin/gdbc6x ${D}${bindir} 
+
+    perl -pi -e 's#${TMPDIR_FIX_SEARCH}#${TMPDIR_FIX_REPLACE}#g' ${D}${bindir}/gdbc6x
+
     cp -rf ${S}/install_gdb/include/* ${D}${includedir}
 
     install -d ${D}${sysconfdir}/init.d
-- 
2.17.1


