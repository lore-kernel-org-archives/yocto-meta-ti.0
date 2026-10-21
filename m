Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12537.1792591893145668547
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 21 Oct 2026 07:11:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=BnaeaJO1;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=EkxW0TjX;
 spf=pass (domain: list.ti.com, ip: 148.163.150.75, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 69LBh3B21385630
	for <meta-ti@lists.yoctoproject.org>; Wed, 21 Oct 2026 09:11:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=lyRV/oUIoww3deJJMQt5BrAA+KCodmgdmh11Ilmvw
	QU=; b=BnaeaJO1aMN07B37KodqesuFAkwd//IGdfFTeOr3LLxQ82kOIb5eThDly
	KUhGRole7IJxTv9FAK3YQEEWVIyi9F6Q7Dk3Nc4dKlDr5srXgp5SwcklLFDwECU/
	gfUC50meF8XEhvyi6KCtWk+uIMgq6ttCq8YzMnfZ8cHSSRf+PGhOVqY8MAkG92YT
	Luqx8rYjvyG4k5O5VRlixJA6mUbdFTn4bQcWrHtGhbHHdcl1f5+pfOsnWYjl2n93
	c9aQkCZJXNPfeaHm8lKNqHVz+SshOH65jaVfNKZ+5d5knYW7FWGleR0r2xPzduiS
	DlrtWASnTM/iGKXJTLY6dNHehExnA==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010056.outbound.protection.outlook.com [52.101.56.56])
	by m0380145.ppops.net (PPS) with ESMTPS id 4hev9yrxmy-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <meta-ti@lists.yoctoproject.org>; Wed, 21 Oct 2026 09:11:32 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vtiiC0DQbGgZYHcM57GaR5Pu71c5Bf4smFTdmcLyysggux/UpBfN/fKHozgwIJkxLQ80ckQLXwV2IT9jnBxkBu+awPDmDypQaYr1Ee+HhTeqSQgalq4/OT+6LoWL77XJhNDFK3xZiy68PdB5DtqLQtPh02ShQoM9PrR92RKrNu4qETEFc1JByHzKksq0vupNLjiepPHGNwSy86TMPcPbIPmIUGDHZ4FbidtvqzRAAMpAjk98TmM+WefAyFQru0ocecMU4Og4iYkuH7FOaCsFbDca5lfzRgd2ANwbwpptTTpOK7W9V7t2lCTn1qbKCP0NssQLxmBbfjI1EDK44VV6gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lyRV/oUIoww3deJJMQt5BrAA+KCodmgdmh11IlmvwQU=;
 b=fqzAEHts3gApml7wyr5k2/w5H+yMroKu0qK4tmiTyM5qKatms+deNOdFShFQIWmWbHPB49croLlhzAJAIBZJXSOW8dsyUovh7VuN+/6RTYqlCoHSbG4ct63FhoHQWIuXU80V1txWux4xUcl81RZAfIS6DShiYDrN1J9hMKyqw1zZURLtWQic+inXs96fYupjTUr1t6mJ5OQzUYBx2xN3NBVYhufIoinyong1noKPH6J4XNqiBWfInYEf130FQXEmUGjXLP4ldoyWTDQzszvyp5pxUnXn7+CigzegT8oeRy7wwG9VSuMY3Pog2SKOjzrFGQIkMRSUE4x1FOcDhkRA2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lyRV/oUIoww3deJJMQt5BrAA+KCodmgdmh11IlmvwQU=;
 b=EkxW0TjXKxmSnOA2uvwXelaAcx8g6l2txwBd9EpX4pUT3246ZEQPIO54FOLfiVMWcKYU3rCRuET8k/Vp/lmUC1WBUhZhyTwlsb4fYWJVvYQuA/TLqiAgyBDm88/PSzRdx1eLt03dQQbKE1GPVimliAPbsVf7+dJ6U27fH8nuxX14gXWSxEgU5DSvGwRTZ+kXhy1PO1FN5UR+KhhtjmpjygmkwyQbBPQYre2YhBFD0aw51BmAjiBqicK4uCz+z6tqf18ATfFxBiqFwXy8xckaSEuANiCZDGxmcxAKXUA8H4Jtlz6f+zU1Iw/r3uSxwUpfDlmqcRuK/i5/dj3CjSvmEQ==
Received: from MN0PR04CA0016.namprd04.prod.outlook.com (2603:10b6:208:52d::8)
 by DM3PPFE9EDA11A0.namprd10.prod.outlook.com (2603:10b6:f:fc00::c52) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Wed, 21 Oct
 2026 14:11:25 +0000
