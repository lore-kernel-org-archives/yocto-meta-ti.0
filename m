Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1281D10FC444
	for <webhook@archiver.kernel.org>; Wed,  8 Apr 2026 21:15:07 +0000 (UTC)
Received: from PH8PR06CU001.outbound.protection.outlook.com (PH8PR06CU001.outbound.protection.outlook.com [40.107.209.8])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.117347.1775682900850050661
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 08 Apr 2026 14:15:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=KALbUPnd;
 spf=pass (domain: list.ti.com, ip: 40.107.209.8, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HLXA18oS6l89hA/6xZ79lJBgZn7RMf56TfWXjIlb7BQLdnvxbHsFn2LhM+O1xUN9aCBVTgnuBUV+gziZJMqku0uGdit9uVI0NpENYB6rins20lFNrWx5WOatzt11Z0k19nV0SJXiqtg6LDAEOJ4BJF8T7gs/OLPAZh7UKp7PmwCT+g3/O5UJGVmJTqflHbVcv/23dk9OHvrqnMwoajUWUkbJoqgiO/nxvkPID6hqRykBwb7xTpqiroE037RC0XAmgH1V7aHjeP73PsyrdpRu5ezLQxpCZ3nOEPtC3GLA+A1vUAMh0NCpA8xtsIMxXWJ6WnJYbzxJVRMgph3llIGFdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rz7QUhnNYvzIjlIL6IAT/UVQSKcYJzmAfZCzk536CIc=;
 b=q2SSPcdlMQa+c4s/a7Th2ns+oBegwaY+DlB+SXr91rof6nXlIdYhUDtDH/mIvRXKxIXQkXhRX7qC0vBAmT4d9VlpTfof7GDtQECKb9V7qaRvzje9hp9U8astYLOMU6adQtK4QQN6HFKdjofx7xSi3wxnFne6Lhu9zX9nNPczgB9f3pCVAMZ9B/gNwSBFM3F17NLEgRJsM4Ym6lgOl7ClUVvkjBVdH9bG0Gx2pZez9oHUXQIdDK9HS528VoSJLoxwX9F6Lhfvk+qgXvGFYKZbUvfKA/A56S9Lcdoxj8utV7FkLTlkZQ75WmqI3kzM65A7AvzZAxlEAqEBVdi9fYcXQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rz7QUhnNYvzIjlIL6IAT/UVQSKcYJzmAfZCzk536CIc=;
 b=KALbUPnd8rio5PGTqnqW29p+fI3EusHsBmiy4WUknRm1M9k5hr/XPKv3Nj/FpUmmNEJkiq1tKnG3bK0pEFudZxQWWpoLkhcR41zQK0OHhy13FHWk55ayRNs6l24hdR0bUSWfBmUC7qv2gIYmYjJBwDH4al3jF26rCOyAz0+8NWcxkjPwOcQow84x+6VqcWLSf96/Lp5GuXBid4lX1VNC49tpwSi91yLxBNdpqtVtKLczv6rJXd+BHewvlABYGkyT2ai3jDn81xD+MMJxj1NbFdbOgX+p/5loa4VAtx8tfQE4llLSJctbbkiADZ1JOUBz7pTF7khDUXadPmbKTox2Gg==
Received: from BN9PR03CA0966.namprd03.prod.outlook.com (2603:10b6:408:109::11)
 by PH7PR10MB7053.namprd10.prod.outlook.com (2603:10b6:510:270::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Wed, 8 Apr
 2026 21:14:58 +0000
Received: from BN1PEPF0000468D.namprd05.prod.outlook.com
 (2603:10b6:408:109:cafe::e0) by BN9PR03CA0966.outlook.office365.com
 (2603:10b6:408:109::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.37 via Frontend Transport; Wed,
 8 Apr 2026 21:14:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN1PEPF0000468D.mail.protection.outlook.com (10.167.243.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Wed, 8 Apr 2026 21:14:57 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 8 Apr
 2026 16:14:57 -0500
Received: from DLEE202.ent.ti.com (157.170.170.77) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 8 Apr
 2026 16:14:56 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 8 Apr 2026 16:14:56 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 638LEuFf1463011;
	Wed, 8 Apr 2026 16:14:56 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id E69FD13F520; Wed,  8 Apr 2026 16:14:56 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH] check_yocto_rules: Add new exclude file
Date: Wed, 8 Apr 2026 16:14:56 -0500
Message-ID: <20260408211456.3886758-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260408210422.1350433-1-reatmon@ti.com>
References: <20260408210422.1350433-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF0000468D:EE_|PH7PR10MB7053:EE_
X-MS-Office365-Filtering-Correlation-Id: d1b15046-2379-469a-1ac3-08de95b3e339
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700016|82310400026|1800799024|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	1xLFb1aFbILFBFGGof9A4tTmOYkNSi3aIEYiAwCmIKi0U5XaxfLZhXXzStV5/bDt8cLfDj6Czb1qYDWTeP/+SO6ZS74ZrzHKROHdv5FllpvOJXwuYSZ4NhSiEhnRhi0/zggZ+U13pn7IKCac1l/tQCY2rKEkH+e7A5n6ySvdyqImlunNiGQg5dYxVkHndgprQyEunN75eL44k6Ic1dYJ1Z2iO/VpObsyn/PUjtYK6ELPsqTCDypz+CVZEJFtdONX419nX4pwTpvY6kineB5pSaE/TZWl1TYpdiSUmpl3kw50V+DDE8537BL5Nzqo1ziBf39Gsg7S4Kc6Wusg2G/mnxGqBQl4U5fqAY5oR2z3axgaYzVqivDYcobH92rqrxtJSGNAcgXE1i7OesRA+V9+DflaMU/Q+wPb1kd73HU/OZPpn3a9t4qjpnmGh/AV5w7vuuCglpBbZwqwUqQpLNFFQdDdaPA8h3j4Ax+A30KHkHl4MAuSsO5nOcASD9TiXmWxstQdmoHt7wCbjxOod37yu/DjyutWkpMdiAOOKk6NeSA6UuraoaMYZ696rwaxQ9GnsPTMdMA+Cftmb+WbvcRGxvz2axA+yQf8zeds7o3ojq2jDRXFioYDl4fkSxR4NaMh63ysfvQmeq87zpZ1DJfiSK5k4aqaKCql8xsz1kXGsK87HOmlNA3nquUhpqiRmEmRccZ77mqNwVvIsw2WodMqmxWACNr1dEPhjRzAum+65TAPpd20SsgxvDi0YtLD6+h5UtxSGAjuAhu9zT/caAKc0g==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(82310400026)(1800799024)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	nSdy/eGVILh7rsFgp1lWHcwMq5Rb4wEFkL6mT36IBuA05lywkRYbZdjp5RLIODQw3GP9PrbNtDiAxREllKea/I4Sad++XGEyEJelrgIuxUJMb899mlNKQJbu3p0zyn/+PhWd7GUlwurPfv4gVNvGOVTHe04JED4elIerGuzJQxozoW7470/vyMgXUPQrCJIo3ogqxBRchdjhz1avdUa1eiZZZ9YbV7sVgepkeFky06mz6pJqa+sQYdvbrX7SCNp40ZUEjs7A1o5wk0rg6mUFcU+Q7vH6l59nLA+NAmGvVbFXvnsXai+0UO7gNHISul0ZKQKYoTowTVQ0SUZ7nHwBt8JZ9d3eppR/JMhWiV3Hz6WG3CmMeKb0r0Xfgod58iQXRo5n4gnGTbutMO9e3kx6xvPzmkNfBkuK2obK016IaOa4pfrc+vdOrlEJbyPfmns6
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 21:14:57.5806
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d1b15046-2379-469a-1ac3-08de95b3e339
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN1PEPF0000468D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB7053
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 08 Apr 2026 21:15:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19839

meta-ti / na / 20260408210422.1350433-1-reatmon

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
- Patch Series: [meta-ti][master][PATCH] check_yocto_rules: Add new exclude=
 file
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Wed, 8 Apr 2026 16:04:22 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: cec655efef37db29c63345fc7f8dd0543=
e963573

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: conf: Add falcon support natively
- Commit SHA: 184758af4e6c34169d229c75fe94e8886ac3d7e5

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




