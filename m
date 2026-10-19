Return-Path: <p-bhagat@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F02DCCF2DE
	for <webhook@archiver.kernel.org>; Mon, 19 Oct 2026 14:02:45 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.35434.1792418557728158313
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 19 Oct 2026 07:02:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=mzkP3o/T;
 dkim=pass header.i=@ticloud.onmicrosoft.com header.s=selector1-ticloud-onmicrosoft-com header.b=PCz9csnc;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: p-bhagat@ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 69JDweul280381;
	Mon, 19 Oct 2026 09:02:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=O0BoIwjOidFFy
	pkssCyvkCAh7qxwtgIuPQFpFs6P9VA=; b=mzkP3o/Thls5uBlaJG4oiywmYbT/E
	KToKZv4Ewfo6jea9Qw8BJIPkINdu3BzSQa0sePMJOq6M8Gsz2nBN2fTiW/Oopb5z
	6z9jGpXd7/HmBfcjxLyQc9Sci2p8u50EIITZz2uy6FQTowhc5ZuXWV1sqbH7evP2
	595zn6wJ8V8QsqNhZi2VLAGZW8EitWgYbKHyo/ep1or+fc7NGCrPziAOook7X+gA
	NVZz/gOwWTXoXp5hP/bHN8lt6Bxsh0rzM0fW7PdSt7seGe4olD4rJzj0D4kNAA/e
	6OUpGiKjXIIEYw30eqfY9SPauZQ1vnnVaoKNHaNQWoQj/XGgNXZXvW27g==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010058.outbound.protection.outlook.com [52.101.201.58])
	by m0380145.ppops.net (PPS) with ESMTPS id 4hct1jpbcn-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 19 Oct 2026 09:02:35 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g9Jlz8K1H06h2oy3oAobJNaCRApo1JhqRe8tVqLkFEdQIIHhoR8SIRNtkOurWDTNJ+r9pEvNrMAPBJBJqvTvxmT60+4WyvxTzwsSm/k5KyIy5xOCRJpWDBUdVeqhEESlWoVUHUEyHovdakpZ2UNIGy0EFgolj2dkp5z+WHWk/+0NMYVvAEicKwbXYK0l54KRzlRbSm4cmqqY6hTMjGVSZdsbUaRdnVoZPICycZXwkb90dg4xH+nwQ4/q1GWMp8RwzAJexUqu8w7TuCKXjUUaHEXbOLZPPBuSdkjmtTGmA+HrzYJ/hvDf95tptdfqUBdrMChnFuKQCsEcb9uAR+Ty7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O0BoIwjOidFFypkssCyvkCAh7qxwtgIuPQFpFs6P9VA=;
 b=mrf2jP+ZXDlE63JB4kkadXPYbn5It/y6/8goQgi2BAVPFNQi7Gl9PlH0ca7tJ01Kiajk4/wdC9jNZ3kagUIG5FwRbmPKe0C/BNliVtp3gWmmSKMGXjzbNthSFPDusbQ94wZSUAo2voZ5QXSJMOrVcCNtO5Mpw8pWHzUObWfQoQUfVULvFouNyxNoL9qzWlI3u3Z1k8lKp65oWC/S0Ek1Q/XeilCt2VRGJlBiLAnS4nZO/VN7QIHZzbzijGCGA+T0HbX7JWXA3J+Z6a2yKmeEEj1I9Tm5qSin1sRaEwQg/w+UkTtZJ8/h9EFC0FrJLJtf5+EZ17LQNmWYeFrUPKDrXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=denix.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O0BoIwjOidFFypkssCyvkCAh7qxwtgIuPQFpFs6P9VA=;
 b=PCz9csncz/gop2scLbNvArk1C9pO8wFePswGkPK6dAllB0UXVkA8TaJQvaOLEHsohDU5ZbrnEBcfe1OULDHjwekGxCUAw8D/Lw+sZxqusLSYphYP499A9I9rucVjWLFG3gDW94WTDjM94tBMps7XCyvREE6h6Fm9Cv6eDKXeN3M=
