Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web12.3899.1575580420275203725
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 05 Dec 2019 13:13:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=wwzxI89b;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: c-robey@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id xB5LDd5Q111576;
	Thu, 5 Dec 2019 15:13:39 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1575580419;
	bh=NZYK8aSNSvneIauwXon9xL/h99E0zGE24VfLRYDZzbk=;
	h=From:To:CC:Subject:Date;
	b=wwzxI89bxiIXmao7S/XDUd5edvCybXZReC7IkmLbAQG5D+EeGTMhf0lC80g16JfiX
	 JAe02VX4lNOzY8qrMy0zd0o+0HPsvdC5QQToLL+pSCIr1AIeJZFOZb05J4NTvchhku
	 QUIyrAI6zH8//pbh/p/9Seh/06+poZBdo1jHTpsA=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id xB5LDdCN061282;
	Thu, 5 Dec 2019 15:13:39 -0600
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 5 Dec
 2019 15:13:38 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 5 Dec 2019 15:13:38 -0600
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com [128.247.22.53])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id xB5LDc8X022903;
	Thu, 5 Dec 2019 15:13:38 -0600
Received: from localhost (ulb0232989.dhcp.ti.com [128.247.59.95])
	by legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id xB5LDcu04406;
	Thu, 5 Dec 2019 15:13:38 -0600 (CST)
From: c-robey@ti.com
To: <meta-ti@lists.yoctoproject.org>
CC: Jason Kridner <jkridner@gmail.com>, Jason Kridner <jdk@ti.com>,
        Michael
 Erdahl <m-erdahl@ti.com>, Caleb Robey <c-robey@ti.com>,
        Denys Dmytriyenko
	<denys@ti.com>, Djordje Senicic <d-senicic1@ti.com>,
        Jacob Stiffler
	<j-stiffler@ti.com>
Subject: [PATCH v4] cmem: Adding am5729 beaglebonai CMEM configuration
Date: Thu, 5 Dec 2019 15:13:21 -0600
Message-ID: <20191205211321.23743-1-c-robey@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

CMEM memory block for bbai should be 402MB to allow full EVE
acceleration and DSP use, but accounting for the BBAI only having
1GB of RAM.

Signed-off-by: Caleb Robey <c-robey@ti.com>

---

v2 changes:
    - Added am572b to CMEM_MACHINEs.

v3 changes:
    - changed am572b to am5729-beagleboneai for clarity

v4 changes:
    - corrected mistake of adding new CMEM machine and
      added beagleboneai to the already known machines

 recipes-kernel/linux/cmem.inc                 |  6 ++-
 .../dra7xx/cmem-am5729-beagleboneai.dtsi      | 40 +++++++++++++++++++
 2 files changed, 44 insertions(+), 2 deletions(-)
 create mode 100644 recipes-kernel/linux/files/dra7xx/cmem-am5729-beagleboneai.dtsi

diff --git a/recipes-kernel/linux/cmem.inc b/recipes-kernel/linux/cmem.inc
index 8bd643f4..3ad8e25d 100644
--- a/recipes-kernel/linux/cmem.inc
+++ b/recipes-kernel/linux/cmem.inc
@@ -2,14 +2,15 @@
 #
 # Use these for temporary overrides
 CMEM_MACHINE = "${MACHINE}"
-CMEM_MACHINE_am57xx-evm = "am571x am572x am574x"
-CMEM_MACHINE_am57xx-hs-evm = "am571x am572x am574x"
+CMEM_MACHINE_am57xx-evm = "am571x am572x am5729-beagleboneai am574x"
+CMEM_MACHINE_am57xx-hs-evm = "am571x am572x am5729-beagleboneai am574x"
 CMEM_MACHINE_dra7xx-evm = "dra71x dra72x dra74x dra76x"
 CMEM_MACHINE_dra7xx-hs-evm = "dra71x dra72x dra74x dra76x"
 
 # Set cmem.dtsi per machine or machine variant
 CMEM_DTSI = "cmem.dtsi"
 CMEM_DTSI_am571x = "cmem-am571x.dtsi"
+CMEM_DTSI_am5729-beagleboneai = "cmem-am5729-beagleboneai.dtsi"
 CMEM_DTSI_am574x = "cmem-am574x.dtsi"
 CMEM_DTSI_dra71x = "cmem-dra71x.dtsi"
 CMEM_DTSI_dra72x = "cmem-dra72x.dtsi"
@@ -20,6 +21,7 @@ CMEM_DEVICETREE = "${KERNEL_DEVICETREE}"
 CMEM_DEVICETREE_am571x = "am571x-idk.dtb am571x-idk-lcd-osd101t2045.dtb am571x-idk-lcd-osd101t2587.dtb"
 CMEM_DEVICETREE_am572x = "am57xx-beagle-x15.dtb am57xx-beagle-x15-revc.dtb \
                           am572x-idk.dtb am572x-idk-lcd-osd101t2045.dtb am572x-idk-lcd-osd101t2587.dtb"
+CMEM_DEVICETREE_am5729-beagleboneai = "am5729-beagleboneai.dtb"
 CMEM_DEVICETREE_am574x = "am574x-idk.dtb am574x-idk-lcd-osd101t2587.dtb"
 CMEM_DEVICETREE_dra71x = "dra71-evm.dtb"
 CMEM_DEVICETREE_dra72x = "dra72-evm.dtb dra72-evm-lcd-osd101t2045.dtb dra72-evm-lcd-osd101t2587.dtb \
diff --git a/recipes-kernel/linux/files/dra7xx/cmem-am5729-beagleboneai.dtsi b/recipes-kernel/linux/files/dra7xx/cmem-am5729-beagleboneai.dtsi
new file mode 100644
index 00000000..e0511d08
--- /dev/null
+++ b/recipes-kernel/linux/files/dra7xx/cmem-am5729-beagleboneai.dtsi
@@ -0,0 +1,40 @@
+/ {
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		cmem_block_mem_0: cmem_block_mem@a0000000 {
+			reg = <0x0 0xa0000000 0x0 0x18000000>;
+			no-map;
+			status = "okay";
+		};
+
+		cmem_block_mem_1_ocmc3: cmem_block_mem@40500000 {
+			reg = <0x0 0x40500000 0x0 0x100000>;
+			no-map;
+			status = "okay";
+		};
+	};
+
+	cmem {
+		compatible = "ti,cmem";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		#pool-size-cells = <2>;
+
+		status = "okay";
+
+		cmem_block_0: cmem_block@0 {
+			reg = <0>;
+			memory-region = <&cmem_block_mem_0>;
+			cmem-buf-pools = <1 0x0 0x18000000>;
+		};
+
+		cmem_block_1: cmem_block@1 {
+			reg = <1>;
+			memory-region = <&cmem_block_mem_1_ocmc3>;
+		};
+	};
+};
-- 
2.17.1

