Return-Path: <asfak.rahman@outlook.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5F332E01328; Tue, 26 Jun 2018 06:40:05 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE, SPF_HELO_PASS autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (asfak.rahman[at]outlook.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [40.92.69.21 listed in list.dnswl.org]
	* -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Greylist: delayed 3615 seconds by postgrey-1.32 at yocto-www;
	Tue, 26 Jun 2018 06:40:03 PDT
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
	(mail-oln040092069021.outbound.protection.outlook.com [40.92.69.21])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9ED6EE009AC
	for <meta-ti@yoctoproject.org>; Tue, 26 Jun 2018 06:40:03 -0700 (PDT)
Received: from AM5EUR02HT097.eop-EUR02.prod.protection.outlook.com
	(2a01:111:e400:7e1c::496) by
	VE1EUR02HT100.eop-EUR02.prod.protection.outlook.com
	(2a01:111:e400:7e1e::408) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.20.906.15;
	Tue, 26 Jun 2018 10:07:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
	s=selector1;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=HRJZ1M7vHqOmzSwrqzWX2+FcFZpFDSX2aTA5Pcj3v40=;
	b=oXBq6vX6OWm7D5CzOodMzGyWKycOLHqWn15TLRd9zgqcpar3N3VIMk1DK7xCLxLTaot8V5Gp0/MFpjmh5mChwnAAZpQXflJ5T4rdCjK6GC5yEXShwmDKFhAB0vkwMBLFFJl5Sn/Cqwp9DDhLZbJiddRCdz5vPU3uDop/aHDyi9xfAa+vHa2pEXUQIm83W3i5E6PRaS1PY4VvD6vLu1p1yLEbWkU3mOCviAsXAXKkdFEC64ioQeLbU8e9sgOBZEAD7Jtb1qe0dilx07XGNpeD6R7ACsEEaPSKQzDReKceL8U1jNUuXmgJlQpKCeLRcMMDYpWCWLL0kj2ndk9FwsjVNQ==
Received: from AM5EUR02FT019.eop-EUR02.prod.protection.outlook.com
	(10.152.8.57) by AM5EUR02HT097.eop-EUR02.prod.protection.outlook.com
	(10.152.9.240) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.20.906.15;
	Mon, 25 Jun 2018 11:43:11 +0000
Received: from HE1P190MB0233.EURP190.PROD.OUTLOOK.COM (10.152.8.59) by
	AM5EUR02FT019.mail.protection.outlook.com (10.152.8.169) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.20.906.15 via Frontend Transport; Mon, 25 Jun 2018 11:43:11 +0000
Received: from HE1P190MB0233.EURP190.PROD.OUTLOOK.COM
	([fe80::b9e7:8c75:3c37:eea7]) by HE1P190MB0233.EURP190.PROD.OUTLOOK.COM
	([fe80::b9e7:8c75:3c37:eea7%8]) with mapi id 15.20.0884.024;
	Mon, 25 Jun 2018 11:43:11 +0000
From: Asfak Rahman <asfak.rahman@outlook.com>
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Thread-Topic: How to create multiple uboot images in one recipe
Thread-Index: AQHUDHgGECYYfEB9ckuPwOEaCs16hg==
Date: Mon, 25 Jun 2018 11:43:11 +0000
Message-ID: <HE1P190MB0233E90101C59E7E782813A9954A0@HE1P190MB0233.EURP190.PROD.OUTLOOK.COM>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-incomingtopheadermarker: OriginalChecksum:4148EF29358F10EB697F7266627544900353F4BA8BA52CB0AD5A9015DF50CB9A;
	UpperCasedChecksum:BEF00FF3CBF581C285DDB3D6ACC52E72CDBCD7E24E14A2874BC757CF86CDC152;
	SizeAsReceived:6863; Count:43
x-tmn: [WIQuqLPV8PaqFsauru8xsSnYwiQHHMGo]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; AM5EUR02HT097;
	7:Z+QjgIZH1W1Xc8vFJq5+GRoxri8UzC92jcnM2QWjgrWG3SkokN+CtavBpxpcOAek2wKk744QsCu/06L9zbIiixzPE1LstrR0MDAVrL0EggObFlWvfMbdy+PhULzrvamkv/JS4rn8ekxQtbQ7FOxf7j3tevJWCTzuYhu6NLXHP4sN4q+f3GXf6z2v8gqywnL1hdwNd4fbRLZFV2HFzMOJw9Levqibg0x4iy5pIdelrNn7RZgva2Gdv0zDK9zFBF+E
x-incomingheadercount: 43
x-eopattributedmessage: 0
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(201702061078)(5061506573)(5061507331)(1603103135)(2017031320274)(2017031324274)(2017031323274)(2017031322404)(1603101448)(1601125500)(1701031045);
	SRVR:AM5EUR02HT097; 
X-MS-TrafficTypeDiagnostic: AM5EUR02HT097:|AM5EUR02HT097:|VE1EUR02HT100:
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0; RULEID:(444000031);
	SRVR:AM5EUR02HT097; BCL:0; PCL:0; RULEID:; SRVR:AM5EUR02HT097; 
x-forefront-prvs: 0714841678
x-forefront-antispam-report: SFV:NSPM;
	SFS:(7070007)(189003)(199004)(6346003)(476003)(102836004)(2351001)(19627405001)(5660300001)(105586002)(26005)(106356001)(68736007)(3280700002)(82202002)(14454004)(54896002)(25786009)(426003)(2501003)(104016004)(5250100002)(87572001)(86362001)(44832011)(486006)(7696005)(99286004)(6916009)(81156014)(8676002)(6606003)(55016002)(5640700003)(3660700001)(8936002)(2900100001)(74316002)(97736004)(6436002)(20460500001)(33656002);
	DIR:OUT; SFP:1901; SCL:1; SRVR:AM5EUR02HT097;
	H:HE1P190MB0233.EURP190.PROD.OUTLOOK.COM; FPR:; SPF:None;
	PTR:InfoNoRecords; MX:1; A:1; LANG:; 
received-spf: None (protection.outlook.com: outlook.com does not designate
	permitted sender hosts)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=asfak.rahman@outlook.com; 
x-microsoft-antispam-message-info: eXw3mGCgC9EaKcdCPH4gwNfVHX5BSaHcV8HlwZ8TNcccxRpDo0l2DnQOWM0Ot1M4J3py7tuLUEcRYsP9tDUi8F8naeovmhknWSwjFnRkm+oolDqrfRB48EFBdwD3nS0TCxRRT6Bl/2bwk5Y+PKJ55T2HSF7swfRrVa0pzRcXAxWKpWFR+uN74JVU1Y3xcMQ2+OOk4wZ3bdo8LIhqrHlRFlqIjWM3z7btmGp8ELkgq08=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: dd759f05-a917-4aa0-a2f5-4cc35c50e0c8
X-MS-Exchange-CrossTenant-Network-Message-Id: d806471d-6e0c-4995-8f51-08d5da90d46f
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: dd759f05-a917-4aa0-a2f5-4cc35c50e0c8
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2018 11:43:11.5926 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5EUR02HT097
X-Microsoft-Exchange-Diagnostics: 1; VE1EUR02HT100;
	23:BWN69HpuG4ygxHx1vKJZl5E8ZqYDq2suJePFCKI/eJI90Iq49zgs4lMKd+AnZ62VjSJuyw9+oDwyyX23JHRtOzkXLBRXgEeMMEzfjFkYktfxMN3nVya3vX11XH76gGxf3SRfyjLmUfuk0wcw8XXU5Q==
X-OriginatorOrg: outlook.com
Subject: How to create multiple uboot images in one recipe
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
X-List-Received-Date: Tue, 26 Jun 2018 13:40:05 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_HE1P190MB0233E90101C59E7E782813A9954A0HE1P190MB0233EURP_"

--_000_HE1P190MB0233E90101C59E7E782813A9954A0HE1P190MB0233EURP_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,


I am trying to build multiple uboot images and have them in yocto's deploy =
directory.


I have created a .bbappend file and added following lines:

UBOOT_CONFIG[sd] =3D "sd_config"
UBOOT_CONFIG[nand] =3D "nand_config"


Now, I can add "UBOOT_CONFIG=3Dsd" or "UBOOT_CONFIG=3Demmc" to my local.con=
f.

This works and I get one uboot image based on the added configuration in lo=
cal.conf


I tried to use a script that calls bitbake twice. During the second executi=
on of bitbake, it deletes all files that were built previously.

Yes, I am using  RM_OLD_IMAGE =3D "1" to clean old images and I want to kee=
p such setting.


How to build both of the uboot images(sd and nand) at once?


BR,

Asfak

--_000_HE1P190MB0233E90101C59E7E782813A9954A0HE1P190MB0233EURP_
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
<p style=3D"margin-top:0;margin-bottom:0">I am trying to build multiple ubo=
ot&nbsp;images and have them in yocto's deploy directory.</p>
<p style=3D"margin-top:0;margin-bottom:0"><br>
</p>
<p style=3D"margin-top:0;margin-bottom:0">I have created a .bbappend&nbsp;f=
ile and added following&nbsp;lines:</p>
<p style=3D"margin-top:0;margin-bottom:0"></p>
<div>UBOOT_CONFIG[sd] =3D &quot;sd_config&quot;&nbsp;</div>
<div>UBOOT_CONFIG[nand] =3D &quot;nand_config&quot;</div>
<br>
<p></p>
<p style=3D"margin-top:0;margin-bottom:0">Now, I can add &quot;<span style=
=3D"font-family: Calibri, Helvetica, sans-serif, EmojiFont, &quot;Apple Col=
or Emoji&quot;, &quot;Segoe UI Emoji&quot;, NotoColorEmoji, &quot;Segoe UI =
Symbol&quot;, &quot;Android Emoji&quot;, EmojiSymbols; font-size: 16px;">UB=
OOT_CONFIG=3D</span>sd&quot;
 or &quot;<span style=3D"font-family: Calibri, Helvetica, sans-serif, Emoji=
Font, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, NotoColorE=
moji, &quot;Segoe UI Symbol&quot;, &quot;Android Emoji&quot;, EmojiSymbols;=
 font-size: 16px;">UBOOT_CONFIG=3D</span>emmc&quot; to my local.conf.</p>
<p style=3D"margin-top:0;margin-bottom:0">This works and I get one uboot&nb=
sp;image based on the added configuration in local.conf</p>
<p style=3D"margin-top:0;margin-bottom:0"><br>
</p>
<p style=3D"margin-top:0;margin-bottom:0">I tried to use a&nbsp;script that=
 calls&nbsp;bitbake twice. During the second execution of bitbake, it delet=
es all files that were built previously.</p>
<p style=3D"margin-top:0;margin-bottom:0">Yes, I am using&nbsp;&nbsp;<span>=
RM_OLD_IMAGE =3D &quot;1&quot; to clean old images and I want to keep such =
setting.&nbsp;</span></p>
<p style=3D"margin-top:0;margin-bottom:0"><br>
</p>
<p style=3D"margin-top:0;margin-bottom:0">How to build both of the uboot im=
ages(sd and nand) at once?</p>
<p style=3D"margin-top:0;margin-bottom:0"><br>
</p>
<p style=3D"margin-top:0;margin-bottom:0">BR,</p>
<p style=3D"margin-top:0;margin-bottom:0">Asfak</p>
</div>
</body>
</html>

--_000_HE1P190MB0233E90101C59E7E782813A9954A0HE1P190MB0233EURP_--
