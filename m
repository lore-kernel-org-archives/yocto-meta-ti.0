Return-Path: <y-hegde@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63B56F94CCF
	for <webhook@archiver.kernel.org>; Wed, 22 Apr 2026 06:23:00 +0000 (UTC)
Received: from PH8PR06CU001.outbound.protection.outlook.com (PH8PR06CU001.outbound.protection.outlook.com [40.107.209.58])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.71994.1776838970195997421
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 21 Apr 2026 23:22:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=S5+V43wV;
 spf=pass (domain: ti.com, ip: 40.107.209.58, mailfrom: y-hegde@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OmrGb0zs62XgDhKuONnREbe0p4bVSjDaxmLymC2ZdC5kd8oQRwofKf5NN2TiHSmljzcOMg+jyYG+8Yl1c/Nnd1inOUFvgpaPwlO/BXwz2asqMTVYmR7ZM4hlVpDE912INiCuxJ97Af+QQ7ykJawC7btfKJ70OxU2sKHFh1k9vzUSt0bnhKalMZ4XGCdMEKZEc6tOWi7Hw8rR6GQTzzLqXW0bYkop+tDQPZImTeLahCm5EcL3L0gB8YuHtpqXcleuKZOmk2elJcE/ssLL2MB5ITjdziggQnbdCYyflmzZRdTH2cym8SW93Q9j57TN20qGtbPtQVs6lmhPJmpBbGC85A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6GnAKLh7SL4iBcuX48TRhyZVcZDwGFtey3VXfPF0zUw=;
 b=Vkfoj4n6hz4CGJLRI+sH9Vd0F9LrtzjoyqgoE/xIIKtMc3PdhQQVUcHD65NMwrWd/4b+wubRpsRolzmpEL/ATczEsm9dHCw8wfNjP5vtUmkpgzeSHl/TceLauBfECNOVlrfuo0a1E8YIPvvWqXwiQvv+B23ZbrJz64A2MugmV6TBXJJqQMo313Wi5bGiUt/cAUuWFYwClFI+eNkwJl9U03arTZzf3920H2hBDp1aJy4a1/Ii8LHEfWGuW9RE+6VC1f5ylDS8oykH4sVwc7TEpM9QVkp6yDVDDOzz3KYg4Fqo5zAjoTNIbWhwjalLPsPc4JIKGBKK9HqBgzYNGDuYsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6GnAKLh7SL4iBcuX48TRhyZVcZDwGFtey3VXfPF0zUw=;
 b=S5+V43wVGyBsJl9Fr5zgwgbh4l356u++7nZccOeD9NLx+W9hYWopZT8StXPLfKu+5ZYDvZ4LapOZylYRLc9FQufze3fRbQgz68Js0fpoAx9anwLrCjd7Q60iVx2jGWVB9TKb4uN6+HRdJ6atGP14luMz7B8zuzoZd8km5Q460Gc=
Received: from DS7PR03CA0179.namprd03.prod.outlook.com (2603:10b6:5:3b2::34)
 by CO1PR10MB4435.namprd10.prod.outlook.com (2603:10b6:303:6c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.32; Wed, 22 Apr
 2026 06:22:48 +0000
Received: from DS1PEPF0001709C.namprd05.prod.outlook.com
 (2603:10b6:5:3b2:cafe::69) by DS7PR03CA0179.outlook.office365.com
 (2603:10b6:5:3b2::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Wed,
 22 Apr 2026 06:22:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 DS1PEPF0001709C.mail.protection.outlook.com (10.167.18.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Wed, 22 Apr 2026 06:22:46 +0000
Received: from DFLE213.ent.ti.com (10.64.6.71) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 22 Apr
 2026 01:22:31 -0500
Received: from DFLE201.ent.ti.com (10.64.6.59) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 22 Apr
 2026 01:22:30 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 22 Apr 2026 01:22:30 -0500
Received: from localhost (yogi-work-pc.dhcp.ti.com [172.24.233.89])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63M6MTVR1877817;
	Wed, 22 Apr 2026 01:22:30 -0500
From: Yogesh Hegde <y-hegde@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <praneeth@ti.com>, <prudhvi@ti.com>, <rs@ti.com>, <jm@ti.com>,
	<reatmon@ti.com>, Yogesh Hegde <y-hegde@ti.com>
Subject: [master][PATCH] am62lxx-evm: Override serial console to ttyS0 only
Date: Wed, 22 Apr 2026 11:52:27 +0530
Message-ID: <20260422062227.4098420-1-y-hegde@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001709C:EE_|CO1PR10MB4435:EE_
X-MS-Office365-Filtering-Correlation-Id: 51a9a3cd-b620-4daf-0841-08dea03791b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|82310400026|376014|1800799024|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	O818/O1nsr5FVo47nrrRzmxnw6+qI2cwNCJuFgq+gE8TNxjfMVB70O7TT7INc944WuGyz+0E2i+GoNseiqQZCZV1JUUROFSLc2Sar+r/9QomgkiYAFE++Kz+df/J2po6T4voMrGrzHSAUxd4PaZJmd9+Tdr5f+rmEWY7wPHxzvsc47/I3KImI1+5B86+gaxYqcauHONEHt3TGlcNbl/UisDTOqH6fVHakzIP2g3BQFvjeu0vI4vOYrTobzhBs6PVY0goZcXpDFPJ4Xnf+Eo+rUWTw6W3fg6c9XcvvfSXXZAWmu3caQE53PAwyqAY6fJl+o5fEN8yaUuvM9x6KuqITkLbjilB77pqpb/mlYHpVIaVMqg6oOis0o3rJL7jW9Hf5ftpXEDHIHsEwhMekHKhbyoNrlql5kkzvhoNbXo/I3/eIGnFTfsOT1Rg27rbUvXXS30emRAY14gI2ox7wigPL3UN7Rd2xz4wLrSYbvhc0x3QfiZJOeW0GK0K51xLicJmg9oy4EsI1bU/ShnteL7M0qpxdU50WEa/fApJJPtYzdq0i0rIlmH9PcGbZq9IEdyj5r6cDvmL2q0k5zZ39mB8R1bd+LDZuAjaeHOmICWg/4DiA+1AgdxlN/63eRZmBdygOIKVJ+E7jYQC9C59vknnKaqZ45VXwTiESCFlDDJtWxubKB2A+vPSrWqWhmmrY9Cx5N8xuo7OPlUN9w0iVLo4U/PlOSgWYRkn1s8FA+0W2A94PDbdH6NznG7XozU3UnsS0PwILRRJuWiHVSCj2fILZw==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(1800799024)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	UhxMkhhbvyiRKBJHD+CucMOrLXQ2p3kDV+kEX4jSjM9rgHXjArcbritbR2X6iOsRIm6omRA0M9xtegpMYp7rwH4BKwfHvv+89pA6QMUlAGEGMlLnRTcuSAhgjVnnrOeVuVMHnrvokzb/kMyn8AZy9UC9XKL5de7ddnG3xQbr5iV7xWlSBsgbBzhUOiZL0xaIJV3dp+5jXB4wq8qqyR0GL/YbJKDn/zKx6Bzd4WTa+hp/OzhR4H7lk/p3A5dMqy/WWSVTxtn8gmQ3CS6JQBqenDIoBWHjmDFKJqu8Z7HsnmroOOQUf+CRyAk8DL2xQQUhG5hdvLAJpTZXViQmZbGqNUuRGXZ1cPgIP2fjY9FuRxW9f6dZn/7LeY6PmaMfYYUCQaUrpPChpvG5AAZ+7Wf3fooasQl6YxJBf38uTmnIjAHlxYyMhBTH4+6A1e0Dg2oo
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2026 06:22:46.0403
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 51a9a3cd-b620-4daf-0841-08dea03791b5
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS1PEPF0001709C.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4435
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 22 Apr 2026 06:23:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19862

The am62lxx-evm board only has ttyS0 available. The k3 default
SERIAL_CONSOLES inherited includes ttyS2, which causes
systemd to wait indefinitely for a console that never appears,
significantly increasing boot time and degrading user experience.

Override SERIAL_CONSOLES to specify only ttyS0, allowing the boot
process to proceed normally without waiting for unavailable consoles.

Signed-off-by: Yogesh Hegde <y-hegde@ti.com>
---

Boot time is increased from 33s to 2m18s.
Boot time is measured from power on to TI LVGL demo
running on HDMI Display.=20

Logs:=20

root@am62lxx-evm:~# systemd-analyze critical-chain ti-lvgl-demo.service
The time when unit became active or started is printed after the "@" charac=
ter.
The time the unit took to start is printed after the "+" character.
ti-lvgl-demo.service @1min 32.588s
`-multi-user.target @1min 32.577s
  `-getty.target @1min 32.575s
    `-serial-getty@ttyS0.service @13.002s
      `-systemd-user-sessions.service @10.847s +660ms
        `-network.target @10.582s
          `-systemd-networkd.service @8.748s +1.799s
            `-network-pre.target @8.735s
              `-iptables.service @7.477s +920ms
                `-basic.target @7.363s
                  `-dbus-broker.service @6.661s +466ms
                    `-dbus.socket @6.310s +434us
                      `-sysinit.target @6.263s
                        `-systemd-vconsole-setup.service @18.198s +391ms
                          `-systemd-journald.socket @2.781s +335us
                            `-system.slice @1.282s
                              `--.slice @1.282s

From the time analysis log, `getty.target` takes 1min 32 secs to bootup due=
 to=20
serial-getty@ttyS2.service failed. This service fails because there is no=20
hardware associated with ttyS2.=20

---
 meta-ti-bsp/conf/machine/am62lxx-evm.conf | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-ti-bsp/conf/machine/am62lxx-evm.conf b/meta-ti-bsp/conf/m=
achine/am62lxx-evm.conf
index 677d6955..edfb4057 100644
--- a/meta-ti-bsp/conf/machine/am62lxx-evm.conf
+++ b/meta-ti-bsp/conf/machine/am62lxx-evm.conf
@@ -4,6 +4,8 @@
=20
 require conf/machine/include/am62lxx.inc
=20
+SERIAL_CONSOLES =3D "115200;ttyS0"
+
 IMAGE_FSTYPES +=3D "ubifs ubi"
=20
 MKUBIFS_ARGS ?=3D "-F -m 4096 -e 258048 -c 12000"
--=20
2.34.1


