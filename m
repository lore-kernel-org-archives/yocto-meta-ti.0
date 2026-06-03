Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEB30CD6E55
	for <webhook@archiver.kernel.org>; Wed,  3 Jun 2026 17:13:38 +0000 (UTC)
Received: from MW6PR02CU001.outbound.protection.outlook.com (MW6PR02CU001.outbound.protection.outlook.com [52.101.48.2])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.25661.1780506816598705193
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 03 Jun 2026 10:13:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=AYBfLzG/;
 spf=pass (domain: list.ti.com, ip: 52.101.48.2, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qm7oP4dOu5fB2oSNbKaHSRMbSC0FnazWWSq60rqOeQ1L3KsB/D/qYT7FFP9GmyvD3yEvGi3I/bUToFw0h7k7vEbIpIahE8mvGonDfdNbL2zLzWLa0U/pnzHXZY+9s59nUfzSjsZMpvWHfqpGs4mCiemNHTyOuAMaF9DwTW7O7BTZQKYmI+0RC58VMue8eRKecLNl+2l55l7QCTLODWOgb5M9rhqfx0kq98d6q5EuzHlcYtzpdqtz1hHRdP30v/nG1lFvh9rJ7H+8uFi/Z8FJbSj6OiTHAXUrlwFjhxVybUH2qP3aw8IBW/fPOgZwDaLFR4fdf8ZXIhULu/AlYnRbmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5zsjBwRKBiP7oj+k7i3vM2AUr38bJihYiXYse3d1VFM=;
 b=X4Wy8p2xsKerXdXI3T7WzVpU9ImI5goOtZga53Ir8AVGcZCOhf07/cekGo3AhFxUL+CSve6bCegVw0h3vRDArZHDpqXKx+71UlVFdgHxe9eujkAkli9r+pDGiV562OMbHTuYOkVHpvP37QkuamOJHqkKhtYz1oOorsVPzLHruNyiD5dgaqiB2V73jN9nP+yzaOY2NIigtziuUIEfoNTaH+H/98RpJcLDKANKFst+D3QNrgS+JeLNukpla9w9i5Yd+cGvcKxj7SncPZLZhD7pQd4gqnbqmaxqznHPMsd8jQ1V69dQMIBU/PsP/+QQZJEsXwM63E3GuJce7MzQrehHHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5zsjBwRKBiP7oj+k7i3vM2AUr38bJihYiXYse3d1VFM=;
 b=AYBfLzG/kYmHL0wRGTnxqR1HRx+kX5dRQXkZ2ZaK9yyhfB9xJLjnB5mbPvDPnY7qSPorNnyJG5dtLjxlk9uGLIlfI8AuMwatSUW1VPL5IrRDp0upy9ivyBEpbRAjxtp33iCT8wJ2kiANO6dL+XrAB87Jhu6zFZNQfZmNd3HXzpvUej614DhdvF99Ptd9xuYVdP0pzcWBgsZ8Hyf57FBbXevLvFIGVjLlblObC8OIH9+3UXLd7V9G4+uifAwoRH/sb5pgvMZ2W4tFucWFkxzmpMb00FZOii3LVzhgfEhSByORWDEMfNqkVtp4LcxlNPEr5N4l1Hv0vFNr45XLu8MoFw==
Received: from SN7PR04CA0038.namprd04.prod.outlook.com (2603:10b6:806:120::13)
 by SJ2PR10MB7558.namprd10.prod.outlook.com (2603:10b6:a03:549::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.17; Wed, 3 Jun 2026
 17:13:29 +0000
Received: from SN1PEPF00036F3E.namprd05.prod.outlook.com
 (2603:10b6:806:120:cafe::6f) by SN7PR04CA0038.outlook.office365.com
 (2603:10b6:806:120::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.7 via Frontend Transport; Wed, 3
 Jun 2026 17:13:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SN1PEPF00036F3E.mail.protection.outlook.com (10.167.248.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Wed, 3 Jun 2026 17:13:28 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 3 Jun
 2026 12:13:28 -0500
Received: from DFLE200.ent.ti.com (10.64.6.58) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 3 Jun
 2026 12:13:28 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 3 Jun 2026 12:13:28 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 653HDSjd435948;
	Wed, 3 Jun 2026 12:13:28 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 387A49ACF4; Wed,  3 Jun 2026 12:13:28 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: <a-christidis@ti.com>
CC: <denys@konsulko.com>, <reatmon@ti.com>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master/wrynose][PATCH v3] ti-img-rogue-*: Migrate GPU driver version 25.3 -> 26.1
Date: Wed, 3 Jun 2026 12:13:28 -0500
Message-ID: <20260603171328.945850-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260603165354.3073981-1-a-christidis@ti.com>
References: <20260603165354.3073981-1-a-christidis@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F3E:EE_|SJ2PR10MB7558:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d55fd36-b6b2-49fe-f261-08dec1936e54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700016|1800799024|82310400026|18002099003|56012099006|22082099003;
X-Microsoft-Antispam-Message-Info: 
	ObIGZKrJuPY6kGNiF4Hl3sJWMh5p1ALpmnZsPRRwBPrhGVu9ffRuP7q55jfvzNrRbY4oPTMpejq/N8I5gsgUfWYiGJi4pjGV6QkvA6Yduw7AB0z44KH2zgHzqWIfxywdaBzYF1QLllGGR0cjZq+b1h9rAvYlde/RCU9Vd3oCH1cZPgypr/mOcZJpNldC9Sv78sVBMCY64N2JjMlJwtAxJe9pJttO/5QNGJHqekL4OJcEpqwIjdoeYauF5ih5dZ3bYp67DnJTaPXeqbVcWohuPK6P2b2Si0K/vxTOmLweiA1FIEMSwpEybjeJZpAVjTzos4UxFLKQxa/HMUhtikrOEOM+lBlD6jVxOUZ66kAGgG+0NCYLRmkpX8k0ABOe4Ib6IdENrZFSvdiQlICYf+rA7MkUXOuJs7MWalYX3fE3Nz1WKInGzDEf/JdvGaR16VVLwa9rfayFNHB4rGJ6JyyR/8NOA11zLywMe4vNluTbBnqg7Ec9ngb90DxN93dvP6phRky3WSaYDznNHcTnwTL9nFWHYfznXBX1AkyVK7/Vp0IQ/kYN+7rIr7P7oJ2CxRH29Duxw6k3XsgqWKSSerpSAYIi5+dY3o+5Mrfv0vniBQ1LmVr3CFnnLTnVpGQg5tzVId2+QuEOAvhLfOithklzhI6iyIlL7k9aIcrlZounF5kFP4ZLOBB8Falw9XFXpZcMDDRj85DebxxAq7o12f+MwuFmRggtUvNlUKdNK0plHBw=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(36860700016)(1800799024)(82310400026)(18002099003)(56012099006)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	BelduOgsLuqzX7jmZ7ENDL/ZrkfS10U27J2/b+i3qVIniCdfZRmpabg4Ces4nRBPcuazIE6y1BeAsjBRrWTwpE5cuZFvBnOigWcm7DjP4LlzyosenPvh2r1qH+3O4PciTmqT1w04uDtIdGqJ+KSro7N7pkJFHGQXdkgJi9VUm7JoOIGwlMcXDmJg0ZvsG/Q+8g7yoqYhHjOW4W23PHQpZHYwcKEGw3L78lOWHpUH0k5h4khh6TSv4dgbVv37mdO0bB+unvnQKI9d7O4OvVktsPrmPPtkRuGaKJ8kn1wnJOm33qWGTxnvY4AXSd0If5R02ORoTlA/t6nyfaU8fYPjJRShW/HibCLaUuDy+WCXe0tIagI5IG1eGg7vN1a/qqbISlHl27Q2iG/rqCqb9Y/izW6zp5NxofZxV2e5/m9Jy4Prfjd8afDKxmFAEkzfKRBM
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 17:13:28.7854
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d55fd36-b6b2-49fe-f261-08dec1936e54
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1PEPF00036F3E.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB7558
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 03 Jun 2026 17:13:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19968

meta-ti / na / 20260603165354.3073981-1-a-christidis

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
- Patch Series: [meta-ti][master/wrynose][PATCH v3] ti-img-rogue-*: Migrate=
 GPU driver version 25.3 -> 26.1
- Submitter: From: <a-christidis@ti.com>
From: Antonios Christidis <a-christidis@ti.com>
- Date: Date: Wed, 3 Jun 2026 11:53:54 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: d6263bb3e421b87cb0945b5c0dfa9be69=
5dbf1e9

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-next
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.master.202605272200
- Commit SHA: efd871d4eb504ec366027fdf6d1f934d2844a04a

Patches
----------------------------------------
All patches applied

wrynose
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Summary:
- Patch Series: [meta-ti][master/wrynose][PATCH v3] ti-img-rogue-*: Migrate=
 GPU driver version 25.3 -> 26.1
- Submitter: From: <a-christidis@ti.com>
From: Antonios Christidis <a-christidis@ti.com>
- Date: Date: Wed, 3 Jun 2026 11:53:54 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: d6263bb3e421b87cb0945b5c0dfa9be69=
5dbf1e9

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: wrynose-wip
- Commit Author: Thorsten Lannynd <t-lannynd@ti.com>
- Commit Subject: weston: fix assert firing when subsurfaces have no views
- Commit SHA: ae9f90cf0baf823a20d10b5e4e3c6af465dabe98

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

wrynose
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

wrynose - PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
All checks passed




