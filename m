Return-Path: <m-shah@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B902DC5AC7A
	for <webhook@archiver.kernel.org>; Fri,  7 Aug 2026 06:22:55 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37117.1786083766109853671
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 06 Aug 2026 23:22:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=jM7rrNJk;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=PZqpXYUr;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: m-shah@ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6776Frel1309774;
	Fri, 7 Aug 2026 01:22:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=oqubnM39PKAQ8VXWgJma0ioPxltpWdrJ1QdV/XrHm
	ks=; b=jM7rrNJkQ3eBcLqTbbKVID8qRV+LlKh8OlLIYGQB1u1KQVgzol90l99Bk
	3CerZzVyNwQrVW4UXCoCqfsTOL47udaAJgfzatIwmhBi2WVc68csRupqMCTSoaLd
	KpcGUXMkBohKVHa//m/1FiITsZnSpY4jSF4snTI559LBHyorgCHXbF8dcOwplP4I
	+VXG+0pqXmm2LgHM7NaX7aV+kSt+lteUQn69kJNgJnpLP0HALEiD+Vjrj+FfQJyU
	dgtuiZO/Ch6CNtcqsH/ViF2HpRj54F708vDhovwI1oTU42fYDQY2ZTokvuuiT0oD
	c7wAJU1sEb0sm4Cq/w1Lz+y/gBs/w==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012057.outbound.protection.outlook.com [40.107.200.57])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4fvs73fehq-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 07 Aug 2026 01:22:44 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BiU4dlYhrzQsMNE7sbBnwQ3MkUAfIDIoKrFbrsQi9qmSirZ7VaRJRMf/xgLPF2sTBimrqa+JLzz8LREnnXo4OQ4te+CCoemXCYtTbAOGvtpfml32KmtVVN1/tBy7fiQLdN3+FzzGhHglNaH4AxO7o2FxFF1stvyCY16rh2obLotIIWMoNO3YU+uG4zwccn/zY15dRyhp1U7IgLDJlZyfU3KhTlxgARYkC5gQpz9ZiViDkbGJ7mZh++2//t46KkUCiUKHSyauQN3YWcl3+pB8jQl2oezbii5AtU+ENC6jEVw8B3VsF3QZJa4iVfjDRXPjxouAx0CKgD9yJNEi+MI55A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oqubnM39PKAQ8VXWgJma0ioPxltpWdrJ1QdV/XrHmks=;
 b=mFld/UFVLYB6r9DwGCwqd+71j0LsIjN+NsKUu9/gybjpDYWWFEXp3wA/AKDISVBWS6gvBibG8wJNTRbBtAEUIFuUyiAE4oHFFZNZ7Oc11dG9ogLXCQqjF4RMZMsyLEqeUqhF2SGrV2qA090/08xUOwSKQggkt/HHG4FgBHBX4iltzKacAs5J7rvrbHcKObIMMNDyMB4J8V3dalBkN0M93SCjb/Pb0MbfT64iOvWRQEe7bZXkFWcYeFVBNhf7Z37UFsrcQhzqbxHPV63nw3Dh9GxJODfHUfnjoyPtWcb0jJZ9/TxCnVjYfwH1aZOYnenbd0RtOF7uYdtnQgBaSZIzrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oqubnM39PKAQ8VXWgJma0ioPxltpWdrJ1QdV/XrHmks=;
 b=PZqpXYUrDUd6GalgSJgDKnj+S3D76raeZHw+Z4uZsPYyRnW03AFq93dq8GZ3O3sKpBlSP5lc+XLUwnce32G9eMeao1ixnuUq8ngVfu43C3AI07a2DqVMjzL7ayh2KJSUPz8d9g+TnKf5LNv/tx7ixlJ4+EyiF8cYzcZ98kvfuP8=
