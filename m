Return-Path: <kirk.sutherland@apisensor.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id EB78AE009DC; Fri, 27 Apr 2018 10:51:57 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, HTML_MESSAGE, RCVD_IN_DNSWL_NONE,
	SPF_HELO_PASS autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [104.47.36.137 listed in list.dnswl.org]
	* -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Greylist: delayed 909 seconds by postgrey-1.32 at yocto-www;
	Fri, 27 Apr 2018 10:51:55 PDT
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
	(mail-sn1nam02on0137.outbound.protection.outlook.com [104.47.36.137])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 15F07E0073D
	for <meta-ti@yoctoproject.org>; Fri, 27 Apr 2018 10:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=apitreck.onmicrosoft.com; s=selector1-apisensor-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=PIQHRMEnHagYp+64f99ow9jqYXwylbpDLKIoHBf8EGk=;
	b=Ci0eqwdZyK+UlmLpccKTwJeA2GiUI/UgM3uhGQSdWhdyy0Zg5U4UCu64YPQIUfnuhRvDK/MPFld6pDDZpvx8ZkLB8T8R7R5yn05WCAQEwmyAChBbioYzfAcjWLKnkyviTDh33J+6Qc12T0mlN0EjBtP+ozIZKZd3s+cf/gCcuVQ=
Received: from BN6PR04MB1044.namprd04.prod.outlook.com (10.174.234.26) by
	BN6PR04MB0756.namprd04.prod.outlook.com (10.172.198.141) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
	15.20.715.18; Fri, 27 Apr 2018 17:36:44 +0000
Received: from BN6PR04MB1044.namprd04.prod.outlook.com
	([fe80::1165:c7bb:e554:81b4]) by
	BN6PR04MB1044.namprd04.prod.outlook.com
	([fe80::1165:c7bb:e554:81b4%13]) with mapi id 15.20.0715.018;
	Fri, 27 Apr 2018 17:36:43 +0000
From: Kirk Sutherland <kirk.sutherland@apisensor.com>
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Thread-Topic: cmem.c fails to compile
Thread-Index: AQHT3kyrsse+kUL5TUKdHBz/UCy/jA==
Date: Fri, 27 Apr 2018 17:36:43 +0000
Message-ID: <BN6PR04MB1044647DA248BB275122B4A0E48D0@BN6PR04MB1044.namprd04.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=kirk.sutherland@apisensor.com; 
x-originating-ip: [152.179.181.2]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; BN6PR04MB0756;
	7:zG5RBeLpHiY3xPYMaoLply6RnDn4NZdYbLGiIKAG43M5XCfYVW+BlPG0X14tKXNcvwmqj383G1JAQHkE7OaR5IhpchFqxe5t0Q5dzxh9h09hbNArlvUx6lwgbvD/0H/wlDrc8Zw5rDtE2ulGA/GgiW2FwAuyirJeBhrjVgZYbeNTrNS74WUsv4E3wSJ1oKpjd80Zu7fHIxFe8kjjXd8SV0wR+17gDuKDSFccOhc9VDivMmE/BiQRM+5s0rTmMULs
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(7021125)(5600026)(4534165)(7022125)(4603075)(4627221)(201702281549075)(7048125)(7024125)(7027125)(7028125)(7023125)(2017052603328)(7153060)(7193020);
	SRVR:BN6PR04MB0756; 
x-ms-traffictypediagnostic: BN6PR04MB0756:
x-microsoft-antispam-prvs: <BN6PR04MB0756B084506C8F016401D005E48D0@BN6PR04MB0756.namprd04.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(22074186197030)(183786458502308);
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(5005006)(8121501046)(3002001)(93006095)(93001095)(3231232)(944501410)(52105095)(10201501046)(6041310)(2016111802025)(20161123558120)(20161123564045)(20161123560045)(20161123562045)(6072148)(6043046)(201708071742011);
	SRVR:BN6PR04MB0756; BCL:0; PCL:0; RULEID:; SRVR:BN6PR04MB0756; 
x-forefront-prvs: 0655F9F006
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(346002)(396003)(39380400002)(376002)(366004)(39840400004)(374574003)(199004)(189003)(106356001)(25786009)(476003)(5250100002)(97736004)(105586002)(2501003)(5890100001)(19627405001)(6606003)(6916009)(478600001)(3660700001)(3280700002)(2906002)(606006)(966005)(2351001)(14454004)(2900100001)(74316002)(55016002)(6436002)(236005)(9686003)(7736002)(86362001)(6506007)(53936002)(81156014)(54896002)(68736007)(8676002)(6306002)(81166006)(102836004)(186003)(26005)(316002)(59450400001)(7696005)(6116002)(3480700004)(99286004)(66066001)(486006)(5660300001)(3846002)(5640700003)(8936002)(44832011)(33656002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BN6PR04MB0756;
	H:BN6PR04MB1044.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: apisensor.com does not designate
	permitted sender hosts)
