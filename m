Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48B40CCFA00
	for <webhook@archiver.kernel.org>; Fri, 31 Oct 2025 08:25:36 +0000 (UTC)
Received: from CY3PR05CU001.outbound.protection.outlook.com (CY3PR05CU001.outbound.protection.outlook.com [40.93.201.35])
 by mx.groups.io with SMTP id smtpd.web10.10647.1761899132348710573
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 31 Oct 2025 01:25:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=emDLmiU7;
 spf=pass (domain: list.ti.com, ip: 40.93.201.35, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=thXPF3kpFFzjXEX78C2MaCv8wrtkUJGGl1mOyWSoQ2YdRJPa2k3Tn5qYtFmDhs+ThAtkY8X97sQF8VdD/6nSZvSgmdTJEfNyJgXryBPrj77z+TLMJW8vCjQc+Dza8nIz3l6xAz9/mPxsQlPYHtMmvYog+vxfL0csl+tYrPA6vrhnhnIwct7g253m1Is4ygmsWTFp5omfmuBHcJowBOXel6gjSEELFwKDTWk3RM5xQ8D6RiVj3CIPwVnuD00iqMqDEX7atHNWKbYw+RtE7kwEgUjzPzndheVNoQBz8TNSB99H1w7LiudxKcuMHhujrMn8E9QAp1IKW9EAYRJf18tYbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XNvfUjiXQtWlEQtzKhFFC+gQpgAP8jeTerc+k/FgBp0=;
 b=Ut0CT4iU9fz82LigyOJNcU0cKekWDb3WkEbjHcKRm7+KpyZTuR1j4tMr+C2dT53a0llInnjx6ZnIKIhKPrr0lnnJCb6FBKsXkekSVnWSeuJnErW0yLVJKlsY2FZC3gZ8PHYAb5wvhDKKZ4pBHDWnUEd9vqN/GDSHxzgIygkuDe8bLJR+TaAyjd/vNzRwFqaNgvNJi7R8fsSY7I9Q1J4UJUUGb7Myq9YXdsmBAznYT+/cTElcjs+3jbMdRyQXDf4MMoRO653c4wrNohKW9+eviC8WMOPbUWW9FXhD07PtNISA+P6FIxmQ6+q1J34qXmH8BORMVvxC227DfPMlQqszVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XNvfUjiXQtWlEQtzKhFFC+gQpgAP8jeTerc+k/FgBp0=;
 b=emDLmiU7jqegV3LhRGphsQbDy+UxTMdRvhdVP3IbgGzDggeEqZNZfjra0cgSe7te0cWWsQwNCh/oCghvLXrcn1i+MDBKKzSm+qMPMGS0wA2x0o1WnjyOM3R2zhyUehdKpHHMGoGhcldHHJNHb0dVH8CADAU7lh7QJQTm50vJqH/734OyR9F2YLjm9QLHJERo6LIltUVYL3NiH0Y1vgsdaIX8sVcis18wRzS8+2c1NI3Vl1QARE3uRMkCAYrG5UWoqOwf4KwLYXNQ7wLcl2A2ygh6uU7CQEfFVd+MyzcJr1d3U6qRFEL5DDt53Wg/7Oc68Znit0j7KoVxlMndX3kaOQ==
Received: from PH8PR05CA0023.namprd05.prod.outlook.com (2603:10b6:510:2cc::8)
 by MN6PR10MB7490.namprd10.prod.outlook.com (2603:10b6:208:47d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Fri, 31 Oct
 2025 08:25:29 +0000
Received: from SJ1PEPF000023D6.namprd21.prod.outlook.com
 (2603:10b6:510:2cc:cafe::da) by PH8PR05CA0023.outlook.office365.com
 (2603:10b6:510:2cc::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.5 via Frontend Transport; Fri,
 31 Oct 2025 08:25:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ1PEPF000023D6.mail.protection.outlook.com (10.167.244.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.0 via Frontend Transport; Fri, 31 Oct 2025 08:25:28 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 31 Oct
 2025 03:25:15 -0500
Received: from DFLE202.ent.ti.com (10.64.6.60) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 31 Oct
 2025 03:25:15 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 31 Oct 2025 03:25:15 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59V8PFD33329115;
	Fri, 31 Oct 2025 03:25:15 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 68AFB13F536; Fri, 31 Oct 2025 03:25:15 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: LCPD Automation Script <lcpdbld@list.ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, "Denys
 Dmytriyenko" <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master.202510310100
Date: Fri, 31 Oct 2025 03:25:15 -0500
Message-ID: <20251031082515.1037435-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251031082130.3317930-1-lcpdbld@list.ti.com>
References: <20251031082130.3317930-1-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D6:EE_|MN6PR10MB7490:EE_
X-MS-Office365-Filtering-Correlation-Id: 6fc8ef8f-24d5-492e-ac0c-08de18570c76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|61400799027|376014|82310400026|36860700013|34020700016;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?2WL8fvR1FgXb4lNbzwkOMoTSmGoipcvZhlkNslPPb5WP4TpxBfiw+/JDc28z?=
 =?us-ascii?Q?+fkscYp8ptgIWAobYes9wBXHRtfaDRVeZNf+NkcPOMM/IBiSA/DDh1UpFF0c?=
 =?us-ascii?Q?VAoSd4bdakri7Kv6SGGTlf3/BxjHzNVzCcH5+iCi3lT96/hj8a2oEQoaWE49?=
 =?us-ascii?Q?voV+IOrOaiYB1UgjE18n8cuB0pGPxS4h9zd/chwLhfGbWYILQo0oGBLRkLdp?=
 =?us-ascii?Q?Bpdvtser1WmXEQwd3+TDnqoZ52OdlKOdbaLD46gSd6KOkmN0Qo5XEoE0szLL?=
 =?us-ascii?Q?9xP6pyA6/Vs1K0ACBXLe+4ilBfe9ebbw/VGmambXi8lFCNCUJ2mtxyDyqi7z?=
 =?us-ascii?Q?Br7Xe0bdpEChuHy8t7cwsm3dcl14ZjEEmmF01G4tpMap5HKoKhHnsjHtmiDi?=
 =?us-ascii?Q?/NlE//y+DU6lxgw1DKwG/Wvvcc8m1FXeOIYJIn+WFsmF2GxQEaiMo/p+RG91?=
 =?us-ascii?Q?Pg7iYu2ZnIhnu99TIzEvnoc8fMWfRDjvAC7/vfkDisBps+3KGERWjwDwD9NT?=
 =?us-ascii?Q?2bjbXrENTToybPNubRoRBtSomS20qVuJnDbYMDNcz7FsJ5wHQXBtr0/enhTD?=
 =?us-ascii?Q?tqwPXWptw7i7u9W2uoA/fox2N7C95zbQjjOHpaEWSc4v8Lq0b5VZ7J9zceqg?=
 =?us-ascii?Q?UkVYAjPCI2IDYK1vVeIBJY9uJqvzMvOu+USPEMDT3rj3GAETeZjWt6GVUCXv?=
 =?us-ascii?Q?9AgUG9rWA2PqA9MFEP4OikBT73ZSPsXdySiUO0CJbtiviCuWvEZUVTyFVLhv?=
 =?us-ascii?Q?MRAzEXk3yofVBJUI37XCrhHmOFFl2khHZ8k7I/PbH3gN3iYEHbih7JHi3Ir5?=
 =?us-ascii?Q?M8G0rGEqK+WvLj9sMZejVIrpZNLKA6YASJMnU/gctdt1EBgfmpbvD4PL8Wuo?=
 =?us-ascii?Q?Cgn1xg+mK/u1z1Kkfm8B8nNU2B0t+upuB/34j5BSLDGK27j1aibU0PDTgo9q?=
 =?us-ascii?Q?EkXNVOukh/iOJbY9D09a8rhhMtddOU2z77nPyRozF4Etwa/o73KgSMgeigEO?=
 =?us-ascii?Q?hIa3mkjtUETB3Gcn8pmYoJrKXj6NbjPr9c7wqoexYhAvwynoE0KlNYHGnX8j?=
 =?us-ascii?Q?yWuRxcdt6J11s94garPDO9qZXqMN2UNLluFHuvTFFpq+LRjJZwH31Fsr6Bge?=
 =?us-ascii?Q?YzGVC4nFdiwM9/0/pivDYvAIaReQ38Uk2fXpahcTgFDKOU6WBKPElZavBPSw?=
 =?us-ascii?Q?dGIKo17IluZIge9WzaZt/RH1ea05YGdpoGpdcz+rHcUUzlEaaQtbm5l3sykN?=
 =?us-ascii?Q?yf/6M/s+oWMrUEKv6S6Q7Z347Gz3Du4Iklb7PsFRmWoJZLN90Qij39xNZ+8b?=
 =?us-ascii?Q?JLWZzV9/HCgEsWtytISCva0N+zmXnJ8aMgS8saGtkpb6fNMHEIWBLI42i0kX?=
 =?us-ascii?Q?nOj13FX3u2rxhKSY7M1JimcKkXk0edf0E5MA/1DZRmSNj/Ei0XfDk0Hw0kEh?=
 =?us-ascii?Q?EtQ9SysPWoOhIT4J8/ISPF60S/PsW1xY2USm21d2RVSfKD+ntIR4qGfA6UQY?=
 =?us-ascii?Q?FfwTtrQHx32keLmEHeUmZDCXFw8lxqZlLexR4ILNQsMID64f+hvr8/aFOXsv?=
 =?us-ascii?Q?hB2kxVMq3J/DwEfSAJ0=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(61400799027)(376014)(82310400026)(36860700013)(34020700016);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2025 08:25:28.2517
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fc8ef8f-24d5-492e-ac0c-08de18570c76
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF000023D6.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR10MB7490
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 31 Oct 2025 08:25:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19214

meta-ti / na / 20251031082130.3317930-1-lcpdbld

PRC Results: FAIL

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  check-yocto-patches: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
Patches
----------------------------------------
WARN - [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master.202510310100
    WARN: Commit message does not include file/recipe name: CI/CD Auto-Merg=
er: cicd.master.202510310100. (COMMIT-MESSAGE-2)
        patch



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  apply-yocto-patch: FAIL
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
master
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Summary:
- Patch Series: [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master.202=
510310100
- Submitter: From: LCPD Automation Script <lcpdbld@list.ti.com>
- Date: Date: Fri, 31 Oct 2025 03:21:30 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: c795f0bf79054c58d8e2de12177d4d271=
124e0bc

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.master.202510310100
- Commit SHA: 39b81fac904906007772dba3100fa92da28a3c91

Patches
----------------------------------------
FAIL - [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master.202510310100
    error: patch failed: meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted=
-firmware-a-ti.inc:8
    error: meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti=
.inc: patch does not apply
    error: patch failed: meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2=
025.01.bb:6
    error: meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb: pat=
ch does not apply
    error: patch failed: meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb:=
10
    error: meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb: patch does no=
t apply
    error: patch failed: meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-=
rt_6.12.bb:10
    error: meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb: pa=
tch does not apply
    error: patch failed: meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_=
6.12.bb:22
    error: meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb: patch=
 does not apply
    Applying: CI/CD Auto-Merger: cicd.master.202510310100
    Patch failed at 0001 CI/CD Auto-Merger: cicd.master.202510310100