Received: from LV8PEPF00000066.namprd03.prod.outlook.com
 (2603:10b6:208:52d:cafe::84) by MN0PR04CA0016.outlook.office365.com
 (2603:10b6:208:52d::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.16 via Frontend Transport; Wed,
 21 Oct 2026 14:11:25 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.194) smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 LV8PEPF00000066.mail.protection.outlook.com (10.167.248.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.15 via Frontend Transport; Wed, 21 Oct 2026 14:11:23 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 21 Oct
 2026 09:10:30 -0500
Received: from DFLE200.ent.ti.com (10.64.6.58) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 21 Oct
 2026 09:10:30 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 21 Oct 2026 09:10:30 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 69LEAU1r2738400;
	Wed, 21 Oct 2026 09:10:30 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 801A89A9C4; Wed, 21 Oct 2026 09:10:29 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Kamlesh Gurudasani <kamlesh@ti.com>
CC: <praneeth@ti.com>, <m-chawdhry@ti.com>, <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: Re: [PATCH master] meta-ti-bsp: optee: Update to 4.11.0 tag
Date: Wed, 21 Oct 2026 09:10:29 -0500
Message-ID: <20261021141029.2078680-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20261021-optee-411-v1-1-1f22b982bbfd@ti.com>
References: <20261021-optee-411-v1-1-1f22b982bbfd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PEPF00000066:EE_|DM3PPFE9EDA11A0:EE_
X-MS-Office365-Filtering-Correlation-Id: 420c597b-3e37-4570-3a6d-08df2f7d305a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|36860700016|82310400026|1800799024|376014|18002099003|22082099003|10067099003|13003099007|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info: Kw6NsHDg0F7Bb05H8gTIkriFe0l5oPuwbqeJQd9zChAlyv0ASbKbZxgB9hlC3fu2TS04DGL0k11DLky1PG4YAfiDD3h0wh5xYYWUpGAqtMLlqlJjwJiXnjKwGviVSxCcyTC+lAX2s+xoSf3jvTNPsp+ffoOLTVVzv44nJQjkqAl7glDzqRfnyXNsHyl+CAoelbgvMM79FFnxAX302N+FHaWPAkGcGC2AnU/XDG4FFrEtoGiqJCk/diw3Id6RQyXSHzQH715i1v/wF2+kOrXVmT3IseKPuHHkt5fOcOaKdMycoAjVjfwxcu7izH6HghsQ7vlstABLYHLbZ/Ji2tIBcrHbrIKY2G8cejTcCNlvETdWZ55wHTwdS/RMtMU1vaGAM1a+euQ6dZXdsQgtLn0jh/n3v31clBLffMq85kYSpZJ2gTQmasyIfKMPrOkGK+OEvtJHmE7pnZ4wQTmoClJtBV4YR9HiEobe6Wc9veJprkuI6iAgqUopoeCjyzGjTI6JiyOAVj9AEMMjSNnBfJPw/iQaAJr3QsONHvVGe4pMw2we5a+MDV8J5PoNG4HD+tRcWNr2r2zG1mbe2SkIpaWayUH0X9WlsI8JvDvXBHzXH4Jcofe9qj3oZ1dN7Hzx/UzzcrqvcL+Tm3Cuwrm0uBz12A==
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(82310400026)(1800799024)(376014)(18002099003)(22082099003)(10067099003)(13003099007)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: ZuCTlShx9LYKWynIrnfpRRIK8vdOxxAtzifWCoiX8V+0IvMj59gy3WjbgPoXw+qMtpMy669MiA6CZYfm+EXz2FSY/zdG2DHTgwkYHyVzxliZal2tr4gWZTkq4z0W+LFEe8PwcUD1+lVnzPrnItm1BxBFyuIsWGZZsRzpllBoNZYmokyDTmi81viQURjkgB1U8q9knI43IDBhiOkGeMPxn6eT4rMKggg6ksDbnqsvYG6p4GAVzVmUWHzERVLifoqk0/66Uqi2w4TgbQ4y05IqWEoGfErzd02e/Ka810ThIeGE2fHpIVZKKaO6HJ6kAovsD/GhULwL1QTi6l5AybHeL4NAUeGA3DOdoYP2jnIrN9wc45v+ToY/4AMfWHR4jtZ0hPGBhyM4I8eCD2frtesASoLmiCRzGF0g9H8vkRE2Idvl1F8r7svoy1EVW8c0bV7g
X-Exchange-RoutingPolicyChecked: oOq5jcir+L/R7hSIoXWb9fiS6laU6Ya6RIKL5HC+TEPp8l2BXspASE99CXSWRyc4cOe5gI1gmbLmJKI4rkzjsrlJljRyygEy+ARCZdLqSJQ7Y3AwIXPyaM8JsqaqQjAuOffcsw++ANeZ314ZSPsfhcvjoBSie22TRuWkJfEr8lM/DUV4NZVPH7jphCiLvFMJYNd93LeGEhhwtnQz6O+nNLZHVfGkCNxMWJmygqFBJu6ARON/q7pHtqWZ4tY3n/EXwawTAq1NtkTSEgpNCzYJ1EnYQvYJWZgbolj8NOi2xTIyehD4NLs3vdXSp55dmnefvl5FAk+xNzq7BggmpwpEZg==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2026 14:11:23.7336
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 420c597b-3e37-4570-3a6d-08df2f7d305a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: LV8PEPF00000066.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFE9EDA11A0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA1NiBTYWx0ZWRfX5BCzFWU5CquC
 Vi/zPMFjT2v8cD49V2CBwlYXkfoVEu9rHybjL2IQ59vRtcaztkKiZPDjdeyJdGFEcdifOo2/V0m
 s5MuY0fB5SbD0LUTbyQNoZv7PHIqOdg=
X-Proofpoint-ORIG-GUID: T2a3ThffpgRtQTp6QD_5SSgSsB-rFVca
X-Proofpoint-GUID: T2a3ThffpgRtQTp6QD_5SSgSsB-rFVca
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA1NiBTYWx0ZWRfX0ufgffrFGN+M
 5/hAk5ZCPrjJAtSiZNrsRfbii7yk8q4DL+JZut5+VXKCpnu/PNjb49vGJ1GHJg+6I76nuN93Opt
 UH/kmZPKv+wf6uJY/6TVTyjX4mpqjHEFeNEo6WRpB1WYM46VJD91WfAaK5EIyVy4FwTN7ey0/Rc
 CjZm7Gw1v5tz1nM474SXBmsScaNjvSuIkNxyXb96zjSQxr72j0RrQP94jwl423QN/+rCbASK2Bj
 P0G2Oy8+1Qje8Ujmu4vsU9PPqGmORYVbI6YHUJHIEnGIJ3L4ysUt2bAqUKz0v175Y3pJGviIZFv
 0PrA9hZRQ2KLRlg8PFHzoygeKdixVOt7yDi3f/J0cenXvtbnIJmGI7ulHZxN9hOPKln4+raXq8Q
 sMMWylzET1xMzIbe8Xm8XBS60I8nU+bfKmh0Qfqy9QETKOJvZB/bQZyUpsmjpifcr/M9Gbxn26a
 3YkaGOWuArLJzzxmctA==
X-Authority-Analysis: v=2.4 cv=R+uWitRX c=1 sm=1 tr=0 ts=6ad8c814 cx=c_pps
 a=T1Jff0mhgTaaoho+8HaPfw==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=660iZSQnnn4A:10 a=Vs-ZokuVWRQA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22
 a=iGHA9ds3AAAA:8 a=sozttTNsAAAA:8 a=aiFUIUhQ_bfqkH38MPsA:9
 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210056
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-ti@lists.yoctoproject.org>; Wed, 21 Oct 2026 14:11:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20470
Content-Type: text/plain; charset="utf-8"

meta-ti / na / 20261021-optee-411-v1-1-1f22b982bbfd

PRC Results: FAIL

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
WARN - [PATCH master] meta-ti-bsp: optee: Update to 4.11.0 tag
    WARN: Missing branches specifier [master/scarthgap/XXXXX]. (META-2)
        patch:78
            Subject: [PATCH master] meta-ti-bsp: optee: Update to 4.11.0 tag
    
    WARN: Commit message should not include directory path to recipe: meta-ti-bsp: optee: Update to 4.11.0 tag.
              meta-ti-bsp (COMMIT-MESSAGE-3)
        patch
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887



=========================================================
  apply-yocto-patch: PASS
=========================================================
master
=====================
Summary:
- Patch Series: [PATCH master] meta-ti-bsp: optee: Update to 4.11.0 tag
- Submitter: From: Kamlesh Gurudasani <kamlesh@ti.com>
- Date: Date: Wed, 21 Oct 2026 19:36:38 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 75d70c29993d0701acc711f89ad4e5557dd68eac

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: Revert "k3r5: Fix mc:k3r5:libgcc build error"
- Commit SHA: 03c17fcac2fac1f2b7f77663ffba8cee77f2de8e

Patches
----------------------------------------
All patches applied



=========================================================
  check-yocto-repo: FAIL
=========================================================
master
=====================
FAIL
    WARN: .bbappend files might need a guard to make them check-layer compliant. (GUARD-1)
        meta-ti-bsp/dynamic-layers/security-layer/recipes-kernel/linux/linux-ti-staging_%.bbappend
    
    WARN: You might need a " " as the first character for the :append. (APPEND-2)
        meta-ti-bsp/dynamic-layers/security-layer/recipes-ti/initramfs/ti-core-initramfs.bbappend:2
            TI_CORE_INITRAMFS_EXTRA_INSTALL:append = "${@' initramfs-module-dmverity cryptsetup util-linux-mount' if d.getVar('DM_VERITY_IMAGE') else ''}"
    
    WARN: .bbappend files might need a guard to make them check-layer compliant. (GUARD-1)
        meta-ti-bsp/dynamic-layers/security-layer/recipes-ti/initramfs/ti-core-initramfs.bbappend
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887



