Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5B04CDB466
	for <webhook@archiver.kernel.org>; Mon, 22 Jun 2026 19:44:19 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5487.1782157455738346075
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 22 Jun 2026 12:44:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=DmyHzRo8;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=MN5e0C3r;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: reatmon@ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 65MJaG0t3678998;
	Mon, 22 Jun 2026 14:44:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=MgYjVfGoEToiIwP9H5P92yrK0sDJhmgUjfx4uRz3i
	Jg=; b=DmyHzRo8kSHDr1bmefIEeWpyOriRTlo7YLr6ceopf+JHvy/sMHplO+qGi
	t6SN0Pgt0kMR9FzJryxF9zvDHz3y3E06Jc1cOn6TFWZI+XeShNikmflqEZ6FPbLQ
	+07J3jANkVa1MHO3C3M/51VtJybOK87Nnqwkns022fN8vlZfQjXrYTyrJ+ONBJsc
	MMVEe5bnifAaDMGfV/3LZnJHnUy2LF6fYbINF+LFr+LJBOpe+c5vAKdsnbbIBOzE
	GIE6JbK+ESE4RHQ7U4qo+RGLo7XukI4iqMBaPgG+QncyryEv5uQJ32GVRWqGhe5L
	4B5v1cv48qRUPdTaUrNJxVbH3BF8Q==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012056.outbound.protection.outlook.com [52.101.43.56])
	by m0380145.ppops.net (PPS) with ESMTPS id 4ey04ec3af-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 22 Jun 2026 14:44:14 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uB4QoW6j5splw3pG4u+bXGMpZD9fTcm9brnhQ5BMk/O5zns9cScgOOWklLt0zFDntOf1Ddyssk/JKdsinAmnbal0+abml7Re4sTz/oSg5pqhBRETejqsHqEFDBLTDa8jewQiG8TvgCObsMs7juKR6dV17cnaeLnb5+E3J7ofN4eyfGGYL1g5zkRTOOx8LA9VAHra8l4sEin8vkEFtcbf8aIGSnVmZxxOg3Z3FRxsgl3ko+yQ+yhnqbJtHpRn58hVOB5X9XWZN3lyBJ2PWYnbjmRxMYAjaAurRoO18GfGOupwID0FbKHw5fAitzHMFPO+J2tHYjIf0oVHNKa1uZH+Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MgYjVfGoEToiIwP9H5P92yrK0sDJhmgUjfx4uRz3iJg=;
 b=WowOc0df2YrYDAwgbyfsJaKdg/zQzHy5WuMFkNaN1JAneH269NZJ67+VsW8HIUkdKIeHiPb5JwmAP7STGIwFv448Vzjc2Zlqj6aKA0bMXh5vKHMFJILi82tQE/WPxaIWMgDCX/mF32wmIRrRkhz8VZETXr9Nt3UyzIesczTLNEvjlzgAgyw76M6ZdFRgMlTOu4lenv39gBP+txQNZ2Mf12zqoFSKSTXQwnmsWMLREzVEj2N8JWUKyRCIUAirK0XHPYsKPMnVxPGlUKsJ5/uk5gt/LnApq+eZ63aS1wwchvuNJ3IGn2lhMb5qYfPYThOcBO/tFNJWQLfDUeEx/9NE+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MgYjVfGoEToiIwP9H5P92yrK0sDJhmgUjfx4uRz3iJg=;
 b=MN5e0C3rtgyo95bSoJJeAgOoQjRNE5xtioDZtI1JPkjAGAFw0zeW0UjdhewF7A7db60EjHqIqm8wYbsN402vAuRN+QTjHjFO+ZB6M9NNQqnF7nwxh8csUWLEEmYlq089PYCUs6MUL3Lo3fOAnGim5r3FsLjTO9R8UfhclzlF5bo=
