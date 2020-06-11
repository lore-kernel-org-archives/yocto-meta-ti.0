Received: from AUS01-ME1-obe.outbound.protection.outlook.com (AUS01-ME1-obe.outbound.protection.outlook.com [40.107.136.115])
 by mx.groups.io with SMTP id smtpd.web10.8302.1591915740429672534
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 11 Jun 2020 15:49:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gallagher.com header.s=selector1 header.b=xatASjcL;
 spf=pass (domain: gallagher.com, ip: 40.107.136.115, mailfrom: ankur.tyagi@gallagher.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HlLTs6ZCXRiCfSe3BKAPAWqQzwmwPq4UUhiMpX+WJvK9LFA8QZ9l9nmGzVb1RCSesLt3jjUOyMJWKhfYL3L2nPKHjYuTsFtEYTHXuE4ESFHCb8oR/ODHnIbMIwpK8hKEvdSns6k08tHAWYJYJqj9A7gcfROVFtt8Djqm7N0f1TcHCImMRnfbFAcxu9Rc7xX6s8YKrMmFVhB/yfxIS55sJZHazaDCnK5Sg5wdOA35etjPoHcUc58cBpXgia6wJisItWb5Ya3Lo1EYN7AmKiWmE+714BOT0mf3krlJd3Z819ghmGQ2NSxq0MpcuUSP4AN8mbisv1K2ludKZ/7x5pCsAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qhfQRaFMPW3NEHRhFrrH5GfFYShzf7uPvLkwjYEhq3A=;
 b=PKhfEVRMp/iKTQfRR9I/mAak3k2B6S4UUIxlgRo9W+j1WdCU4RnLcM6+suTzGSVsijfI2P+LldQt1sUOIwzbpu/tD7mUPxAZcsNnP2A9/4/MdO9pwtFU9db4ohRvs+MscOaF5cpwfNKbAe/W34glrAXSgOUaUCPJdOIwe+LcRNN5ykO9KtK1j1kik/Kl0cy4hm4ztHBl9gNvK7acwUtCylOLTOrfPC/NqHIM69H37G6wK4TpsFA296xDOW9st4s4J0etYsKumclPTs+Lfa1azD4BR2QPMMq2dLBzVKXwBKVqvQ94f16oh+cBuTL1yDpsmccY+Hvkxaw5AJLQ5WHTHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=gallagher.com; dmarc=pass action=none
 header.from=gallagher.com; dkim=pass header.d=gallagher.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gallagher.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qhfQRaFMPW3NEHRhFrrH5GfFYShzf7uPvLkwjYEhq3A=;
 b=xatASjcLiiuUjxeb1eEU1P17XGnRcjOI7Ks1Pn6NTdOuA2KNJKnIg5IiYhUbv+rg4O56j/ABda5jUJT6L7e3OAti/5j3Uni4WJww/lXYyQvz5QTKMvuOdvg0EUYTC+oVDflgGGQLIciUGAgbPJgC4PkIqXsqqqEK8QQEldj5/u0=
Received: from SYXPR01MB1088.ausprd01.prod.outlook.com (2603:10c6:0:9::17) by
 SYXPR01MB1775.ausprd01.prod.outlook.com (2603:10c6:0:26::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3088.24; Thu, 11 Jun 2020 22:48:56 +0000
Received: from SYXPR01MB1088.ausprd01.prod.outlook.com
 ([fe80::d4bf:2e94:579a:f482]) by SYXPR01MB1088.ausprd01.prod.outlook.com
 ([fe80::d4bf:2e94:579a:f482%2]) with mapi id 15.20.3088.022; Thu, 11 Jun 2020
 22:48:56 +0000
From: "Ankur Tyagi" <ankur.tyagi@gallagher.com>
To: "meta-ti@lists.yoctoproject.org" <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell/master PATCH] ti33x.inc: Use weak assignment for uboot board config
Thread-Topic: [meta-ti][dunfell/master PATCH] ti33x.inc: Use weak assignment
 for uboot board config
Thread-Index: AQHWQD/nrJf3Oo6qp0akYZEBsU+1lajUBGbw
Date: Thu, 11 Jun 2020 22:48:56 +0000
Message-ID: 
 <SYXPR01MB10887259A369A29D4C3B932CE5800@SYXPR01MB1088.ausprd01.prod.outlook.com>
References: <20200611223018.58178-1-ankur.tyagi@gallagher.com>
In-Reply-To: <20200611223018.58178-1-ankur.tyagi@gallagher.com>
Accept-Language: en-NZ, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=gallagher.com;
x-originating-ip: [139.180.92.147]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6ac2c9ae-ce12-4496-fd25-08d80e599f8e
x-ms-traffictypediagnostic: SYXPR01MB1775:
x-microsoft-antispam-prvs: 
 <SYXPR01MB1775AE421742EE3C1213175CE5800@SYXPR01MB1775.ausprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4125;
x-forefront-prvs: 0431F981D8
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 kfepJqnuCdGV9gUsaSKCR8zn914JTCHJwOpM5XvJtj9KZAY+0O1oSXU1ExovYfevNAbkGKiy66eR7HF7FiiIV1ZijBnrSbvW6jGZcN6ASWerj0ITRgh+2PEg6SnDMpBCgVj7DDZ5HPcvTp8OEGWt3+zT1Q2LxJ0sL5E7OFgu+JWnAthc8kwmaTJAoI5WPyZrWAoK8iwYwiKyswSc0UYGRTRKK4xD9L93X0iDygIeXrTv8JoUtaVpen3eG/sYTsEal323rSsvdTtm+DOjiLnFXrfURhV1/51QytzH5GIY1djvVGJqZOW5QAUxEhDD5H3g1P8iCxY/59PPCrrKczU6Bw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SYXPR01MB1088.ausprd01.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(376002)(346002)(136003)(39850400004)(396003)(366004)(55016002)(6506007)(186003)(71200400001)(4744005)(8936002)(26005)(83380400001)(316002)(6916009)(9686003)(86362001)(478600001)(52536014)(8676002)(66476007)(66556008)(66946007)(66446008)(64756008)(76116006)(33656002)(5660300002)(2906002)(7696005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: 
 PQ67spw5nCj1UKY1WkcwOnadcXs6JuYGUGmitTsevNgucQgwlwUQx0lQYUsW4QbpnQjLbpK5ntwXOUROoYHj7gh5H4nJZC5jBcGeMR4l6r61i/Iqv+FL7DMhf45RWWETEMfhfAEdEXf+9JpmzWLuebcLujGod3WjvZP3F6IA27O+rUTcuj03aBhmdH6We3Nggu4CIeoAz1OcmF85SZ8T9NEnJqG0CsiJJGwHV2XQwakLmvfsm2Wz0ClvD9WhCCNgXgOaYGV2SmLoU3D837SLyNCDfMSS2F7Smv/PkiizdECSdvrzjeYZAiUhwEwpcZy0+oA6Ar3ZUcRR4n43ksjJD60Zrjp8bY54zTyxWrOFUdbXD3b9Gv5PrYeCYZdLbBf6ZFSHLgIh3fEo443Rz2xm8jqxbeJx3wCCB4JBeB7+ISvSV1CV2vs74CYlbLvXhFZAtevcGEIgCvEs9oTLXD0nW1jjRV/BPg/nC7UMooD2Ouq4xMiUdCMaKyiQkxwlwOmv
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: gallagher.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ac2c9ae-ce12-4496-fd25-08d80e599f8e
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2020 22:48:56.3412
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2156b869-431f-4815-b2ce-b4893b5c9aaa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ls4PP0aJ/p5CaC5kUOo55/IplfpfMBWjBbC8vz9zlyYeWPnQrqv2leqcis4ITeRJZxAMSRWcWxdC0YhbBb3/+tr9Ar7dN0oJ5T83LWy8tp0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SYXPR01MB1775
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

When using meta-ti BSP layer, user should be able to override default uboot
board config with their custom board config as it is common for customers
to design custom board based upon am335x-evm dev kit.

Signed-off-by: Ankur Tyagi <ankur.tyagi@gallagher.com>
---
 conf/machine/include/ti33x.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/conf/machine/include/ti33x.inc b/conf/machine/include/ti33x.in=
c
index abfd7ec7..ff72a382 100644
--- a/conf/machine/include/ti33x.inc
+++ b/conf/machine/include/ti33x.inc
@@ -39,7 +39,7 @@ KERNEL_DEVICETREE =3D " \
 KERNEL_DEVICETREE +=3D "${@oe.utils.conditional('ENABLE_TI_UIO_DEVICES', '=
1', 'am335x-icev2-pru-excl-uio.dtb', '', d)}"
=20
 UBOOT_ARCH =3D "arm"
-UBOOT_MACHINE =3D "am335x_evm_config"
+UBOOT_MACHINE ?=3D "am335x_evm_config"
=20
 UBOOT_ENTRYPOINT =3D "0x80008000"
 UBOOT_LOADADDRESS =3D "0x80008000"
--=20
2.17.1

