Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 245E0C5AC7C
	for <webhook@archiver.kernel.org>; Thu,  6 Aug 2026 14:10:18 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20720.1786025413871722207
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 06 Aug 2026 07:10:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=eVlix7W+;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=nRxnAqDM;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: reatmon@ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6769L8J2560181;
	Thu, 6 Aug 2026 09:10:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=5ZLn2S+qIsgszk70NXC5uEiDD4Q1pzTVZn5xbM9I9
	gs=; b=eVlix7W+Tj4mkKY32FZf+TDcPQlYn4VaES2oQvFuEpJml+m1GULl2uaLG
	eGODnPxvKMSS8qEGvW3SYCe+u882AB0ug3rHP9ZVPUhtbAB2oL77G3mOUDKoNvlx
	PjlVzzLzVn1DO3QKa1uXiuEumWOhlgM7y+zawUWA4vvZEAd2FXFeczfjdhZq4uNj
	b8G/ZgggnjP15Jq0dnzcfAETCqv+9QRzP/6bu9rljaEn6uZ1dvSrYs9ml2uAKcKK
	9TF0ue1rH8Haqx6uhZ7G2lmWOeaHBNtgR2dQ4bBYZ1SImNfNVKwejvcK9MCbGj0E
	AP/F/rS9ASXdxKC+z/3tV/8dFSEtA==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011015.outbound.protection.outlook.com [40.107.208.15])
	by m0384305.ppops.net (PPS) with ESMTPS id 4fvqjg9tu2-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 06 Aug 2026 09:10:11 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mWNB1ncbJ4uo3ow1s5je5jxdwJLj+CXk+i3m0clCuh9tX+3lX0Pz+CvMPPSFpEpfORwE7kC+T/PyQ1furF/HT5J4Fe0hyqUvamvf6i03bblBHuxgtqtS+oJVZmwFsmGxZ/PQReAdh5dG9BBDlG8MUrHmh4eksesfxlUQoU5TVvmSMszdd4VRPYHPr+bsr8eXCYWr5CKds7ziFKe3CbGw6ISKVd6zzCZIaEksuIj7crmeB3hnJ0Tj0fF0tDbBM3obY9CZiEdsMBdxgM10xocbO5GAfsIIQeS5oMrZ4YJFkvo+G/C0PfkoVu/QV8LkVJFQEIweaeWfd/Q524icX2Xk/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5ZLn2S+qIsgszk70NXC5uEiDD4Q1pzTVZn5xbM9I9gs=;
 b=Th8I981g5P0J1NYC21JmtQunb4+MbmIpfuBxvwyIBHAAF/XFWJpyk28+ZdKP+htY3JhQscdPBLEEViyiAQlFd8j/DBTSQg9+naYy4p+yFVgIMAkJNYX7HspYLmjNSspVJp+cWvJ8w0ZexjDDCGt8NFQj3vDW2hCaqfS7REVZ5HZ8qma62n6Nt8O+kcej3H6gxjyqOJCjzwhcCrSTFXMSZkvUaelbhU38DRpHQw7eu/atgeZqOyjg1g0eUaJiO/9HrSlRZkgHVnHs/NOO/u9mB5fJZaNl3nZBB4sLZmwXDTBlS3N+t0j5OYQnEDwlX9xuBLZ57NRCewDdaeJactps9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5ZLn2S+qIsgszk70NXC5uEiDD4Q1pzTVZn5xbM9I9gs=;
 b=nRxnAqDMsQc9rcBuJtJyAaMT0KiDuGy8FAC4LThtIaHxWOSNE/UzRUCJIaJzema9nVWcKHjd/aF0/6oYDNo+DvRFgXdH5mK4yTlreOSRl2BT0oyqnUW31Og4S5O4StrQ4O1DCJdGE8j1gF9zWySvQ+2NhjUN/PSe0M4RMh6rdK0=