Received: from BN9PR03CA0580.namprd03.prod.outlook.com (2603:10b6:408:10d::15)
 by SA1PR10MB7753.namprd10.prod.outlook.com (2603:10b6:806:3a9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.19; Fri, 7 Aug
 2026 06:22:41 +0000
Received: from BN1PEPF00006002.namprd05.prod.outlook.com
 (2603:10b6:408:10d:cafe::2c) by BN9PR03CA0580.outlook.office365.com
 (2603:10b6:408:10d::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.23 via Frontend Transport; Fri, 7
 Aug 2026 06:22:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN1PEPF00006002.mail.protection.outlook.com (10.167.243.234) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Fri, 7 Aug 2026 06:22:39 +0000
Received: from DFLE207.ent.ti.com (10.64.6.65) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 7 Aug
 2026 01:22:06 -0500
Received: from DFLE206.ent.ti.com (10.64.6.64) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 7 Aug
 2026 01:22:06 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Fri, 7 Aug 2026 01:22:06 -0500
Received: from aniket-z2-workstation.dhcp.ti.com (aniket-z2-workstation.dhcp.ti.com [10.24.53.43])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6776Ltrr537827;
	Fri, 7 Aug 2026 01:22:03 -0500
From: Moteen Shah <m-shah@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <u-kumar1@ti.com>, <s-vadapalli@ti.com>,
        <a-limaye@ti.com>, <m-shah@ti.com>, <gehariprasath@ti.com>,
        <denys@konsulko.com>
Subject: [meta-ti][scarthgap][PATCH v2 3/4] initramfs-module-netsetup: add recipe for DHCP before NFS root mount
Date: Fri, 7 Aug 2026 11:51:53 +0530
Message-ID: <20260807062154.1387339-4-m-shah@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260807062154.1387339-1-m-shah@ti.com>
References: <20260807062154.1387339-1-m-shah@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00006002:EE_|SA1PR10MB7753:EE_
X-MS-Office365-Filtering-Correlation-Id: b1627c7d-7393-4c91-a2d4-08def44c47fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|36860700016|23010399003|1800799024|6133799003|18002099003|22082099003|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	0JgGOW/iJwmsgkbMYU30wVO49HEv5m5rAtN9uXzhkswYaR1rzp4udc+Qy2mGmzQf6yllVEMPNPzPKYvFHIW4f9JI5TpVNedjEHCguw04gEAMlvMJDQojLwSkQD8nMHWQ1Lah20GvlenZ47tmtYIFgtqQHRDH9sKX5WAtT1y26kQEKPE5wN1AeGfpx3ZG3JlXsCUPleobu0pOq6vOWNOyv7Ulu5bLsmBM/g0gYts3eZpdsHw0uMCq0ACRmOQ7DSSpclYzO60R+DA2UmdY030u3G3VB7w1vMx/1TOgCwHkcMxheFMZOwX3AsZIcbgHwPkgGhRFaGJeVOVY4IeuLzyMa0fatIXX12iOfMRPuT0bqCEPjPnemxp/Ky2cqawW8qvrxevIDKxiyuoeyRQSUctKCAqWrVFNK6YuvPAFGR6KUw+tea2AVVjGnMnp2koqnQXQlcCPadSm4Bi5Qv44iwgegRdXbB7JKLSfr1x4I735T04q4Y4KsXV5hLXn4fsI0I8gzKx6LVOvnj9zNGPOWw/Ve7oRh3o8E3l0t60hGSPeuqXC9WyL7MCFB1GAoCZJN0+mtcMHQHwJfEqSjjYAl8GKTcgKyRyBFkIV474Gwggv3brCaGiweu+MfTXh4HB8oIkVkTZPafi2y2hiDSGFTqnkNQeblL2VEaRnwIlPva/Ar2e60hTV2AZpYjk3ROdDVQyFeblKCK2jRBsaXNXqFb0D+Q==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(23010399003)(1800799024)(6133799003)(18002099003)(22082099003)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	x14WTb80AggiFgar0cZy9t1wPmv8/36/sMgNhYz4s+k0Ao9c7y18trYI7DngP2Fro/IJW3TRxhKsnfink6FwkpPfwt7HZxOyBGtILxFmGvgFJiZQLUjOgTVSzAvnCSk2P6AK6uBAYF2LEggzT+l5n2Ufz1p59y2uIe4it1Ff04tpCXxSuSqCSJzi2nqEnYqRmDbCV3YIpbno668xfw7itiQtDtixdsQNvWtMLqyx/EgBJgtzHa5OCVi6Seb70X8oEiO941H5byF9Xhlws91UvKi26MA3e8rawM3xiY4N5cUh7fZsrj/tO+poSqLoYVGK5McN4e44UPVX+5aDR4+qXC0bSsrvkIcP/R0RE0CCQAY4kBaoiiROgpSVeVZyIy8zx2JKS4ii9vRv+djvPNQXjIVlmv97t+d6M8PgolFrR11A17KDJaSPIbKC/Wphmmk2
X-Exchange-RoutingPolicyChecked: 
	TzjJ84t4+Ll7wH8fU7edOIp0jGhiEtXRhsSHpIRMWqAEbUm2YN0JUyWe8oioTIVIKId+1CX7Is35SOg/vNuwtiPlLRM5ihPOt5FZEMNLupCgGzWuxI+Rh+TulgdN30c55s990uwU6MZQVYnV9NIcyISvHGihrIDm1np8BQwP+iUouzoY5XUIHZAzKdEsfu9joOh9qIS16nuainHSDpzvfxUJVpIbFayUVuh0cKgJp26F8feYkWJxiXae7vgQM1CS52WeQ8UEi7tuwU3MKBPlW7lcuzX63RIMrrAWDHG6d5pyE5BtyKlyMMjsYJ5akJ8hXL8Gh68C09CxrnAxKi0gxw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 06:22:39.4474
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b1627c7d-7393-4c91-a2d4-08def44c47fc
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN1PEPF00006002.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB7753
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDA0NSBTYWx0ZWRfX/t3ZrC1A0kpV
 oeKq/Grzp8ajdUD04WFuZ6XX0m+G1tu7z0NHbZfjZZOkaHwSmTAGGlWzKMyGxksaRzySIR88srR
 kb1032tnz9Vr5tDUvzjJSYwGrysbL6YJv/BtIx90V/zGYgFMxWrqUlv8tb/him9obujQ8clsiiL
 NXquqaZSsV9T3hLPE7PbQuON2ShIacRchCQWdoO8R0g1jSphaEsntESX4akWkkulY1e8HTlOsYo
 mUyD7nBV0K+o1wHV0xcMXHfXxBzC+Act1h03+XBgnJYrmTOz5tLrz6F2LB3EL7UxpRb6cmmLEI+
 W86aWiNDUkuWqyKrTcJfOjT9yc7a59y5fND3Tc02kms4qWRdRAwWZKkOoBjV3jie8d/8/i5nukN
 cJ9SSyOD1i7zo8qFQeQdLpGMnXjwybhWBwAGXjorZ3OgO1klVZcW/mAUO04uLFod88PsSbO/Fbs
 LIf3BxyooW8InawWnZw==
X-Proofpoint-ORIG-GUID: 42Pwkq81p5z-_Kj4SoayzDP0V4pCgDLb
X-Proofpoint-GUID: 42Pwkq81p5z-_Kj4SoayzDP0V4pCgDLb
X-Authority-Analysis: v=2.4 cv=dtfrzVg4 c=1 sm=1 tr=0 ts=6a7579b4 cx=c_pps
 a=sWN/8n6q3Grq+dQ3JdI7kA==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22
 a=sozttTNsAAAA:8 a=Y7y5GAGdEv-jaJFZO70A:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDA0NSBTYWx0ZWRfX4mHG3fNIaFJ8
 Sn/edjPfpdBuD7mSo5fqrWSkOg48QzJ+CD31++9dpY6cSDh+dLAOLcHN53JY/+jRu7BQNTcEuIf
 dgY8YktnnEZZgrzDo1hUiUayP6ighfA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_01,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1015 phishscore=0 spamscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608070045
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 07 Aug 2026 06:22:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20232

Add an initramfs-framework module (83-netsetup) that brings up an
Ethernet interface via DHCP before mounting an NFS root, polling for
the interface to allow the driver's deferred-probe chain to settle
after udev loads modules. Pull it into the initramfs packagegroup
under bsp-next and bsp-ti-6_12, matching the kernel-module CPSW driver
sets those brandings need for the direct (non-proxy) CPSW path.

Signed-off-by: Moteen Shah <m-shah@ti.com>
---
 .../initramfs-module-netsetup/83-netsetup     | 54 +++++++++++++++++++
 .../initramfs-module-netsetup_1.0.bb          | 30 +++++++++++
 .../packagegroup-ti-core-initramfs.bb         |  3 ++
 3 files changed, 87 insertions(+)
 create mode 100755 meta-ti-bsp/recipes-ti/initramfs/initramfs-module-netsetup/83-netsetup
 create mode 100644 meta-ti-bsp/recipes-ti/initramfs/initramfs-module-netsetup_1.0.bb

diff --git a/meta-ti-bsp/recipes-ti/initramfs/initramfs-module-netsetup/83-netsetup b/meta-ti-bsp/recipes-ti/initramfs/initramfs-module-netsetup/83-netsetup
new file mode 100755
index 00000000..8e76bac4
--- /dev/null
+++ b/meta-ti-bsp/recipes-ti/initramfs/initramfs-module-netsetup/83-netsetup
@@ -0,0 +1,54 @@
+#!/bin/sh
+# Configure network via DHCP before NFS root mount. Polls for an Ethernet
+# interface with sleep 1 per iteration to allow the Ethernet driver deferred
+# probe chain to settle after udev loads the modules.
+
+netsetup_enabled() {
+    [ "${bootparam_root}" = "/dev/nfs" ] || return 1
+    return 0
+}
+
+netsetup_run() {
+    local iface timeout devtype
+
+    # Extract interface from ip= kernel param (format: client:server:gw:mask:host:device:autoconf)
+    iface=""
+    case "${bootparam_ip}" in
+        dhcp|on|any|"")
+            ;;
+        *)
+            iface=$(echo "${bootparam_ip}" | cut -d: -f6)
+            ;;
+    esac
+
+    udevadm trigger --action=add --subsystem-match=net
+    udevadm settle --timeout=10
+
+    # Poll up to 60 seconds for an Ethernet interface (ARPHRD_ETHER = type 1).
+    msg "netsetup: waiting for ethernet interface..."
+    timeout=60
+    while [ "${timeout}" -gt 0 ]; do
+        if [ -n "${iface}" ] && [ -d "/sys/class/net/${iface}" ]; then
+            break
+        fi
+        for dev in /sys/class/net/*; do
+            [ -f "${dev}/type" ] || continue
+            devtype=$(cat "${dev}/type")
+            [ "${devtype}" = "1" ] || continue
+            iface=$(basename "${dev}")
+            break
+        done
+        [ -n "${iface}" ] && [ -d "/sys/class/net/${iface}" ] && break
+        sleep 1
+        timeout=$((timeout - 1))
+    done
+
+    if [ -z "${iface}" ] || [ ! -d "/sys/class/net/${iface}" ]; then
+        msg "netsetup: no ethernet interface found after 60s, skipping DHCP"
+        return
+    fi
+
+    msg "netsetup: configuring ${iface} via DHCP"
+
+    udhcpc -q -i "${iface}"
+}
diff --git a/meta-ti-bsp/recipes-ti/initramfs/initramfs-module-netsetup_1.0.bb b/meta-ti-bsp/recipes-ti/initramfs/initramfs-module-netsetup_1.0.bb
new file mode 100644
index 00000000..6b465462
--- /dev/null
+++ b/meta-ti-bsp/recipes-ti/initramfs/initramfs-module-netsetup_1.0.bb
@@ -0,0 +1,30 @@
+SUMMARY = "initramfs support for DHCP network configuration before NFS root mount"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+
+SRC_URI = "file://83-netsetup"
+
+S = "${WORKDIR}"
+
+do_install() {
+    install -d ${D}/init.d
+    install -m 0755 ${WORKDIR}/83-netsetup ${D}/init.d/83-netsetup
+}
+
+FILES:${PN} = "/init.d/83-netsetup"
+
+RDEPENDS:${PN} = "\
+    initramfs-framework-base \
+"
+
+RDEPENDS:${PN}:append:bsp-next = " \
+    kernel-module-ti-am65-cpsw-nuss \
+    kernel-module-k3-cppi-desc-pool \
+    kernel-module-davinci-mdio \
+    kernel-module-ti-cpsw-ale \
+    kernel-module-ti-cpsw-sl \
+    kernel-module-phylink \
+    kernel-module-mdio-bitbang \
+    kernel-module-phy-gmii-sel \
+"
diff --git a/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb b/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb
index a9eff847..e1d75327 100644
--- a/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb
+++ b/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb
@@ -23,3 +23,6 @@ RDEPENDS:${PN} += "\
     initramfs-module-nfsrootfs \
     nfs-utils-mount \
 "
+
+RDEPENDS:${PN}:append:bsp-next = " initramfs-module-netsetup"
+RDEPENDS:${PN}:append:bsp-ti-6_12 = " initramfs-module-netsetup"
--
2.34.1


