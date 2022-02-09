Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web08.29345.1644425818355911755
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 09 Feb 2022 08:56:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=TQJZUeV7;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 219Gutkx011252;
	Wed, 9 Feb 2022 10:56:55 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1644425815;
	bh=Ej8Qd51JkLLCRtu6hs61yEFNTUmrZFB6GzGRpPlcen0=;
	h=From:To:Subject:Date;
	b=TQJZUeV7Zu4sJqJATWvUC79RM/hJ3TNLp/3qxW9QGbWaG2ZU4wWqjVXFKGRq3bLn7
	 1f+fvinR/4ZDKR/DEzvptZ/2GDSmfUZmb7MXlteeLJ5P53W1n1IcCrIQVDBOosh70x
	 gKQ6xy3v1jFTmPT2JAhy+VKqwl05SiSXFp6nCX+4=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 219GutBF038008
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 9 Feb 2022 10:56:55 -0600
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 9
 Feb 2022 10:56:55 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 9 Feb 2022 10:56:55 -0600
Received: from uda0214219 (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 219GutoS095128;
	Wed, 9 Feb 2022 10:56:55 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1nHqH1-0005IE-Em; Wed, 09 Feb 2022 10:56:55 -0600
From: "Ryan Eatmon" <reatmon@ti.com>
To: Yogesh Siraswar <yogeshs@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell][PATCH v2] cnm-wave-fw: Split firmware name into target and source
Date: Wed, 9 Feb 2022 10:56:55 -0600
Message-ID: <20220209165655.20307-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

We need to control both the source name of the firmware and
the target name, so split the current variable into two and
update the install command.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
v2: Fix the commit message to include cnm-wave-fw

 recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb b/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb
index 28f3440e..0c432de2 100644
--- a/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb
+++ b/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb
@@ -19,7 +19,9 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 S = "${WORKDIR}/git"
 TARGET_WAVE521C = "wave521c_codec_fw.bin"
-TARGET_WAVE521C_j721s2-evm = "wave521c_j721s2_codec_fw.bin"
+
+SOURCE_WAVE521C = "wave521c_codec_fw.bin"
+SOURCE_WAVE521C_j721s2-evm = "wave521c_j721s2_codec_fw.bin"
 
 ALTERNATIVE_LINK_NAME[wave521c_codec_fw.bin] = "${base_libdir}/firmware/${TARGET_WAVE521C}"
 ALTERNATIVE_TARGET[wave521c_codec_fw.bin] = "${base_libdir}/firmware/cnm/${TARGET_WAVE521C}"
@@ -31,7 +33,7 @@ ALTERNATIVE_${PN}_j7 = "\
 
 do_install() {
 	install -d ${D}${base_libdir}/firmware/cnm
-	install -m 0644 ${S}/cnm/${TARGET_WAVE521C} ${D}${base_libdir}/firmware/cnm/${TARGET_WAVE521C}
+	install -m 0644 ${S}/cnm/${SOURCE_WAVE521C} ${D}${base_libdir}/firmware/cnm/${TARGET_WAVE521C}
 }
 
 # make sure that lib/firmware, and all its contents are part of the package
-- 
2.17.1