Received: from CH0PR03CA0349.namprd03.prod.outlook.com (2603:10b6:610:11a::33)
 by DS7PR10MB7129.namprd10.prod.outlook.com (2603:10b6:8:e6::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.21; Thu, 6 Aug 2026 14:10:08 +0000
Received: from CH2PEPF00000147.namprd02.prod.outlook.com
 (2603:10b6:610:11a:cafe::2b) by CH0PR03CA0349.outlook.office365.com
 (2603:10b6:610:11a::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.21 via Frontend Transport; Thu, 6
 Aug 2026 14:10:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CH2PEPF00000147.mail.protection.outlook.com (10.167.244.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Thu, 6 Aug 2026 14:10:07 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 6 Aug
 2026 09:10:03 -0500
Received: from DFLE205.ent.ti.com (10.64.6.63) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 6 Aug
 2026 09:10:03 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Thu, 6 Aug 2026 09:10:03 -0500
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 676EA3qL3450022;
	Thu, 6 Aug 2026 09:10:03 -0500
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1wrynL-0000000BeCh-2ZzL;
	Thu, 06 Aug 2026 09:10:03 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH v2 3/3] ti-devicetree-prefix: set ARCH directly
Date: Thu, 6 Aug 2026 09:10:03 -0500
Message-ID: <20260806141003.2776131-3-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260806141003.2776131-1-reatmon@ti.com>
References: <20260806141003.2776131-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000147:EE_|DS7PR10MB7129:EE_
X-MS-Office365-Filtering-Correlation-Id: 517b769b-8a08-4a0f-02ab-08def3c46b3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|23010399003|376014|82310400026|36860700016|22082099003|18002099003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: 
	ZxoTMH3OLeRMXMFH+sXOWz1nsC6AtsNW0FT7AXGll1O/5PGcS87ZYwlk9APyw/kf2TFgCoey2XxFZhh881AGR5QiMi/6xyl6AUHfU3D71vQOntk6IAt4JSyG1qSqFbDiL+sX4itodbDofzQh8EFLB7GWWLt2F83/5BLyaL3haLGHZa5gnfJzJqBRd8SjbfNyIrPULmLIqIMzvw+tyJ5qlZLSkw8gN9VwLhPDmbEFdM/yxevirKR9L9GxEwaNoW8u6heiD2oUOqrhKZeJqnspTXckDMZHJqovonCPcMv48OxLAeNReZJL9H3OD7T0h1XYfZ7a/PU+NzeoclwU2Twpt21WZpscBa5leQ5M5TEHXD04gTk4mt6x4tWVYfSYo+zWmUc3alg6VwQCfC+2JlDpSRz1Z4PbvH77HJGKGkQqdN6CQlCt0A6Tq1Fsv7nF05NJViCwUYxMQWgDRWWkzobey0R3SJAseeKR5Pge+T5tujZ003olV6WFuJh2JJ1G9QciqUUbMmPqCp6acwwRf4OuK2anrumA4vKh4DJSqdAwkyMVobdTmXsokpHn3MXVnbmM/UiPbsB4GDpYrvsueNrrvr+ZwxG9TYN1+HdV9WBRIz0UiBixSfJL7qWRfdKxngWXkTnxg1AIOBmS/NEmW/O0K6khrG9nggbg6yMfRXhK+Jc5VbzdPKrJCI/g+EGZlWGrq6iMpAfi+Jn11GUmh9YrPA==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(82310400026)(36860700016)(22082099003)(18002099003)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	4ZRJb15OKF3d+WKmFiRjnVk1s4d4APbqMTCzlBVsxFAfQQVoelpv782INaxgIu3xjRiaBLYxztTK33wKQHRBzBe+NVnqtAeEi+7Oy13ktQxbTkhsckNnXAhGVdrLHsVkjMRYuZCMwliyDLAp0QiI7gDu317X88+Jbj05SbSsWJZyZDG2ASL3WfwQsoNepZfxVPRcP064KHSTbZ0XW5Fmz8Txe50uBFKZA0K/OlGnj1eFMOlvCbE8gRW6W4LnUOlDqyIKyO/ypLSZDElwVMGC1qyFWqpjlpVehRZhKGHaGWHh0/+71c2Kj9dTvXS4geQKrm1sTXmAh2Gk2mlvVoZ31uH6Q95n/pgRv06bLBPRxW7JPC8PEhM03vOD3a05l0PWbv4shXucaSr3+TSDOIBWDT1uZTwfH4IdQnRWypYc+lQPB10t+/nTltyOdok/NdC1
X-Exchange-RoutingPolicyChecked: 
	ONs/7LeisVfhXjjYmyixdJDTYMwGyNp76Nh4YESVqYMn9NefAGqzNhvJrIPGjK9CgSaZmj4DEVjacWp2tpPjiX0Gweys6YLqdDDwm7SvuZkVn1dFmftgt0cSxwkyX8slx60L7kShlESM/CzVW7vXOVOzRigV/KuFxpchly3D2/hy6mtQxdm4u/AX/mCR6XpURCa1CewrNiWyspvrdeKcMgkSPqxaSg26wzkHwu0zVcsDXGDnIUWhOcSM6fBl8Vphfp9cG27iZocr6OXpdPg6lIvQKJhXvufqP8oRaiXtO7hXO6kYNwh+sVMFh5YgrAdL4P6sLQTacKYUmD6GTsCR6g==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 14:10:07.0687
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 517b769b-8a08-4a0f-02ab-08def3c46b3f
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH2PEPF00000147.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB7129
X-Proofpoint-ORIG-GUID: 5bV1ufvSzEmxVqDZOggTzvvjLXjtdPUK
X-Authority-Analysis: v=2.4 cv=WNdPmHsR c=1 sm=1 tr=0 ts=6a7495c3 cx=c_pps
 a=+HTpKnCyMzx6Y2VIV8u7NA==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22
 a=Q4-j1AaZAAAA:8 a=sozttTNsAAAA:8 a=TQNyws8Eu_bvOnJVYgsA:9
 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDExMSBTYWx0ZWRfXwHAkY8D2LbIK
 Q7FaWl1f+0XmBJDGg2AtoLuASxNQAoMDb9Mnf2DOTmyTqBAvJdcUfgPuPejJ+76PvyxkqFSVgDO
 4RX/HDgjHITFXxkteaOBRCG2HQYZz5w=
X-Proofpoint-GUID: 5bV1ufvSzEmxVqDZOggTzvvjLXjtdPUK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDExMSBTYWx0ZWRfX8Oz/d1r2sQXP
 FTZc5+9YHtJ9+tF/e8KBPJ8eC/4HrNdIX2thE5ObYUZcumvVDzpk8muCng24nXjYD5RL6tljptS
 S8cN/8kqquggERy/3A+YK8Py/PddiYSXGCTLxGk1h0r6M9ZQ8pP027loR2/0IhE8wqkZgMp6YJe
 U+wknDjcPEqBjfLj0MdDwY3kgbZwUzC+oZfQu2evouGRFprOFxlEY4gZpGo/w56X6EXtJ92SXMa
 HH2ly/Ws3Lv7AWeI4iTJ2FxcgUjA2pMytVQIG75+ZuXAo5g0uYfLUSE1Vghu0UcyrrW3OTK7ohY
 toX+1ppObu5aC6hNpyP2B5OKrX4/ZMvyYQE1LQTT+onzDHYb13g8IbR302lUSLEtdh8CJGf1bS4
 kqXO7qzehWyvHu8+rH0jgEIghjX5aGPrDsqlurK6620ZmFTGmwLG8pQfXjYPXJqHGzfEvHQIqHw
 sNKDb49jWGINz93mL4A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 spamscore=0 adultscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608060111
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 06 Aug 2026 14:10:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20220

A change in oe-core [1] no longer set ARCH but prefers that you set it
yourself.

[1] https://git.openembedded.org/openembedded-core/commit/?id=635f85b7b8ffe4bfd5f282a98bdf640aa037cde1

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
v2:  New patch.

 meta-ti-bsp/classes/ti-devicetree-prefix.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-ti-bsp/classes/ti-devicetree-prefix.bbclass b/meta-ti-bsp/classes/ti-devicetree-prefix.bbclass
index 5858cc65..65c0134c 100644
--- a/meta-ti-bsp/classes/ti-devicetree-prefix.bbclass
+++ b/meta-ti-bsp/classes/ti-devicetree-prefix.bbclass
@@ -35,6 +35,8 @@ def get_merge_dtbs_from_kernel(dts_dir, dts_pattern):
                     matches.append(pattern)
     return ' '.join(matches)
 
+ARCH = "${@oe.kernel.map_kernel_arch(d)}"
+
 KERNEL_DEVICETREE = " \
     ${@get_dtbs_from_kernel('${STAGING_KERNEL_DIR}/arch/${ARCH}/boot/dts/', '${KERNEL_DEVICETREE_PREFIX}')} \
     ${@get_merge_dtbs_from_kernel('${STAGING_KERNEL_DIR}/arch/${ARCH}/boot/dts/', '${KERNEL_DEVICETREE_DTBMERGE}')} \
-- 
2.43.0


