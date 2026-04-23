Return-Path: <y-hegde@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BBB0FAD40F
	for <webhook@archiver.kernel.org>; Thu, 23 Apr 2026 05:40:08 +0000 (UTC)
Received: from BL2PR02CU003.outbound.protection.outlook.com (BL2PR02CU003.outbound.protection.outlook.com [52.101.52.6])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13388.1776922806870326952
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 22 Apr 2026 22:40:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=HNh4oHwt;
 spf=pass (domain: ti.com, ip: 52.101.52.6, mailfrom: y-hegde@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jOnrXiuCYmFN4G1adZa2XhRI2Kwo61ChonoQMPxcKsxYImQs123krNMVyId17awWlHYf86UX/0AzjvxKvKgxlTu9XD0yv5dh6BUFViOcix76DpDRxUd9WE3NKPJF93S8A3muy+g0t3+w5IxlBHSIsVntVJO1Aeepf9Rk2HBnZRPOvphUHmdlPytey7+JzDrTdSFx7mQfZXy9/1p0n8ViIUyOq8YVSfDFFzpQ8xWoEWRqaeRVtMzRmp0+4T8zATuVTnnICEZYXHvW3+yTy5q+8fN6xD4bSrqR3fNO1imXx+pGADvMLFDhGJkyrZoYk3Sej0ujEBgAP3BQFf8oL/DApg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fJS+OaaNVaLUvmp5cMeuW7Sr9ZW+HCah1p+3cn6DCpE=;
 b=tIcC3qvpTjhCQNoTvj8gSgn6WebevJZFx37WKoxaKrdT1EZg55/0HEj6gHtl6TAcbC5QW72p8iB4abcsFU3ID5vbmzFY6kOrxm8esKe0FwOqtDKOCPh8z1GADjWiahw4VGirbT7s0IHJQsXqLCEBxon/HB72HV1yNl92Ho4//ge0iuNqBb9bLpND8DiM7+BGoE3HT7pdpXct10aHBKztSmxMFl1WMXbZR+wy311qWH6Q9hrBuC7lyh2XIdFqnAiBKyK2Hh0gYJfAm8lJNL4XySSDdVWjHpZsq9YlgWJSrgasSpj2qqSlPmfmOObGEVhp2+XX5Td6iO2b+rLXC6H2ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fJS+OaaNVaLUvmp5cMeuW7Sr9ZW+HCah1p+3cn6DCpE=;
 b=HNh4oHwtAKAV3uyduJ7zMaEnJp7GFA/ZqYxIvOG0IlYHjf/Ns/1p/HhcyJqIoFMxtDE5wI76mq1pJE/jgwlGr+ejlcd6BLz7CJVTubkqeHGE2stnUTpfDL9Wy0u/7UrrH9CSUgUVsTRZgwkk0S7336g/GpFGkz8SjILQ+5OlF4M=
Received: from SJ0PR03CA0290.namprd03.prod.outlook.com (2603:10b6:a03:39e::25)
 by SAVPR10MB997818.namprd10.prod.outlook.com (2603:10b6:806:4e8::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.21; Thu, 23 Apr
 2026 05:40:04 +0000
Received: from MWH0EPF000C6184.namprd02.prod.outlook.com
 (2603:10b6:a03:39e:cafe::d9) by SJ0PR03CA0290.outlook.office365.com
 (2603:10b6:a03:39e::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Thu,
 23 Apr 2026 05:40:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 MWH0EPF000C6184.mail.protection.outlook.com (10.167.249.116) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9791.48 via Frontend Transport; Thu, 23 Apr 2026 05:40:03 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 23 Apr
 2026 00:39:58 -0500
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 23 Apr
 2026 00:39:58 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 23 Apr 2026 00:39:58 -0500
Received: from localhost (yogi-work-pc.dhcp.ti.com [172.24.233.89])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63N5dvlD3483907;
	Thu, 23 Apr 2026 00:39:57 -0500
From: Yogesh Hegde <y-hegde@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <praneeth@ti.com>, <prudhvi@ti.com>, <gehariprasath@ti.com>, <rs@ti.com>,
	<jm@ti.com>, <reatmon@ti.com>, <afd@ti.com>, Yogesh Hegde <y-hegde@ti.com>
Subject: [master][PATCH v2] am62lxx: Override serial console to ttyS0 only
Date: Thu, 23 Apr 2026 11:09:52 +0530
Message-ID: <20260423053952.254126-1-y-hegde@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6184:EE_|SAVPR10MB997818:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c791a64-7344-431a-72f5-08dea0fac4ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|1800799024|376014|82310400026|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	FkaZdrbvn//KgqRzpwYXQ0EBKRvHNV3lFLPkmkLMFDIbmwK1SWdRd/nR9E4J22bJbu51x4KxBFDIwjj2L8JH5QzXdzCsd6Nc+zbzydtquWpXbeKmo93/Fx/MQPcqGQt2kcemURXmEd7twyHsYb1K8WOtEDzgUJ8hmfqM6nUQE/bH/YPOU7wFrI6QvlwudrmykvV2/n/8uzG5hKn37uvv2cg1u4dxPIoXptQiiImLgxyX/5k+KOV6hJWCuueoMGhZqi5SzEFfCZsTybs4u1t2VUzW1ypi6ppED3UpM62+lct5YamHYo5N/ie5eL4yyXP7I28DxuuQgrIWQe6xmwzUoUwsu4rV2ruoZ3l3sMnLzuS76lQf9aQW8AT8QlBcQgYNQg22kLvCT/tjHA2u6vbQ6NZH5bV9XHE9eDf3zhUjNcwV9LwIh0mX/Ap75XIWT6KPCqGQQwOs/r2jy3BOFH7+VIShCdz0cPSUl8M9aKJP9+xqgNC6DRVEXTgwyLh3f59PB3o7qEvtppqDX7jZrvIhEcUK/6ptMA5/p0OGa2MFsw1ThH5kqE0yNIiXRJJBJ/pKIrRtFjgGRr/GL/MmOlwF7F8veGZIcszTwyvGd4O6I4Om9BqsgmuvnEEip5ttKavCr+WEvoHwTBD3us2VvsxcjTLLFNAZfj4R9asaF52cP2oBe6mJfo1tTRKc1RWbBHPAzgGPGbNUoTVe90gNQGm+W51XKuHq5eVZG3Kra6zOfRjFSGu9f3Y6Tvs62nK01YatrroxzwL2up661Z0XV6P+9w==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(82310400026)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	VFCsgxtRpUooDnwZqGIzxW9ofm7vA3QA4XfsDFuoPVTqNO45OgmsFsaY4EaJ0lNcZ+HrP4oMN3YlWECHQZQvU4p6kwo1KP4iavpVB3I+Aa/PXUv5AjXK3EGUmfzsK1f+z6OZIQtenBoarOUmIPRbBX7S4LTI5/Icd3IK2315tFyoTz6n65LGJxgwihGdMXFufn+EZNFTP2ZR+0U7099b670Tu8EPi2Jy2rPnPYzSLz7zMmFPKr0OvNpgWew4OnagaSEqrky+DghntET2kgswzxIbNFKd6hkyrKCKTVKVU5kRWXeoVCj/7e1FquBYBRQb6A5vD+UEKFjf96EHTcvDtaHEwaPD9iorFeBWjbelkKZ6l4oievPiiYkIy+sEVNe/RA3i0snxX1Nbp9OXTjqwR+/OaeMb2FFvUsstEsFet8lEuQfVKxHo0QwW4s/Q7HQa
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2026 05:40:03.8045
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c791a64-7344-431a-72f5-08dea0fac4ee
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MWH0EPF000C6184.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAVPR10MB997818
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 23 Apr 2026 05:40:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19873

The am62lxx SoC default UART is ttyS0 since it doesn't have the
R5 cores taking up a UART. The k3 default SERIAL_CONSOLES
inherited includes ttyS2, which causes systemd to wait indefinitely
for a console that never appears, significantly increasing boot time
and degrading user experience.

Override SERIAL_CONSOLES to specify only ttyS0, allowing the boot
process to proceed normally without waiting for unavailable consoles.

Signed-off-by: Yogesh Hegde <y-hegde@ti.com>
---
v2 Changes:
- moved SERIAL_CONSOLES override to include/am62lxx.inc

---

Boot time is increased from 33s to 2m18s.
Boot time is measured from power on to TI LVGL demo
running on HDMI Display.

Logs:

root@am62lxx-evm:~# systemd-analyze critical-chain ti-lvgl-demo.service
The time when unit became active or started is printed after the "@" charac=
ter.
The time the unit took to start is printed after the "+" character.
ti-lvgl-demo.service @1min 32.588s
`-multi-user.target @1min 32.577s
   `-getty.target @1min 32.575s
     `-serial-getty@... @13.002s
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
 to
serial-getty@... failed. This service fails because there is no
hardware associated with ttyS2.

---
 meta-ti-bsp/conf/machine/include/am62lxx.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-ti-bsp/conf/machine/include/am62lxx.inc b/meta-ti-bsp/con=
f/machine/include/am62lxx.inc
index 12c8d6ea..26abe479 100644
--- a/meta-ti-bsp/conf/machine/include/am62lxx.inc
+++ b/meta-ti-bsp/conf/machine/include/am62lxx.inc
@@ -3,6 +3,8 @@ SOC_FAMILY:append =3D ":am62lxx"
=20
 MACHINE_FEATURES +=3D "screen"
=20
+SERIAL_CONSOLES =3D "115200;ttyS0"
+
 TFA_BOARD =3D "am62lx"
 TFA_K3_SYSTEM_SUSPEND =3D "1"
 TFA_PLATFORM =3D "k3low"
--=20
2.34.1