Received: from SJ0PR05CA0168.namprd05.prod.outlook.com (2603:10b6:a03:339::23)
 by IA1PR10MB6736.namprd10.prod.outlook.com (2603:10b6:208:42c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.20; Mon, 22 Jun
 2026 19:44:08 +0000
Received: from BY1PEPF0001AE18.namprd04.prod.outlook.com
 (2603:10b6:a03:339:cafe::4a) by SJ0PR05CA0168.outlook.office365.com
 (2603:10b6:a03:339::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.11 via Frontend Transport; Mon,
 22 Jun 2026 19:44:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BY1PEPF0001AE18.mail.protection.outlook.com (10.167.242.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.159.10 via Frontend Transport; Mon, 22 Jun 2026 19:44:06 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 22 Jun
 2026 14:44:03 -0500
Received: from DFLE206.ent.ti.com (10.64.6.64) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 22 Jun
 2026 14:44:03 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Mon, 22 Jun 2026 14:44:03 -0500
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65MJi3fp1215254;
	Mon, 22 Jun 2026 14:44:03 -0500
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1wbkYt-0000000E9ew-06Wl;
	Mon, 22 Jun 2026 14:44:03 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH 2/2] gstreamer1.0-plugins-good: Move to 1.28.4
Date: Mon, 22 Jun 2026 14:44:02 -0500
Message-ID: <20260622194403.3373710-2-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260622194403.3373710-1-reatmon@ti.com>
References: <20260622194403.3373710-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE18:EE_|IA1PR10MB6736:EE_
X-MS-Office365-Filtering-Correlation-Id: b6332596-38c8-41e0-740d-08ded0969f66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|376014|82310400026|23010399003|1800799024|3023799007|6133799003|56012099006|13003099007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	8noZBLxaDDVb/S3waPruGyDePsuF5MnhUi/8O4TcvDnjQxtRcqwsxAb8lnmXBD53r21OsH2ytyj68P10X8ZLNAMhK+jYKhbsbOhT6PsrqveYyLLXUyARuSZjr0zdTcRvbsDAcV2qQyuEPF/0ATPPFeo6qMW+gDWKZE7IZuiYCbuBZoqX6sXQNGHVt06vObvlZOE+Ee4h/8N1cqgV13atT7/rSz9ymJ6oykBZIxyJXDdwGP4uvtL7UdJ8aQNs5c/5iog/DnSLu2NAsGMvsgYpoqhjbi5iBaZlS8Q+wTnm+GzZRfgPvySvQ0Ib4TBPi9y1P+IIwTK+7a4SC9VoBwmSwrNBr/E6ontXPJjJYRiFhgwBUs5774222MdMulHXsqk1v7dPt0TBNFs0B0LW5emFcsuVIu2RSdcCxmyBvWh2PNxDBOJsTR/8Mk41ZN9KtWb/wB1pFe4GwTceXUZlZqwO2g06P970Xb3dz8y/dFKOBjpUR1EB/Uswl4Urvutu0LL8/9OBvxoQ1kuaXWLM2+myqdkDZqoWKobGT/Hb1RfJfP1Cih3rxkiSl7QHXX/vytJOjrlLpLQQIZ1uwa0Lu8olT4YczpGwlemEiiNqAnXdzZ8srFxd19uydNreMcmgiYjJ/LimHxc+lQkbLHPUj3DYx9poZrrbM26C7Ygrzyo9sku2XADKZAKnqKsvt/oY0QqoyLA4v0NWgto2ryl3/9XWyQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(23010399003)(1800799024)(3023799007)(6133799003)(56012099006)(13003099007)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	2cctFV6gW4D9a+xTcyElwJCOUoWpXkp+9e98W/3SM5Ida1seEZzFwWqCsI0hEgZ2uyuu0/VssUTT/BTaU5wMs1pQLmN6P1HmaVMSZkbhauOtuWsGgv6nsB34183BLo/82fQfM/2ivel0pQ1LVT4eKHyTf0XrSYl8XV5VNoJjHQZST2HvZNgW4YnpkMwGqPPVyy03ayvdWtNpEthDScyavIXR+LKATRVASLK0u0LawneOs5OaNNqfB6+3N3e1Yqi+Dia8Ao4nM5iut/sDWJvakweovvIhLQSUTxTVgaee+GpDWpFONR1KJLwOdwItuemLlQRedX8nxIchvgEQsQWCOfiVcPtRID+eLQ3h0hSCbJh5L7HB81xu0SUMh2TS49l+lIEMuq6UCk5oF/htaZTS3oFJ6Q2OdLDjg45s3+3rl+C56WhFhHtRq8hDnbBwUYAk
X-Exchange-RoutingPolicyChecked: 
	anO93jKqSb3i02WzEluIEMovkOtqowE994Y0AZZ6hy7ogbK5DM4Y+kw29kIE9bXqc5re1aiM75NZUTfBeGAzVJ2hDkswhGeLc6UpPT+KmA1OZhMDg4NaAGvIcLhug5yBlnuAKYbRAXTOzWXwuxiFIxN/i4vdhwcL6WdVqMepyl7I9tN75datwDuDNKRUZBOee3IyW9xj/bPcOih96mX1CBjftwKkOGllhYDeP0v4VmdbSkuIu1ymsM/UBGkFt9j/KaVq3la7mgaeuKe47g+0aDNQD3Oruamwd3WwSfQCYAnDW90wOrPCBLv3Xnv+s+DbpSlz3s9VrMFkmTcRQ6ELQQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2026 19:44:06.9871
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b6332596-38c8-41e0-740d-08ded0969f66
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BY1PEPF0001AE18.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6736
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDE5MCBTYWx0ZWRfX53c8/So+WJd6
 o0GoUlP+cVJ5YpQbTlu4X3V1uijw3fmACuVY6ewAZiFW4NcKT8A6eSIzY0HEa9q2ZCoe1xtRCyh
 XV58epwzcbe+eIwZEcgw8ZcR7l/+dDw=
X-Authority-Analysis: v=2.4 cv=X/Fi7mTe c=1 sm=1 tr=0 ts=6a39908e cx=c_pps
 a=6XSCBLYFY2RPGp+89yprvQ==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=FelO9ux0wxsA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22
 a=Q4-j1AaZAAAA:8 a=sozttTNsAAAA:8 a=KWvlojpNHRZ8j1zzLcAA:9
 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDE5MCBTYWx0ZWRfX9C3HXSabFUbR
 Q5lQ5lQyaUmfsVyglw9V5afF7C/NTM5gLJPeUhy4Fqs+kajgGpvK1hnVajOvwP9Nwm3q/t9q7Df
 +D94naLsQtlAMvL15kf1Mi3nfBygSd405/2uyhM4A34TOBRqAevPxqmrKSgr7bjg2e31Pst6ScE
 U12Npctj2j1F8yn3MuZY9CB35gPmYpJBKt7x/45rCQIuroiZKRA2+NqQz+7ult8o28bXJUmhYxG
 ujGX2zZHjV/OerXJgpRMwQLRoo3hjJKi1tqX6mtOQ1AvcjJAbKmgLz8wnPjnNboJ9B+mJnb0LIv
 7aWbnGYspY4gOgBKnTyOAr2VRUDLrM7O9HjV/ckDLc6xByLt+kixplVP7RPcLXsCTKL5EbpPIZN
 arWJTtxTD83Bl/zJEMA1TPZjXAAyiiMANAPfUPU6dsfcnZO1TMFc7bgyyHyk3qrkHAAb4ShpuYH
 AdcLQs9veALAG6Ly3Bg==
X-Proofpoint-ORIG-GUID: IHKlNb0zbhs9Zuq-1TuOqHJRsjk4dzPA
X-Proofpoint-GUID: IHKlNb0zbhs9Zuq-1TuOqHJRsjk4dzPA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_04,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220190
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 22 Jun 2026 19:44:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20049

A recent version update in oe-core [1] has bumped the version to 1.28.4.
We need to update one of our patches to match the new code base.

[1] https://git.openembedded.org/openembedded-core/commit/?id=430c35bc1e4358173ab3b6d1e2e5e94f58357359

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../0003-v4l2-Changes-for-DMA-Buf-import-j721s2.patch     | 8 ++++----
 .../gstreamer/gstreamer1.0-plugins-good_1.28-arago.inc    | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0003-v4l2-Changes-for-DMA-Buf-import-j721s2.patch b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0003-v4l2-Changes-for-DMA-Buf-import-j721s2.patch
index b4622fd6..e369eaca 100644
--- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0003-v4l2-Changes-for-DMA-Buf-import-j721s2.patch
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0003-v4l2-Changes-for-DMA-Buf-import-j721s2.patch
@@ -24,7 +24,7 @@ diff --git a/sys/v4l2/gstv4l2bufferpool.c b/sys/v4l2/gstv4l2bufferpool.c
 index d85f036..e6a60dc 100644
 --- a/sys/v4l2/gstv4l2bufferpool.c
 +++ b/sys/v4l2/gstv4l2bufferpool.c
-@@ -83,7 +83,7 @@ enum _GstV4l2BufferState
+@@ -92,7 +92,7 @@ enum _GstV4l2BufferState
  static void gst_v4l2_buffer_pool_complete_release_buffer (GstBufferPool * bpool,
      GstBuffer * buffer, gboolean queued);
 
@@ -33,7 +33,7 @@ index d85f036..e6a60dc 100644
  gst_v4l2_is_buffer_valid (GstBuffer * buffer, GstV4l2MemoryGroup ** out_group,
      gboolean check_writable)
  {
-@@ -1584,11 +1584,22 @@ gst_v4l2_buffer_pool_complete_release_buffer (GstBufferPool * bpool,
+@@ -1624,11 +1624,22 @@ gst_v4l2_buffer_pool_complete_release_buffer (GstBufferPool * bpool,
              gst_v4l2_allocator_reset_group (pool->vallocator, group);
              /* queue back in the device */
              if (pool->other_pool)
@@ -62,9 +62,9 @@ diff --git a/sys/v4l2/gstv4l2bufferpool.h b/sys/v4l2/gstv4l2bufferpool.h
 index 60340c2..cec4207 100644
 --- a/sys/v4l2/gstv4l2bufferpool.h
 +++ b/sys/v4l2/gstv4l2bufferpool.h
-@@ -124,6 +124,9 @@ gboolean            gst_v4l2_buffer_pool_orphan  (GstV4l2Object * v4l2object);
+@@ -124,6 +124,9 @@ void                gst_v4l2_buffer_pool_enable_resolution_change (GstV4l2Buffer
 
- void                gst_v4l2_buffer_pool_enable_resolution_change (GstV4l2BufferPool *self);
+ void                gst_v4l2_buffer_pool_release_buffers (GstV4l2BufferPool * pool);
 
 +gboolean            gst_v4l2_is_buffer_valid (GstBuffer * buffer, GstV4l2MemoryGroup ** out_group,
 +                                              gboolean check_writable);
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.28-arago.inc b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.28-arago.inc
index 9e418b86..a2204efb 100644
--- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.28-arago.inc
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.28-arago.inc
@@ -1,11 +1,11 @@
 FILESEXTRAPATHS:prepend := "${THISDIR}/gstreamer1.0-plugins-good:"
 
 SRC_URI:append = " \
+    file://0001-v4l2jpegenc-Add-support-for-cropping-in-JPEG-Encoder.patch \
     file://0002-Adding-support-for-bayer-formats-with-IR-component.patch \
     file://0003-v4l2-Changes-for-DMA-Buf-import-j721s2.patch \
     file://0004-v4l2-Give-preference-to-contiguous-format-if-support.patch \
     file://0005-HACK-gstv4l2object-Increase-min-buffers-for-CSI-capt.patch \
-    file://0001-v4l2jpegenc-Add-support-for-cropping-in-JPEG-Encoder.patch \
     file://0006-v4l2object-use-actual-stream-resolution-for-encoded-.patch \
     file://0007-v4l2object-Attempt-non-contiguous-if-contiguous-form.patch \
 "
-- 
2.43.0


