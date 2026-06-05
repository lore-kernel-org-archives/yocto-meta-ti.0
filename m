Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA4FFCD6E74
	for <webhook@archiver.kernel.org>; Fri,  5 Jun 2026 05:36:49 +0000 (UTC)
Received: from BN8PR05CU002.outbound.protection.outlook.com (BN8PR05CU002.outbound.protection.outlook.com [52.101.57.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1986.1780637799314156045
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 04 Jun 2026 22:36:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=pb4yWpTv;
 spf=pass (domain: list.ti.com, ip: 52.101.57.41, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v/DvSV7rJGlUBVhS6BC1HJJXvppVK8q/hjuFBazrDrvrZhls+khG9vqaeFsWrrJfqAx1qFhJ7vmuBHDdO3T+R5UqjOI7Rw7uEPDgngMa3OzPSq7NUC3D0diTwFOk2iJ8e/BYsY5JriDPj3V9fJnFzUEsweAv+2P3/Aoe1E1omtxpOdbCJL6djW3BhWseqp0GUy8YiFaRsFc8NrEwHvqRa0EaDL2eZIpRzVUtlSgjeQhHOcQSCYG1jmEKowiJu9VfhXDBbtRetRwSdhv/NutXc28zk6M1+aUq7lZ+ALSChtzla9h2YmIZU5W/ghD1nHP2S1Epc1QpNs9s6NMoT9LVAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M7GYDKnAdbjA12HpSrCtrTGWs6NAZ3Vi6gFxpsqYFeQ=;
 b=fNH30P+6TOgMNwKWBESrAETopCx7ut3+OovHJ4bKmJGbTk9MrQHsrsWPBPvx/+VzX7bv9pxmroWYmYb7A/8O2act4QRstIhAzH+lICpV4znD2JpjAo5w+QQfY3+i85a5HNkdPL9BE+09nJ7xIYKZ9XGp33ld/6uVRFihyMjIOONVtO5wmjNK0kmltkKVUqYOlaJHG76T3Jf2/drH7MkDEGskfDDbE0DLnV0iONVF5c2gB6cOTgXbCDmaZ3O9L4PZ+gk8/NCc/6MSOe2q6qnmeTEY9qIiRA4fJa90P9iM/maHhwg/VMs47sK6g9PeeZuBAACb2gH7hP5Pmq8OLKfX7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M7GYDKnAdbjA12HpSrCtrTGWs6NAZ3Vi6gFxpsqYFeQ=;
 b=pb4yWpTvJkDqhh5DNQ07g75IB6YAbAKXOlZgnk4Grjpy6RuAB/6G5/NuHsAKTH9Dhpm6TbBL/0mvbEHVv8QlrtrYwmtLPlCe3ONgDSauZD9zl7bvLaoVt/NnOQGD7o5vBzhINp9e98IkPizURCLzDHqSdntwh05KNQATbSJr5kYGJTpCY3Vamb1PuGgmGSmrCVMDwb2QR9RaWGoysySORYhgonAkRS+JkqgJXcRiNffBTsZZQW6RJxvEONU71tBF0kVTOUe420J/9wAdl+7pu27JIR65WNpjbk6QfxGgyzCkv2woUx5VQ4pFCrr61LFnrkHOTrKK4opoto4R9dAMPw==
Received: from BL1P223CA0044.NAMP223.PROD.OUTLOOK.COM (2603:10b6:208:5b6::17)
 by IA6PR10MB997658.namprd10.prod.outlook.com (2603:10b6:208:5dc::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.8; Fri, 5 Jun 2026
 05:36:36 +0000
Received: from BL02EPF0001A101.namprd05.prod.outlook.com
 (2603:10b6:208:5b6:cafe::80) by BL1P223CA0044.outlook.office365.com
 (2603:10b6:208:5b6::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.8 via Frontend Transport; Fri, 5
 Jun 2026 05:36:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BL02EPF0001A101.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Fri, 5 Jun 2026 05:36:35 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 5 Jun
 2026 00:36:24 -0500
Received: from DFLE201.ent.ti.com (10.64.6.59) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 5 Jun
 2026 00:36:24 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Fri, 5 Jun 2026 00:36:24 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6555aOhv694451;
	Fri, 5 Jun 2026 00:36:24 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 0D08D9ACF4; Fri,  5 Jun 2026 00:36:24 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: LCPD Automation Script <lcpdbld@list.ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, "Denys
 Dmytriyenko" <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master.202606042200
Date: Fri, 5 Jun 2026 00:36:24 -0500
Message-ID: <20260605053624.724125-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260605051122.1422094-1-lcpdbld@list.ti.com>
References: <20260605051122.1422094-1-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A101:EE_|IA6PR10MB997658:EE_
X-MS-Office365-Filtering-Correlation-Id: b139d0a9-39f6-4647-f12c-08dec2c4684d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700016|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	GGo0K8lo4efTFFGKUC3HeQASruRz0hlgypdkt/Hj3UqdmKL4yrcj8FpkRcCh59OFJrq9A+5GDcjaYzUn+S+nt8nvoLjigmsleXWO20srLmeeKNpjwQHyX1E3nJC+6YnDdaA1uufuQfBUBfYJxe04JZROG7008NcAFd0nQjT1vUHXNoq9VYv4M15U5IzEKk4AXcMJH/vzTBZdILzZYjmgb270g95T+uLfyEtKpx555OfcttFLAyVri4yTN4dAkaEC3PunYEE+/HtaFc0Der90wjRndqgUuYvJsC16yZFc/1JGkkUVGmGsuzxfxDHTnciCyBNrM1Bm2UMQKdxvmA02pC4ijw7bTw2xHmsp7rwQWEdMDa3e11E4swP/eBaxu2StJLTefO0csUgL86F6xagZhuvL/vyZutLdWsAefAcIas50FsMVYz2c5UP0X0qAKJDBQHnccAUpdq09dRHKC6XTRLZQVAw/QPBbNYz5T0T1U94cSdDHgQkH09aPEODyWykWEkiRV5bJGZWRhknLnjdosbnjZdqQ/owerOQAQy7Qx6loFB1GHCREWYJoFEsvAjEQl164JWLhCTa/fOWdhdbJq54trgKqUViBG0PmibVd5+uhUEsmiXLUoOl1Dey/lrIGpHv1mte+O/v9JHY/LJy+ssjZ5rL9ZV0yOhCNcnrpcvgG27oGdX4sBBK9C1d5SLLAbg7eQm1chxRO8GZtJND09EpG2mjJvXecBvV26nROuAU=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700016)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	OB0WYY44JSburXMuSD89whG/SudDFuMj7/kjn5RhppJq5ELC5wKZNhDas2FJpyDDyMKOFM/T4EYB4GV/svvwZtR2Nbh5Bmf1BPTpoHBYAaJB2hLpdnlDdUTOhOiaKA3M59Rnom2WKUkGdxDsXisrxqdJcvBOMHChASih9HfluoPBPGag1uPFZCNiP2p7iYnHzmhXPnZp1MPvs0uc0Fqf9nS7/1KbG1aCXDrcYqcHHFo2AYiudpEaoXlTYXytX97bGSjTkQ5xPlG6CoFDPFpKRAYQwa3hQaY01Y/OT4KTUJsQiB31vih8Z0B6GlXskIbSMuhjsr3ufmL0sML8v5+2b+hRSEKOuDvCFhUBdjoUiEc3yd2Y+eZtLSTIwBa63oDCmOT9CMCzj+K9+NqssweYHA1L+mEPmjHacR6NQasXRoXEQ7AGVqX2/XsJmmAC+Sm0
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2026 05:36:35.1289
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b139d0a9-39f6-4647-f12c-08dec2c4684d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL02EPF0001A101.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA6PR10MB997658
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 05 Jun 2026 05:36:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19978

meta-ti / na / 20260605051122.1422094-1-lcpdbld

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
- Patch Series: [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master.202=
606042200
- Submitter: From: LCPD Automation Script <lcpdbld@list.ti.com>
- Date: Date: Fri, 5 Jun 2026 00:11:22 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: c5125291b6c100971f41d385baec4ddf0=
9a85752

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Thorsten Lannynd <t-lannynd@ti.com>
- Commit Subject: weston: fix assert firing when subsurfaces have no views
- Commit SHA: 1fb5f1718d4673b2a9c794f83e9e5e4769c39d23

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




