Return-Path: <prvs=15897a19a=Kevin.E.Cribbs@L3Harris.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 638A6E00BE2; Thu, 19 Sep 2019 05:41:15 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [166.20.51.117 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from smtp6out.l-3com.com (smtp6out.l-3com.com [166.20.51.117])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EC79AE00994
	for <meta-ti@yoctoproject.org>; Thu, 19 Sep 2019 05:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=l3harris.com; i=@l3harris.com; q=dns/txt; s=mail1;
	t=1568896874; x=1600432874;
	h=from:to:subject:date:message-id:mime-version:
	content-transfer-encoding;
	bh=Vw4XaUBtf9ggwpaVkNvsWls83j9aumPMxRNKFo83IPI=;
	b=A+cZx/1ZUqeFfJx+H1yWHHGvKpwhlXS9SnGP6kjU+BKziu7yxRkx5J4l
	yLq1JAMXwqjhmHf+QWo1ZO5/sLAJLbDdTnfu1KFb8VHRa5VjhsJGfNKuw
	hta/x1iabzW4nKvQI/H9Smj++Os7J2qq1orMVltNvu6MgPrnAQR75yg/m
	2kco5M7q2j7lUiZVo9HOMRAww4Ry/9+dcoD1/c2a1x6QND5L/5UvkGok+
	s7G8Imp0ol/uMaHB7WGhcRfh88yBqhtBI75ETL0T1LIkDCVV6cCYxffNh
	zNnc2PcbEYgTYYOok2XWde0Nl3T30GzkrRkZxKTafqzRleePkFDAPktf9 w==;
X-filenames: 
X-filesizes: None
X-filetypes: 
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,523,1559520000"; d="scan'208";a="424770721"
X-L3Internal: true
Received: from ex08dag01azusva.rootforest.com (HELO mail.l3t.com)
	([141.199.128.138])
	by smtp6out.l-3com.com with ESMTP; 19 Sep 2019 12:41:12 +0000
Received: from EX05DAG01azusva.rootforest.com (141.199.128.135) by
	EX08DAG01AZUSVA.rootforest.com (141.199.128.138) with Microsoft SMTP
	Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
	15.1.1713.5; Thu, 19 Sep 2019 12:41:12 +0000
Received: from USG02-BN3-obe.outbound.protection.office365.us (23.103.199.144)
	by smtp.l3t.com (141.199.128.135) with Microsoft SMTP Server
	(version=TLS1_2, 
	cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5 via
	Frontend Transport; Thu, 19 Sep 2019 12:41:12 +0000
Received: from CY1P110MB0470.NAMP110.PROD.OUTLOOK.COM (52.145.1.138) by
	CY1P110MB0214.NAMP110.PROD.OUTLOOK.COM (23.103.24.217) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2241.26; Thu, 19 Sep 2019 12:41:09 +0000
Received: from CY1P110MB0470.NAMP110.PROD.OUTLOOK.COM
	([fe80::c82b:7d59:7f61:ead0]) by CY1P110MB0470.NAMP110.PROD.OUTLOOK.COM
	([fe80::c82b:7d59:7f61:ead0%11]) with mapi id 15.20.2136.029;
	Thu, 19 Sep 2019 12:41:09 +0000
From: <Kevin.E.Cribbs@L3Harris.com>
To: <meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] meta-ti (a345e0c2) Linux kernel fails to boot on
	Beagleboard-xM (rev C)
Thread-Index: AdVu3ufoIqpeUmgGRj+tFMGoe8BBXw==
Date: Thu, 19 Sep 2019 12:41:09 +0000
Message-ID: <CY1P110MB047006AD2DFE79658DE8867DE8890@CY1P110MB0470.NAMP110.PROD.OUTLOOK.COM>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Kevin.E.Cribbs@L3Harris.com; 
x-originating-ip: [166.20.224.11]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bb9ef5d9-dbc6-4a85-2dcd-08d73cfea594
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
	SRVR:CY1P110MB0214; 
x-ms-traffictypediagnostic: CY1P110MB0214:
x-microsoft-antispam-prvs: <CY1P110MB0214F7ACA046051EDB76BC96E8890@CY1P110MB0214.NAMP110.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 016572D96D
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(366004)(199004)(189003)(486006)(2351001)(55016002)(9686003)(3846002)(5640700003)(66446008)(6436002)(66556008)(2906002)(6116002)(14454004)(76116006)(64756008)(7736002)(66946007)(6246003)(25786009)(8936002)(74316002)(498600001)(66066001)(66476007)(99286004)(6916009)(305945005)(229853002)(8676002)(102836004)(81166006)(2501003)(476003)(81156014)(256004)(26005)(86362001)(5660300002)(71200400001)(6506007)(186003)(52536014)(7696005)(33656002)(71190400001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CY1P110MB0214;
	H:CY1P110MB0470.NAMP110.PROD.OUTLOOK.COM; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:3; MX:3; 
x-ms-exchange-senderadcheck: 1
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: bb9ef5d9-dbc6-4a85-2dcd-08d73cfea594
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Sep 2019 12:41:09.2666 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: ba488c5e-f105-4a2b-a8b1-b57b26a44117
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Kevin.E.Cribbs@cse.L3T.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1P110MB0214
X-OriginatorOrg: L3Harris.com
Subject: Re: meta-ti (a345e0c2) Linux kernel fails to boot on Beagleboard-xM (rev C)
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Thu, 19 Sep 2019 12:41:15 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Summary: meta-ti created beagleboard .config is causing the Linux kernel to=
 fail during boot

Question:  How do I connect with the people that can correct the MACHINE eq=
ual beagleboard .config file?


Information that may explain why I ask the question above:

Based on Denys' recent reply, I confirmed a mainline Linux kernel v4.19.73 =
build runs on the Beagleboard-xM (when compiled with an appropriate kernel =
.config).

After identifying an appropriate .config for the mainline Linux kernel v4.1=
9.73, I used that .config for defconfig in a poky 2.7.1 and meta-ti (44a979=
c5265) build. The meta-ti build using my defconfig override runs on the Bea=
gleboard-xM.

When not overridden, the defconfig used for MACHINE equal beagleboard is th=
e one line "use-tisdk-config=3Dti_sdk_omap2_release" file. During do_config=
ure(), the one line defconfig causes execution of the lines below (with con=
fig equal to "ti_sdk_omap2_release").
/short/build/tmp/work/beagleboard-poky-linux-gnueabi/linux-ti-staging/4.19.=
59+gitAUTOINC+50ceb3c6e7-r127a/git/ti_config_fragments/defconfig_builder.sh=
 -w /short/build/tmp/work/beagleboard-poky-linux-gnueabi/linux-ti-staging/4=
.19.59+gitAUTOINC+50ceb3c6e7-r127a/git -t $config
oe_runmake -C /short/build/tmp/work/beagleboard-poky-linux-gnueabi/linux-ti=
-staging/4.19.59+gitAUTOINC+50ceb3c6e7-r127a/git O=3D/short/build/tmp/work/=
beagleboard-poky-linux-gnueabi/linux-ti-staging/4.19.59+gitAUTOINC+50ceb3c6=
e7-r127a/build "$config"_defconfig

After my quick scan of the defconfig_builder.sh, I found a "ti_sdk_omap2_re=
lease_defconfig" file I believe to be based on arch/arm/configs/multi_v7_de=
fconfig (based on defconfig_map.txt redirection via "defconfig: multi_v7_de=
fconfig").


  =


CONFIDENTIALITY NOTICE: This email and any attachments are for the sole use=
 of the intended recipient and may contain material that is proprietary, co=
nfidential, privileged or otherwise legally protected or restricted under a=
pplicable government laws. Any review, disclosure, distributing or other us=
e without expressed permission of the sender is strictly prohibited. If you=
 are not the intended recipient, please contact the sender and delete all c=
opies without reading, printing, or saving.



