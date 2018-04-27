Return-Path: <luis_dan94@hotmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 49873E0098A; Sat, 28 Apr 2018 14:43:01 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FORGED_HOTMAIL_RCVD2, FREEMAIL_FROM,
	HTML_MESSAGE, 
	RCVD_IN_DNSWL_NONE,SPF_HELO_PASS autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (luis_dan94[at]hotmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [40.92.3.104 listed in list.dnswl.org]
	* -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
	*  0.9 FORGED_HOTMAIL_RCVD2 hotmail.com 'From' address,
	but no 'Received:'
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Greylist: delayed 871 seconds by postgrey-1.32 at yocto-www;
	Sat, 28 Apr 2018 14:42:59 PDT
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
	(mail-oln040092003104.outbound.protection.outlook.com [40.92.3.104])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CAF7AE00595
	for <meta-ti@yoctoproject.org>; Sat, 28 Apr 2018 14:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
	s=selector1; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
	bh=XlKdQ6JQ5341WSpIpC4II9pgiK6inTJETqRvj0guu8Y=;
	b=jds4vol5HI+YmP7kxzSFjxasF2gIVLmQkKxL+L05QPnVH8C7yeWvNf0KkaEBFSSOmXdky9fk0AXMSU322kHzWQwvdIvr4iU4CLBYStEj7SOnmBsbCOzQvathT8h5+1uGzwnX4D1Yfii2uzAoGnROXnrwO+VC9Arwhl5VbSzaXKP0xcgrDb63pMLPsUGnnpWHYIrDurPR/Zf7CRpGOyAcNQnB9ojqfvr1aB83SCEv/wgp7aUynR8zPn2OXh5Nrwdhktgbq/HaIdwWVuN+G1sr4pbblzyLcDHZS6TG2NcH7+aPz/RVhLYneMzpa7dNVorQ41ArDLdVVPHEhVyv6Zxq0g==
Received: from SN1NAM02FT015.eop-nam02.prod.protection.outlook.com
	(10.152.72.55) by SN1NAM02HT174.eop-nam02.prod.protection.outlook.com
	(10.152.73.56) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.696.11;
	Fri, 27 Apr 2018 19:51:30 +0000
Received: from CY1PR06MB2121.namprd06.prod.outlook.com (10.152.72.51) by
	SN1NAM02FT015.mail.protection.outlook.com (10.152.72.109) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.20.696.11 via Frontend Transport; Fri, 27 Apr 2018 19:51:30 +0000
Received: from CY1PR06MB2121.namprd06.prod.outlook.com
	([fe80::b0c3:c811:5afc:9bef]) by
	CY1PR06MB2121.namprd06.prod.outlook.com
	([fe80::b0c3:c811:5afc:9bef%13]) with mapi id 15.20.0715.018;
	Fri, 27 Apr 2018 19:51:30 +0000
From: Luis Daniel Mendoza Camberos <luis_dan94@hotmail.com>
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Thread-Topic: WL18XX  Support
Thread-Index: AQHT3mDrexbCbd+Yq0OFm08Yj4E9kA==
Date: Fri, 27 Apr 2018 19:51:30 +0000
Message-ID: <CY1PR06MB2121EC6EB39679AF5DD5AB82F58D0@CY1PR06MB2121.namprd06.prod.outlook.com>
Accept-Language: es-MX, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-incomingtopheadermarker: OriginalChecksum:16F1A0CA5062291D9E503ECE4C961AD07461AD6EEE290E362B65F3E9EEADF3D5;
	UpperCasedChecksum:D1B5FF4AA8A1E995820B13649952AF39AB29D1F10B02289E7AD1BFE6F17FBB3A;
	SizeAsReceived:6870; Count:44
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [IQ6z9OxxYcgbQk+EpRrLr6vsJF1qgBnUHEBj1Jsojv4=]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; SN1NAM02HT174;
	7:G3Z1anfItQGFUYjW5C8EGykKfUoCaXs/SrnSMK0QH0N0Qqo/i5hqq55XMdBnMjPJmo3igkp3idPyhSvPvPyYnsJaQqMSYWbHE+G9u5x7m0JKFWsNdtePKdDthfr6ZDN+xOq6R38u0iMBbG8VlXauL61YHnNtpm/uXykChNf0/g1tbt/jdSCztsnS3Obt8WwsQ7RmfYNa2KZLsAOtaiSySRVTH44c1t1EAhJUXzdHiB1jnUS0IV3+fqhcmIKRCksR;
	23:7GHBFGgl58hTbGnNzNL9nmzPqhehNB/UA3OyO9PL51Ds+nNyygQ/3AyJFb8a0WiKWxkHcrzvyWwXGutBMom2zWp9vJkWKPfi1lss1bdy2atgHkYhos3w6gndpgiD0kJAi46ayJ63QNFnVfvtky87bA==;
	23:smbLsRvj21nMtp5BT8AFSdGi2gktBgiGMiTTuuGy1Ffu0bmLeTwll+3+OE8xYw5PVwzeIlbfk+39Naku6mPQtRkRQgDiEdCBk110XWqRst3nStXKMe/Rc4xbgv/6GhhBldNNaQZo4pmUoGaNBuxlAg==;
	23:F6wN6TWUDxz2ji0T9NF0upnwk6qKvgQOYdq64vNeBLd8iRTO6L17M9MYCpysrktSPAwEHdmktX6+rCf/nd3TOKoZwKTd3Kj7pD5ZXNQtkXsppmPWAVhEVdLQpmNXZ2ba+rhzw8mz+Phxt3NqRnEcOQ==;
	23:YFqRkqU+oEQpEvpKxw0OogAvjz1ZPA1TduwSweZ6aIAEVS77kgnN4qqc7WZQvz/nfcNQ0401UOYkgukwaBM9OabhlNdbR94doMmPMRCYclDI5eTZrMxTRK0L2tB2ZT23s+3h7VFc03/iZYrlqcCuhQ==
x-incomingheadercount: 44
x-eopattributedmessage: 0
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(201702061078)(5061506573)(5061507331)(1603103135)(2017031320274)(2017031324274)(2017031323274)(2017031322404)(1601125374)(1603101448)(1701031045);
	SRVR:SN1NAM02HT174; 
X-MS-TrafficTypeDiagnostic: SN1NAM02HT174:|SN1NAM02HT174:|SN1NAM02HT174:|SN1NAM02HT174:|SN1NAM02HT174:|SN1NAM02HT174:|SN1NAM02HT174:|SN1NAM02HT174:|SN1NAM02HT174:|SN1NAM02HT174:|SN1NAM02HT174:|SN1NAM02HT174:
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0; RULEID:(444000031);
	SRVR:SN1NAM02HT174; BCL:0; PCL:0; RULEID:; SRVR:SN1NAM02HT174; 
x-forefront-prvs: 0655F9F006
x-forefront-antispam-report: SFV:NSPM; SFS:(7070007)(98901004); DIR:OUT;
	SFP:1901; SCL:1; SRVR:SN1NAM02HT174;
	H:CY1PR06MB2121.namprd06.prod.outlook.com; FPR:; SPF:None; LANG:;
x-microsoft-antispam-message-info: VP/qtklq2z5Z1F7EFhWaB0BVK+PGNe9aX0CEewvMIQ1/l3BZuFWneLxU+rtiUbtPAaYpMzusvHtwhwVE5saedE2UAYt864A5poOFY3xcRJL7A4XvC654LWuYWBk/mGCj2E3l26k21nEAZ2gV0EmKKxnP+qQ6Ju1PPBRCi7DsLPWjf0hVTygCSR19x4EVPY4a
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: c47be44c-6572-42ca-dfc4-08d5ac78457a
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: d4d70346-2c10-4f39-8c00-e767963926d9
X-MS-Exchange-CrossTenant-Network-Message-Id: c47be44c-6572-42ca-dfc4-08d5ac78457a
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: d4d70346-2c10-4f39-8c00-e767963926d9
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Apr 2018 19:51:30.3901 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1NAM02HT174
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02HT174;
	23:REMZwqv39f2wnKGWSnw/+d7k4aUpi+D543V51lOONQaCgnHHOCn77gRVc4oAEgclI7yCYmaLFVcSqqG5OKGo762p2P21tOPnV7l/5WU1Bn7cBX2di1sC1YqQtoGtV56EKyh24RC6jWvcjjI+X8Irog==;
	23:MtfptRudpA3r3HLPfIngBsGSdNkbSfuFs0lMUYul6uooI2CjPwZnoWv3EjFBVbV/KusMlmimmyqETJjfAHqhEjQ3kfQUx/2yYsn2qLJk/8SHglvzPtuqLRHBHN/qX41y5Gt4gbBLawesjiqj7vVrJQ==;
	23:VCifYebky67vn6Yusl3+sB2BLvINDf6zaMUDWyrs73zbL170ENgtxg3l37CNorTqx/87ELQF021UHgSu6eOojRYaAPZwAxnzScrMuidoVks5PXJl0RjtFkzrblFnNO1yA9HL/geV3UQPbx+EgXtppQ==;
	23:NO1FZJ8zc4aRKY7n1mA2Da0yf0spYV1nvm0ksF25YzB3LFqUyuzaQeJaRrr0ozR9wRwRjptRDAY2Iereq07ttVXjgGEmxrwAACULdygZ1NkHEJrkgNCXYgimX/bJz4SwskIHpvYe0OuTiXYtpVgnAA==;
	23:BXPWLCIZZ21secMy6vWf9ZjK90X+5/JlqtDVADLgtjCmKoBkfCTlEV0DPxaGvY2LFiqNgg+ExKCtYk1HelTuPRDcwj0wLgdSOt9RRp9c5Zn9HvVjkT5FedCFLuBTuwsm2NhwbzJwaNWjd+olDjPq9w==;
	23:Bqw2nq6dxX/lY1tsgOPN3oal1yUnVsifx6lplXyq/ieG7Hvea//ZDpGYY4w/C1scSPcYUQdDN3DAA3zwhfWDrG/4mKtNRRKlKeqjq8UlbzWMoiplfa6rUut/J9LqYZnQrjpIbHgoo8dpmfiMMGi8Nw==
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02HT174;
	23:B30AlvySiLCE5tYEqbyaB8DOIomuh+kElqmUBQra3RUIauERhpfVX0o361FZaaGGqcA9ziirfxfjK63z8fjPGJRL79h5VRFvcRQfxQzOC9pwn2kaIawx0zD0gocmCTcd/sV540qeBKsQpnZSxbvR8A==
X-OriginatorOrg: hotmail.com
Subject: WL18XX Support
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
X-List-Received-Date: Sat, 28 Apr 2018 21:43:01 -0000
Content-Language: es-MX
Content-Type: multipart/alternative;
	boundary="_000_CY1PR06MB2121EC6EB39679AF5DD5AB82F58D0CY1PR06MB2121namp_"

--_000_CY1PR06MB2121EC6EB39679AF5DD5AB82F58D0CY1PR06MB2121namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello All,

I'm creating the meta-layer for a board that uses a WL18XX device.


Saludos,

Luis Mendoza


--_000_CY1PR06MB2121EC6EB39679AF5DD5AB82F58D0CY1PR06MB2121namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: &quot;Times New Roman&quot;, Times, serif; font-=
size: 14pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
Hello All,</div>
<div style=3D"font-family: &quot;Times New Roman&quot;, Times, serif; font-=
size: 14pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
<br>
</div>
<div style=3D"font-family: &quot;Times New Roman&quot;, Times, serif; font-=
size: 14pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
I'm creating the meta-layer for a board that uses a WL18XX device.&nbsp;&nb=
sp;&nbsp;</div>
<div style=3D"font-family: &quot;Times New Roman&quot;, Times, serif; font-=
size: 14pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
<br>
</div>
<div style=3D"font-family: &quot;Times New Roman&quot;, Times, serif; font-=
size: 14pt; color: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"signature"><font size=3D"4" color=3D"#666666">Saludos,</font>
<div><br>
</div>
<div><font size=3D"4" color=3D"#666666">Luis&nbsp;Mendoza</font></div>
<div><br>
</div>
</div>
</body>
</html>

--_000_CY1PR06MB2121EC6EB39679AF5DD5AB82F58D0CY1PR06MB2121namp_--
