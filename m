Return-Path: <p-bhagat@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D896BC982FA
	for <webhook@archiver.kernel.org>; Tue, 22 Sep 2026 10:31:04 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7072.1790073056280639684
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 22 Sep 2026 03:30:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=iHfgu+v0;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=Um6y/sDI;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: p-bhagat@ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68M8ingM3143538;
	Tue, 22 Sep 2026 05:30:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=l75yVdMRuY7Xu
	jRBUDJmxYCfwxnbLk+j1t9leQBGd0I=; b=iHfgu+v0ABH1UxoimWrG0URst6HIo
	IB7PLwdiEYgYKZL76wXMUqJL7xibcppCpx007Vg+F72W2cjbotLs8u7MxPTufLAr
	wFO669hUEsTJ18Mqb1Md6MDwLQjxJHbbjtZ/Bv5kxprxWxw/iY4alz/xf89krj2v
	8FApKIktSVL+qc8RsA3miPJDN1Q/zefq8rstDVUN8Hfiin6N2i/UcKM8JS5cB/W5
	26t4UNE8XplGZZbZhzymjtM63u/8JhLXLxpPHdnMbmb/wVpWXxrosoy6H6D9q5fg
	xhnI8nKCp5f5fk8wv+ESAAGTxK+Eu/u/YbtIcrNx2tGqKGU1NupXuenbQ==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012056.outbound.protection.outlook.com [52.101.53.56])
	by m0384305.ppops.net (PPS) with ESMTPS id 4gupea0fq4-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 22 Sep 2026 05:30:54 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZWyQbdalpSuMedcK+V0JEv5IrDfVFJs8PS7uVA/R59f2q1m5ikhmrhsENfKilBZD7CUDQ+5MafJit0gCBh0ZyLYNyLR7zD1DnI/CE2cHbfpk2ReGWRVN8oD4VAS8KJSWlL4euoR6KqNMfclrPKRifKPv2nUjXNBcsmpsFYcxKxhkmZ3PSxMaNkQjXzpA8Bwa9AexVS9GnfX78zqUZwe/AMG3X2SUhug/wi7+NpilgWOOkqnyOUw5Xeg1EhEmFYTSu4EczdKY8mc/sTZGxuZdOGDlVNgMNhirWQ901ID5dO7V6SnYtBLfF3jE2cAV4sHGznZqHPwapP3h8ImzTgwbOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l75yVdMRuY7XujRBUDJmxYCfwxnbLk+j1t9leQBGd0I=;
 b=lD1MUswNFbE+TFeNKcGfx+C6SnkH1J1yeBsqwF8aa51iItFr5xEeKdO44I1WpuFNPPfwQUpUrTEPfys4+0NfcO2W5Fn1GDN/dKY2vmxspEd+svsw8xD1Gi9TEk5lXEwN00o+DzwFdqI0D9UB2TSj6YybknqPksk4AAPQqoWUYcx2hCnFZvdylISbyxCdYdsG7zxjL9m4wxNnk7WMArWmg9CHzvL7yXaSocv9GfHl0Cp8TMdP2iRRznOl2JY8E2+QXh2UbX7hYNvOtmPS73IMYleQHbh9VveR1zezMO8SzKnHUg0yF6cgvNkjt443Zdl3jpCPWnfqgbWh8lXCvR+wWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=denix.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l75yVdMRuY7XujRBUDJmxYCfwxnbLk+j1t9leQBGd0I=;
 b=Um6y/sDIRq2dMzuDuPexhs4K6M9+2ZPtViYS3mdpTO6DXqetH6ve9OtirWTWDzMu9rHaqCbcGJl8kK2AQFvakILbZfQDJCUpz/Xl1vrFfFdFT1w5fW7F2YTXHtOEntoeYaqFDP+1OLe0R2LvAm2WCIcINjGhenoKw80PjlfRSM0=
