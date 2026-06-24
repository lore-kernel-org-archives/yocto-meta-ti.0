Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B08C6CDE000
	for <webhook@archiver.kernel.org>; Wed, 24 Jun 2026 18:33:42 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14444.1782326017030650750
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 24 Jun 2026 11:33:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=ecmDNNhf;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=a1M86H7S;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: afd@ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65OF2ekJ703896;
	Wed, 24 Jun 2026 13:33:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=Xvpn2nQwTheUSnWMyxpPQ728QU6OPIlCSqzB+KlL3
	W4=; b=ecmDNNhfl7gNyZEBtB6f9N4QH1rE2s73JvT3bi8nNbzEOnyq2OZIHFmyx
	RwZ5MKTJx2Fik3/FsjdE9UMa3SPD6cDLwpVTfGf87KlqtAm3UqrRkdnlDWURA474
	fwfxLFZEH1frqnhbCfZfRm7iALuhW7XYfJqpY79lwLTSo6N9OTBl8Ddzj5BKCtwF
	izh0mXniOQ/f2oqdM2bUjDAGpPw5dTLsJR+ITgNXYL6aPUBaaegn35GmIAwFpdEO
	2mzdkaOlvOizmy3e3OzGz4Sd/lkYUxtPN1Yn9GSL5Xv+JdxwWPquFzpjSxQfFMTk
	48WZGYmSU74qll0RsbTT8SYYuSvTA==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011038.outbound.protection.outlook.com [52.101.62.38])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4f0e5m2tnb-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 24 Jun 2026 13:33:34 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e+cEKvJFNu9nk9cCK13CX2NLwKM80SsqU+OW/TslVAS/krjEYyU+bar7qRhSEbkHImLpikJCX7unM5xnAoBK9dmTbTgtqDqhcOGgV7yjfppZ1bH8Ue4ME02Dx1Rth3fDrwax7lTRit5lzVIHBLrZLEOjapv4Y0onq/7m+3eWvco1b/8A01Ewn2zHhYaXwSeXqHAvTpUxEUPMMw6m1sc9CHPJJcWlr9yzq3/wPg8Wr8XeiC2wnhwVa8I/HarbXs0Urnu4tsAmN27Xw1Vl5npVKVE/89ujR5IinWhcP9j2Gv1e8rLnztW6Ct+cQaDIG/zSkViiJkc2y/6i0qNBAdIFIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xvpn2nQwTheUSnWMyxpPQ728QU6OPIlCSqzB+KlL3W4=;
 b=w2Eu/3kZL5iOU1badMUYKMIsnMAy9abv0M7Rh6AStofEffzUe9GcS2bKlhahKvP/TOBuGuDTxpGxGIoUX6TbUsQrnv4ci7y8D8oJQ7VWCYMwfTHN6HqHAesl93H2479hjxKYv5kxkeDR1CIGrDMv54l6nyvfMAfMKHtZCO6HtrpZN95DV087AZTBEgLpKFFr0znDwBCWLn2RdKP+n59a2TUT/DYQiufKjPYt9THFg3aIRgPqJZJOXJyXb8PVg/ozA5MMbviVALf+NBH1OmF6p/TZz+WV6lOV1TmGrViX5YBMR31LTa70cYJClyBxT7tsUN1oB9jMiCTUU+u6kWiN5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xvpn2nQwTheUSnWMyxpPQ728QU6OPIlCSqzB+KlL3W4=;
 b=a1M86H7SCwNij/arHVjbTxPPd0o1G76dubNVd3nU+5DMQ9CYMbme2O7/Od777evCD2sScLfcN/bIMaQe0k1qEqJPndTxtL4prZxxngmvJNk4SskiNLK+mroG/q2E50UJcMRYaX3XmawRbDw4BqLAZ8mv7eQP6nIS1vItHy2qEOQ=
