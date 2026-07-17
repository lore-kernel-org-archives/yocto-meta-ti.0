Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82951C44516
	for <webhook@archiver.kernel.org>; Fri, 17 Jul 2026 13:01:59 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12874.1784293311392988520
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 17 Jul 2026 06:01:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=n4BLofDI;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=Yk3xOc9d;
 spf=pass (domain: list.ti.com, ip: 148.163.150.75, mailfrom: lcpdbld@list.ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 66HCKL8c2493599;
	Fri, 17 Jul 2026 08:01:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=BxycMGO2soGT0
	s8F1dJ9Ije4j7WYeZd0GL5yczxxp5c=; b=n4BLofDIsIrzWhnUDtWkghWcHdlxk
	j4kCfpr23utiNYUsd41CwDyJot/czubRcnGBWjltpzG229U4Ws2X9CzzYGq5mR8s
	fNdhBKhZiHM8B44X6cf5YWbokYXChEnFwN34srG+gdhgXj3aOe5DAef+fSSf7nW8
	L/TJYKXZYZQKiAnlUFz0xrcYTnO+AJwIZLR5gb5aOPajmzjsHQdMt5I8xlbPY6Wv
	QwDBwEk70U1fGZMaDkYazn1iIurvXTAQ1Yb/DPRl8gcMNggByJL9aNADuxMZm3YG
	wt4iVNk3cmgnzM0u8uzfZIptJ7n3O2zsOSlkzAcIu5uEcU6sFOEFxzKmA==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013038.outbound.protection.outlook.com [40.93.196.38])
	by m0380145.ppops.net (PPS) with ESMTPS id 4ffks30can-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 17 Jul 2026 08:01:48 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gcrERynglcR5ntWimITU3VCDghzL7pdrFmt5rQgKaM7iMipS7WP4rnK+TTvn6ZnxkGHqn63WTis2XwYbxq/mcFBMbuO1Iilwey8LROw3dyZxMmZ7fGwrlj1BbdQxRz77O142Sk1XqguNVnARqdOMZQg9A2R1V1za+g4hwStGat9pswq6eiKetyZ0Gbv1DvEgRZCeJMcY+RMvUQfbpEV9gBNF694amfiiHun/uTXOyVoiWaQ07R6Z6ENl16ez8yfK3nBmD2z3PqCB5rrR2ORI8xwa+mjQ65NNB3RDoIST0tMN29OsVJdxoJc7slWkmXEBMORjVoDc/98/q9zwm5B/NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BxycMGO2soGT0s8F1dJ9Ije4j7WYeZd0GL5yczxxp5c=;
 b=eesGmdBTVIsiKVsWn2UmX0Mcig85UTsxefoc4043rYl3WU3LewiNlU6cLkt1tY2Ny2wtWha4fGUh2UROY6cPyasqN1ia7u2RzaXZ/QMjdKxFwSHn9uQHdUTIfI5FNsyzNbRVxy+FfuBmx9Vth29Qhry0k2oQm9C/oh9t+IP23yk0JFxSQHzftXdBIsZqWuaBdb71hOUeloko7SwqQSKV0Ne3BhPlpgfQ6KQZCsgBjunoQ1Wf05ob8bBwFfyR4NKR/ihZvxGspAKrLiPU2VnsWXFVie9sGIKpGD6bBisiFpjMrF1jMhZfJoWh0S+hKfRU999PedZZAAYaS4GtIQidKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BxycMGO2soGT0s8F1dJ9Ije4j7WYeZd0GL5yczxxp5c=;
 b=Yk3xOc9dUionTwJPxvZN2b9UNq/MU/mHt/7idi8ZKGozASJyeCcxsJooOk2qpertmY+WB4Xh17/uZDNLsewyyPY0cl9uhlhvUGXRxNcChJChchNNO9e1jsoQTsEubQTsMAs+WyO4+K6futiDd+Bz3R3hGrn7pABTXZc9J4OOipZQrNMLPYrNSoqCcnxs7PRzXlYKHcC+vQAh5DO2hDZAgSwcL5sLbx71zKM8yo8rYGHtx1n8qYuWgE9ag5/z6bYwrKM6dU0WX+mZFYMUfhqWJr+6ZDY3BgjBxoYDtnKAoQw5SnuOrIkFiTnQ7hGPLHcK1EGJvk0SosgbDd2wwTGgQA==