Received: from BN9PR03CA0936.namprd03.prod.outlook.com (2603:10b6:408:108::11)
 by DS7PR10MB5069.namprd10.prod.outlook.com (2603:10b6:5:3a8::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.13; Tue, 22 Sep
 2026 10:30:50 +0000
Received: from BN2PEPF000044A1.namprd02.prod.outlook.com
 (2603:10b6:408:108:cafe::77) by BN9PR03CA0936.outlook.office365.com
 (2603:10b6:408:108::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.16 via Frontend Transport; Tue,
 22 Sep 2026 10:30:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN2PEPF000044A1.mail.protection.outlook.com (10.167.243.152) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Tue, 22 Sep 2026 10:30:48 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 22 Sep
 2026 05:30:27 -0500
Received: from DLEE206.ent.ti.com (157.170.170.90) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 22 Sep
 2026 05:30:27 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 22 Sep 2026 05:30:27 -0500
Received: from localhost (ula0502350.dhcp.ti.com [10.24.52.241])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68MAUQeT672451;
	Tue, 22 Sep 2026 05:30:26 -0500
From: Paresh Bhagat <p-bhagat@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <praneeth@ti.com>, <v-singh1@ti.com>, <afd@ti.com>, <denis@denix.org>,
        <j-sahu@ti.com>, <p-gupta5@ti.com>, <r-soni@ti.com>, <reatmon@ti.com>,
        <s-kapoor@ti.com>, <s-sinha@ti.com>, <sen@ti.com>, <y-hegde@ti.com>
Subject: [master/wrynose][PATCH] recipes-multimedia: Add PipeWire bbappend for config files
Date: Tue, 22 Sep 2026 16:00:02 +0530
Message-ID: <20260922103002.3723697-1-p-bhagat@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A1:EE_|DS7PR10MB5069:EE_
X-MS-Office365-Filtering-Correlation-Id: c44748a9-4f54-4b58-f3fc-08df189491b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700016|1800799024|23010399003|376014|10067099003|3023799007|6133799003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	02HYsz5NqvxHZAHEjOEIXsh3a/dIungp1JhxLaisXl0oMLVmolRoq1/517JpByKNp+z8SDQxnxUx/wau1v1uQtGQjdV9Xfv7DbrZP7RI61OIDDi8/xR8gWeay7p+LwLr18agL3xTM4VK+H0w6rpdVTjUNtZeovrMh/9rum17ZpR4LUHQLETrUUGYjLr4rT1NpI1o6U4Ly90ypcYw4TjJHmiBuBDv7gl0nx8l+dfR3+UQEh6VmdGcA6+s1KasPWExvACsRQVIjKS1j25gDh6Hh7omawsCNM1YLiURlTSq1OxqYKytavdMepuVF/rajP0sfNTlQuUbRiXLYNI/0idHasfIrguj8VbOm7V1mxS0zqFqSdvvUltkSJe8HwA3U1icgD4qydVeywXZffxnMwfVBpfRhYNmcMIUi2JyVy6WNF1sjLbfXTpmrecrNpXz85YM4DVgyAWvn2M7nHywHlRmt5MJO0/QgWfsr7vmY5moPmkPJboW053/BiOP7OE3rTdMYkzFmqgBRzwIRWdAb0rwizLU96lH/B4rBGozNJftBwmtcXtbPFaumicgqfEPd9JirhAE7D4/XPsvZBWbBmruPi/NJ+qwnWI0z9hPAHrD6uIifqCI5BQ7c+cbQP+KWpOuH20lmXy8ZLF79482UW+89tIJuwy1dBEhp2SlfybXxUtUcFo1ze3JYfMBepoqCgsJGyWwFYIh5yKso8zHTq1+IQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(23010399003)(376014)(10067099003)(3023799007)(6133799003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	5y4z3tGeRqGgrh8qoqMlZRTYh+AYajrzFVnWgJJU3LuiHr5GWce8M2lyN/CRmFDQJGI+9g6mPfCpO7V+F8DMdbl8k1VJ5YsGw1SdeCHhm4ZE0fsFbwqJf8WFOnFgDjvcCScyXs2KjeklRS4/U8uK42wvoJLpCt1F/gmrqG0jrc9u3NLXQCajGnZTLl0JmgMGtj3nMYFnYaLwF6CHUmdUlOZDRNIyAdf44cm4UWldsCHePXcaihJk8V34JDs5l8/itRFlHRIHcE9+J7CIq1e+7YmwC0I94US2pd935X0dwZ0LQm8yrqW09w8Eh+TvIZ1pTCeu5MHHL1SyAJSdLhpWGRs02AfxomKn+JB0Rwatrp5De3QMu3N0cvW7CU0Q2Xy+QNuUiyZI+0fMcHLK93dQe3AYvnPIqeum5Dxjbl+I3xPN8qmkrynUDXODdakF0A8s
X-Exchange-RoutingPolicyChecked: 
	h8CwOMyzeYL+loHVDFA5qZ+pDOMmeaZDz0eQuJ4mPBF6oAvu2/F+qKgHJL9HZgyZ8GBhj811xxh6PcmCRScrY1mXpruELKZ/5N2t5rgyN8Rf80pdoGwfx6dgfPkpL821QKXsYZKS9ffVsO2IkDVblTLnzNldA2jlBfV8AXJtNk+3fhhpBD1h9Os0kjKESyXE3Z1X3vfgTxcThVseVK2txpMhcF2CtGZZAsgTu/P/gXD4gdKqoxWEbdqeKbfPAhX/s4waqtsPiCMofrpOHxwd0x+N6j10T7oRgHY2QPOK/6Ymrh4mQOcaD8VWjwE+LTHZZEuPciCYTMudjxN0StEW0A==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 10:30:48.7641
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c44748a9-4f54-4b58-f3fc-08df189491b6
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN2PEPF000044A1.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5069
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDE1MSBTYWx0ZWRfX/MJnzCxGVWdk
 Y/NhLSY1rOZYEdKrlr8gHhJdIoB0iaklMkhABwmSdb90ES+XSLdURXMVes2xqc44hP63lK0NWx8
 lj8cV9dTdut6lLADp+n5KGakEE9XQikh1Q4dpUsyps1h0BP6Ib7Yu7b0hi05WEJlxFiPwUwTC8y
 15Z+VyQblf90MFZ+9p5Q1zByGDiyALTbTcCKEf/8lgWkA6bmlC+TsIVSP4DaGpmewpQrmfPqy5R
 EowCHI0aECPkBKfMKprr1mgtqQQWbXuOJzLaOSs/ZXhgynCVjgnhRjrHDOw2Z1s4k+C7E/EqT9Z
 cmGAjBrH1bFL+E3Gzo/zEwEVNSwL+6tCjfOndsyAKnCkOHgYbrqt3QZ6MFEWUOXLLy0ZClRzdNe
 6c6tigJT7HJuNWERINAA+VDuKgaK5vOiSpVqiXixa1xCpC5wVxGBj9tQAj5QHM87q0+TAcEilbc
 memKpngVG7w2mcvon8Q==
X-Proofpoint-ORIG-GUID: R0QYA9wL9VwqeGDdUkNpRlypw9LoEO8d
X-Proofpoint-GUID: R0QYA9wL9VwqeGDdUkNpRlypw9LoEO8d
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDE1MSBTYWx0ZWRfX5LJ+7tqzDseK
 Z3A/LtkDHft86z+K6kU1ICkdXztYdU31HCzf2WLl8v7Qcd6B1rad6BE7srgASR6+Fz9NCIrwym0
 Lt1M5L60+C1M5E+TfExme6IsZ+qRl8w=
X-Authority-Analysis: v=2.4 cv=Mdz5KJ/f c=1 sm=1 tr=0 ts=6ab258de cx=c_pps
 a=68eZn42HhoOzQwLNwT8gAw==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=sozttTNsAAAA:8 a=XgT7tb4lZfqlI_RVjF0A:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 adultscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609220151
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 22 Sep 2026 10:31:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20389

Extend the PipeWire recipe to add platform-specific ALSA configuration.
Add sink and source configuration for 8-channel audio playback and
capture on the AM62D2EVM as the default configuration is 2-channel.

Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
---
 .../pipewire/pipewire-ti.inc                  | 20 +++++++++++++++++++
 .../am62dxx-evm/90-pipewire-sink.conf         | 17 ++++++++++++++++
 .../am62dxx-evm/91-pipewire-source.conf       | 17 ++++++++++++++++
 .../pipewire/pipewire_%.bbappend              |  4 ++++
 4 files changed, 58 insertions(+)
 create mode 100644 meta-ti-extras/recipes-multimedia/pipewire/pipewire-ti.inc
 create mode 100644 meta-ti-extras/recipes-multimedia/pipewire/pipewire/am62dxx-evm/90-pipewire-sink.conf
 create mode 100644 meta-ti-extras/recipes-multimedia/pipewire/pipewire/am62dxx-evm/91-pipewire-source.conf
 create mode 100644 meta-ti-extras/recipes-multimedia/pipewire/pipewire_%.bbappend

diff --git a/meta-ti-extras/recipes-multimedia/pipewire/pipewire-ti.inc b/meta-ti-extras/recipes-multimedia/pipewire/pipewire-ti.inc
new file mode 100644
index 00000000..65a82671
--- /dev/null
+++ b/meta-ti-extras/recipes-multimedia/pipewire/pipewire-ti.inc
@@ -0,0 +1,20 @@
+PR:append = ".ti0"
+
+FILESEXTRAPATHS:prepend := "${THISDIR}/pipewire:"
+
+# AM62D-specific config files
+SRC_URI:append:am62dxx-evm = " \
+    file://90-pipewire-sink.conf \
+    file://91-pipewire-source.conf \
+"
+
+do_install:append:am62dxx-evm() {
+    install -d ${D}${sysconfdir}/pipewire/pipewire.conf.d
+    install -m 0644 ${UNPACKDIR}/90-pipewire-sink.conf ${D}${sysconfdir}/pipewire/pipewire.conf.d/
+    install -m 0644 ${UNPACKDIR}/91-pipewire-source.conf ${D}${sysconfdir}/pipewire/pipewire.conf.d/
+}
+
+FILES:${PN}:append:am62dxx-evm = " \
+    ${sysconfdir}/pipewire/pipewire.conf.d/90-pipewire-sink.conf \
+    ${sysconfdir}/pipewire/pipewire.conf.d/91-pipewire-source.conf \
+"
diff --git a/meta-ti-extras/recipes-multimedia/pipewire/pipewire/am62dxx-evm/90-pipewire-sink.conf b/meta-ti-extras/recipes-multimedia/pipewire/pipewire/am62dxx-evm/90-pipewire-sink.conf
new file mode 100644
index 00000000..857c344e
--- /dev/null
+++ b/meta-ti-extras/recipes-multimedia/pipewire/pipewire/am62dxx-evm/90-pipewire-sink.conf
@@ -0,0 +1,17 @@
+# PipeWire sink configuration for AM62D.
+
+context.objects = [
+    {
+        factory = adapter
+        args = {
+            factory.name           = api.alsa.pcm.sink
+            node.name              = "alsa_audio_sink"
+            node.description       = "Audio Output"
+            media.class            = "Audio/Sink"
+            api.alsa.path          = "hw:AM62D2EVM,0"
+            audio.rate             = 48000
+            audio.channels         = 8
+            audio.position         = [ FL FR FC LFE RL RR SL SR ]
+        }
+    }
+]
diff --git a/meta-ti-extras/recipes-multimedia/pipewire/pipewire/am62dxx-evm/91-pipewire-source.conf b/meta-ti-extras/recipes-multimedia/pipewire/pipewire/am62dxx-evm/91-pipewire-source.conf
new file mode 100644
index 00000000..ac7635de
--- /dev/null
+++ b/meta-ti-extras/recipes-multimedia/pipewire/pipewire/am62dxx-evm/91-pipewire-source.conf
@@ -0,0 +1,17 @@
+# PipeWire source configuration for AM62D.
+
+context.objects = [
+    {
+        factory = adapter
+        args = {
+            factory.name           = api.alsa.pcm.source
+            node.name              = "alsa_audio_source"
+            node.description       = "Audio Input"
+            media.class            = "Audio/Source"
+            api.alsa.path          = "hw:AM62D2EVM,0"
+            audio.rate             = 48000
+            audio.channels         = 8
+            audio.position         = [ FL FR FC LFE RL RR SL SR ]
+        }
+    }
+]
diff --git a/meta-ti-extras/recipes-multimedia/pipewire/pipewire_%.bbappend b/meta-ti-extras/recipes-multimedia/pipewire/pipewire_%.bbappend
new file mode 100644
index 00000000..f806d28f
--- /dev/null
+++ b/meta-ti-extras/recipes-multimedia/pipewire/pipewire_%.bbappend
@@ -0,0 +1,4 @@
+PIPEWIRE_TI = ""
+PIPEWIRE_TI:ti-soc = "pipewire-ti.inc"
+
+require ${PIPEWIRE_TI}
-- 
2.34.1