Received: from BLAPR03CA0165.namprd03.prod.outlook.com (2603:10b6:208:32f::9)
 by BN0PR10MB5207.namprd10.prod.outlook.com (2603:10b6:408:12c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.13; Wed, 24 Jun
 2026 18:33:31 +0000
Received: from BL02EPF00021F6F.namprd02.prod.outlook.com
 (2603:10b6:208:32f:cafe::2) by BLAPR03CA0165.outlook.office365.com
 (2603:10b6:208:32f::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.13 via Frontend Transport; Wed,
 24 Jun 2026 18:33:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BL02EPF00021F6F.mail.protection.outlook.com (10.167.249.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Wed, 24 Jun 2026 18:33:30 +0000
Received: from DFLE213.ent.ti.com (10.64.6.71) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 24 Jun
 2026 13:32:56 -0500
Received: from DFLE204.ent.ti.com (10.64.6.62) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 24 Jun
 2026 13:32:56 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 24 Jun 2026 13:32:56 -0500
Received: from fllvem-mr08.itg.ti.com ([10.249.42.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65OIWt5n1600079;
	Wed, 24 Jun 2026 13:32:55 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][master/wrynose][PATCH 3/3] ti-rpmsg-char: Update to latest with CMake support
Date: Wed, 24 Jun 2026 13:32:53 -0500
Message-ID: <20260624183253.1130737-3-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20260624183253.1130737-1-afd@ti.com>
References: <20260624183253.1130737-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6F:EE_|BN0PR10MB5207:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d3a38ec-7669-4775-21fc-08ded21f16c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|1800799024|23010399003|36860700016|22082099003|18002099003|3023799007|6133799003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	WzsQjbeRamXjU/INADzVvj3ybIq46kLkj+Eu6WVvxAbOC6stcIZA70gG0xnXrw44NBPEkj0RrjTCUsx/iIlz4HK9KX4htpCchKg57pk7IGra9QQnLqOoUSfBhoNSdJ5KvE3O/yW5/YkfGCskkiCkFbWqd4KgukTAvB+o2M3+Z2aYfrD/3zvQB3I2VoSapVY+qe28DvdwfiWdNQg4AVO/49juGZXT1hnVv1C9IFWQGImEuCpMhIMjvwOengsjwAFzGz5DGH+ya55A/uI1h3BYHG+p93fQOpdDeCqC9xRNaesTqys8bR3k0ZAc3iTkg2CLQd2lQwlCBNzT8rsS9diaVBQemDtteSYrYFjE0PvNpr9o8LKgforTgXDDjZdeMpVIdrA0pS41JOejUhNNJrGc1s+E1Bp1Y9hJLZBHgeIQ++KCzpy7aN9ZwyAelSHB9ncCSywA3des3E6IFF9LBetEVo4/MtRN+QiUWiUWGbofJY18oNOwp4+g9aFindKurBnOqVTWwxcQY1uioG1o3sFUpVnCqB4ZsaX6Aj1AigZLHLvlX7xBN0hjO93Djp/cl1EqZhzJFufZMD179peUB/lZujjPHQAm+zUBH7ilzclIzV0z1nF62rxRUAYRRiCLXqrn7ATVl9Yljs1f7mW0e5vJ9KPk+THzK/c0cVRv4bnxkuBMuGbFfqLGMqA92gUHo6lA1DvmfI5eOZ6St049cd8ECA==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(23010399003)(36860700016)(22082099003)(18002099003)(3023799007)(6133799003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	Gda2W/wRimxwqzcDVdRAFLJgYUmaVEq/9xiaVOnvapQ5Kfpm2ZFcCfXzAtZ0r9yHd8PqfiILdgmH0EhQooojb1s27YNO3dT6BUe/D6llv0uNsvJtZf+VztDVQOjs7+DKukB60vaiI6zhlw8hB+pHmJZWzhGoOLhPEu9MnP3BQzprbNaI08gaXBASs5lKdQmyp55pk4C3bWlKnSA0JZDKgpkOj3B+X5eCAkAmF/7VOyFMOhETtTIagVJ+LKIJgHcvVD9mPJk/VHqZkI2y8fKQ/+oscUeSY3kDMY3rc4iJBqBl5fNIZ+aoN1z/ewHoaYbNXLGFwsc74+RGRqxnG/0Gyw1/3hZoQI2A7uGa5ufAAZ6rSIoPeg+/Htl38cnWrEkDwjXgHwLhg3ZCtg9YrLg4ub+1TJfNYb8EqM2GawxHGU9MgC+pU8p5X553O+XMH8AA
X-Exchange-RoutingPolicyChecked: 
	c9+rSQrodkWkmum4oYaovKWkUPcMtWoA3/ZSMrxmvmDbrcAvuhxPU58dSd/6Y8rIZMiOa/4erYeE0XFbA3TXCqIllQliacpoEcHP/awmznQz44vkVPQfP9qRmnenBVgl8noUy9ZaDR9WAo7cNAj3+lJd5jZm1wAx3KjvJqAcpswYfy2judvSZfGVQpqrBLC63zIgzjYIHZE4QZy9FqXzaptvOaLcfGKV/pLBvySfVubSEi6sQ9TDTgASJtDJl8SceOdiKVjlcMl87D2O4wjPz1jCCHa21Iu3Zk0YtMyOBpYZ1BUMQGAsAR4IN5C4kVJTHwhazpNWzcmIZPEtKAQBlA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 18:33:30.0075
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d3a38ec-7669-4775-21fc-08ded21f16c9
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL02EPF00021F6F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5207
X-Authority-Analysis: v=2.4 cv=I/9Vgtgg c=1 sm=1 tr=0 ts=6a3c22fe cx=c_pps
 a=5I5pDAtSp800fId2YpAiPg==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=FelO9ux0wxsA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22
 a=sozttTNsAAAA:8 a=pGLkceISAAAA:8 a=BX0wYEayIL8hf1ovRgQA:9
X-Proofpoint-GUID: h8QDXMrruISvx-WRdaLplBkUAENPEpZs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDE1NSBTYWx0ZWRfXz1KXd2azUEQj
 cwrysnYPh8zJY7hkEtghQgZcEu63KQrBiXahmxopli0eAD3anqwA3G6WHDiuEtTBNK8L5ncyPvA
 BBvzXF08oV/K7VG+jNUW6QBdPWa9sVFD1JS2ksTlpO1A/TE7K4t2W+AEWw8P9yU4sMSXuh369N7
 Okb0owV4bBwLtSt6vndfeO7X1P+qdO2JsUpXhpG4q5uafPKxsRtywB8xFUIWARuO8Ur1iL6rcWk
 +5Sa3mRHHyi9Onn2I9Rdm2bwlml6Z+3qwu3xPaf+KPuJILDj/eiwK2c4nNM1HdJi49Dj53ZjSHO
 rycuys29L2y5UDCj7q6tmb2bdombtzpJNSiPF8RRWLYPE36CiXZyKV/ExoCee8eAfsp1UchuAO5
 AbTIBE8EdCWnPr/Q8imdMU80KwUH2w==
X-Proofpoint-ORIG-GUID: h8QDXMrruISvx-WRdaLplBkUAENPEpZs
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDE1NSBTYWx0ZWRfX2mhmeM7MjKns
 0A2fvud1X6bDJ49bGKmpEIFwzi+CDJllSzZsM6Za4wwosyNfbNlgf2eXDkbUkZHSCTWpucoqV/s
 bHwjGONTeeIJj5PPfq5p5l24Wkh/KwY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_03,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 malwarescore=0 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606240155
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 24 Jun 2026 18:33:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20068

This project now uses CMake. This allows us to cleanup this recipe in 3
ways:

 - Remove patch for includedir and libdir as CMake handles this correctly
 - Combine in the in the examples recipe, CMake builds the examples along
   with the library in one step.
 - As there is now only one recipe, merge the .inc into the one .bb file

Signed-off-by: Andrew Davis <afd@ti.com>
---
 ...-Remove-use-of-includedir-and-libdir.patch | 44 -------------------
 .../ti-rpmsg-char-examples_git.bb             | 13 ------
 .../ti-rpmsg-char/ti-rpmsg-char.inc           | 15 -------
 .../ti-rpmsg-char/ti-rpmsg-char_git.bb        | 20 +++++++--
 4 files changed, 17 insertions(+), 75 deletions(-)
 delete mode 100644 meta-ti-bsp/recipes-ti/ti-rpmsg-char/ti-rpmsg-char-examples/0001-examples-Remove-use-of-includedir-and-libdir.patch
 delete mode 100644 meta-ti-bsp/recipes-ti/ti-rpmsg-char/ti-rpmsg-char-examples_git.bb
 delete mode 100644 meta-ti-bsp/recipes-ti/ti-rpmsg-char/ti-rpmsg-char.inc

diff --git a/meta-ti-bsp/recipes-ti/ti-rpmsg-char/ti-rpmsg-char-examples/0001-examples-Remove-use-of-includedir-and-libdir.patch b/meta-ti-bsp/recipes-ti/ti-rpmsg-char/ti-rpmsg-char-examples/0001-examples-Remove-use-of-includedir-and-libdir.patch
deleted file mode 100644
index 3539e8d9..00000000
--- a/meta-ti-bsp/recipes-ti/ti-rpmsg-char/ti-rpmsg-char-examples/0001-examples-Remove-use-of-includedir-and-libdir.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 1a26cb577ba54dd9214eeb94fed0ce3a0f4603b6 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 24 Oct 2020 23:46:39 -0700
-Subject: [PATCH] examples: Remove use of includedir and libdir
-
-These point to standard include and library paths which already are used
-from sysroot relative paths secondly, they use absolute paths which
-means we are asking to add -I/usr/include which might be ok in a native
-build but not in cross build. This helps mitigate QA errors found with
-OE build system since it finds it adding host include and library search
-paths to linker/compiler commandline
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- examples/Makefile.am | 6 +-----
- 1 file changed, 1 insertion(+), 5 deletions(-)
-
-diff --git a/examples/Makefile.am b/examples/Makefile.am
-index da34204..34ac7a8 100644
---- a/examples/Makefile.am
-+++ b/examples/Makefile.am
-@@ -1,6 +1,4 @@
--INCLUDE = -I${includedir}
--
--AM_CFLAGS = -Wall -g -O2 $(INCLUDE)
-+AM_CFLAGS = -Wall -g -O2
- 
- bin_PROGRAMS = rpmsg_char_simple rpmsg_char_benchmark
- 
-@@ -8,10 +6,8 @@ bin_PROGRAMS = rpmsg_char_simple rpmsg_char_benchmark
- rpmsg_char_simple_SOURCES = rpmsg_char_simple.c
- rpmsg_char_simple_CPPFLAGS = $(AM_CFLAGS)
- rpmsg_char_simple_LDADD = -lpthread -lti_rpmsg_char
--rpmsg_char_simple_LDFLAGS = -L${libdir}
-
- # rpmsg_char_benchmark program
- rpmsg_char_benchmark_SOURCES = rpmsg_char_benchmark.c
- rpmsg_char_benchmark_CPPFLAGS = $(AM_CFLAGS)
- rpmsg_char_benchmark_LDADD = -lpthread -lti_rpmsg_char
--rpmsg_char_benchmark_LDFLAGS = -L${libdir}
--- 
-2.29.1
-
diff --git a/meta-ti-bsp/recipes-ti/ti-rpmsg-char/ti-rpmsg-char-examples_git.bb b/meta-ti-bsp/recipes-ti/ti-rpmsg-char/ti-rpmsg-char-examples_git.bb
deleted file mode 100644
index cbe4d7fd..00000000
--- a/meta-ti-bsp/recipes-ti/ti-rpmsg-char/ti-rpmsg-char-examples_git.bb
+++ /dev/null
@@ -1,13 +0,0 @@
-SUMMARY = "TI RPMsg Char Sample Applications and Tests"
-
-require ti-rpmsg-char.inc
-
-SRC_URI += "file://0001-examples-Remove-use-of-includedir-and-libdir.patch"
-
-DEPENDS = "ti-rpmsg-char"
-
-inherit autotools pkgconfig
-
-EXTRA_OEMAKE = "-C ${B}/examples"
-
-PR = "r0"
diff --git a/meta-ti-bsp/recipes-ti/ti-rpmsg-char/ti-rpmsg-char.inc b/meta-ti-bsp/recipes-ti/ti-rpmsg-char/ti-rpmsg-char.inc
deleted file mode 100644
index f9fb0f25..00000000
--- a/meta-ti-bsp/recipes-ti/ti-rpmsg-char/ti-rpmsg-char.inc
+++ /dev/null
@@ -1,15 +0,0 @@
-SUMMARY = "TI RPMsg Char Utility Library"
-
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://${S}/src/rpmsg_char.c;beginline=1;endline=31;md5=71987db43a2159cff5ea00505c6fce58"
-
-PROTOCOL = "https"
-BRANCH = "master"
-SRC_URI = "git://git.ti.com/git/rpmsg/ti-rpmsg-char.git;protocol=${PROTOCOL};branch=${BRANCH};"
-
-# 0.6.11 release
-SRCREV = "dd4783422bf4fbed1015bfaa51054e40057b4f04"
-
-PV = "0.6.11+git"
-
-COMPATIBLE_MACHINE = "^(k3)$"
diff --git a/meta-ti-bsp/recipes-ti/ti-rpmsg-char/ti-rpmsg-char_git.bb b/meta-ti-bsp/recipes-ti/ti-rpmsg-char/ti-rpmsg-char_git.bb
index 50565300..a0043caf 100644
--- a/meta-ti-bsp/recipes-ti/ti-rpmsg-char/ti-rpmsg-char_git.bb
+++ b/meta-ti-bsp/recipes-ti/ti-rpmsg-char/ti-rpmsg-char_git.bb
@@ -1,9 +1,23 @@
 SUMMARY = "TI RPMsg Char Utility Library"
 
-require ti-rpmsg-char.inc
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://${S}/src/rpmsg_char.c;beginline=1;endline=31;md5=71987db43a2159cff5ea00505c6fce58"
 
-inherit autotools pkgconfig
+PROTOCOL = "https"
+BRANCH = "master"
+SRC_URI = "git://git.ti.com/git/rpmsg/ti-rpmsg-char.git;protocol=${PROTOCOL};branch=${BRANCH};"
 
+# 0.6.11 release
+SRCREV = "e36103aac7d9f6d64125eb917d3c69022cb86e0b"
+
+PV = "0.6.11+git"
 PR = "r0"
 
-DISABLE_STATIC = ""
+COMPATIBLE_MACHINE = "^(k3)$"
+
+inherit cmake
+
+PACKAGES =+ "${PN}-examples"
+FILES:${PN}-examples += "${bindir}/rpmsg_char_simple"
+FILES:${PN}-examples += "${bindir}/rpmsg_char_benchmark"
+RDEPENDS:${PN}-examples += "${PN}"
-- 
2.39.2