Received: from BN9PR03CA0050.namprd03.prod.outlook.com (2603:10b6:408:fb::25)
 by BLAPR10MB4963.namprd10.prod.outlook.com (2603:10b6:208:326::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Fri, 17 Jul
 2026 13:01:43 +0000
Received: from BL6PEPF0001AB59.namprd02.prod.outlook.com
 (2603:10b6:408:fb:cafe::96) by BN9PR03CA0050.outlook.office365.com
 (2603:10b6:408:fb::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.13 via Frontend Transport; Fri,
 17 Jul 2026 13:01:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BL6PEPF0001AB59.mail.protection.outlook.com (10.167.241.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.5 via Frontend Transport; Fri, 17 Jul 2026 13:01:42 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 17 Jul
 2026 08:01:42 -0500
Received: from DLEE206.ent.ti.com (157.170.170.90) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 17 Jul
 2026 08:01:42 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Fri, 17 Jul 2026 08:01:41 -0500
Received: from fllvdckhpci102.itg.ti.com (fllvdckhpci102.itg.ti.com [10.64.72.97])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66HD1fDW256669;
	Fri, 17 Jul 2026 08:01:41 -0500
Received: by fllvdckhpci102.itg.ti.com (Postfix, from userid 60899)
	id AF2892A69; Fri, 17 Jul 2026 08:01:41 -0500 (CDT)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        "Denys
 Dmytriyenko" <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master.202607162215
Date: Fri, 17 Jul 2026 08:01:41 -0500
Message-ID: <20260717130141.1790605-1-lcpdbld@list.ti.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB59:EE_|BLAPR10MB4963:EE_
X-MS-Office365-Filtering-Correlation-Id: cd7da6d2-bacf-4afb-5466-08dee4038c6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|1800799024|82310400026|376014|23010399003|56012099006|6133799003|3023799007|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info: 
	Ttt8v/ueEm12mbvIdTpGoU2p/tA2J1A651LMlgEVOncl2gwHNSQPNua8Y1sin9VlzS4hJmVlPet6+rd1H0OG5r4ALMU6wUHg4Pe5A7NNOSvGNYI8N5kL11Fwbisli5AptSYtTKMpjNKHPF0mCZktECm/G7HrfUaq+XJCoYbt7pb/jxIKkdB5PS7b8lxCWY5YEjRdTadM1fBm0/WuVaLNhJVjBLihpS07vzBb4S1KXwe8fByjuwnoQmAjCLhI5NAuaj8EMs6HKQj+n49Oj+4fIu9qOTg3grQLjzv0yt2IGa2FFtxNHey5F87spnjuD9OFGjYrdP5ztgotW7hTf2t6TosAX3WjX6v3OwqgXs42q1Ade1r7xWGWGzwovUOPEcbbXeROH7g9S4Tr8bTp3gzab/o28vy84SLJq0P+NwR/IEdochexj7Yhnvx1LWPnpz5pI5cbIn+1ZQN4lVaYcuGhGwcdca6sQ1WFIziNRwasFV+riOtbpUWw+DHpaSdaBZqBODX/Up/oe8MUh/PiYTRNMX25G674+6N8IdeY9g3J+dbATERQ0zTsnHi+pye/xWLM5LSzn9EmeSRFJ4f0WJAnBMpN+YWEirTYcF3Z4OVEtycqo87JAXJPWdiZKF9e+IsjmwO/tR97JIxIMuEuJ6Y2eOpr1p8l4twdnt1YbGhBD3DzaOvuOX+HPBME0zB7vvLEHZRahJBkemDjUXBwxcRMtQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(82310400026)(376014)(23010399003)(56012099006)(6133799003)(3023799007)(18002099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	9y+bvlBJWfmDPURmJ/djkwJl5Yuva3cKjZDH31sZK+IllY034vIs7v8WpgqJbGrLob08sxAuYC50oREaZiEVXbWgc1ZYBqLS6V0q6tiSgeSR/xogriR/tmE3dHEEVWhbB9c20nx1dBBflnTGji3c4L8nzNto82VRIg8VlrgR6S2CaNTFKpcQ+e/tGCjA56FnfjfaJn6Da51mlIApPHztHvG74nYMRohxXTMUla1dG1gn1+v4PfTftPw+UKaU4Pso+QandgBkQVMJ0xwbfk+DB7kRm9UcAIbuQ95VgT4HmhMG6Zv5Xio4GuEDYuRnGoKGxjQMHbj2DsbK+ElyKmRV4N/7FoFFKjCMPpwbtVFqQNUNIMDNOG1nvG7M7yE6DJ0HDJn8Z0eDYAmw8WaJHgzfMyJleTJHCoaHIHCre5OwzosvKpL9rncXfGLgeZZTOg0C
X-Exchange-RoutingPolicyChecked: 
	iBMGDzZbPxOru8fdAHFurhK3ujC0VwGDBU8flF4jYXQ6BlxwQll5gpnzjBZtGc+Ka1LsDfLwjvikOY1vlykEdcr29A5633qdXD4+6eEmNncpxMPyjO2YpqyzEKRYFV9cc22rgTH8sDGfI5Pq/PHLjbO2aYaOeR7E0Irz25J7TZxhrKPgcWFWwhHAk8NrsZTVqiUcmXSo2iNYly53X+ELfaaHEYw1Ojz4Pw4boBAfqbCitydBMqq1OxH/VhjEjvgGJfCFOqwuSrB8eXhXH7yox8ixnVB4OCLPC1YeJ5FYIq4+pdzaeWBqrzA5xKNYH/4mAd3y0zbSZT27RRSZUF+1Lg==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2026 13:01:42.4078
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cd7da6d2-bacf-4afb-5466-08dee4038c6e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL6PEPF0001AB59.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB4963
X-Authority-Analysis: v=2.4 cv=e9Y2j6p/ c=1 sm=1 tr=0 ts=6a5a27bc cx=c_pps
 a=iBoLJ+TzW6OYwHE2Vh/RVw==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10
 a=f7IdgyKtn90A:10 a=Vs-ZokuVWRQA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22 a=sozttTNsAAAA:8
 a=b45o4kL6AAAA:8 a=NEAV23lmAAAA:8 a=OznPVnshDsZA1M4IYPAA:9
 a=dhdsR-PFWuPJUldTnwXm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDEzMiBTYWx0ZWRfXxBKXswvFZkY0
 gsII+QZT7hg6J1rZ3n1uz/CQIzbkxR6cznVb/N8WwpJdDkvUIBZMSMEjN58hQN7QOooQmizAooA
 z7P74jvfCbDQ9paAF5H6d99Wrjmlk4KN2Z9bZKb0jooDZtpPBdH+CGfIOZCy0F/qkIXtCvfnATE
 i04DEWbSkRKEPmojga171+DzfMSxh9CsKWJcFuefcKAecTpufj5mvs7eTV5OMl/Yu1lipruzmb2
 3cpHnZ4yizkefy5Xc1OQ9V2LeeIizfJcwxIjqbYQ3/dPNKmRSd4JPXIGJ51mEEzx3VbrnyxE2wA
 NxSo/gjT4KGnURrEQSgQRHRgcQRXPb20KixR59hGpFC4Uk37i11n/Yml7VwycaS6TIkiBkQ3ULG
 BsR32PVD+vpeUjY6ILpOSTsAqktrGJz8Oc5g8siJLTUzZrqRPyj3ySOXV5lnUWlrXAv0VNiPZXp
 KQRJEknwNFz9fBEfzeQ==
X-Proofpoint-GUID: Ar6b6GcmTAIii0eq38iMRAsSpYjNDbmt
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDEzMiBTYWx0ZWRfX9FbB7vAeYyRs
 DtfwxkMHARsb9Vy3VSv4H78yWSnU/lnl33T+MvBAnLAZz/H45gQ3W+C2IamnidafSpcaXO/e5Ng
 XrVi+zTS6TP+2eGEOy/wfMON9V6uxnY=
X-Proofpoint-ORIG-GUID: Ar6b6GcmTAIii0eq38iMRAsSpYjNDbmt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_03,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 malwarescore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170132
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 17 Jul 2026 13:01:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20159

Updated the value(s) for:
  ti-linux-fw: TI_LINUX_FW_SRCREV,TI_SYSFW_VERSION
  atf: SRCREV_tfa:am62lxx
  u-boot-ti-staging_2026.01: SRCREV_uboot
  linux-ti-staging_6.12: SRCREV
  linux-ti-staging_6.18: PV,SRCREV
  ltp-ddt: SRCREV

Changelogs:
  ti-linux-fw: https://git.ti.com/cgit/processor-firmware/ti-linux-firmware/log/?qt=range&q=ec029baad8b4b147af8331a5e099ef891e5ae1f4..9dffeff8264765a462d6f96b50ba12e4ad7fba70
  u-boot-ti-staging_2026.01: https://git.ti.com/cgit/ti-u-boot/ti-u-boot/log/?qt=range&q=617c6fa1c50fab2acb3955b8888ec71ae7630769..5fb29434232110fb5a176136086d26ecb299932e
  linux-ti-staging_6.12: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/log/?qt=range&q=98bbe0d37952d0ce1b6508f108c357ceb6d58bf3..5ae038766eda6647bee6dc52c88308a0a280878d
  linux-ti-staging_6.18: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/log/?qt=range&q=4c3bfa15a22a5c6729519e730459c483c125d5db..8933766be737ed2cabb9466fce497b8bc8c1ce21
  ltp-ddt: https://git.ti.com/cgit/test-automation/ltp-ddt/log/?qt=range&q=b042b729cf573537f68fa3ea5050f5d22b07c811..dc5516f772ff621c2d7d517e094f1a4db3a972f3

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc           | 4 ++--
 .../recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc  | 2 +-
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb   | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb     | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb     | 4 ++--
 meta-ti-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb     | 2 +-
 6 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
index 88992e60..982a3512 100644
--- a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
+++ b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
@@ -15,14 +15,14 @@ CADENCE_MHDP_FW_VERSION = "2.1.0"
 IMG_DEC_FW_VERSION = "1.0"
 CNM_WAVE521_FW_VERSION = "1.0.8"
 TI_DM_FW_VERSION = "11.02.07"
-TI_SYSFW_VERSION = "12.00.02"
+TI_SYSFW_VERSION = "12.01.02"
 TI_HSM_DEMO_FW_VERSION = "11.00.09"
 TI_PKA_FW_VERSION = "2.1.0"
 TI_IPC_EXAMPLES_FW_VERSION = "3.52.00.01"
 PCM6240_FW_VERSION = "1.0.0.0"
 IPUMM_FW_VERSION = "3.00.15.00"
 
-TI_LINUX_FW_SRCREV ?= "ec029baad8b4b147af8331a5e099ef891e5ae1f4"
+TI_LINUX_FW_SRCREV ?= "9dffeff8264765a462d6f96b50ba12e4ad7fba70"
 SRCREV = "${TI_LINUX_FW_SRCREV}"
 
 BRANCH ?= "ti-linux-firmware"
diff --git a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
index 82c0441c..e40b6ccc 100644
--- a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
+++ b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
@@ -10,7 +10,7 @@ SRC_URI_TRUSTED_FIRMWARE_A = "git://git.trustedfirmware.org/TF-A/trusted-firmwar
 SRCBRANCH = "master"
 
 LIC_FILES_CHKSUM:am62lxx = "file://docs/license.rst;md5=6ed7bace7b0bc63021c6eba7b524039e"
-SRCREV_tfa:am62lxx = "bd4afc7d9dcc492b8894fe88a666c880b2fb1734"
+SRCREV_tfa:am62lxx = "b54338ab6ee648bb9bef2e9dab7550a9a1d11d54"
 SRC_URI_TRUSTED_FIRMWARE_A:am62lxx = "git://github.com/TexasInstruments/arm-trusted-firmware.git;protocol=https"
 SRCBRANCH:am62lxx = "ti-tfa-2.14.y"
 
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb
index d3a00652..da7fc0b2 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb
@@ -4,4 +4,4 @@ PR = "r0"
 
 BRANCH = "ti-u-boot-2026.01"
 
-SRCREV_uboot = "617c6fa1c50fab2acb3955b8888ec71ae7630769"
+SRCREV_uboot = "5fb29434232110fb5a176136086d26ecb299932e"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
index 61cef2a6..5e7e8cd2 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
@@ -21,7 +21,7 @@ S = "${UNPACKDIR}/${BB_GIT_DEFAULT_DESTSUFFIX}"
 
 BRANCH ?= "ti-linux-6.12.y"
 
-SRCREV ?= "98bbe0d37952d0ce1b6508f108c357ceb6d58bf3"
+SRCREV ?= "5ae038766eda6647bee6dc52c88308a0a280878d"
 PV = "6.12.57+git"
 
 SRC_URI += "file://0001-libbpf-Fix-Wdiscarded-qualifiers-under-C23.patch"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
index 153032f4..903133aa 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
@@ -25,8 +25,8 @@ S = "${UNPACKDIR}/${BB_GIT_DEFAULT_DESTSUFFIX}"
 
 BRANCH ?= "ti-linux-6.18.y"
 
-SRCREV ?= "4c3bfa15a22a5c6729519e730459c483c125d5db"
-PV = "6.18.15+git"
+SRCREV ?= "8933766be737ed2cabb9466fce497b8bc8c1ce21"
+PV = "6.18.38+git"
 
 KERNEL_REPRODUCIBILITY_PATCHES = " \
     file://0001-perf-python-Fix-compile-for-32bit-platforms.patch \
diff --git a/meta-ti-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb b/meta-ti-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb
index 5514f2e7..5dd8b52f 100644
--- a/meta-ti-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb
+++ b/meta-ti-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb
@@ -11,7 +11,7 @@ PE = "1"
 PR = "r1"
 PV:append = "+git"
 
-SRCREV = "b042b729cf573537f68fa3ea5050f5d22b07c811"
+SRCREV = "dc5516f772ff621c2d7d517e094f1a4db3a972f3"
 BRANCH ?= "master"
 
 SRC_URI:remove = "git://github.com/linux-test-project/ltp.git;branch=master;protocol=https"
-- 
2.43.5


