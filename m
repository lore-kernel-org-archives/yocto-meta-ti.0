Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web09.29391.1644425670903205358
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 09 Feb 2022 08:54:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=fAo87yz7;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 219GsRoE023868;
	Wed, 9 Feb 2022 10:54:27 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1644425667;
	bh=Hw8O7jEGCe7EExpaDTGl27FpLzJiScIe48YhluqOYNE=;
	h=From:To:Subject:Date;
	b=fAo87yz7EWVaO/9sP78YIoBrWqmjPjYzVtDjdBsUsFohYmkIwrr9ZGa1M4s2JAU9i
	 Jh9VQRvCiU+aHh5OR/RXUMjjRtGwVIvGS4mxsN0VOoICI7UneiE/wGwZtiT65JiH2M
	 WbQ7n3XEce+RFfaUeTsE4IBL7cEYD+hdWBXuYDSk=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 219GsRli118340
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 9 Feb 2022 10:54:27 -0600
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 9
 Feb 2022 10:54:27 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 9 Feb 2022 10:54:27 -0600
Received: from uda0214219 (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 219GsR4v091783;
	Wed, 9 Feb 2022 10:54:27 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1nHqEd-0005Ez-DN; Wed, 09 Feb 2022 10:54:27 -0600
From: "Ryan Eatmon" <reatmon@ti.com>
To: Yogesh Siraswar <yogeshs@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell][PATCH] Split firmware name into target and source
Date: Wed, 9 Feb 2022 10:54:27 -0600
Message-ID: <20220209165427.20106-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

We need to control both the source name of the firmware and
the target name, so split the current variable into two and
update the install command.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
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

