Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5F97F513E7
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 23:09:23 +0000 (UTC)
Received: from BL2PR02CU003.outbound.protection.outlook.com (BL2PR02CU003.outbound.protection.outlook.com [52.101.52.13])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.57476.1772752160996717815
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 05 Mar 2026 15:09:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=Nw23RHJg;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.52.13, mailfrom: rs@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kOUx9dXP5s3bQAEmAu6lNrT98trVzGTn/Lu+UG06tccOkd83BSJIqAe7E1zvVJG0JQHbPF4MesEeDowa3wBO/O9Wxf8L59v6GcpwNN+VMO3SWYc38/UPUBzqGsDSIAsA4TncqXPqIrcqY1ZMfgkBQ92xBCIhYb1SGSnyrV4fxJkoW2XlHdI/ufatuC4mZJ69H064SHk9KrOjs72jQRF5fZAzmkLcXzOsNdRzFB0HA3Q9A/CXYsnQYadfRSv0GEmzy07zXnUxmHLpSI/g+9RRuiNlZy4fPomBq6h1g/3sN6bCt6h8JUa4S7n13YLJdOeqULgiCumvHtowDfwlufP5sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3YS53yMKoQG4jgd0oYrx0mntBZlkMnoCHgYMUKOWJKA=;
 b=YNVwFaxrwsmKOnHSXFxgNZbJwdh7n2fWW5vSACqtUohNPvPJ0ef/XudoDPkzW8x4qHjBuqou9q3/YXgIohO2uGuG9LrInDgTVHtWF5QF68sRr3PjF25K9KY2Kc+Fs6rqINnvZXComKfOjlbnFvk/h67avdU7lGjdBFQYED2ENIL4dYoqpAGicYQPIOTjaNeHmAj1JqL5t1LY1DzeFworOc7+h3h4ABAIakdVZVu9KhPVnWLjglEdgcmgRWQ6zO71s48IfbkoixHech2hPcMmALh7OKHi3WcfORZ44LKbDkuLnsOpVHFSxfs8Su050Ep0i2I0JoZ3UHBujMAgeJV59g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=criticallink.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3YS53yMKoQG4jgd0oYrx0mntBZlkMnoCHgYMUKOWJKA=;
 b=Nw23RHJgoj3N2zKcQHO59IgURIvDrymjAy8eGFrLvmwjRcD7WX8/+G7fZgfBlHJ1Sp//aiBK08KTH5Rt1TZK+w5+UiZTTClr64MS1F220jd16ifFAZzm16ZX8ie7+1eFcE/Neu8Oopyb6x7+A/+Xox/hnbc0CJQsxmgGkhGEDcs=