Received: from BY3PR10CA0014.namprd10.prod.outlook.com (2603:10b6:a03:255::19)
 by SA1PR10MB997715.namprd10.prod.outlook.com (2603:10b6:806:4c0::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.14; Mon, 19 Oct
 2026 14:02:30 +0000
Received: from PH7PEPF0000000C.namprd04.prod.outlook.com
 (2603:10b6:a03:255:cafe::1) by BY3PR10CA0014.outlook.office365.com
 (2603:10b6:a03:255::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.19 via Frontend Transport; Mon,
 19 Oct 2026 14:02:29 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 PH7PEPF0000000C.mail.protection.outlook.com (10.167.243.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Mon, 19 Oct 2026 14:02:28 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 19 Oct
 2026 09:01:25 -0500
Received: from DFLE208.ent.ti.com (10.64.6.66) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 19 Oct
 2026 09:01:25 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Mon, 19 Oct 2026 09:01:25 -0500
Received: from localhost (ula0502350.dhcp.ti.com [10.24.52.241])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 69JE1Nkt3870007;
	Mon, 19 Oct 2026 09:01:24 -0500
From: Paresh Bhagat <p-bhagat@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <denis@denix.org>, <reatmon@ti.com>, <praneeth@ti.com>, <v-singh1@ti.com>,
        <j-sahu@ti.com>, <y-hegde@ti.com>
Subject: [master/wrynose][PATCH] pipewire: Set default audio targets and use S16LE format
Date: Mon, 19 Oct 2026 19:31:11 +0530
Message-ID: <20261019140111.3881999-1-p-bhagat@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PEPF0000000C:EE_|SA1PR10MB997715:EE_
X-MS-Office365-Filtering-Correlation-Id: 160d66ae-37ab-4c82-ea29-08df2de99c80
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|23010399003|376014|36860700016|82310400026|56012099006|261009223027099003|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	5+QdLL37UnqDIbGetofi61mu2VavlnhAbRQ5KcEenJjrdMkmWZwZyTb2AzcFNV+zRD/INgPkQPN4vFy8wu3dARPNfuCqsCRI7jj5Ue82FUU4bjQ4QFvnvasw1+4CkMjZXCypsQRUppyzqqA65t/vISdJT0LcQUwgDIpX/dQXyZ+Xohf93YEzhHXHhwUoYcz6kYMosr1OEF4LkXZJX/B0nsxZ+Bd0fj+Cef6Sny0ggzdUmPMZuoiJJhzIk1sxC54OS6RtVjm3YPF2OzCh9uQZofw4fN3t4XnMek75SkAwEpqGIFbKJYsfGqnZZT+lmS7j+/dF1Dx8oYBN2fpbu7uPeZF7gTsTpQ0SzNZMY1DP/sbq+wwEYg7EyCGJNen08Uq51DZrxc8Z83M3tJCSciU1iWprRmP+vJsennLqq2+fa8ivQb53fC1BU9eSQD0wRnmx7+0f/XMoiofRRFP70F33NEaGXUK9nVvYDk1tEt0E6KwuHi/dceBKjZEokoXCrKQ+oNwDyOvK2IhCmZ25wI8DiR6lId+Sa+dKcRUGBbZhtLKjH78KDsLjmYYJFIrJK3HuJes7BDJmDZ34mvXIJan79btBHeJtHceJTpz+qMvG1QYTT9tLNj+pb4WlPRYHYP1rI1uzDnNMBQDGxnaBx1JUmSQyd5e9b92H+3ITCI2fKD5kqr8u5sOPuPKcVeIgHQeR2E4qD19kPnw2Mr3BwphDTA==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(36860700016)(82310400026)(56012099006)(261009223027099003)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	jRSMaBFIc8n2sbErB5D6CJfwCd7bgQ+2zIf1MdU12aIWUcI4Te4nVTtcTcD6NjSt/d5YNHkKsVSSCOihtoegxgVZHBWOpEL3nAfweT59n7feNqaZZC7Xerb6OOutomqNClg0z2VmmlYCEoc5VTxM+iG1DDisku2BxVuv7GOxx/LmriU3z7GUNiS57SfQb2UIRGNAXWec1eHo2MaDpeSQh5AZJj+l1k1Is0DzXSNfDlsQsC7hyrj/ZbkOfFaBaYhS2BxYcl2XIZw16DJcwPWN0QdzEtMNJrkhJYW148nNhfHOl3kczXF/9UYNG/QP0oaYsIgaw9dmMU1erLDh9doYSSGTjEhnDyhunJL3su7K+vCJrcrihW5TmBsNRGnF30WV7OZx0p4PlymAXRlelFQJchZNO9KC76DAB9fXHnIjMQtsMPp23FopSO1X/jgMIkfw
X-Exchange-RoutingPolicyChecked: 
	zAtQE7N4Zt/OCEnG5Vo3u/LtiIJohhUrUDmDQDUBkwa8eyOBELAOZsPmZgtpgHAbLNVli6SNdsPw4pw8wlon2vUKXXaF46V7GMmyttcXk/KqBd93R45FATljhrjP8CjXeiFFTsVN9sUliyxPlN6YsxfUda1h5yy5MyWhm+z6jKeNTFZbhUDDEzncCLZUt4riAKjwGw/9jUutp2JhkH9GpghwFqc/cPEpYh16Wxd1kpVLu0QWmjSik9iLH6edFtWVDdSuOLhvWkVouAbMoqhuQY+MNP4jaic/C7v5IkhlO9QxMvafLXDv9qj+46yKuk8HsElO3RJdE0V4VKbVEITanw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2026 14:02:28.5114
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 160d66ae-37ab-4c82-ea29-08df2de99c80
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	PH7PEPF0000000C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB997715
X-Proofpoint-ORIG-GUID: O_LLtlWx-jq2OQDFLFCeGqSAiaYoyaft
X-Authority-Analysis: v=2.4 cv=ZN9CCn7b c=1 sm=1 tr=0 ts=6ad622fb cx=c_pps
 a=jKN40M1qUjEArv1iOeQWeA==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=660iZSQnnn4A:10 a=AlMIdn_sM9wA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22
 a=sozttTNsAAAA:8 a=nhouiWvp2GeSNFgeDfkA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA1NSBTYWx0ZWRfX5i9291WTCAky
 BBWB3L1YhWVhl9gL31009rwTF93eCVUXkzoLdq2GHOqRIkLi0Gk4g54orMmv6xzuyIIO3NoWHdQ
 Oj/u5bPu1bJ3PtwnGuKxa+t2aYeK5YB0T/ma3VkEqb1VfEys3mM0IfOrheOmhFieeAl9XM9lk55
 iyYWV+PeSj3ZboJkFaxX20CPiV0jYDHnvTPwkz9hf9+I6/93+xdHEMtY1KQIzoyNgWj/tMTTjNN
 WT/g106B5oVoBywTSCw8whCG4+bqBK85KAUhAjLcLWkmT3HvUAusAo99QwX1GuDzkzZubcasmcf
 dlC4SbIcljBDK5GW59+aW/ElHZVxnWwWIGmnzKgDmHqmW5DgT+svRuCqrxXzs4Zh+8zXw7pETI3
 vQONgxEgYylXch8UM490qUbFpa74tIYJmoa6HOi6ybjOJgtDQ3YweF3NdLbjC2m5XS7XBmsNSb/
 xVGdoxU6SQZtc7ia7cQ==
X-Proofpoint-GUID: O_LLtlWx-jq2OQDFLFCeGqSAiaYoyaft
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA1NSBTYWx0ZWRfX625EhCvlB+t6
 tzIQglsdlLj2NV54s3quZuPQ7Gb9uzfstbk/5qW/x41vtCOcYk6r3i3Gv4rXO26xA+sB5qWbNuU
 maQIGrqvmvvN3BAi3HJfneB+YthSZ7Q=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_04,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190055
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 19 Oct 2026 14:02:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20466

Configure PipeWire metadata to statically initialize default audio
targets sink and source at daemon startup, by leveraging WirePlumber's
find-selected-default-node hook priority.
Also update audio format to 16-bit signed little-endian and
audio position for AM62d.

Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
---
 .../pipewire/pipewire-ti.inc                  |  3 +++
 .../am62dxx-evm/90-pipewire-sink.conf         |  3 ++-
 .../am62dxx-evm/91-pipewire-source.conf       |  3 ++-
 .../am62dxx-evm/92-pipewire-defaults.conf     | 24 +++++++++++++++++++
 4 files changed, 31 insertions(+), 2 deletions(-)
 create mode 100644 meta-ti-bsp/dynamic-layers/multimedia-layer/recipes-multimedia/pipewire/pipewire/am62dxx-evm/92-pipewire-defaults.conf

diff --git a/meta-ti-bsp/dynamic-layers/multimedia-layer/recipes-multimedia/pipewire/pipewire-ti.inc b/meta-ti-bsp/dynamic-layers/multimedia-layer/recipes-multimedia/pipewire/pipewire-ti.inc
index 65a82671..e6a92202 100644
--- a/meta-ti-bsp/dynamic-layers/multimedia-layer/recipes-multimedia/pipewire/pipewire-ti.inc
+++ b/meta-ti-bsp/dynamic-layers/multimedia-layer/recipes-multimedia/pipewire/pipewire-ti.inc
@@ -6,15 +6,18 @@ FILESEXTRAPATHS:prepend := "${THISDIR}/pipewire:"
 SRC_URI:append:am62dxx-evm = " \
     file://90-pipewire-sink.conf \
     file://91-pipewire-source.conf \
+    file://92-pipewire-defaults.conf \
 "
 
 do_install:append:am62dxx-evm() {
     install -d ${D}${sysconfdir}/pipewire/pipewire.conf.d
     install -m 0644 ${UNPACKDIR}/90-pipewire-sink.conf ${D}${sysconfdir}/pipewire/pipewire.conf.d/
     install -m 0644 ${UNPACKDIR}/91-pipewire-source.conf ${D}${sysconfdir}/pipewire/pipewire.conf.d/
+    install -m 0644 ${UNPACKDIR}/92-pipewire-defaults.conf ${D}${sysconfdir}/pipewire/pipewire.conf.d/
 }
 
 FILES:${PN}:append:am62dxx-evm = " \
     ${sysconfdir}/pipewire/pipewire.conf.d/90-pipewire-sink.conf \
     ${sysconfdir}/pipewire/pipewire.conf.d/91-pipewire-source.conf \
+    ${sysconfdir}/pipewire/pipewire.conf.d/92-pipewire-defaults.conf \
 "
diff --git a/meta-ti-bsp/dynamic-layers/multimedia-layer/recipes-multimedia/pipewire/pipewire/am62dxx-evm/90-pipewire-sink.conf b/meta-ti-bsp/dynamic-layers/multimedia-layer/recipes-multimedia/pipewire/pipewire/am62dxx-evm/90-pipewire-sink.conf
index 857c344e..bd91a9a7 100644
--- a/meta-ti-bsp/dynamic-layers/multimedia-layer/recipes-multimedia/pipewire/pipewire/am62dxx-evm/90-pipewire-sink.conf
+++ b/meta-ti-bsp/dynamic-layers/multimedia-layer/recipes-multimedia/pipewire/pipewire/am62dxx-evm/90-pipewire-sink.conf
@@ -11,7 +11,8 @@ context.objects = [
             api.alsa.path          = "hw:AM62D2EVM,0"
             audio.rate             = 48000
             audio.channels         = 8
-            audio.position         = [ FL FR FC LFE RL RR SL SR ]
+            audio.format           = "S16LE"
+            audio.position         = [ FL FR RL RR FC LFE SL SR ]
         }
     }
 ]
diff --git a/meta-ti-bsp/dynamic-layers/multimedia-layer/recipes-multimedia/pipewire/pipewire/am62dxx-evm/91-pipewire-source.conf b/meta-ti-bsp/dynamic-layers/multimedia-layer/recipes-multimedia/pipewire/pipewire/am62dxx-evm/91-pipewire-source.conf
index ac7635de..467ae525 100644
--- a/meta-ti-bsp/dynamic-layers/multimedia-layer/recipes-multimedia/pipewire/pipewire/am62dxx-evm/91-pipewire-source.conf
+++ b/meta-ti-bsp/dynamic-layers/multimedia-layer/recipes-multimedia/pipewire/pipewire/am62dxx-evm/91-pipewire-source.conf
@@ -11,7 +11,8 @@ context.objects = [
             api.alsa.path          = "hw:AM62D2EVM,0"
             audio.rate             = 48000
             audio.channels         = 8
-            audio.position         = [ FL FR FC LFE RL RR SL SR ]
+            audio.format           = "S16LE"
+            audio.position         = [ FL FR RL RR FC LFE SL SR ]
         }
     }
 ]
diff --git a/meta-ti-bsp/dynamic-layers/multimedia-layer/recipes-multimedia/pipewire/pipewire/am62dxx-evm/92-pipewire-defaults.conf b/meta-ti-bsp/dynamic-layers/multimedia-layer/recipes-multimedia/pipewire/pipewire/am62dxx-evm/92-pipewire-defaults.conf
new file mode 100644
index 00000000..fac730b1
--- /dev/null
+++ b/meta-ti-bsp/dynamic-layers/multimedia-layer/recipes-multimedia/pipewire/pipewire/am62dxx-evm/92-pipewire-defaults.conf
@@ -0,0 +1,24 @@
+# Default target nodes for AM62D.
+
+context.objects = [
+    {
+        factory = metadata
+        args = {
+            metadata.name = default
+            metadata.values = [
+                {
+                    key = "default.configured.audio.sink"
+                    value = {
+                        name = "alsa_audio_sink"
+                    }
+                }
+                {
+                    key = "default.configured.audio.source"
+                    value = {
+                        name = "alsa_audio_source"
+                    }
+                }
+            ]
+        }
+    }
+]
-- 
2.34.1


