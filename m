Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.52])
 by mx.groups.io with SMTP id smtpd.web10.643.1583522166619065899
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 06 Mar 2020 11:16:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@uievolution.onmicrosoft.com header.s=selector2-uievolution-onmicrosoft-com header.b=iZ9cVH4J;
 spf=pass (domain: xevo.com, ip: 40.107.92.52, mailfrom: mkelly@xevo.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SEuV8jdnHkAqRcto285zJu+HywqvyFSLq4Y7JpijSUo1n5coe2bD/sYQdiHWEArw3SCjHBW2n4TgXcMEuNYNQ0fXOwWHquV3EbjqwLDcgIJUNUwlarQ8q3bsncDNx2dA9MUNji0ylfiItnIMl3d9q4xQqimy+treWPXxSWJ+Sf+8km0nBkD+M3J3brUOyo5eXTIuKve0upf3xrqqWK8nmY+Z4ZwucF7dRoQqNEHdjPRW2kEu3MvMPjPhLQ/Doat3nNPLk/DTXVE69q5wodo1YoKkTaLqah0f6inXr6YGayLnrRAk2IMyKuJFXWOzQLXBP53JvJEUQUo1Wofava7DUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mpbm8k0wyAJjUjIsYZjL8Zm+eAxy5rXLwGjXnY02+YU=;
 b=UMXq8YJRdewx4YmFqKJ45lnlpT1Z8QEk6A2Tj2b9DRhoXrTtsMIL254Z893suCB9Zv15iR/pipyFqowqDDNNIIlTcFoP9hbqwsDNQGYFyyaOCohm+xRzcPlrLFW9Vv8Bp7QF5vd2RKxNWdQNYbMAYvc/fh2Hp3b7qjah5sLPQtp2vE/9JhOt/da1gkprWMUj0i3BLi/ShCgzzHhoOCf1H4DV+K6nXraLkV5eKsVR+AxztYBSiBki8XL2Tb/lnCrFs9PtCoNOX2aM6miHZqrpDriw9+mmNxuAoL6RAPivjqC9Mk/Wg9qGNcHvtcXL9/Kk8CkenAbTF0qcLF2zWCphkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xevo.com; dmarc=pass action=none header.from=xevo.com;
 dkim=pass header.d=xevo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=uievolution.onmicrosoft.com; s=selector2-uievolution-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mpbm8k0wyAJjUjIsYZjL8Zm+eAxy5rXLwGjXnY02+YU=;
 b=iZ9cVH4J5Fdzuy2YZ5xQ0b6uzR5/Uk/qhXyaNna4UuXslXAkYoGZvGOGAUcH3ODfGmXg4NyDjk0dj5AURg7EnZkyPU+5sjW6x1InuJVt0VplDAhP9ZviV+k5pi+0BWfvIoOM7nlmp6j/5f4M3Gve4VR/Tv4xyEcL+WO920cYiuw=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=mkelly@xevo.com; 
Received: from MW2PR18MB2236.namprd18.prod.outlook.com (2603:10b6:907:7::14)
 by MW2PR18MB2123.namprd18.prod.outlook.com (2603:10b6:907:8::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2793.14; Fri, 6 Mar
 2020 19:16:04 +0000
Received: from MW2PR18MB2236.namprd18.prod.outlook.com
 ([fe80::492:f89:e20a:12b6]) by MW2PR18MB2236.namprd18.prod.outlook.com
 ([fe80::492:f89:e20a:12b6%6]) with mapi id 15.20.2772.019; Fri, 6 Mar 2020
 19:16:04 +0000
To: meta-ti@lists.yoctoproject.org
From: "Martin Kelly" <mkelly@xevo.com>
Subject: Booting a J7 EVM without meta-arago
Cc: denys@ti.com
Message-ID: <efd6a31a-15ab-1f2d-9b74-e08b11662c02@xevo.com>
Date: Fri, 6 Mar 2020 11:16:01 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
X-ClientProxiedBy: BY5PR04CA0025.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::35) To MW2PR18MB2236.namprd18.prod.outlook.com
 (2603:10b6:907:7::14)
Return-Path: mkelly@xevo.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.254.27] (50.35.85.47) by BY5PR04CA0025.namprd04.prod.outlook.com (2603:10b6:a03:1d0::35) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2772.19 via Frontend Transport; Fri, 6 Mar 2020 19:16:03 +0000
X-Originating-IP: [50.35.85.47]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7113536c-b298-4d79-92d0-08d7c202d043
X-MS-TrafficTypeDiagnostic: MW2PR18MB2123:
X-Microsoft-Antispam-PRVS: 
	<MW2PR18MB212366D0D4198FF677945E2EABE30@MW2PR18MB2123.namprd18.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 0334223192
