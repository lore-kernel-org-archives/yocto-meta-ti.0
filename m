Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67019EC0480
	for <webhook@archiver.kernel.org>; Tue,  3 Mar 2026 09:54:57 +0000 (UTC)
Received: from SN4PR0501CU005.outbound.protection.outlook.com (SN4PR0501CU005.outbound.protection.outlook.com [40.93.194.12])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14740.1772531687729569623
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 03 Mar 2026 01:54:48 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=S4PpIIIv;
 spf=pass (domain: list.ti.com, ip: 40.93.194.12, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CYnnjUNex+WIWpkhiyTSqd+Zwy0ZAnp/HARlNMq2FfcUt/AcfNP0tuNENI7Cuv91Ggf200MI19rxohVdiIn/EdlpNSvstORpypUxWW4E6AM0ysxhygqzDtD6RFrd1vuM8FarRC1s+KQfT6Mu/qYdMtJdt1BGVRWsb4rTP7cNF2h/jDaB+B0Uu4k8C9jWEXa1tWSB7QhYl1aE/yZh4frZtxn/w2RapQCf2UNz11FDvNuHCH1FfRBjBW2SYBlUNs8Z5KxHGwodTIJQR6+zeMWMzEMyPtGK3aK5Ioeu6E/cJvFVioyn1Mc/FJsp0ufLUgKQiG25wUiEqJTtB4T6kIVJeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GjQGrjg+7mB3U7VgseQyE2XrkhX1Ofo22XyS3S3/1o8=;
 b=JsENqlSzZLlK5lRtGmDs3UZFU/c9Cfq4iWuQCeyFr4vX2vH9kVMk7jSfmdmOO0KsrknS4eQWYwQLL5S/GcbtDpojXQ4grlolbdf8og7OgWTCMrwVEaLoipoDir+VmXOhFJAJDaWKGES0EMaHVqTN62TwtmmC0GzUW5ztCOoKUvMmL5JWGwmoSJ+WfJLb8o81QsyFD/qv3ib362zj8oPv5Dhysz6oEqETBWXi+gGnByjkjv8IEcfNuDp1/i0it5J90eW4cE/AIRMLh52esgswTNDYnuYZABemHT79mSWpL+W9R3ykSN00koqMbLJ5SBGMMErLiZQv668mqq61FLj/dA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GjQGrjg+7mB3U7VgseQyE2XrkhX1Ofo22XyS3S3/1o8=;
 b=S4PpIIIvLlNoXwE+it1aDu4xJX3hAbSJE/wPuZ4ntITeVo4wFk+J3WCRmB/Fx2V8iAx9qc63yebUNzgKRQgqXsDJ2h0wusFiEPfOGAhS8GfDVn9OwgGfZgG6CwY7CaDodJHrbDdwJHO8mQQkK3PaT+huYLJTP4QdkY/2VFz7AXSz3NZGtqAhrgAyqG3qRFAmAg5dJUSFDACZ2cUPSKmMRNeu7eCRA03cdcE7gLe6g47BbiwdYPT/+3synSeEI9s5ZnE3LcQjW47Tid3Zk+jE9cocepsGxpfNBCgQ4pHqxT6huIasvOy8Dhb63bNbRdacMb3hl8UYeF3L4hQMDP9O3Q==
Received: from SJ0PR13CA0221.namprd13.prod.outlook.com (2603:10b6:a03:2c1::16)
 by DS0PR10MB6200.namprd10.prod.outlook.com (2603:10b6:8:c0::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Tue, 3 Mar
 2026 09:54:44 +0000
Received: from SJ5PEPF000001CB.namprd05.prod.outlook.com
 (2603:10b6:a03:2c1:cafe::f4) by SJ0PR13CA0221.outlook.office365.com
 (2603:10b6:a03:2c1::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.21 via Frontend Transport; Tue,
 3 Mar 2026 09:54:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ5PEPF000001CB.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Tue, 3 Mar 2026 09:54:42 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 3 Mar
 2026 03:54:41 -0600
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 3 Mar
 2026 03:54:41 -0600
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 3 Mar 2026 03:54:41 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6239sf2Y3446118;
	Tue, 3 Mar 2026 03:54:41 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 68DD59ACF4; Tue,  3 Mar 2026 03:54:41 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Suhaas Joshi <s-joshi@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <kamlesh@ti.com>, <k-malarvizhi@ti.com>,
	<s-tripathi1@ti.com>, <vishalm@ti.com>, <praneeth@ti.com>,
	<m-chawdhry@ti.com>
Subject: Re: [meta-ti][master][PATCH] meta-ti: optee: Update SHA in optee_os to integrate timeout increase
Date: Tue, 3 Mar 2026 03:54:41 -0600
Message-ID: <20260303095441.3424438-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260303094117.1650691-1-s-joshi@ti.com>
References: <20260303094117.1650691-1-s-joshi@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CB:EE_|DS0PR10MB6200:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d8ac8a9-8760-460d-1f79-08de790ae4e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013|34020700016;
X-Microsoft-Antispam-Message-Info: 
	Ns3BrckWL4S7SNmbXLbT6KJVf+8OrafaqTJ+QVx1aqt1QlV9RiH3KB9boV5YqI2AYic0g9HBIIF62nHGhFhfgLUR+3OD3cWeykyTAm1Z0V3yznzEHSV3w/eza1Lq5j9NT5Isi7oruKr044Jf4MlHdDk0/Z1qDVBMtMRvupOalPMLRMg8CD9Pn/m/ulnafPeqzDFKoiGm8l3pEgEByCTLdqaZ2W0SWNTTygP3tyToZTyjFkO8DhhZTqYfoRDlaHRkMXK1yqo+d7c250x/7WXlOhFbqs7oNuEXitOTMmsgk694y3lkRnJLTvsf9RUIbrrHcFW3lv44T0RqHhE7XYHYcABZU9pMnjhe096Zi96hiQdeK71lB2OnRpukmLgTOK+Q7N6kpw41IVum7QDXDsXH1tjfiRptcL0BXEMcNEjoxYOGSHOvnoflIFYD4fLBrSLdaPxX5HETadUeHQBHrU8YbF3UgInuhoTpuAs229AClKrD1qQXp+FA28s4vX8KEp+CMoo2FhPK/8ievKoSiphV3BzRshqEXcwZX3m9g2Ft5v87B+NG/LoZVi+xguelVGidEm5nO+Kwu0AOj4bwGrr/daM9+oI372xtqbieKmNvCQXnIvgw22zLLJTDnf3vG++eiJcx/ao+k0pwmKboTkFkjI2/yFf1UFIdOZC9zSwoll/YQMKRuufPd5zTyFmPiTjQoalKXpFSABlLMXa10W8zJ6W+7iZeBmS9Cts3oVQPa5bReTSQ3Q78hfwsCVZvxqhIs88iJ/SZaZpBAPp71njcwxTTvLlQ1Lmy5jppQiP+OTrj8y30RMfrZcPgn0Scut6c+GEJ7+e7r45aciwbzNtdng==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013)(34020700016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	dMivqJLNEWLsvA8u74JJPVLiw7QceuMHsCyZ3d6ssvD0EOIzuZKzQSn4QmLIoOQcAlM+6vfCQGWz8b6X3euecd6/gu6s1G5MmXiWonzbQ9sKD04TkfQQnU5eqIKbyxlt3v2FjMUi278HuSERaQo69MzUL8PWmPGo2aYzrsUct+Ov92Yi1GgvtYlsI2/cXqte+fbvsoHmRoCAHeeFitN8/4erMHlK5Jeiq50RnnF5f83G/komGsjMqp0dqrf3xK/0G48mKQHE1PyY7X7aYO9XQsxSwmeJ0NfuSlobXYHbkVmU0NqKkApvj9IWMK9I/9aPDHzzxvgDVlIGH0xJAlWpap6DYX/+UdmzMlWllU0m9f/faYQK0y/nVLotjFmCX42lDY9J6iritPSZ9Z/vvPzZL2wT3/Lkr7ejZGgIwLkqCEda5rFAfUssdCKTMmkXcI84
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 09:54:42.8322
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d8ac8a9-8760-460d-1f79-08de790ae4e0
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ5PEPF000001CB.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6200
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 03 Mar 2026 09:54:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19636

meta-ti / na / 20260303094117.1650691-1-s-joshi

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
- Patch Series: [meta-ti][master][PATCH] meta-ti: optee: Update SHA in opte=
e_os to integrate timeout increase
- Submitter: From: Suhaas Joshi <s-joshi@ti.com>
- Date: Date: Tue, 3 Mar 2026 15:11:18 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: cabe206ed807b3c2fac5c51759463f557=
698339c

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: conf: Add falcon support natively
- Commit SHA: 51a8447ebd71a82b9907224852aa664002fe5c7f

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




