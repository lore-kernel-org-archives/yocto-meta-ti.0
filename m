Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63BD3CD6E60
	for <webhook@archiver.kernel.org>; Tue,  2 Jun 2026 14:59:29 +0000 (UTC)
Received: from PH0PR06CU001.outbound.protection.outlook.com (PH0PR06CU001.outbound.protection.outlook.com [40.107.208.65])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.340.1780412360920913318
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 02 Jun 2026 07:59:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=HbZbcJKb;
 spf=pass (domain: ti.com, ip: 40.107.208.65, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xJ4hfit4Rnj3J5NF4yia48XEkJBYteiCpQZJIN5FOl3da9vzn8u5GST6jhCl8nxHPg9/ikTZuz5Wn5dk2nd2BYb0Y+IumkDRTOpQI2XefxYx953CENfYP2DuMN0wq9JhRbOcXKmfvxkaY7i7hn8NEzXbb4WFw8Fhj9G3Dr0nNr08igA4jGblbGMXJEQnZCwJNlKCTOYCohWvYpGSfNbiRJ5DplI3DM3oIZsI2g4CKbPN6IwfRf+HoH1kHDIOh06yXvYMRkC/juzshqO1HOysHxxRSfB8pLrPhhP9+7aNiYUDiNVRDE+mN8vNDNvpehjOEfnDpAnB+VYbR8tPK/Q7pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iTbfdmJEgyCXz2VZxim0PyVqRGHBXpQuo9hnYUn4ffs=;
 b=A539SRkeYFD+MfNiDceMOz2ZesqmQe0oI5XyX+DohpXE1w5L3GZtDZwHWS8ydkxNDwkeVDn6WHCfM3TTBOwiCeogeN9h3ixgUWPMosHOzwfUpBTOlk8DibfYjSfP/6Eg3qmDX3cBqM4yn9f0zfS/H6ZU1Qk2rhjlFuQ9iHA3U+5z+82BgOnoUyuJwB2qnVSz0PpkykWqp7tXDWrEj0YNhdZKSdBOPRo5PmS4Kk5FbYkvRQbcw/nZXgbuAnFLRmR9z/0Kq1M1hAPBxfuXnyRBx0gO0iB0PN4HOCynwl15qnbwj79wgIvQmknAYzkw717jymvrGnF2orx19wK/hdSfIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iTbfdmJEgyCXz2VZxim0PyVqRGHBXpQuo9hnYUn4ffs=;
 b=HbZbcJKbnR36s1tBGR/23qJzRysqaDxTn9yrJgUbSDCA9ctlEcSIiV+AJmNg4qDOwOllCss3BPWWEz4iCMp6SiEk1Eusz0jUgaBq+M/DZ93FEbNnTo363cZxf6ByLp8NoLzuElBLi0HfcRRN/o9E/qs8LN9Qts2ibpFH0b/Jsvc=
Received: from BN0PR04CA0120.namprd04.prod.outlook.com (2603:10b6:408:ec::35)
 by SA2PR10MB4716.namprd10.prod.outlook.com (2603:10b6:806:11b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Tue, 2 Jun 2026
 14:59:17 +0000
Received: from BN2PEPF0000449E.namprd02.prod.outlook.com
 (2603:10b6:408:ec:cafe::3c) by BN0PR04CA0120.outlook.office365.com
 (2603:10b6:408:ec::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.7 via Frontend Transport; Tue, 2
 Jun 2026 14:59:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN2PEPF0000449E.mail.protection.outlook.com (10.167.243.149) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Tue, 2 Jun 2026 14:59:16 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 2 Jun
 2026 09:59:16 -0500
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 2 Jun
 2026 09:59:15 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 2 Jun 2026 09:59:15 -0500
Received: from [10.249.32.125] ([10.249.32.125])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 652ExFif3982900;
	Tue, 2 Jun 2026 09:59:15 -0500
Message-ID: <7302e93b-5df9-4d75-8329-30b180c51804@ti.com>
Date: Tue, 2 Jun 2026 09:59:15 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master/wrynose][PATCH 2/2] initramfs: Add netsetup
 module for DHCP network configuration
To: Denys Dmytriyenko <denis@denix.org>, <m-shah@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <nm@ti.com>, <u-kumar1@ti.com>,
	<s-vadapalli@ti.com>, <a-limaye@ti.com>, <gehariprasath@ti.com>,
	<denys@konsulko.com>
References: <20260602104810.1068959-1-m-shah@ti.com>
 <20260602104810.1068959-3-m-shah@ti.com> <20260602134755.GC23325@denix.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20260602134755.GC23325@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000449E:EE_|SA2PR10MB4716:EE_
X-MS-Office365-Filtering-Correlation-Id: e416b091-1a3a-4a5a-94d6-08dec0b78465
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|82310400026|1800799024|376014|56012099006|4143699003|3023799007|22082099003|6133799003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	cqBqlTAS60oFKqlka4Af/3eSOUD7BxSkKrjD2vH3FXuseERY6B92KNmxKGrfyHepK08haTbaqudR3sbDyTu7WwtZZEr4Zr/7mlq6sq8/PJ1oZEeVpSaE0ORxosl62sPKbbyit6EJjA66ARZn405aLzSVFqC3hqMri4xRGwcVBfbCK1cujE4Bfmx0GJO8t39yZBVqkKsH2MBaT+4V6onrtMwzZHrUmAc6+8f7RomamOSo8fgAPowq3LTUkNpskBoT/5x1Br8wu0ZuE/HiCalJK02xM32pwBArd7ORFqK46fazBtxt+FrJnfKEAesMdAK+L3rfQUezkTl5HcUDmdugM6c1IfQYFaogG/GLTspZLqGfXE6H7D+IncJNoogEuw8dTe43Bd1GFERtKMjm4da8lqdvy1j6V0pu0f7qEHjGRDMVKw5sYuoIhLp8ITKKGmqPYnqJJotFlNXGJF9MPQkqZMv7vVwzMVn651nsp+O5Bm2zQRMeDm6tb3IqSDfVCllWg6q3I/XLMuePOSz2U7VgUV/yqDA/pxBRZuJDajqv3usC7fPnf0CcX5RPjLY1NLYHPxvPe2e7V6PZNO5ZVsCGNh0zvjeYHs+1kJNzn5zMjG4O2nWW83d/mB6ncnzwdyzNS1RiEFNpKxUIkZfks2Ver0PwwMVpp8L1CEo4eew3+OPM1fF1nn0V+ELvdGOTzmqLelwLjrCWV/YNRmpovmWOsZQEJ+itmUHAh4hndGlIffU=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(1800799024)(376014)(56012099006)(4143699003)(3023799007)(22082099003)(6133799003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	e8Ek7ePe++jRyV1hBftJXmUstvpcC7aUC189h0RMmh5oePRrdX7WaEWKy5BaqdZWSqBKgdXJtfFVMuSH5poEqqlsi2Fd5PKA7TIlFj+xRbiuELco9jgBr347Btmdi+rcWvJAprofbAABJ4kNYuT9GIT7DtmoVTeUaupazWq5Hg/u5LgrB66g2US56MgkQzi97IgAi7/LTNuGR5xuAfBDUUVgJghC5q19UQJLnOGOXf0KiljA2HxWb2FvDzGw+HENHywMmBm1yxWCFP6vLmWQ02i66oa1n9U+StwAkDqQ/cbPtpf8lL4uvvCgm8vu1R5qSf6vPaKapemgYtlB2JAPuHwKk/gKFTGmndyp/HjOqbeF7nBI5v43qr03N4xewaFX2tzkpK8r10+NF1CAtWt8CiKsGvu6JEq4mPpW2DymDYeb4EaRUgNLUrJ5qPGXOUvt
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 14:59:16.4847
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e416b091-1a3a-4a5a-94d6-08dec0b78465
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN2PEPF0000449E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4716
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 02 Jun 2026 14:59:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19950



On 6/2/2026 8:47 AM, Denys Dmytriyenko wrote:
> On Tue, Jun 02, 2026 at 04:18:10PM +0530, Moteen Shah via lists.yoctoproject.org wrote:
>> Add 83-netsetup, an initramfs-framework module that configures the
>> network interface via DHCP before the NFS root mount. Needed when the
>> Ethernet driver is a loadable module and the deferred probe chain
>> requires time to settle after udev loads the modules. Also add dhcpcd
>> to packagegroup-ti-core-initramfs to support DHCP configuration.
>>
>> Signed-off-by: Moteen Shah <m-shah@ti.com>
>> ---
>>   .../initramfs-framework/83-netsetup           | 54 +++++++++++++++++++
>>   .../initramfs-framework_%.bbappend            | 15 ++++++
>>   .../packagegroup-ti-core-initramfs.bb         |  2 +
>>   3 files changed, 71 insertions(+)
>>   create mode 100644 meta-ti-bsp/recipes-core/initramfs-scripts/initramfs-framework/83-netsetup
>>   create mode 100644 meta-ti-bsp/recipes-core/initramfs-scripts/initramfs-framework_%.bbappend
>>
>> diff --git a/meta-ti-bsp/recipes-core/initramfs-scripts/initramfs-framework/83-netsetup b/meta-ti-bsp/recipes-core/initramfs-scripts/initramfs-framework/83-netsetup
>> new file mode 100644
>> index 00000000..b71bc3b3
>> --- /dev/null
>> +++ b/meta-ti-bsp/recipes-core/initramfs-scripts/initramfs-framework/83-netsetup
>> @@ -0,0 +1,54 @@
>> +#!/bin/sh
>> +# Configure network via DHCP before NFS root mount. Polls for an Ethernet
>> +# interface with sleep 1 per iteration to allow the Ethernet driver deferred
>> +# probe chain to settle after udev loads the modules.
>> +
>> +netsetup_enabled() {
>> +    [ "${bootparam_root}" = "/dev/nfs" ] || return 1
>> +    return 0
>> +}
>> +
>> +netsetup_run() {
>> +    local iface timeout devtype
>> +
>> +    # Extract interface from ip= kernel param (format: client:server:gw:mask:host:device:autoconf)
>> +    iface=""
>> +    case "${bootparam_ip}" in
>> +        dhcp|on|any|"")
>> +            ;;
>> +        *)
>> +            iface=$(echo "${bootparam_ip}" | cut -d: -f6)
>> +            ;;
>> +    esac
>> +
>> +    udevadm trigger --action=add --subsystem-match=net
>> +    udevadm settle --timeout=10
>> +
>> +    # Poll up to 60 seconds for an Ethernet interface (ARPHRD_ETHER = type 1).
>> +    msg "netsetup: waiting for ethernet interface..."
>> +    timeout=60
>> +    while [ "${timeout}" -gt 0 ]; do
>> +        if [ -n "${iface}" ] && [ -d "/sys/class/net/${iface}" ]; then
>> +            break
>> +        fi
>> +        for dev in /sys/class/net/*; do
>> +            [ -f "${dev}/type" ] || continue
>> +            devtype=$(cat "${dev}/type")
>> +            [ "${devtype}" = "1" ] || continue
>> +            iface=$(basename "${dev}")
>> +            break
>> +        done
>> +        [ -n "${iface}" ] && [ -d "/sys/class/net/${iface}" ] && break
>> +        sleep 1
>> +        timeout=$((timeout - 1))
>> +    done
>> +
>> +    if [ -z "${iface}" ] || [ ! -d "/sys/class/net/${iface}" ]; then
>> +        msg "netsetup: no ethernet interface found after 60s, skipping DHCP"
>> +        return
>> +    fi
>> +
>> +    msg "netsetup: configuring ${iface} via DHCP"
>> +
>> +    dhcpcd --waitip "${iface}"
>> +}
>> diff --git a/meta-ti-bsp/recipes-core/initramfs-scripts/initramfs-framework_%.bbappend b/meta-ti-bsp/recipes-core/initramfs-scripts/initramfs-framework_%.bbappend
>> new file mode 100644
>> index 00000000..c8955689
>> --- /dev/null
>> +++ b/meta-ti-bsp/recipes-core/initramfs-scripts/initramfs-framework_%.bbappend
>> @@ -0,0 +1,15 @@
>> +FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
>> +
>> +SUMMARY:initramfs-module-netsetup = "initramfs support for DHCP network setup before NFS root mount"
> 
> This should probably be a standalone initramfs-module* recipe, instead of a
> bbappend.

Agreed.  It's a little confusing to add a subpackage like that.  We 
should create a new recipe and depend on that name to pull in this one 
file.  The name you chose was fine, just move it out of the bbappend.


> 
>> +SRC_URI:append = " file://83-netsetup"
>> +
>> +PACKAGES =+ "initramfs-module-netsetup"
>> +
>> +RDEPENDS:initramfs-module-netsetup = "${PN}-base"
>> +
>> +FILES:initramfs-module-netsetup = "/init.d/83-netsetup"
>> +
>> +do_install:append() {
>> +    install -m 0755 ${UNPACKDIR}/83-netsetup ${D}/init.d/83-netsetup
>> +}
>> diff --git a/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb b/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb
>> index a9eff847..ede0639d 100644
>> --- a/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb
>> +++ b/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb
>> @@ -18,6 +18,8 @@ RDEPENDS:${PN} += "\
>>       netbase \
>>       base-files \
>>       base-passwd \
>> +    dhcpcd \
>> +    initramfs-module-netsetup \
>>       initramfs-framework-base \
>>       initramfs-module-udev \
>>       initramfs-module-nfsrootfs \
>> -- 
>> 2.34.1

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

