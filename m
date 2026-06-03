Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70A75CD6E55
	for <webhook@archiver.kernel.org>; Wed,  3 Jun 2026 19:24:09 +0000 (UTC)
Received: from CY7PR03CU001.outbound.protection.outlook.com (CY7PR03CU001.outbound.protection.outlook.com [40.93.198.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28466.1780514648048436747
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 03 Jun 2026 12:24:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=a6Q+4ZAZ;
 spf=pass (domain: list.ti.com, ip: 40.93.198.42, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CAHFlRWJZ8LVLbHW3hSw5m5lsIGYLw1LPWNsI/LsktIp1gajFpqyXYBw0KVmds4h2vLGMlh6ibXeB96XtFjVnolAhW5bxuR4M/2SstrEEUOFdPuH6RZyU4/Jn+no6pXv8Bdwuo0aIiRD35ZbsOFxFZYbkkjFoIgK6Jt78j/h52rhu77KBVnzBc5xx4kB0nOKPrhV+faGCOBrCwHyp7WVynNhygS1Xte5Ndn9R9EjGq5npcrSLux1vGMeUG3ivqEYOcBNMS+Acd9ZyyVn4x7fu1B/j/K0g8qZtYLIFwBrkfz0uu00pljCl25l3fBolVugINziGnWt7iIwdaygHNrPhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9z1m1o090C/5QGjY4DqRUXIAKYbiruRh2bqcLjWBJtM=;
 b=Jd+YuisI4EXZIR2SupF8k6vh39gE5FrGkoyjIfU0C8ck6T92VeuWOKgNujsVbmwyl+jFVz7JyP4n49WyeRPYkcwhkpv9WsxbJd7hPtGB6lIcYEfXNtEsp66uealzNL2bQ+VTBCGj2dckZMIyxYuY0C9Qy3XB97Jv6bIeH5WgyQe9kwYTmykmRTZDQWq05x+/OtnP8PIsdxGyy9iV0RKom4JgGsJgP3LuBsb65U9LHXI8nnQB9leuzDkBtJAwadZHtrYqs2xaEP0V6zqrwOSA/LwhzKHf7F63lkYXwvnBwhFA+ZJhEmWWB8XGU47JCrzZNKT5FgMzlNy9xleHyt7gAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9z1m1o090C/5QGjY4DqRUXIAKYbiruRh2bqcLjWBJtM=;
 b=a6Q+4ZAZqQuw3MdqZg/xneeJX8nFYsf60GH9ik4NwDX3P+eDOyxWFm+ITFBj++BP/1OCsM3E74Eq6+1fqghRsStG+gFko2hAvQ/vrNH5v0svA/DklZ8zt5xgRDxhzKY2k0HQdxQoYP395nM3/La+FqpPW/d0s15nHiYKqnGzpNRdJCTcv870kXrXPCFLW5GojZPd3RRo3x+bqIGnqZ5V0s4AX45TwR6kOosC7TLaDVdgMqpamWVmA9nGA+qio9dPclvFHsZnN/UjgiHPSrLcPPSmGBQh7febjOCtSRxqCO/TdsTDmvjEhknhWL/pE3TdPCtn8evxRzo2Vx3iwjJOjA==
Received: from PH8P221CA0031.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:346::7)
 by IA3PR10MB8663.namprd10.prod.outlook.com (2603:10b6:208:571::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.13; Wed, 3 Jun 2026
 19:24:04 +0000
Received: from CY4PEPF0000E9D1.namprd03.prod.outlook.com
 (2603:10b6:510:346:cafe::64) by PH8P221CA0031.outlook.office365.com
 (2603:10b6:510:346::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.7 via Frontend Transport; Wed, 3
 Jun 2026 19:24:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CY4PEPF0000E9D1.mail.protection.outlook.com (10.167.241.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Wed, 3 Jun 2026 19:24:04 +0000
Received: from DLEE204.ent.ti.com (157.170.170.84) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 3 Jun
 2026 14:24:03 -0500
Received: from DLEE207.ent.ti.com (157.170.170.95) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 3 Jun
 2026 14:24:03 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 3 Jun 2026 14:24:03 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 653JO3fW563013;
	Wed, 3 Jun 2026 14:24:03 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 8CCE89ACF4; Wed,  3 Jun 2026 14:24:03 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: <a-christidis@ti.com>
CC: <denys@konsulko.com>, <reatmon@ti.com>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [PATCH v4] ti-img-rogue-*: Migrate GPU driver version 25.3 -> 26.1
Date: Wed, 3 Jun 2026 14:24:03 -0500
Message-ID: <20260603192403.1006080-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260603190158.3082977-1-a-christidis@ti.com>
References: <20260603190158.3082977-1-a-christidis@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D1:EE_|IA3PR10MB8663:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f9a618a-3fb4-41ca-a7a8-08dec1a5ac9b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700016|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	fUke4tyLNHWBs0VSapDhuowM815VoQAePJC9Le2OeuEsNVta1g19DkyarWWyjL/b9KVjgdJ9jXyq3qRfAanp9fPt0MwZmrtcUyTCXTSzP+LehxNN+RREPo8Du2wOOg68E8jd1373KRpTjNtkF67P9LuqF1igpbS69xweCxUtPfx6uhQLh0JbXNOz3C2UN9QC56JU6/fphNrHCwXDxZ+kBy+6Q5xHoHVvEwtQUBO5+anHjeKJvxEG4ndXMWG6njAAWNgdlTCau7+MjHKGZgumnSd5/QUolpWfIkF/kumtmQsEfWOqbU8vdPxTlxHcMMFd75B+RoZP/yv+2ZTWN9rQ/NgwOkI5gUnKkxUyXF8cB8H1oQymZ+8m6DpVIXElKrdUle6zHkSwbaoFMMYvb4Q5TRQFjm0VBeHNAqRrrQ7o6Yd2Mla0mFwmiZAAsJd89YAka1OPhVN2641GPu5OEWJNcenkZcX+rQuC+lOcHymNsh60BGDcoWVfOGCIHu+qCxryBu8Ir9fX+erLrAWHWrG5obmdyufIz+tKKvZpAOucLJiyyT5easnnL9na42FzZVQc97dMT5YcXXoJfHqDCnXg7BztKPwRvypqONutIhC7dYn45QDuok+CEBhawYpo8K93GhFS34MPI9Qf1tXUMRd+fRwLuL06EsBPw/WjsY7Lb5ZDZTwA9qzbmooCyzsWj9+4oxATOqLpo7mHAhMpHlHQAIwL10XWMineMVbMrxO4xJE=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	iw5yh/igwjJpmc5k9O5G0xNEquSrDivVIPdahoeQHL5JvkrtqC8biiHKkGi39pIJ9ULhUJzp7EOhls+GccDS2mNDSDx6RfX5+sL0ojTXg+IJeavnNKaxnwmCDcDgRObZZ6Te9R37PY6I9rMn8FSfEo+lmvFPHjG2q5HuxVEG7sNHQN5mkqvnzGUfW5Xqt0+o/QM9X4Kwq6TPIxdG5UWDlVpk9w/COjjnO/GDCECLWEcg8XextiqupZwfziKOMkr8inkAiH766uiPNzTdv7BrdDnO4tk0SfZie3YgwU/fdVGFggZJczNso/+fXq9jlJBPH4sVc7kTYm3dWkc/HqOd5cfhvOoyYr/xrvkeDApsO9it6JZSe+MLs3k0Md/RCDyAH61wzkgMPqsdL35UlycKh743pKK/rMNImJa1xeyMyOnop/QaqeMkrnrpRH4zMpyG
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 19:24:04.1940
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f9a618a-3fb4-41ca-a7a8-08dec1a5ac9b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000E9D1.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8663
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 03 Jun 2026 19:24:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19971

meta-ti / na / 20260603190158.3082977-1-a-christidis

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
WARN - [PATCH v4] ti-img-rogue-*: Migrate GPU driver version 25.3 -> 26.1
    WARN: Missing branches specifier [master/scarthgap/XXXXX]. (META-2)
        patch:67
            Subject: [PATCH v4] ti-img-rogue-*: Migrate GPU driver version =
25.3 -> 26.1
   =20
    For details on the above errors/warnings visit: https://lists.yoctoproj=
ect.org/g/meta-ti/wiki/40887



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
- Patch Series: [PATCH v4] ti-img-rogue-*: Migrate GPU driver version 25.3 =
-> 26.1
- Submitter: From: <a-christidis@ti.com>
From: Antonios Christidis <a-christidis@ti.com>
- Date: Date: Wed, 3 Jun 2026 14:01:58 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 5b549724b70d9ecbf3180eea8459e37c9=
7349bbb

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-next
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.master.202605272200
- Commit SHA: efd871d4eb504ec366027fdf6d1f934d2844a04a

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




