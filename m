Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 536A1C79F99
	for <webhook@archiver.kernel.org>; Tue,  8 Sep 2026 14:06:47 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8212.1788876399409940952
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 08 Sep 2026 07:06:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=giCgaNhI;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=joE6cMNZ;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: reatmon@ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 688CnjE11805411;
	Tue, 8 Sep 2026 09:06:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=8Ir0gWpVzSnltLLLxG6dWoWFgjCv0HFyvkwe1mFlI
	uA=; b=giCgaNhIvieFJPz9Qe5QNfpd8uID0iQePwtLnNbQ6cKKvla2WE+qdO+eo
	WKToRVp1NQQ99Um7NMNpsJ8ne9IaM5uGxZF3irMoF3D0PyEPlbzkSddBRDZoLyH5
	XvGt7xWGA61h2+0wrnN+dzl0XtEyKoHRcz7p9VC7hsTGymVReNFboHLdzV+fmlqg
	44huD3wwr3c0pgWTZfTwq3bWtWCm5BgJmYbkT48hTc6rKBF2GEA48Ef89LjzxBIO
	qIARZQOF3yQvgV8S41ZkP2N+b+6fWtMpC00vGjYriA8qJLnYE24Jbs8TNYwGa4v5
	+uhdnoUFSRhVPkoAodDh36+syhoCA==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013037.outbound.protection.outlook.com [40.93.201.37])
	by m0380145.ppops.net (PPS) with ESMTPS id 4gjffmshxg-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 08 Sep 2026 09:06:32 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Roj0f8fdOF4rnqCaH1RdR1+1R7QdG801RtRJAhorCVxmPYVkY7WZR3mLfa/woZOvm93kEFmLeib08UeS7zQsSxfTCarMsDJkVSNuurjX3PhR06eDITyqTg47YvRGfPkdT1Ju4Sv0AWz9LA+IvhkENw5xb8iR8tJ91EQmQteam6hosoV63GdhaeZsUlV+4XvM7nFXxVjFJT+6Nx99TFBm/VVbnTUrNvqSnOKo2rfW3jjJIiGgJ0lgslYNsrNVPYQN2Gwq9k0RA2iRyw8Gw7ToLrL8ecq2DiC6iBUja7O+H5okGTGUNEogtgl4gHKN/xZ4+PfZ2UDN4wzi4EmKKT8x2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Ir0gWpVzSnltLLLxG6dWoWFgjCv0HFyvkwe1mFlIuA=;
 b=JT20dFuaSUc2zUr/vjPLF0HzrPeaDyAoiNFHAVn+lEooGfVjGz0EZLcQZXCAkeqtzi+wnfftAzSlEoZsK0Phrlfsnk7OeYEJNlD0H8nvro7WnvBqdaY0F0renenrpwzVPecKpKh9Ccr/yAR5493HVjPRWXOTUwGj7Qu/lvSZRk+Xec4UbNeWSuWfbDyRwmuUfhz8apk5FxGh7BSpTJ5lWvEftI2kB0dUmmo0wCLgqNFpMbzkd3v7cemVGYBQU+Sg/TF8imKfZMFhMqc6h8NpYpEmW6z9FsVFF8L5vapV/ctXPAwojEJAjF14hR7ozo//CxtaxjYGHzTZzgPh0t+NWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=dolcini.it smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Ir0gWpVzSnltLLLxG6dWoWFgjCv0HFyvkwe1mFlIuA=;
 b=joE6cMNZYkDkK0LqtU34dK6BMy99CXRrNB2hMyJNJQuqDhmslmcNMvQoNeDbkXYW+R2148wp9tXF4j+E4zlw476s79DG6dhLHHWHQdXCjQocQZ16DT9mY7RUn758l9kZHwBBV9RZ6GhRRN1ryKdQN/mjwngUD2in+lFLQpm2FAI=