X-Forefront-Antispam-Report: 
	SFV:NSPM;SFS:(10009020)(39840400004)(396003)(136003)(376002)(366004)(346002)(199004)(189003)(16576012)(316002)(31696002)(956004)(31686004)(2616005)(66946007)(52116002)(66476007)(66556008)(4744005)(36756003)(4326008)(86362001)(8936002)(26005)(478600001)(8676002)(6486002)(5660300002)(16526019)(6916009)(2906002)(186003)(81156014)(81166006);DIR:OUT;SFP:1101;SCL:1;SRVR:MW2PR18MB2123;H:MW2PR18MB2236.namprd18.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
Received-SPF: None (protection.outlook.com: xevo.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	HHU+w6uO9PvSIMO9uCLkFdVIe/GibBmvsLqs1fSaZM6LIjy47+4jCp62IjeulqvOFBcMdHyDwO0d3RX8/FnxrHJwXqBlPU1573e/1mq1GA2/NnN3phwtnll+F8hsOlIcXBO1j4lq8t3ujhEaGAY//xoUqElLLzKdzKiXOgia0/FGfLyN1wcstY2N6HJ0lOSJJazj+vcxSROIfvyoT3RZ55OnpP+2l3CIam/ir54BAZRxP36z0/Pa2Du8oIqrqreUoCCG6Z/RCe5tlgiyr5b0Xn2ar2e+MXA+4tQE78imOq7eta2cU+oFupjEBYFPuhpmajAhJdMbKOTnNmGNhdCjjfBz9hYYlZa3fanVZQ00eR5ilDMLzg1UtpLv+QGdBEZ9v0gRpF5em1Q21xrycluCoHWFcjNNOmld9RX79XpOPdilFKE2axSSYF6k26Pxdvdv
X-MS-Exchange-AntiSpam-MessageData: 
	AxaV4LKMizcrTNyv4g7vNtgVUuJo7MZHcD+8FZ/6lNvKAI0e37483DPdmd7lHoZWJnq1E232vVnsy+OTc8c7/AsPOGCC4aDbzu+dFODtwT3q5wipGjJ8wQBqPmtazEy/k+izFcPFYHz8kvZ0JEkFzw==
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7113536c-b298-4d79-92d0-08d7c202d043
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2020 19:16:03.9215
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e0a7ca1f-2458-4cd6-a7c7-d733c07495ab
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mes/jxRj7SwAKA/VVsi3Tp6UXVa/q+g2TMqKmG2adR7eiYifpcCcbae87qOjIm1H
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR18MB2123
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi,

I'm trying to get a basic image running on the J7 EVM using only meta-ti 
without meta-arago, as I want to use this board but don't need most of 
the TI SDK support.

I'm using the j7-evm MACHINE type, and I get a successful build but no 
u-boot output. In contrast, I get fine output with an SDK built with 
meta-arago. If I copy the boot partition from the SDK, I can get u-boot 
output.

I then noticed the following comment in k3.inc:

# Please note that booting K3 platform also requires
# tiboot3.bin and sysfw.itb, which are provided by meta-arago
# u-boot-k3-r5 and ti-sci-fw recipes
IMAGE_BOOT_FILES ?= "${SPL_BINARY} u-boot.${UBOOT_SUFFIX}"
WKS_FILE ?= "sdimage-bootpart.wks"
do_image_wic[depends] += "u-boot:do_deploy"

Does this mean it's not actually possible to successfully boot a system 
without pulling in meta-arago and all its many dependencies? Is there a 
chance we could port these recipes into meta-ti, or will I always have 
to use meta-arago?

Thanks,
Martin
