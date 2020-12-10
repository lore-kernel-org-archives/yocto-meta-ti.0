Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web09.974.1607642036981720363
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 10 Dec 2020 15:13:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=bwDEwbtU;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: nm@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0BANDqMw019231;
	Thu, 10 Dec 2020 17:13:52 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1607642032;
	bh=qR6G2g07JZTnBSV+lEhf5AXoOheo/IWFf0UFaFI33v4=;
	h=From:To:CC:Subject:Date;
	b=bwDEwbtUyIkrZtvTbwMqkPNZKoThJyzUcGZIjgsbPcnsP5kVuhdHWu/2PJRD+nMf9
	 03LxBKtlt+2SCFXZcj2zr5R4E1fOe9U8s/MdPx+id8l0zK+jHIoyGmUDrA6wq1kBlR
	 IWvPb/zoNqwJMBS12wfaGd5Zm6kk6nf0MPLb1puk=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0BANDqUi020126
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 10 Dec 2020 17:13:52 -0600
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 10
 Dec 2020 17:13:52 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 10 Dec 2020 17:13:52 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0BANDqxB092082;
	Thu, 10 Dec 2020 17:13:52 -0600
From: "Nishanth Menon" <nm@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <praneeth@ti.com>, <d-gerlach@ti.com>, <s-anna@ti.com>, <dmurphy@ti.com>,
        <denis@denix.org>, Nishanth Menon <nm@ti.com>
Subject: [dunfell/master PATCH V3] trusted-firmware-a: Update to v2.4 merge
Date: Thu, 10 Dec 2020 17:13:51 -0600
Message-ID: <20201210231351.7637-1-nm@ti.com>
X-Mailer: git-send-email 2.25.1.377.g2d2118b814c1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Update to v2.4 tag merge from upstream to keep TF-A in sync.

For major changes in trusted-firmware-a, See:
https://trustedfirmware-a.readthedocs.io/en/latest/change-log.html#version-2-4

TI specific fixups include:
 - stub for shutdown (CPUs enter wfi)
 - uart console is now configurable.

While at it, update to include PV_k3 as 2.4 and provide the license file
checksum.

NOTE: We use PV_k3 instead of PV since this allows meta-ti to not
affect other platforms esp in a multi-BSP configuration.

Suggested-by: Dan Murphy <dmurphy@ti.com>
Signed-off-by: Nishanth Menon <nm@ti.com>
---

Changes since v2:
 - Update license file and checksum (Thanks Dan for catching my next
   blunder)

Changes since v1 in v2:
 - Update for PV_k3 (Thanks Denys) - I was'nt sure to pick a
 "Reviewed-by" tag for your LGTM :).. so did'nt want to guess.

 recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend b/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
index 3c1862643086..c561fe2d7e76 100644
--- a/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
+++ b/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
@@ -1,6 +1,8 @@
+PV_k3 = "2.4"
+LIC_FILES_CHKSUM = "file://license.rst;md5=1dd070c98a281d18d9eefd938729b031"
 BRANCH_k3 = "ti-atf"
 SRC_URI_k3 = "git://git.ti.com/atf/arm-trusted-firmware.git;branch=${BRANCH};name=tfa"
-SRCREV_tfa_k3 = "52c334fc361194e3896ea3b2529c10a06e586a5f"
+SRCREV_tfa_k3 = "f0a310d000fd6e8a1ed0ccc365b5931390393db1"
 COMPATIBLE_MACHINE_k3 = "k3"
 TFA_BUILD_TARGET_k3 = "all"
 TFA_INSTALL_TARGET_k3 = "bl31"
-- 
2.25.1.377.g2d2118b814c1

