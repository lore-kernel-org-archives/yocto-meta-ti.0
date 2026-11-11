Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6377.1794392060778789268
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 11 Nov 2026 02:14:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=MfNxO1r5;
 dkim=pass header.i=@ticloud.onmicrosoft.com header.s=selector1-ticloud-onmicrosoft-com header.b=j/inTnNZ;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: r-sharma3@ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6AB7Hxcu3913594;
	Wed, 11 Nov 2026 04:14:19 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=gMA8CcrSEhC65
	K90wWmGpywsu65uaajAYdxvAQiDIYY=; b=MfNxO1r5h/o4tVT24270X1ja4rsLk
	TopjHK2ipx0HEMCVavB7xNdDNC3OfEvwZtpaZYEW19pxp6v6BEIG+6W8yhMYuS63
	KykMlihIB/h9vXrZtSEiHtMmDPl5yXI1skiZSmZG/AVS9ZGlHGZhkvqyxvl0urGm
	ROti0ynNMYEd01fM+e5Ki37KSyiNPuvf1L5Gm/kjVSJUNqySnX6OrKErEuy2OLqj
	GJmiHq6xAcLGVgXdVXkTHibArak+QYRFr4U+NcYClmpRVJ4bWc5KWiXw24iM/cFM
	j8sIgESdME5HmBu9NdPZPfyGB3M8B8vk+YsKaW+kb61czxiQIr8iskwrw==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010018.outbound.protection.outlook.com [40.93.198.18])
	by m0380145.ppops.net (PPS) with ESMTPS id 4hveuptg8r-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 11 Nov 2026 04:14:19 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cMgx7r4yVsfHC6uIXZMRiRWtodJ4FhPOGnvB2gsvbhvZRugUzVWqATMOIcwN4JeQZRA69ulS3mBqLu/yAqsLYZX4WySNki8X23Z7ogDFkbL4tNiJnbS9vQZn7/ZdNFlM/G9aZgVY+D5Mr2kyELPIzGAlJVp6sMvntDZ8wmr5kfqpWX0EnvrkH5LFe3o8RnVOMopwo8+NIsjlkZT/KAp1IzLxIocYsFMfCBxI3BrEYJ73hkLg2Rxx7DFCr16npThndHZsrmTwjFigP3l5fgWbESGsCEMXf3PPEgigpW1Qu1Sws/Xs6GNo2RX9p5zR4n3bkdF6auRd+LJ1PfGyiwXvBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gMA8CcrSEhC65K90wWmGpywsu65uaajAYdxvAQiDIYY=;
 b=gy/SQfm5jXwP+FTPxa5812p96LgbQlAxBwYV9M263E1UieXjJhVvQ9FbmtNVZPE9KczNNOg+QhX2HHTnP8evTNLI617ELvZko+0R6Itk5RDW3j4mxbzbktm0aMlO7UTJdiAFkt7UI0Gx/Gzu0OeSaGB7iY5AGE9R4ga2nMkSrs3yHrxK96XH32vKxihNvtcDwTSKxEkrK6kaBYagJXoQZaU4m01kV/m5+nx0dJ5TQc+sJ1YP+7xwenrNrXepMZX1t5gdqJzzXhbldFTOgDLLCcHIH4RM20VeqIHnwYkY/ttWrZuAHKj8V1Ds34k0BN00faWFxamudu0PD+RCSPXL8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gMA8CcrSEhC65K90wWmGpywsu65uaajAYdxvAQiDIYY=;
 b=j/inTnNZ7OUDg4rshrZHHnlShniHOWVKVDgysadKorgHNEnk3H33huSfhlfhiU58/1l06cg0av8a26rt/4XGTXM7RUZB87uLlxfTtHEIi/vUx30AEyaEqdwlZtJrD5I3IEMrvuG2IM/DeMGZeCwqT0EGYd4kUSzTrK7xAg8XVPk=
