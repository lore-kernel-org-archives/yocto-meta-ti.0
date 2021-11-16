Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web09.8382.1637060042223671903
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 16 Nov 2021 02:54:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=JfpdlMEJ;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: yogeshs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1AGAs0G0014939;
	Tue, 16 Nov 2021 04:54:00 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1637060040;
	bh=u4gfR4bYfIS4Q1UExSZCGbr4m5Nj2YIH5nwMEOMXuCY=;
	h=From:To:Subject:Date;
	b=JfpdlMEJo+VCUqeARTJFV9VxUf0FtDzwuB5TqQ+NUxzhUo3Ffe5+T3ngKAym/R7XJ
	 zNuFd8l7k+T0PPgmKJzzfKDtNBKsMvhyF/Ub9Udb7I4u2x+16TLx9orCJPWa5dGeRm
	 hmUdvsJvjcUY24UkeQ2RtutCjcATkPSUkFY7toY8=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1AGAs09e089784
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 16 Nov 2021 04:54:00 -0600
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 16
 Nov 2021 04:54:00 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 16 Nov 2021 04:54:00 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1AGAs0W3073292;
	Tue, 16 Nov 2021 04:54:00 -0600
From: "Yogesh Siraswar" <yogeshs@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell][PATCH 0/3] Add J7200 HS platform support
Date: Tue, 16 Nov 2021 10:53:57 +0000
Message-ID: <20211116105400.45878-1-yogeshs@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

This series adds J7200 HS support for HS-SE devices.

Yogesh Siraswar (3):
  conf: machine: Add j7200 hs platform
  ti-rtos-firmware: Add j7200 hs support
  j7200-hs: changes to support new hs platform

 conf/machine/j7200-hs-evm-k3r5.conf           | 13 +++++++
 conf/machine/j7200-hs-evm.conf                | 22 ++++++++++++
 recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb        | 18 ++++++++++
 .../trusted-firmware-a_%.bbappend             |  8 +++++
 recipes-bsp/u-boot/u-boot-ti.inc              |  6 ++++
 recipes-security/optee/optee-os_%.bbappend    |  4 +++
 recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb    | 34 +++++++++++++++++++
 7 files changed, 105 insertions(+)
 create mode 100644 conf/machine/j7200-hs-evm-k3r5.conf
 create mode 100644 conf/machine/j7200-hs-evm.conf

-- 
2.17.1

