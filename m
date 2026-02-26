Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 024B9FC5935
	for <webhook@archiver.kernel.org>; Thu, 26 Feb 2026 11:33:30 +0000 (UTC)
Received: from BYAPR05CU005.outbound.protection.outlook.com (BYAPR05CU005.outbound.protection.outlook.com [52.101.85.1])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.67950.1772105607047737588
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 26 Feb 2026 03:33:27 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=VK3pHPUj;
 spf=pass (domain: list.ti.com, ip: 52.101.85.1, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fOPHrxmFU6DFLs6LD3QADhjPbDKWP5G6U5VRpd5i3p8cyNyXeReNuvBMMhtjBkw5Mq1ypaGw7rs6VqfvkBXhOKqxrN3M5sxWIaDPb3RZDB4wfX1IbUTuCTFqHag5uTFRwNgYdYi+mp4292DUOagaAd0Ig5JzJTpiVA7kvEx851AZrPEd39hLUhPlp7O8HiIICfLB7UZU8vVo26jLfOd+JGwonS3UpOEl51YPxtWPA9Mm20mJy61SspS9Di776TIKPRdY+QxPgzv+Q73JcrnYrCV/4Mv50uiwzHov5h2fTa5RRaRIYlLGBFbWQIR1gElDcxLve2g2iiN+XK/Kyedmfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w0pxZEMqdYo4sn1lq/VoFH9dkd9sDNZF3PXTDDuT3KA=;
 b=r4ghGrGEz5qCF/TODhaJrim4SS835MfUs7GF0yr72TgRBRMKgsh4GPUlLx4RDBPCoLVVNVqZwA3RW9lHx5VTT5cihYabZ/RmaKDWlMiSbd+jbcg3k+MKPxEv4Rtr7Qy1bBWF3aufXKbI5FeamRGd0+JjEQqo6R+YbjKPVN/BVzDLwMM5ugLqmJeBGPmNwEmpk3CBzeT2E05the4Wh2SKaJvxLv3zUOI/7AeRUjTaeXDpGGMyh9nygOK7C3HtLfj3jtKzVEJNZlAeR7V9dqCa1/q4+ssOFlf8yhdrBQoUTao/74awir8vavntgpQEGWM/2T6bOYiIAUJpuzhnCxNk6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w0pxZEMqdYo4sn1lq/VoFH9dkd9sDNZF3PXTDDuT3KA=;
 b=VK3pHPUj1ytehNnOw2ffEtUDs48B+qDsO1p5ZAVTcyXuu6yOMmuY0Hx3cua7ibLDGlssHBp+3BWYwqqCOX780DVp+YtSnE+nfECQ4p2oL0FquoYP3SCZit5oXYhdfXi72K3pKFeoCQv1ClfIRHuwtMrju7zidoxfQG0+IBUDV9qL8BIcFTAVF8BmVcMqUliLL2dsEkAniRMUAsR8s7R+jRqF4EpF4itS26VY63FJOamMuvlASmHPELShY5jJRiF+34dHpXRBbv1qs5JkTDOEIrajW5OCKXwoScvAOyAqoejRIK1kXkKvVrGeHvT7bC2rdN5W53ThH+mwRfhtZlLgmw==
Received: from CYZPR05CA0002.namprd05.prod.outlook.com (2603:10b6:930:89::20)
 by CO1PR10MB4628.namprd10.prod.outlook.com (2603:10b6:303:6c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Thu, 26 Feb
 2026 11:33:25 +0000
Received: from CY4PEPF0000EE34.namprd05.prod.outlook.com
 (2603:10b6:930:89:cafe::5a) by CYZPR05CA0002.outlook.office365.com
 (2603:10b6:930:89::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.23 via Frontend Transport; Thu,
 26 Feb 2026 11:33:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CY4PEPF0000EE34.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Thu, 26 Feb 2026 11:33:24 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 26 Feb
 2026 05:33:22 -0600
Received: from DLEE213.ent.ti.com (157.170.170.116) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 26 Feb
 2026 05:33:22 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 26 Feb 2026 05:33:22 -0600
Received: from fllvdckhpci021.itg.ti.com (fllvdckhpci021.itg.ti.com [10.64.72.33])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61QBXMcT1800604;
	Thu, 26 Feb 2026 05:33:22 -0600
Received: by fllvdckhpci021.itg.ti.com (Postfix, from userid 60899)
	id 0C225142E1D; Thu, 26 Feb 2026 05:33:22 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Suhaas Joshi <s-joshi@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <kamlesh@ti.com>, <k-malarvizhi@ti.com>,
	<s-tripathi1@ti.com>, <vishalm@ti.com>, <praneeth@ti.com>,
	<m-chawdhry@ti.com>
Subject: Re: [meta-ti][master][PATCH] optee: Update optee_os to integrate Firewall RNG changes
Date: Thu, 26 Feb 2026 05:33:21 -0600
Message-ID: <20260226113322.1467021-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260226112249.416567-1-s-joshi@ti.com>
References: <20260226112249.416567-1-s-joshi@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE34:EE_|CO1PR10MB4628:EE_
X-MS-Office365-Filtering-Correlation-Id: 79128e95-cc85-4784-90a5-08de752ada73
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|34020700016|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: 
	9hsIF1fHOW2N0aUu40BUTWw/DizhyOCNFCjUMwq795U1XXo94EDcJjumtWgE++aZsVZ+S6GXRRmfCnf5nIqaP3rPS0McmJ04FYlD9ieSErTs6MqzBSudvJ85c5Fpvam02z+swNsU8g+akbhUVEndJ8PV+/QQNhRdsK7NF/W2MRyZpf8t+/ypiMDSEDiT0kuEYnZE7uzqqFV0q9YxgEcK6eFF77Iijvn+pI0qvmCA2TtWwcdeDx54G2zZcoXW34Bglwzm1oCV5Bvu7C6IEpOpVJHFGmq5RO+EcikOfsokB8BWY+2enItky83Ij0N1S3fkcGlj1dbhak8frets85dm+Nua624yC/89HqFE18QoTK13RFfs6in0dIxP/yxyC9nguXWyS5Xob9GHm2BGius+64vh6TSsT2zQHy3jJWKA/8qyycQc302V4RPqW3kUComQhGMzujmQYTZiGG6oDWufxHS0eur1f4Ei9eRakpP5MlJzDlJU5skxTS6B9LHzRzQ3EjVL42n1+MZ3QtIown+JYmLWbm3G/jZq37HdaMx8fHzTpqVfQg31kUJyInHwoo2pa5J7+j+rn4nzws+xJkd+l+QOaOgz3B3FfVlKawW8PpM3ee5aEhKmlT6gb+z6UgQ03wKDolqHPD2b/An1ASO81+fsrFlOXU04i/V6yC8QXiBJmbF35B5wJEWKiIn7iHrOgA5Fyzx9DlolfXIfylEnpxxiuYIyrm+YkvJ2EPVnWh5YWvAq/aQ5BqJd1TKvZZro/NRLx11JC8AzQVaUy9ZCh47r8Qgr2+df11qO92Xn0KvuRnYyC22FAQSpQdmj9xIWLgdMlrM7B/SEzrn9jfjZwA==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(34020700016)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	SjlatHSsq+HYL7FKOOfJBEslGNRe1u7I7ed9PmDkUgZveaA1lUyZ7/HZi5VouCN03uKnJEmeX2bvKrLoBatulrZoUCplC9Sd8NGLxyXRX0/IJgOqeCPGvn9rr28yZIYIOTBs4qSnjqK34rf2wu2ppaSmaiqRTmx6fl8DZWb4th5H2OJ8PrEjilGEBhRS4ZmN8yWNQncwm9Iibcwkm+GP6As1cJCybUYxQFTQobe+gqQBIXKUpprNWufAhoNNmFhmTB5FXVk1wTc83jBNSA2BUdN5rv8y9BDrTIL5woTY/zvReQYX2m7sLHJ/zNH5CnMzlOWTllCRPpU4y4a1YWbwv2NPlzck8QbNcUxA7rQMzZ6rIHGQojOIdRhk9DxncANxO/s+fCg8CJYqUAzs+hp+9xOBQWreivm6xHNpTNkPWHEFV/ptMnrhFHcVONR38/Aj
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 11:33:24.6416
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 79128e95-cc85-4784-90a5-08de752ada73
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000EE34.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4628
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 26 Feb 2026 11:33:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19616

meta-ti / na / 20260226112249.416567-1-s-joshi

PRC Results: PASS

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  check-yocto-patches: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
Patches
----------------------------------------
All patches passed



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  apply-yocto-patch: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
master
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Summary:
- Patch Series: [meta-ti][master][PATCH] optee: Update optee_os to integrat=
e Firewall RNG changes
- Submitter: From: Suhaas Joshi <s-joshi@ti.com>
- Date: Date: Thu, 26 Feb 2026 16:52:49 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 070095bb2516aa0ac936a7449afbd3696=
6710cbc

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Randolph Sapp <rs@ti.com>
- Commit Subject: beagleplay-ti: use the am62xx.inc
- Commit SHA: de3bcac5598074abc3aab258416f1028bb1e338d

Patches
----------------------------------------
All patches applied



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  check-yocto-repo: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
master
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
PASS



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  yocto-check-layers: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
master - PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
All checks passed




