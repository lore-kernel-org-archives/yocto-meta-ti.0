Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06664E7E0CE
	for <webhook@archiver.kernel.org>; Mon,  9 Feb 2026 11:25:18 +0000 (UTC)
Received: from SJ2PR03CU001.outbound.protection.outlook.com (SJ2PR03CU001.outbound.protection.outlook.com [52.101.43.1])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.45619.1770636316420848547
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 09 Feb 2026 03:25:16 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=vVuqKTZr;
 spf=pass (domain: list.ti.com, ip: 52.101.43.1, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xFCFG6Ow5oGyFudvD2vfG9kb8urFnG7JlM4grYapO8uhdaepoddoZ4h+vwfTTezGWq4ObyKmvzjCLJz7bR1rKCO97T3d6KsEVrAdVOyYocMCOQlRPHdugyvMBD3LEw9wEgmDq4Okx1xiHYCr/RMe+vgjWEh+tw+jNCEyrWs/pW4ve9+VC4vkjF+gLW4OE8VJcwwYToJwTzsExy5Qw8yEFbj/j41ZxGainRg0kf4tbTxzu+gg74euIRcGmWtSQsB2Spy6nYdmHyIV02idz21p9tHkXL1uU/wGZcz7tXi8KPMkH1AugWjBC/tlWWUEWUnRsb0zyZsve/rY3XUTJGhAbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yXEgfdMqijeefwUxxkpmV+Rsqlfs41aA9HMjL+VWH+k=;
 b=DLOHBF8Z7hdwMk6n3YNECdqBM397ZmFb6anArtZguwk+cK+yfLETVgXdmF6dnx7VJXW/dChFbBNF3mgu2itgOsx5eLwuLLxqvpCKfyOhcJbyJrPwn8nO/43uXT9c5FEGjRt0V3NeaUnKHDWPTSBHo5e/xIe+0GOCkWmiVmqyInU1BitAHn8eBI3H3VwwRY8ZAne1JNLV9GsAhSdiycK4jFOOxeYconBSTxhmshsS3zCTjHlaDwyZ5wstsiIJH2ppf9fEcCUayM0u4YYFkDnF5NBlMrQPEtVzd7TlaS+Nj9g3zx/AAZNA6toG50CNqdPaRE6GRphyIdqtDHSwitixAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=toradex.com smtp.mailfrom=list.ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none
 header.from=list.ti.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yXEgfdMqijeefwUxxkpmV+Rsqlfs41aA9HMjL+VWH+k=;
 b=vVuqKTZrbrNGsZB80eBc+RlaGNXlJXZ6UuPJRjhEhBOkSZh4v/MhZp4vZIvwQwrTZxeXf0o4AU22N2eOyLoZezTPb8raJbx8RSRCPHhN4qNpv4VgY36WwpWWA1UstI8Ma9Owq8ibRbw0wHNuS6vwW1U15UePtcU3w5uS5c6ex9kfzTaW/4P+za6DNqJwWeaQ4slBZS8LMlwXVNBGA9EReQMNjvwDe4jQ/9So1EPOMTM3v32Y32SxfTRLkRZa5WDGJbou+53YGhSGRI1pCubI6gVmhtJiO4dBAyqLYe5vwJHvEUSYf2Ea7mAnpZGSW4AU/QX2LoQuGfO7ojraxgcXFg==
Received: from BY5PR17CA0036.namprd17.prod.outlook.com (2603:10b6:a03:1b8::49)
 by CY8PR10MB7266.namprd10.prod.outlook.com (2603:10b6:930:7c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Mon, 9 Feb
 2026 11:25:13 +0000
Received: from MWH0EPF000989EC.namprd02.prod.outlook.com
 (2603:10b6:a03:1b8:cafe::97) by BY5PR17CA0036.outlook.office365.com
 (2603:10b6:a03:1b8::49) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.19 via Frontend Transport; Mon,
 9 Feb 2026 11:25:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 MWH0EPF000989EC.mail.protection.outlook.com (10.167.241.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Mon, 9 Feb 2026 11:25:10 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 9 Feb
 2026 05:25:10 -0600
Received: from DLEE207.ent.ti.com (157.170.170.95) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 9 Feb
 2026 05:25:10 -0600
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 9 Feb 2026 05:25:10 -0600
Received: from fllvdckhpci021.itg.ti.com (fllvdckhpci021.itg.ti.com [10.64.72.33])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 619BPAEP469049;
	Mon, 9 Feb 2026 05:25:10 -0600
Received: by fllvdckhpci021.itg.ti.com (Postfix, from userid 60899)
	id 0C938142E1D; Mon,  9 Feb 2026 05:25:10 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Vitor Soares <ivitro@gmail.com>
CC: <meta-ti@lists.yoctoproject.org>, <reatmon@ti.com>, <denys@konsulko.com>,
	<vitor.soares@toradex.com>
Subject: Re: [meta-ti] BSP version selection forces initramfs integration
Date: Mon, 9 Feb 2026 05:25:10 -0600
Message-ID: <20260209112510.1141508-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <78ec394aae8a141ceb87a6b67f109665e7c96122.camel@gmail.com>
References: <78ec394aae8a141ceb87a6b67f109665e7c96122.camel@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989EC:EE_|CY8PR10MB7266:EE_
X-MS-Office365-Filtering-Correlation-Id: 9450ee73-82b3-4656-21e1-08de67cde32e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?iySwH2EVIZuSPbA2UHwU7Dyxn3OnpcbONc/d8dudZaCGi9XvN+qhqvcYVrfv?=
 =?us-ascii?Q?5SlE6ZG4c7xCyqEmYweGG8iOogpHF8CELC3LKYnvHBteSmdadoz6vlmm4tVh?=
 =?us-ascii?Q?qr58WTOLx3zS/GT+5eSUZ5sY3XLPk492Uf/1vvAL/2wYlxT9o9HilHmi31ou?=
 =?us-ascii?Q?W/539N4Lf4GYMDU1kL+TcylLJ8lKRWyMYhxKpygQz+5LAV3fXRZ91v2xcEK3?=
 =?us-ascii?Q?3iz1Mj/JzC0PIX7wZczlDZBOS3bWuyuzL2F9lTMlLZnfNYXTHdaUpHHezPlZ?=
 =?us-ascii?Q?WMPBzOfAFSV4i/1pyOKDfbikhSlkXCnIXnonJ6hgrP0iA0yzuaVjAcCxA9TM?=
 =?us-ascii?Q?XJLmOMiVzXd+hU/Qy68yGzttdUCztP5XCfW0nDGbj0h/OePdk5LUf3PZwoDI?=
 =?us-ascii?Q?Nun/zvjz6Q82roDUvfdEFEL1pEnosDqMDsH1zFIOzsUtEH/xwZG579iSvjeS?=
 =?us-ascii?Q?DO9C+bR+GIHiAaJp8su8uzcvX6YxdX0hPUPhF9GJpOO8y1/YlLO7iIEJeYNk?=
 =?us-ascii?Q?0ubIVB1zLqeIZybsynXGHhfRPd9aTROVT2eenHmBPONk+VIBirjbkkH4JcBn?=
 =?us-ascii?Q?kpJdW9Pxgvj6OWD3Lj7vCalWGOtLl8uZO2nKPvzsqRuqyByiVi5d1eMJMUqi?=
 =?us-ascii?Q?BVOvtBxwYlTyN+lkmExpgbY9etmtroiis9dogJot9/4Qqcvf5r3eu7j1SfGw?=
 =?us-ascii?Q?HQhjViQBvBxppb8sOqEj4OaNXPPJgqdA8i5ZLOhFydC+8jhE6i5DRGk0xR3R?=
 =?us-ascii?Q?OM0y1A73W7Q7NBp2eNyWjwByyWMk79xGWlfzPdz3oHx1Cky4/OJSlyk36r/T?=
 =?us-ascii?Q?sKe3V1mE/tuakNrPoy5YvnrOuKAPEFV0tngajivkkhl44DVQS84OwwC9+VeB?=
 =?us-ascii?Q?UHf/H3YkPPlFWvWqvRL04DziT6iRwM3dOvJv2d3PKtrbmMIOajqbNkemPb3s?=
 =?us-ascii?Q?uUcPJLePv7SEl53VGbfdkTxfXZOvdpXzIm3bTEqhZ7cjiBXTT3opvMo0btpR?=
 =?us-ascii?Q?K9paf6pj1461c4SZJxVO7IoDTsedU0EMMb961GXU/rND5vS6eF64ftNRwc5z?=
 =?us-ascii?Q?613OY8DxMSWX+ecxxgsdeRM0v/9EmZkeEoG95qatykjmD3GRcaNRlhd3avM/?=
 =?us-ascii?Q?rQZ5GPnocnoVCK8gBn/4CwK9+Z+hhqSiih1nvErHylojSc7CBVJqgX14TJha?=
 =?us-ascii?Q?aRim1F637SwZfuG2Lt8YrjSWqZxHwRGsVK9OMos1NYzfC7vKGD1CWacAk1t9?=
 =?us-ascii?Q?Uj2xBHW7Dkgd7Fyuq/Bi5qMn5NUIxiuKnu8Rq2gHveLENhpiT9tysxDkykcZ?=
 =?us-ascii?Q?NOjDYonXMiCiMd1t32NSIIfUx+SKq5UV/uwr7iHicNdjHYFaKvTiXe8NVliR?=
 =?us-ascii?Q?lS8uV686OWmXGwXo8Z/9JbWwlklynkg90AkUCJUf4mzqaBdX2l3SamkJnBV/?=
 =?us-ascii?Q?oVtfbfUWILxtWuxYO56Zg1YNaR/5dgN7b5rfg7kbwSxk5FYQJMf8zwuHNVSK?=
 =?us-ascii?Q?hNxMx6tOgM3jU2boO/5X+P7h+F+D/H6wA/c4U7Io/WAhvHQERULKTrW4SFiW?=
 =?us-ascii?Q?Ifccy+AV/CfUYHrrzT7PrxGR3L2Qf85CWLVwbnYA9T3GfQPYpEjhN6Ip9avp?=
 =?us-ascii?Q?3qNUPFe1DrMSZxtboN0Vn5s/FY+DTWAyVNXCzLFcpZHQBE2eZsnvZe8smvBF?=
 =?us-ascii?Q?xt00Cw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	qJTWuCNySQ/SqNYs2TxJrAsncbi2feX5xiuoqxf/zKJSvPzdEU4qJZjTFtiK2wVCYw4Rxoyacx1tQczZFLD6UbhYK9kRsMide1tV6lRWZaZIX0iz6mbowdwapJbH+Y1LVD8llBtGYYeWdmWFkGX3vv/wBSNmRJiEkMmYXG7nTW+Bz/3vTJ4I1cwU14gjLSR2UJyEa2g3jR3o8EK/a6qZx3M1DyaYlJ+I6C4ukkto3bVou7MUduZFSgO/Yyu+DYg6TxVI+tV0kEzYrH2FRqnO14mtFbh5Zcc6WIVnWa6pj1XNmZ969visNr+1v6b1LL5nqcnpbi1xgLqLTpOxtb92XY5MWdcIjnitAyIKNSAcCh/2BBkhtYs604FHcyUY9gIK5Ci0FHS1f/iJz4yob08S7dBvuKyrLy+UmEXS4VnE5JRPnXFfnU87HjZ/1s8+oT8W
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 11:25:10.9216
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9450ee73-82b3-4656-21e1-08de67cde32e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MWH0EPF000989EC.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB7266
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 09 Feb 2026 11:25:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19473

meta-ti / na / 78ec394aae8a141ceb87a6b67f109665e7c96122.camel

PRC Results: FAIL

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  check-yocto-patches: FAIL
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
Patches
----------------------------------------
FAIL - [meta-ti] BSP version selection forces initramfs integration
    WARN: Missing branches specifier [master/scarthgap/XXXXX]. (META-2)
        patch:55
            Subject: [meta-ti] BSP version selection forces initramfs integ=
ration
   =20
    WARN: Commit message does not include file/recipe name: BSP version sel=
ection forces initramfs integration. (COMMIT-MESSAGE-2)
        patch
   =20
    ERROR: Missing Signed-off-by in commit message. (SIGNED-OFF-BY-1)
        patch
   =20
    For details on the above errors/warnings visit: https://lists.yoctoproj=
ect.org/g/meta-ti/wiki/40887