Received: from CH2PR05CA0014.namprd05.prod.outlook.com (2603:10b6:610::27) by
 BL3PR10MB6044.namprd10.prod.outlook.com (2603:10b6:208:3b4::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.17; Thu, 5 Mar 2026 23:09:18 +0000
Received: from DS2PEPF000061C1.namprd02.prod.outlook.com
 (2603:10b6:610:0:cafe::ac) by CH2PR05CA0014.outlook.office365.com
 (2603:10b6:610::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.18 via Frontend Transport; Thu,
 5 Mar 2026 23:09:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 DS2PEPF000061C1.mail.protection.outlook.com (10.167.23.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Thu, 5 Mar 2026 23:09:18 +0000
Received: from DLEE204.ent.ti.com (157.170.170.84) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Mar
 2026 17:09:14 -0600
Received: from DLEE211.ent.ti.com (157.170.170.113) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Mar
 2026 17:09:13 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 5 Mar 2026 17:09:13 -0600
Received: from localhost (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 625N9DPF2697043;
	Thu, 5 Mar 2026 17:09:13 -0600
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 5 Mar 2026 17:09:13 -0600
Message-ID: <DGV86WQ1U0MU.2YBP9LC8G84XA@ti.com>
CC: Shiva Tripathi <s-tripathi1@ti.com>, <meta-ti@lists.yoctoproject.org>,
	<rs@ti.com>, <jcormier@criticallink.com>, <praneeth@ti.com>,
	<kamlesh@ti.com>, <vishalm@ti.com>, <k-malarvizhi@ti.com>, <vigneshr@ti.com>
Subject: Re: [meta-ti][master][PATCH v4 1/3] linux-ti-staging: Add LUKS
 encryption config
From: Randolph Sapp <rs@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, <reatmon@ti.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260305172148.3684377-1-s-tripathi1@ti.com>
 <525a7c96-f504-4ddc-81b6-709974825760@ti.com>
 <20260305211225.GM11121@denix.org>
In-Reply-To: <20260305211225.GM11121@denix.org>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF000061C1:EE_|BL3PR10MB6044:EE_
X-MS-Office365-Filtering-Correlation-Id: a574d455-7916-4f75-47e3-08de7b0c3a8b
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|34020700016|36860700016|376014;
X-Microsoft-Antispam-Message-Info: 
	LghyI8VdxSJTQ9zT+OYON6krFXBg7czB+a5CBZfCSQZlN8d8xqmNgKdrqwjCJWIZFhASXMGxnrBWvT4QePZreLZc90Abx5EbognXP5dQyUyhB+7VKZprdNB3GX71191NkRoWtTQ0ib7PRZdNdIIKyYvU4XwifZ/bcjT7dw2sLrnVuo5ksYLdUXgEWlTa1i6XJgecQbr4BtvWrLLLmtGeoUgEUfgUoCOcicmB5mjArng7HSlZG4dC79GFKPACPcIXQtQOU4aursuZf8PGN09q4nOk+LVMDhPRSiO4NG9y3NRMb66yFLrDOuYhtypL9cxOfRk4ZXZ3k/yUOH3j6rCudsJ+/p6CjDthEwf5PYmzXXW6TZcWfWmBY/zO0T6JvppXpcG7ibRLLQKzChfrfU77nAePSOsMV3Nqkq+FRS8DLW/UX4oBiNh2RvDUgZsJSwj0fJ4MFtl9+QPxdiM9QtqYiCR5wgtY2As4kQMlJvektCll3qLyjlijOl4g8jvgtpcA4uTWCaQgw0DD37VY+ZJs9Pq3Q0908Ro14t18JZt7tSDeHC0T+u6nMgdsVO/0YWG6I/ugzMPUs7lGv/KNZEaGv7wx1GwMJiO+9zsXG33oPdQZ5/dosMI2CIz+7o0aUgZfpONEJFK4NpegqGbWNSuY1na6oJH3FPNT1CalU4Nl1+PuLlsVBk5UIZrhzlENMGgQ27eHh+o0cRMeyQYLTa4Yv2oNIJ24XdJd70rUGJcaOm+Pal177k/r8fbpNW+Ogyfa8Qa1uuylr4j1WeigxF6Ekg==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(34020700016)(36860700016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	nHHYJR7ZCEHNIAWDIlcydY2GLPAggAgMok40zXpMPJ8Qwt7IEzj9CyYdSe+X/TNbxv0ph97gajsU0PDTOXaqZkIDBWSdisrH3ZtlavmtX9k0mo617yHv+WKo9n89PpgQu5xO7NCHZ1nK+Y3WFrSG3O4At9363nBavOCN9d8Z4yFq8OmeuSfv0Rd1rf527A3iZJsEdBLo6WCMC8mtyZhxjF/AoUsCPiM8wdxF4YKkOGIWxw1PQuy7m0PuLYKJAAbaKxt0l+opvQpjK7n2f79zbQPHEvOj9ADqp0/IA5gkpEruTHlWWE8qeXs7eZ0F0faDKblyDdkxgk86RauOGFv4RKevZCiU5WM4xakJtwsNhKm7HpuQBYIa7eXrf+pm2DIwzhFkVUJ00w6WKCRsAqy4zZrU33yuiYzRxfBNkeEx81fMmdkezhltGUnisJESgJax
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 23:09:18.4167
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a574d455-7916-4f75-47e3-08de7b0c3a8b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS2PEPF000061C1.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR10MB6044
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 05 Mar 2026 23:09:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19663

On Thu Mar 5, 2026 at 3:12 PM CST, Denys Dmytriyenko wrote:
> On Thu, Mar 05, 2026 at 02:51:44PM -0600, Ryan Eatmon via lists.yoctoproj=
ect.org wrote:
>>=20
>>=20
>> On 3/5/2026 11:21 AM, Shiva Tripathi wrote:
>> >Add conditional kernel configuration fragment for LUKS encryption with
>> >fTPM support. This enables dm-crypt and necessary crypto algorithms
>> >when MACHINE_FEATURES contains 'luks-encryption'.
>> >
>> >Signed-off-by: Shiva Tripathi <s-tripathi1@ti.com>
>> >---
>> >  .../linux/linux-ti-staging-6.18/luks-ftpm.cfg | 28 ++++++++++++++++++=
+
>> >  .../linux/linux-ti-staging_6.18.bb            |  9 ++++++
>> >  2 files changed, 37 insertions(+)
>> >  create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-=
6.18/luks-ftpm.cfg
>> >
>> >diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.18/luk=
s-ftpm.cfg b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.18/luks-ft=
pm.cfg
>> >new file mode 100644
>> >index 00000000..234cc087
>> >--- /dev/null
>> >+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.18/luks-ftpm.=
cfg
>> >@@ -0,0 +1,28 @@
>> >+# Device Mapper support
>> >+CONFIG_MD=3Dy
>> >+CONFIG_BLK_DEV_DM=3Dy
>> >+CONFIG_DM_CRYPT=3Dy
>> >+
>> >+# Crypto algorithms for LUKS
>> >+CONFIG_CRYPTO_XTS=3Dy
>> >+CONFIG_CRYPTO_AES=3Dy
>> >+CONFIG_CRYPTO_AES_ARM64=3Dy
>> >+CONFIG_CRYPTO_AES_ARM64_CE=3Dy
>> >+CONFIG_CRYPTO_AES_ARM64_CE_BLK=3Dy
>> >+CONFIG_CRYPTO_SHA256=3Dy
>> >+CONFIG_CRYPTO_SHA256_ARM64=3Dy
>> >+CONFIG_CRYPTO_SHA512=3Dy
>> >+CONFIG_CRYPTO_USER_API_HASH=3Dy
>> >+CONFIG_CRYPTO_USER_API_SKCIPHER=3Dy
>> >+
>> >+# Additional crypto support for LUKS2
>> >+CONFIG_CRYPTO_CBC=3Dy
>> >+CONFIG_CRYPTO_ECB=3Dy
>> >+CONFIG_CRYPTO_ESSIV=3Dy
>> >+CONFIG_CRYPTO_LRW=3Dy
>> >+CONFIG_CRYPTO_PCBC=3Dy
>> >+
>> >+# TPM kernel modules needed for initramfs
>> >+CONFIG_TCG_TIS_CORE=3Dm
>> >+CONFIG_TCG_CRB=3Dm
>> >+
>> >diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb =
b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
>> >index 8e4ccd7d..69d6217f 100644
>> >--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
>> >+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
>> >@@ -35,3 +35,12 @@ module_conf_rpmsg_client_sample =3D "blacklist rpmsg=
_client_sample"
>> >  module_conf_ti_k3_r5_remoteproc =3D "softdep ti_k3_r5_remoteproc pre:=
 virtio_rpmsg_bus"
>> >  module_conf_ti_k3_dsp_remoteproc =3D "softdep ti_k3_dsp_remoteproc pr=
e: virtio_rpmsg_bus"
>> >  KERNEL_MODULE_PROBECONF +=3D "rpmsg_client_sample ti_k3_r5_remoteproc=
 ti_k3_dsp_remoteproc"
>> >+
>>=20
>> After thinking about this a little more... I'm thinking that the
>> luks-encryption is more of a DISTRO_FEATURE and not a
>> MACHINE_FEATURE. "tpm" would be a MACHINE_FEATURE.
>
> This was the first thought I had - it's a distro feature.
>
>
>> And the best most correct thing to do would be to do some
>> combination of the two.  I assume that only some of our boards have
>> tpm support, right?
>
> On the other hand, isn't fTPM a software-only implementation of TPM?
>

Yeah, though they should behave the same in userspace. It seems like there =
is a
bug preventing systemd-cryptenroll from working in our case though. Obvious=
ly
there are some quirks here.

>> So I would go through the effort to add that to all of the correct
>> boards, and then change the logic to check both variables.  I'll
>> reply on the other patches with those changes.
>>=20
>>=20
>> >+# LUKS encryption with fTPM kernel configuration
>> >+SRC_URI:append:k3 =3D " \
>> >+    ${@bb.utils.contains('MACHINE_FEATURES', 'luks-encryption', 'file:=
//luks-ftpm.cfg', '', d)} \
>>=20
>> ${@bb.utils.contains('DISTRO_FEATURES', 'luks',
>> 'file://luks-ftpm.cfg', '', d)}
>>=20
>>=20
>> >+"
>> >+KERNEL_CONFIG_FRAGMENTS:append:k3 =3D " \
>> >+    ${@bb.utils.contains('MACHINE_FEATURES', 'luks-encryption', '${UNP=
ACKDIR}/luks-ftpm.cfg', '', d)} \
>> >+"
>> >+
>>=20
>> ${@bb.utils.contains('DISTRO_FEATURES', 'luks',
>> '${UNPACKDIR}/luks-ftpm.cfg', '', d)}


