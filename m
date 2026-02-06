Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D93BFEB28CA
	for <webhook@archiver.kernel.org>; Fri,  6 Feb 2026 05:46:09 +0000 (UTC)
Received: from BYAPR05CU005.outbound.protection.outlook.com (BYAPR05CU005.outbound.protection.outlook.com [52.101.85.31])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5548.1770356761172448482
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 05 Feb 2026 21:46:01 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=jla2iU1t;
 spf=pass (domain: list.ti.com, ip: 52.101.85.31, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sGYS7G2UDbb5YseMVVhlXeyw8zg0ZeJ7EIr9GJEfr/TrY6ZM1mZ+abE1aW37jM0062uXRC51w1ayhNxkIA3OyS6CboGm5KO6yP8E3fxVyS7FlEjNHErKCOmi7O7CD1OQdz0eZxuSrZAuNGjqSAMN4mHcpvy4obULZf8HrZzt18ZP5HVXt6ygWwn4BSL5EKfv/Kb7UECDmwrxDAXBCB3keq5d104DxFRpe6DGRCYbD6fhcnsknoPlZA9Qq3vNK3qzm2jityoI87fwIBELqdfPugqFcWO2wnK220tlkN61qmJdHOeD9E8mC2mzSjUPsGxNzCoecY+acT30tP94YFf/eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U5n59fkR7bfll1jcunUWVennkbpSlnSfC9eCwdr4M2s=;
 b=VDy2PGutF1GmV4uehtVJkydVpk410+gsSXUwvgJd+FY/YBTOupLGpeFyZGRyKavwp8wKwfA+5LOySwYpREJL4y+kpqVlQYaWurQXyg5eZUcJF6NlJzxpRvuTh1ZH493AdzMUhRxy53xcL6CbByDx0IyJeLzkgacsBpSHTeCvNpKXSnuNgjXA9j5lGPIF12xQWTNjYZxRQiSUPocBp9lUkDKJ6qIZCqgJ/LlXwAnKClAgKrxrxGN5V4kP9UofygF35JNVR6uXdJ+UCQzovKmxB3AufKnh9sj1pZerf5tE351HxosL/C5CBh5DjeYJPaCq2eFvQyipuJMElntgp1TvCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U5n59fkR7bfll1jcunUWVennkbpSlnSfC9eCwdr4M2s=;
 b=jla2iU1tQua3+0ArgmB3t45xS42MKfRoEuR3ZHODW6K4dDA/awYuehDL9ELC7WQUeccdd1kVm80ghjatrwgHXMBpyIQu7CkcGnEJBENdDsR+9vIbb/6lHM81lN5cnK3KXEzMkSxrHntl+k30Xh0q/tBbpcEa05/14IW6sfwSztMhrPJhobcjxInXBOwINcjIJ1AjLZ4lpXbHi9pZju+cPO7ywKvXevus1FilaVRbaDenH6KnviUgigx18sU7w0d0pgFRJGMF/8ur2qCfBfg8sm6KnBjMoY+KyuKm66w9iFUEtl6pAQJXPTZLWpEtgGMsg6nbgOL9nXHD5fIUMqMlNw==
Received: from SJ0PR03CA0050.namprd03.prod.outlook.com (2603:10b6:a03:33e::25)
 by CH0PR10MB4906.namprd10.prod.outlook.com (2603:10b6:610:c6::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.15; Fri, 6 Feb
 2026 05:45:58 +0000
Received: from MWH0EPF000C6190.namprd02.prod.outlook.com
 (2603:10b6:a03:33e:cafe::66) by SJ0PR03CA0050.outlook.office365.com
 (2603:10b6:a03:33e::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.14 via Frontend Transport; Fri,
 6 Feb 2026 05:45:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 MWH0EPF000C6190.mail.protection.outlook.com (10.167.249.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Fri, 6 Feb 2026 05:45:56 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Feb
 2026 23:45:32 -0600
Received: from DFLE203.ent.ti.com (10.64.6.61) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Feb
 2026 23:45:31 -0600
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 5 Feb 2026 23:45:31 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6165jV9r1329903;
	Thu, 5 Feb 2026 23:45:31 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id C5AFA9ACF4; Thu,  5 Feb 2026 23:45:31 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Manorit Chawdhry <m-chawdhry@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, Ryan Eatmon <reatmon@ti.com>, "Aniket
 Limaye" <a-limaye@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, "Denys
 Dmytriyenko" <denys@ti.com>, Udit Kumar <u-kumar1@ti.com>, Shiva Tripathi
	<s-tripathi1@ti.com>
Subject: Re: [meta-ti][scarthgap/master][PATCH] optee: Update to 4.9.0 tag
Date: Thu, 5 Feb 2026 23:45:31 -0600
Message-ID: <20260206054531.686299-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260206054157.1848713-1-m-chawdhry@ti.com>
References: <20260206054157.1848713-1-m-chawdhry@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6190:EE_|CH0PR10MB4906:EE_
X-MS-Office365-Filtering-Correlation-Id: 97d3f9dd-46f8-460d-1ee6-08de6542ffca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Gddx3JVJIqAGtl8X1kgmga7XXwkMMSRiULgASrH2LCiQPGvgK770i92tVJLu?=
 =?us-ascii?Q?KuqnSgCfOB7mOC1D9YsKD3wAMNicQPl4SmDgDZBloIwqwSTzCLbbFFXBHWjH?=
 =?us-ascii?Q?+AIrrbM9HGNRDO76ypC7G91OB8cLlVNIRaeR9SQJBBsUHhTiorRaU1lj5BO+?=
 =?us-ascii?Q?A45Og6Mz7r04/3UrxMLlLDXz/1q5IMkvsJg/y/q/Zjh0rxONipfynYkYX65T?=
 =?us-ascii?Q?1JsUNR0fQiS+JmL2UNeEVLCPHyxrmr+RsGDBP1+T+WG7eOJVcatCbRTg40mk?=
 =?us-ascii?Q?F0LLBt/I7O1Uc64HfsekC8oBXy9VD4O96Os6p0Pwn/8yB6hJTmORafkQewfb?=
 =?us-ascii?Q?EMZqIkrEKAmJdTYcnuOsrP3abW43yhwSgDCp59pnCHwqQCGQyrJcdK3TmIvJ?=
 =?us-ascii?Q?09TvubZcQt4oItMOo1+sNbxyR/0/w9XJuCXJwpawwx0BZf/EK9jk67aN5i5p?=
 =?us-ascii?Q?/J/cgZqwLTD6gSyj6svWevHdAKdVc/2UQ4gVH9wzNrlAI8TXtNgbUq8cPa68?=
 =?us-ascii?Q?+dPoHHkPDdw1GFFugUbu8wvZO3cf3q7fpvbr5vL5KckB/nvhKQTaAlgM75M2?=
 =?us-ascii?Q?7Be2oxXKbPH52tReAykynFG3sQS7N+ybqtNM0O6vQLWqQ5aaUJr+cjrH/fmm?=
 =?us-ascii?Q?TU4k8p7tZEBlsAKdQyEXRUrFh2hd0uYFkGHW0+lJCQN5mkailcJgx9S9uvAz?=
 =?us-ascii?Q?+8Ad2p7PVhEPxR1yAYx2JFz+qr1sQBRJJr/oEUGKjQaJ7W4xATsGNKTjEcGJ?=
 =?us-ascii?Q?0ggyuYc7tyGnDxPKAr1v4oTD8kA9HYrYxz8DimJjeJl0SzN4IF2p3uWGfEoY?=
 =?us-ascii?Q?upvYt9/3pLvbRzKamgHO3MDrGnn1A78yc5NTYVDfN+vtBSNJZtWbWIJk/D+V?=
 =?us-ascii?Q?PPKHRNP5zT7iXH6BfpytwEGq8yu6YqqScd8PZoQk5K2gcwWlxpjvgCwFcWDq?=
 =?us-ascii?Q?SllibwZVbYcpQJYFZnVtyLYtbfEQIidJM+sOy6E2cW0RJPkZMoLeJDONR5KV?=
 =?us-ascii?Q?FCIjgl0aCtzUWuF42v3Mlb3XjXum+R+TG9DzbrW9Tdw4cid71udR+euvmHoo?=
 =?us-ascii?Q?NLLHhp6PqRIYT7t5eLXzvQZef3HsuyRxrfdySjbe8y9A6ZDIH+Fos9wjZtpm?=
 =?us-ascii?Q?LhQkhrGaTaIRXwZfPauiaNSni7xt027bRd5+jAAv5/XAHpY6vfyGrWiun6Tm?=
 =?us-ascii?Q?NCfGBNt1G/U5QUVpKFWIyO2yveMw6u6DB+F+L5alvLzufpgUpRKlMuT7eSRn?=
 =?us-ascii?Q?1sbjKbO+Nc96BQKw4pHCt99JIt5kG+RiM0Q7GtCMcNGzPJTr3fxrCkG/fbTm?=
 =?us-ascii?Q?w4F/nbvpFvzJ0nCtyUR53hSbE7FfOChbjfbq8EL8EC3a6xZ1IVUhcDTirEUq?=
 =?us-ascii?Q?UzjueUoM8GEEj6bv31Z3QCB7Pbnb5GvR8Ct2anArrzN/8yPh0TvlIrHslDy8?=
 =?us-ascii?Q?N6v1m8jffnRZdY46lTBZELuUS+bGf9ze1F22fiuuNpbatjcamzezynCSfDNH?=
 =?us-ascii?Q?Gh+39HsgRo/iLalY/r6EBdZn5Mg03IOvnavanDUnxK07bOBFueUVIk0SmIHq?=
 =?us-ascii?Q?or7vh2HPyvZ98SyWCI+FyggXBb1M/wgTwBChPQX2kC+zu+3WdY3rprfTPWNx?=
 =?us-ascii?Q?kAsMA6iBc88mEEIKOl4KyNI5ZOTTGVJS/Xjsp6UGHpt4+ImRkxXNRV0pwUmz?=
 =?us-ascii?Q?GFSlTQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	2XkNojUJdEgMDGv4nNkCoNrCQX+LwzceOhBPepcIyPbVvI2HFDd9HoocPpnIP18G0g1nDgBwgFBs50+OXobjWX/U/OjQfuJhGzxReR4DiWgbx8h/oXuBZWPAaH03xm1GonTJ1+ayxKfKnc/oMqkoTcXKmbFXkjvBrT7x2KgnNqiZs99utHdOWGEsXkbzONSN4pQHs9BWr+bSCVAwzjG/TFna4QpigQ2cySPnvsalDLBVs7u/ZAlS+OEC8sm7et+k6bQy+To2JoEeXzVwqIqXnpLcSDDS8nOa65Gc3MUUq0kXsNZbeaaFUSL+E5x+yIJcnfYtmCty4ahl/SsvqCkfv21K6s4gNIwkB4Pk/lfqKGa5VXGkl5gF6iFA30ivzwhQlApNwoQ+07w1Hq4O5ruwD20vuftbnAIkCyGZX6xfdUoPpEvZSzMqUFmZCy7kY8ME
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 05:45:56.5531
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 97d3f9dd-46f8-460d-1ee6-08de6542ffca
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MWH0EPF000C6190.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB4906
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 06 Feb 2026 05:46:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19469

meta-ti / na / 20260206054157.1848713-1-m-chawdhry

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
All patches passed



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  apply-yocto-patch: FAIL
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
scarthgap
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Summary:
- Patch Series: [meta-ti][scarthgap/master][PATCH] optee: Update to 4.9.0 t=
ag
- Submitter: From: Manorit Chawdhry <m-chawdhry@ti.com>
-From: Prasanth Babu Mantena <p-mantena@ti.com>
- Date: Date: Fri, 6 Feb 2026 11:11:57 +0530
-Date: Mon, 3 Nov 2025 12:42:57 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 4867c4a16703065551b17b5c96f88a0c7=
091114b

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: scarthgap-wip
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.scarthgap.202601300920
- Commit SHA: 5258ee2f903d8f1e0cbcb9d01488d08b57314009

Patches
----------------------------------------
All patches applied

master
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Summary:
- Patch Series: [meta-ti][scarthgap/master][PATCH] optee: Update to 4.9.0 t=
ag
- Submitter: From: Manorit Chawdhry <m-chawdhry@ti.com>
-From: Prasanth Babu Mantena <p-mantena@ti.com>
- Date: Date: Fri, 6 Feb 2026 11:11:57 +0530
-Date: Mon, 3 Nov 2025 12:42:57 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 4867c4a16703065551b17b5c96f88a0c7=
091114b

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.master-ltsprep.202602051800
- Commit SHA: c79f7b833ee92e42f5dcfd6a33a47a9399d1c575

Patches
----------------------------------------
FAIL - [meta-ti][scarthgap/master][PATCH] optee: Update to 4.9.0 tag
    error: patch failed: meta-ti-bsp/recipes-security/optee/optee-client-ti=
-version.inc:1
    error: meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc: =
patch does not apply
    error: patch failed: meta-ti-bsp/recipes-security/optee/optee-os-ti-ver=
sion.inc:1
    error: meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc: patc=
h does not apply
    error: patch failed: meta-ti-bsp/recipes-security/optee/optee-test-ti-v=
ersion.inc:1
    error: meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc: pa=
tch does not apply
    Applying: optee: Update to 4.9.0 tag
    Patch failed at 0001 optee: Update to 4.9.0 tag