x-microsoft-antispam-message-info: ti+A/w7CWA938cuh0Q8o+7/5uSi8QWKG8DbKcnfyCq0W/i8JrBvkotz6MU1SaH9pNUkqiXyHr3hFpFGqkCR8OTI5aAHB3sCq2hBsmrgAC0pM3gmq8/F/kX7mRj7zBd2kaYO22csTiPe8BhlFTuD0TjSTF8RzSQpZg/YznXZ7jTXnxPISZlh8lToOGfic7oeN
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: 5f371497-0ea9-41d8-910f-08d5ac657184
X-OriginatorOrg: apisensor.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f371497-0ea9-41d8-910f-08d5ac657184
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Apr 2018 17:36:43.5855 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 88d40d3c-11dd-48ad-bc72-689361be940f
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR04MB0756
Subject: cmem.c fails to compile
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
X-List-Received-Date: Fri, 27 Apr 2018 17:51:58 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BN6PR04MB1044647DA248BB275122B4A0E48D0BN6PR04MB1044namp_"

--_000_BN6PR04MB1044647DA248BB275122B4A0E48D0BN6PR04MB1044namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,


I've been trying to build gstreamer-ti from the fido or krogoth branch of t=
he gumstix/yocto manifest but ran into issues with the meta-ti parts. I can=
 build the standard console and gumstix images just fine, but when try to b=
itbake gstreamer-ti I get:


cmem.c:38:19: fatal error: stdio.h: no such file or directory


I'm running it on a 32 bit system and as far as I can tell all the required=
 libraries for gcc are there, it does make me think it could be related to =
this more recent issue with gcc https://gcc.gnu.org/bugzilla/show_bug.cgi?i=
d=3D70129 but I'm not really sure what is happening here. Any pointers as t=
o how to get this to work or what branch does work would be greatly appreci=
ated.

IMPORTANT NOTICE FROM API: This communication, including any attachments, c=
ontains information that may be confidential or privileged and is intended =
solely for the entity or individual to whom it is addressed. If you are not=
 the intended recipient, please contact the sender immediately and delete t=
his message. Any unauthorized disclosure, copying or distribution of this m=
essage is strictly prohibited.

--_000_BN6PR04MB1044647DA248BB275122B4A0E48D0BN6PR04MB1044namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"><!-- P {margin-top:0;margi=
n-bottom:0;} --></style>
</head>
<body dir=3D"ltr">
<div id=3D"divtagdefaultwrapper" style=3D"font-size:12pt;color:#000000;font=
-family:Calibri,Helvetica,sans-serif;" dir=3D"ltr">
<p style=3D"margin-top:0;margin-bottom:0">Hi,</p>
<p style=3D"margin-top:0;margin-bottom:0"><br>
</p>
<p style=3D"margin-top:0;margin-bottom:0">I've been trying to build gstream=
er-ti from the fido or krogoth branch of the gumstix/yocto&nbsp;manifest bu=
t ran into issues with the meta-ti parts. I can build the standard console =
and gumstix&nbsp;images just fine, but when
 try to bitbake gstreamer-ti I get:</p>
<p style=3D"margin-top:0;margin-bottom:0"><br>
</p>
<p style=3D"margin-top:0;margin-bottom:0">cmem.c:38:19: fatal error: stdio.=
h: no such file or directory</p>
<p style=3D"margin-top:0;margin-bottom:0"><br>
</p>
<p style=3D"margin-top:0;margin-bottom:0">I'm running it on a 32 bit system=
 and as far as I can tell all the required libraries for gcc are there, it =
does make me think it could be related to this more recent issue with gcc&n=
bsp;<a href=3D"https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D70129" class=
=3D"OWAAutoLink" id=3D"LPlnk213685" previewremoved=3D"true">https://gcc.gnu=
.org/bugzilla/show_bug.cgi?id=3D70129</a>&nbsp;but
 I'm not really sure what is happening here. Any pointers as to how to get =
this to work or what branch does work would be greatly appreciated.</p>
</div>
IMPORTANT NOTICE FROM API: This communication, including any attachments, c=
ontains information that may be confidential or privileged and is intended =
solely for the entity or individual to whom it is addressed. If you are not=
 the intended recipient, please
 contact the sender immediately and delete this message. Any unauthorized d=
isclosure, copying or distribution of this message is strictly prohibited.
</body>
</html>

--_000_BN6PR04MB1044647DA248BB275122B4A0E48D0BN6PR04MB1044namp_--