Received: from BN9PR03CA0735.namprd03.prod.outlook.com (2603:10b6:408:110::20)
 by PH8PR10MB6575.namprd10.prod.outlook.com (2603:10b6:510:225::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Wed, 11 Nov
 2026 10:14:16 +0000
Received: from BN5PEPF0004698D.namprd02.prod.outlook.com
 (2603:10b6:408:110:cafe::4e) by BN9PR03CA0735.outlook.office365.com
 (2603:10b6:408:110::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Wed, 11
 Nov 2026 10:14:15 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN5PEPF0004698D.mail.protection.outlook.com (10.167.245.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 11 Nov 2026 10:14:15 +0000
Received: from DLEE208.ent.ti.com (157.170.170.97) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 11 Nov
 2026 04:14:15 -0600
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 11 Nov
 2026 04:14:15 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 11 Nov 2026 04:14:15 -0600
Received: from uda1253387.dhcp.ti.com (uda1253387.dhcp.ti.com [10.24.51.39])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6ABAED3t3698034;
	Wed, 11 Nov 2026 04:14:13 -0600
From: Rahul Sharma <r-sharma3@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <denys@konsulko.com>
Subject: [wrynose][PATCH] am62pxx-evm: Add tisdk-uenv configuration for display support
Date: Wed, 11 Nov 2026 15:43:58 +0530
Message-ID: <20261111101358.3203148-1-r-sharma3@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN5PEPF0004698D:EE_|PH8PR10MB6575:EE_
X-MS-Office365-Filtering-Correlation-Id: cf863a90-df8c-4d66-124f-08df3fdc8a8c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700016|23010399003|376014|1800799024|18002099003|6133799003|3023799007|56012099006|261102123227099003|261009223027099003|261021121427099003|261021123027099003|261022075727099003|261022105027099003|10067099003|261028144727099003|261022115727099003|261026140227099003;
X-Microsoft-Antispam-Message-Info: /opTe0QsxrhAD3uCyvwlh3Lda7E/Q172jvjcDkAQ4YEfgk+KcmOKZ/N8Etw2K9Fcc/GeySRHBpTuasFq25WQTvViLCaLTdQmMgqSt1mnoCA+RFMTnTPO8CPS89O4Hmpk8anXYcQqiy+c95vBa+HzzAl6xhaMxV+iemd3ymhKgsTYS8YTVwMe3N1/Bu8zd5LDAD3DGs7Lb4A8NoB5ol1Po3a+aVa2E6sZhcPP92uPbJ/ZzW+G14gNjlO7oZmidCSMvLBBqZeDn5mZs7fJ14hyk0cWElVqKmTrh2DCaxWj8NfSPFoBNTmw+8YPoFxg5gkCtRjSRzOBUnYS0V5JXB4J39q+2QZUlNmpALz1F+8sfvP7+poqaAlBUpkI9Bvyf6Ua4pAOeqgF7W0UzrWsi6Hzx54DxQjGGIsnBNto2BkDMSoqCdzHHbOvdYEHuhNnF2QiriRP6QlWp1spqCj2xEqmB/DrxCq5XXaV4I54EIwDI/MnegOAT8yPQZTNc91uIpH6pxumuTU1dXux0PTxl15igVQCJK6SZ8hppwCnZdCwZFtRw/n0wb+8u/RXCdm6dHhY//QnKN/oLV1D5j2/bZwIeSqIfV57Q26SCJt96S0y1xPsHdf057fDU7QgIJNJgzE/jOJ72UqiddwAxyLZyi/niyddKD5JSHPlR0zodFBrkwgbVIm5lpCbFKaJWoUcE2B9z/0Gjalhn/cukE2wwWUPYw==
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(23010399003)(376014)(1800799024)(18002099003)(6133799003)(3023799007)(56012099006)(261102123227099003)(261009223027099003)(261021121427099003)(261021123027099003)(261022075727099003)(261022105027099003)(10067099003)(261028144727099003)(261022115727099003)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: SggtR2lYYsgYHWhoL/4aMLd8Z8Uke+BGBBX+A4I5avcMay1bac+TWQiHWrmZDgb6jviVnBoq7b7YRQXXK0qWzu39E7M1sdECn9yGFCrrp+1EGQP+MbTcdrk4ExU66nDnqcD7nUa4hQ1mPIyhGmmLdcApDWHRSjHLjZdtoCTmYxU6V5WSdOBmtsEGZopeFBR9HZS5PeRs7djPAODMiCksfjrlLtOVgBE7iNiFtAsBGlxF4W49Q3WSNorfET4thg8C8A66kRfwgBGtgD5sVOqQH3ywsbtbi+GOvVePkkXLDCnKaTz2IPAe37gXEmi7i0Ew6ksLtCSHam1zMpse4EwX4PxTWDK0BBVC2GEyJLgJrN37bU+6ffEVorJmeHncQBTj4RfvESx6OEy6bJKO1hA6LTKrR4PIY0H094qgzNLB/0/Q8b8FCnjASidE/fDh5CgW
X-Exchange-RoutingPolicyChecked: OAqykKbUiZ0iCHPUFxV3l1DR5h6URqZq13jOvLbCxq2w2eByS7OZRjLk3GZ8q39DaE/DNSpHx3V+0S51n3rjMwLDxmtiB0aW9ZWcbb+woA1TpfPpjcLkvmqiFjyhBHyGAl33eHJObXVC59m2yckuidHC+HYVfoIVVjlZ8773sJ1M7RJk774uq5EJLVp6nMLtN3KdUKPyjE9YS5H8k4wZlcQykoro19AhMmpcUsCVclJYXcy40OSRIBCWUw30AUeFnKZ/uKyGexJjndrNSRM8f7sh5Irz3xlEM/sSW539RbegXuEUdrxLVPwZWCGc8CliRGik9GUmYBf67GTyaPvQWg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 10:14:15.8557
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cf863a90-df8c-4d66-124f-08df3fdc8a8c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN5PEPF0004698D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR10MB6575
X-Authority-Analysis: v=2.4 cv=KeRHIgYD c=1 sm=1 tr=0 ts=6af43ffb cx=c_pps
 a=TKURuYQIacZDyiG+Utq8vw==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=sozttTNsAAAA:8 a=C3-p5tBX9ej98Kpk-98A:9
X-Proofpoint-ORIG-GUID: umSbT5Z9hfn74iCPrGWN7IQV6x55wBCv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA0MCBTYWx0ZWRfXwdWCPCeMq1dt
 MKHIX6wIB7zOUaCWzUsHS8dfYzbES3nxdTKtAhJkG0NfZrtFw2CF0MxwXA4KQ1doA0iRYWxWebM
 XXYWOkdZj+glClJfFcqpVT+1I0DrbIELDu0WEkJXXiqVjHwXTiGCXaUXO04cFN9f7wcvGINiu/g
 4FQvgAilM/YiDa9w115iSGva6TwE0dgnGYKrl7fxcAdJz6x2/ngij1injcMX7rKRus7UluQgz9g
 HBrcJbvWnLI15nzTKaGeX1zJ7/CqRy4AFhdRtk98wNy+OR4rXZXSPjWnfd1TsEUDo1TwIOxeSEy
 1sBt2XIalDLzXEgz4XguJ/eWsz2B515rWd0jCGXva2XpnL7scL7Ra6Q3BfXC7IBSqGdNP2WMEw8
 7EwYr389qiv/EVvhGjlOvE7CgihrDPTxzKjrXXUxBnLqeoSXGQGWHaiakJOejjiwwjfR7yJ//mg
 1mSTawNJpjuabP6caqw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA0MCBTYWx0ZWRfX+jJtRoShUU9R
 gUYe1IElFXj53K4/jLzMqko+Wa3nnzZUHdxj7KuajaxYn6WneRvzcm0yjBA5BWh64L42S8JN6fI
 OUmcaHuS3NiBKVAhAs3VPuFYC8bgQkM=
X-Proofpoint-GUID: umSbT5Z9hfn74iCPrGWN7IQV6x55wBCv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110040
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-ti@lists.yoctoproject.org>; Wed, 11 Nov 2026 10:14:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20518
Content-Type: text/plain; charset="utf-8"

Add U-Boot environment configuration to enable OLDI display output
on the AM62Pxx EVM. This includes:

- Create tisdk-uenv bbappend for am62pxx machine
- Add uEnv.txt with OLDI simplefb device tree overlay

The configuration loads k3-am62p5-sk-oldi-simplefb.dtbo overlay
to enable display output through the OLDI interface.

Signed-off-by: Rahul Sharma <r-sharma3@ti.com>
---
 .../recipes-tisdk/tisdk-uenv/tisdk-uenv.bbappend     |  5 +++++
 .../tisdk-uenv/tisdk-uenv/am62pxx-evm/uEnv.txt       | 12 ++++++++++++
 2 files changed, 17 insertions(+)
 create mode 100644 meta-ti-bsp/recipes-tisdk/tisdk-uenv/tisdk-uenv.bbappend
 create mode 100644 meta-ti-bsp/recipes-tisdk/tisdk-uenv/tisdk-uenv/am62pxx-evm/uEnv.txt

diff --git a/meta-ti-bsp/recipes-tisdk/tisdk-uenv/tisdk-uenv.bbappend b/meta-ti-bsp/recipes-tisdk/tisdk-uenv/tisdk-uenv.bbappend
new file mode 100644
index 00000000..bc061b1c
--- /dev/null
+++ b/meta-ti-bsp/recipes-tisdk/tisdk-uenv/tisdk-uenv.bbappend
@@ -0,0 +1,5 @@
+FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}/${MACHINE}:"
+
+SRC_URI:append:am62pxx = "\
+    file://uEnv.txt \
+"
diff --git a/meta-ti-bsp/recipes-tisdk/tisdk-uenv/tisdk-uenv/am62pxx-evm/uEnv.txt b/meta-ti-bsp/recipes-tisdk/tisdk-uenv/tisdk-uenv/am62pxx-evm/uEnv.txt
new file mode 100644
index 00000000..0ffda50d
--- /dev/null
+++ b/meta-ti-bsp/recipes-tisdk/tisdk-uenv/tisdk-uenv/am62pxx-evm/uEnv.txt
@@ -0,0 +1,12 @@
+# This uEnv.txt file can contain additional environment settings that you
+# want to set in U-Boot at boot time.  This can be simple variables such
+# as the serverip or custom variables.  The format of this file is:
+#    variable=value
+# NOTE: This file will be evaluated after the bootcmd is run and the
+#       bootcmd must be set to load this file if it exists (this is the
+#       default on all newer U-Boot images.  This also means that some
+#       variables such as bootdelay cannot be changed by this file since
+#       it is not evaluated until the bootcmd is run.
+
+optargs=vt.global_cursor_default=0
+name_overlays=ti/k3-am62p5-sk-oldi-simplefb.dtbo
-- 
2.34.1