Received: from BL1PR13CA0273.namprd13.prod.outlook.com (2603:10b6:208:2bc::8)
 by DS0PR10MB8104.namprd10.prod.outlook.com (2603:10b6:8:1f4::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.6; Tue, 8 Sep 2026
 14:06:26 +0000
Received: from BN3PEPF00022BDA.namprd03.prod.outlook.com
 (2603:10b6:208:2bc:cafe::4f) by BL1PR13CA0273.outlook.office365.com
 (2603:10b6:208:2bc::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.6 via Frontend Transport; Tue, 8
 Sep 2026 14:06:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN3PEPF00022BDA.mail.protection.outlook.com (10.167.248.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Tue, 8 Sep 2026 14:06:25 +0000
Received: from DFLE203.ent.ti.com (10.64.6.61) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 8 Sep
 2026 09:05:25 -0500
Received: from DFLE205.ent.ti.com (10.64.6.63) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 8 Sep
 2026 09:05:24 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 8 Sep 2026 09:05:24 -0500
Received: from [10.249.66.148] ([10.249.66.148])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 688E5O8I2588803;
	Tue, 8 Sep 2026 09:05:24 -0500
Message-ID: <4608f653-12a3-4810-b905-c8fc59e1f5a6@ti.com>
Date: Tue, 8 Sep 2026 09:05:24 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [master] mesa-pvr/libclc broken after LLVM 23.1.0 upgrade in
 oe-core
To: Franz Schnyder <fra.schnyder@gmail.com>, <meta-ti@lists.yoctoproject.org>
CC: Francesco Dolcini <francesco@dolcini.it>
References: <pyqpmssd7hwfvotynswv3mhg5bqkaa3fdvctg2yvuydurvegvi@n2gbtvs6wn6h>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <pyqpmssd7hwfvotynswv3mhg5bqkaa3fdvctg2yvuydurvegvi@n2gbtvs6wn6h>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF00022BDA:EE_|DS0PR10MB8104:EE_
X-MS-Office365-Filtering-Correlation-Id: e1f4341a-afcb-42db-cfa2-08df0db25e8a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|36860700016|23010399003|1800799024|13003099007|6133799003|10067099003|56012099006|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: 
	ulnQj1lDrOsHYH88WkJiI/OqSa8G6eSB63h6DINvuI2oRZLtFgB6s4f7Aj/EufOqlT0GSZPgbJ8NNdM+Gl92RfoqJN1MCKOqqXXcae/wHISURYGAiPc3cMoCoQr+SPo3y+f1pUTM4CZptvS/1KhIwQmovJ1xOBWlOHdesDnbNGGedry56cNQ1abiyQyHKbr2eAP6uOu6tY5n4NWGh7CSGgN/OCOvLxO69tR8uswXGYd/jSoPxqvOkNhz66eUSAX3mwgvuVdQxsltez+m4eX8dRl//+D5fZvSl8bW0+V1G/c5x5ygFow+jXQeq1tkRBVyx2m46/YphJPMS/pDe6zOXGOUFyRb2vsj7VJh2dknCxZdLkHC2GheJkPUhAx3CjG/Jp94vFG7nPzGOxDtv/KmeQml8eMQUsYU/+eAJ2XFk89zGonrUHkRT1JX64GO/Am7RMOdc28FhmhgNGll6VII9iefVjJhI2tv7J5mjAOPbMZ43uu+8/iH7rT9W4a2mgzWZaRWNsvd0hTA7i4F8zQYUo27siP10ovace8aGzzS0Fq5OGNrV934MN8iyVEJmNvouhvYPIIryIL6V6CpGqDN7Q1tji6n65SBak3sH+kMTg15EZLp8Q3nF0S6RE9prKOFoWaN6i+W5nVol4qX806W6w==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(23010399003)(1800799024)(13003099007)(6133799003)(10067099003)(56012099006)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	w1d9MuSLbpJXPyB0czvTvKjWKW6dKb/CUYokqvUKLBMuwE2CpvQsgC3BBrTei+dErNWTleXrr36JVjOLx2uhC5RsWIG1LtDfv52tg8TmSiU0NNLaO6oRRXiNC+nWqqC8bBWMSwUulA7WO1CGAUtrk/wUIWyrtqK4q3c78CkIlupjbBKYREm/up49XKuG1QeX8YNR/8lIKvVfYtBJTGPxHT8K5UEbqNsVB331a01/2MnIJ8iTm1D/Ic/KLP/zLC8adOxQzJ3C0LdEUo0/7J05CukY8Hg0cPLswe/GfmMP87y9AWMNBrQSAE2BEKkmM3CIhuImdiItt2/47XG8BuhtBnwa0qxghrRORWIyfQsoJ6xBjZkQc3l0tY8iOe4OeYsbcVQK/W6mM9+kjqjbC0pspndcY55mMIaN4pk/kEZZGxGtUUZ3ORXvNXP5d0cS9j4y
X-Exchange-RoutingPolicyChecked: 
	wgJivwsQO9skH0DY0BfEe4eAqzSKp36++4KSS2E0js8MBSjmFXrEqMFd0AxuQpGfkDvi1Yp63Ya2/j7I8oOhqrcUA6OWy2MGEnRkNSxMgT8X8BE0lkfSMa/rkTLYV8LHsdauuIngLPnmcUgu3INOlB/g59d/bki779fa54FvkglfIwkl7/gtdCc3+IZ25ff/u1X0HNnIedqziA/MhKeO2wgt5v8c31N93M5TTiz26UFRz8jL9SwSG0Lb1PRA2sQ91dBQpVZuA/bgwLhyjkLzTEVC91y9O97gqO6gk8b5B9WHNK8Uo9lIsN0Ov4rdflb8gbnerUVjI5Jpw3iGvlm07Q==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2026 14:06:25.0245
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e1f4341a-afcb-42db-cfa2-08df0db25e8a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN3PEPF00022BDA.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB8104
X-Authority-Analysis: v=2.4 cv=FewHAp+6 c=1 sm=1 tr=0 ts=6aa01668 cx=c_pps
 a=a2CzU9h33xTdk3q/+L33yA==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=Q4-j1AaZAAAA:8
 a=sozttTNsAAAA:8 a=Hz6Mq-uxhiPez1QYCQAA:9 a=QEXdDO2ut3YA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-ORIG-GUID: DaRNDyTVtYTVWt33ZXKkJ2IjnJcxLJ9B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDE1MSBTYWx0ZWRfX8yPmlSIkVbgQ
 5IyGikk40uMMQorjl9/PPE3cfy/xnLSl3eOcwcsMFAlCk49EyOeS2/Obsqr4LB1Nrn29BnpFPh1
 +KmJzygV4HpImDNhlTm921fGSCAxjf90Pz4sA48qKfR383WjsS5tTCdyi49tVlqNDgdEZpVG3xs
 1sMfIffHuMEbylxgZViy39bhTWNSBG1GcgwF3x7q973YLS+1zX9WpfETm4PYQ0Y8ncXAq1Vx+4D
 8trj2TTTFzaXAOunRnlrXgPeHmffRioT5h1DsFKp4A3xbhXQ2wgaRNKNIOP5N6f52qoMhYo5yGc
 BbP8f8njuSATz9rMw2RbJU1wONCFWxKjm2X8j76JfHHGdEN52r9OOCd2YI2DJ910mRNcZ8EzVXF
 wGfX1dr+dxEul9pyLwiC5l5qgdIgCoHFxb5y4lz2DKYYkyBJbWZBYxKMzZYxUGn04k2oFOSm52o
 dJH3xXdwMYIvEPyMsng==
X-Proofpoint-GUID: DaRNDyTVtYTVWt33ZXKkJ2IjnJcxLJ9B
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDE1MSBTYWx0ZWRfX+Ex+WRALfo73
 DocuzGDpf+xhe5sNV5AhWaAe5Q+w+fo6+drrPwksT0QmUag1VBVLiOl7hEp/Y0eh2OnKRQ+VLJs
 SnOt+61fYWlPNvTuCcwMjWlkab2aiRY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_02,2026-09-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 clxscore=1011 phishscore=0
 bulkscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080151
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 08 Sep 2026 14:06:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20348



On 9/7/2026 10:48 AM, Franz Schnyder wrote:
> Hello,
> 
> In addition to the patch I sent earlier to remove the makedepend
> dependency [1], we are experiencing issues with our builds targeting the
> master branches. There is a problem with the oe-core clang/LLVM upgrade
> to 23.1.0. libclc fails to build and therefore also mesa-pvr.
> 
> | The no-dev option is deprecated.  Use -Wno-author instead.
> | -- The CXX compiler identification is GNU 16.2.0
> | -- The C compiler identification is GNU 16.2.0
> | -- Detecting CXX compiler ABI info
> | -- Detecting CXX compiler ABI info - done
> | -- Check for working CXX compiler: /var/home/scf/build/BSP8/bitbake-builds/tdxref-master/build/tmp/work/aarch64-tdx-linux/libclc/23.1.0/recipe-sysroot-native/usr/bin/aarch64-tdx-linux/aarch64-tdx-linux-g++ - skipped
> | -- Detecting CXX compile features
> | -- Detecting CXX compile features - done
> | -- Detecting C compiler ABI info
> | -- Detecting C compiler ABI info - done
> | -- Check for working C compiler: /var/home/scf/build/BSP8/bitbake-builds/tdxref-master/build/tmp/work/aarch64-tdx-linux/libclc/23.1.0/recipe-sysroot-native/usr/bin/aarch64-tdx-linux/aarch64-tdx-linux-gcc - skipped
> | -- Detecting C compile features
> | -- Detecting C compile features - done
> | -- Check for working CLC compiler: /var/home/scf/build/BSP8/bitbake-builds/tdxref-master/build/tmp/work/aarch64-tdx-linux/libclc/23.1.0/recipe-sysroot-native/usr/bin/aarch64-tdx-linux/aarch64-tdx-linux-gcc
> | CMake Error at cmake/modules/CMakeTestCLCCompiler.cmake:29 (message):
> |   The CLC compiler
> |
> |     /var/home/scf/build/BSP8/bitbake-builds/tdxref-master/build/tmp/work/aarch64-tdx-linux/libclc/23.1.0/recipe-sysroot-native/usr/bin/aarch64-tdx-linux/aarch64-tdx-linux-gcc
> |
> |   is not able to compile a simple OpenCL test program.
> |
> |   Output:
> |
> |   aarch64-tdx-linux-gcc: error: unrecognized command-line option
> |   '--target=spirv64-unknown-unknown'
> |
> | Call Stack (most recent call first):
> |   CMakeLists.txt:20 (enable_language)
> |
> |
> | -- Configuring incomplete, errors occurred!
> 
> I tried to understand what is going on.
> As oe-core removed libclc, a copy was introduced with
> commit de61ea26 ("libclc: Import from removed oe-core recipe").
> However, with the upgrade to 23.1.0, libclc changes how it detects the
> build compiler.
> 
> Due to the constantly introduced breaking changes from LLVM, mesa itself
> moved to its own libclc fork with mesa-libclc [2].
> I tried to follow a similar path for mesa-pvr-25.inc:
> 
>    --- a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-25.inc
>    +++ b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-25.inc
>    @@ -206 +206 @@
>    -PACKAGECONFIG[libclc] = "...,,libclc spirv-tools spirv-llvm-translator ${MESA_NATIVE}"
>    +PACKAGECONFIG[libclc] = "...,,mesa-libclc spirv-tools spirv-llvm-translator ${MESA_NATIVE}"
>    @@ -239 +239 @@
>    -RDEPENDS:libopencl-mesa += "...'libclc'..."
>    +RDEPENDS:libopencl-mesa += "...'mesa-libclc'..."
> 
> + dropping libclc_git.bb
> 
> mesa-libclc builds correctly, but mesa-pvr do_configure then fails:
> 
>    | Found CMake: NO
>    | Run-time dependency libclc found: NO  (tried pkg-config)
>    | ../sources/mesa-pvr-25.2.8/meson.build:873:12: ERROR: Dependency
>    |   "libclc" not found (tried pkg-config)
> 
> I got a bit stuck on what the correct approach would be.
> Adding a patch to change the dependency in powervr meson.build source?
> Before spending more time on it, I wanted to report this here first.
> 
> Any ideas how to proceed?

You are basically at the same place I'm at with this.  Welcome to the 
quagmire. =)

Now that I'm back from the holiday weekend this is my main focus on 
getting working.

> [1] https://lore.kernel.org/yocto-meta-ti/20260907144642.3994088-1-fra.schnyder@gmail.com/T/#u
> [2] https://git.openembedded.org/openembedded-core/commit/?id=2614dd44ed724844df13d44b7cb6f8971925b0a3
> 
> Kind regards
> 
> Franz

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

