Received: from AUS01-ME1-obe.outbound.protection.outlook.com (AUS01-ME1-obe.outbound.protection.outlook.com [40.107.136.92])
 by mx.groups.io with SMTP id smtpd.web11.26583.1592249921547738099
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 15 Jun 2020 12:38:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gallagher.com header.s=selector1 header.b=TW6TQ0XI;
 spf=pass (domain: gallagher.com, ip: 40.107.136.92, mailfrom: ankur.tyagi@gallagher.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lrLeLvimb5NVUUVHv5NmoM2qHwRevgXyjuWkH8FWndb5KCDYJ5iaNIK/dCY2MoYwpXohNZlxWPQf1L3W8rSALmrdRoDC3CXBSBiv9sbUSX1YF4hPOHF9Yqot96q/Isf53yMRHF5WMFfz1B4SO581mZ0eZjqQKlBBsleFSoaN3NBm4kF+9pnu0846kc8vaCN1lSrXjencdJtCtO/IKPZm6TplGSWLwQn5pHJiWyBsQ53Oh7Q5QUfgHhjGFQkmDplzAmVZWxJ4LpKToxCIs9+q2ROUpG61R8oK1FOytbThpLq5lqUX5TZhyMtuhdlzzKQgwbYpTJcGCqKLWLF5EWyl2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pLiqs2N24Yn6Lp1bPs0N7LsRqcYT8qo5ZBqoN7G1z8E=;
 b=UvjzhsqOO1Rjdqjjar9GF8htm1Z7CGobFchNIM7x9KGR9eR20XYLCEAquIEh9XklftgYbM09Et8ti+SJrw6FXPDnOsEjP15oHpr7BAD7KQvhH/hG49xSLNi/bdk2bCqlLIe3JqhgiOPSYbOIotGEJ13hDaFdYAemtay6I68RS7+hzYgjpZA5uvIsQLdBJL4PxxNS18CUNPzcJpkB4a6Thhn5qLxKXg5vFIuWhC7rdz6ueDVuAWq4wScfUa9ur6WaEuySPDdaKVrMFIm0SVRlDQJdefCAI3LfeA+x2p8mfC1zt+8E8NdmJXNLGCH+wmMD9efzTLP+6YC2EjAVgdfQ5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=gallagher.com; dmarc=pass action=none
 header.from=gallagher.com; dkim=pass header.d=gallagher.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gallagher.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pLiqs2N24Yn6Lp1bPs0N7LsRqcYT8qo5ZBqoN7G1z8E=;
 b=TW6TQ0XIfRTTuqmTB7CF0kr/tfGj2Do5QmiVL+tc268j1+3trobu0WEgbV911an17e3E+1VdbpLe7ucsF7YQZtZiwZWS9yOuErEFXDz23NqsMJhS/nVjzIZwaRKCM2HafGVItvYkLAH7gpQx0vcMPzeoliTbG7XT5ycC66iDS5Q=
Received: from SY3PR01MB0809.ausprd01.prod.outlook.com (2603:10c6:0:6::12) by
 SY3PR01MB2012.ausprd01.prod.outlook.com (2603:10c6:0:20::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3088.26; Mon, 15 Jun 2020 19:38:36 +0000
Received: from SY3PR01MB0809.ausprd01.prod.outlook.com
 ([fe80::7d3b:74f3:fc8:6fb7]) by SY3PR01MB0809.ausprd01.prod.outlook.com
 ([fe80::7d3b:74f3:fc8:6fb7%9]) with mapi id 15.20.3088.029; Mon, 15 Jun 2020
 19:38:36 +0000
From: "Ankur Tyagi" <ankur.tyagi@gallagher.com>
To: "meta-ti@lists.yoctoproject.org" <meta-ti@lists.yoctoproject.org>,
	"Dmytriyenko, Denys" <denys@ti.com>
Subject: Re: [meta-ti][dunfell/master PATCH] ti33x.inc: Use weak assignment for uboot board config
Thread-Topic: [meta-ti][dunfell/master PATCH] ti33x.inc: Use weak assignment
 for uboot board config
Thread-Index: AQHWQD/nrJf3Oo6qp0akYZEBsU+1lajUBGbwgAYSxsA=
Date: Mon, 15 Jun 2020 19:38:36 +0000
Message-ID: 
 <SY3PR01MB0809877DA03074D6265139D1E59C0@SY3PR01MB0809.ausprd01.prod.outlook.com>
References: <20200611223018.58178-1-ankur.tyagi@gallagher.com>
 <SYXPR01MB10887259A369A29D4C3B932CE5800@SYXPR01MB1088.ausprd01.prod.outlook.com>
In-Reply-To: 
 <SYXPR01MB10887259A369A29D4C3B932CE5800@SYXPR01MB1088.ausprd01.prod.outlook.com>
Accept-Language: en-NZ, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=gallagher.com;
x-originating-ip: [139.180.92.147]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ed4ee0d2-288f-45b5-0f29-08d81163b27e
x-ms-traffictypediagnostic: SY3PR01MB2012:
x-microsoft-antispam-prvs: 
 <SY3PR01MB2012929ED61E555249660013E59C0@SY3PR01MB2012.ausprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-forefront-prvs: 04359FAD81
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 xJUPEJ/SShPsHc77vCjMo/nTNAixs2qi0oJgL9f77SpAgnwH0z+YTjVl4ngN/ZbCMSRoxuf5e+4MPs5Sk49QxwHi4InwWgF51DLntWZWdDnlBRUDPRV5YhSi2jDfnNT4ZQ37X5q1IML5rNkT2hj+hf7evEt8P0/ru18GtX92RqxTmTkIcO+/93d8TmqeEIseqn20u50SIpWNT6gbfyIkXdoqQWK4XqdLphFx00EZzyA6hCcbXC1x8nUZmvIpp/kmd8cilEjd0puTFe2DBAg08uhk2qk2RZGEQ77ZBnu+Cc+exkFcss51fCzJXhizpJgp5+U088zqsh+8F7mwGeUmXg==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SY3PR01MB0809.ausprd01.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(396003)(366004)(39850400004)(346002)(136003)(376002)(478600001)(5660300002)(2906002)(66946007)(110136005)(66446008)(52536014)(7696005)(76116006)(66556008)(66476007)(316002)(64756008)(83380400001)(8676002)(8936002)(26005)(53546011)(6506007)(71200400001)(186003)(9686003)(33656002)(55016002)(86362001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: 
 bOo78HgS1ZtQZNfoKmS1lycAj9VC92ge1qN/mZ0SNtaLIg6Cr1ywgs/y/Bic8+r2CZx/YEuNJGM6X+lCCExBpzoej1rrvlrckf7Y4BaLCf1v+qrJLDGbLHGYTBB5zmKvtOa4yJ5m2wHE/Xxtj9VCmvpKpolD5iw7iaM6QBREYy7T8bkUpnhTzpetQO+VqEPhy/X7wLMUUEscdLtXYEyxsBhkDNRl59+RJpTR+TWmLrnfMCnGZOwJlg1sPdDK2q1HjkMI7UCgocyEPkHj3ZgP9fsxqdiXeq/u8ZlQ0wGoTo+6OvEq84ueEDBdiEbP+C2rZR6dKr7eCfq3jrGOfrC4mDhqi+3O7NJL8E5kQQ2xLZ7LpZTGOWeXE0sbVShpxnC72LS5IZfxboPl2UpZBnUSKT+C/OyQAPnJOcKSRIRW+/0ZMVvyH7d7dZW23UMc2JwgC5dJjLnJOVwzvbn+yZ4lXVez/NuTgZkGUprnSTx4RvyweqJdSAlgLKACGnsOudaj
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: gallagher.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed4ee0d2-288f-45b5-0f29-08d81163b27e
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jun 2020 19:38:36.4786
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2156b869-431f-4815-b2ce-b4893b5c9aaa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: seahx8tdxtp9bWcxJzWlsa+PV9ldo9+UMmRMKdmPy3X5CM8f96yv2G6dFnh3F092RwqSss8voyOujvfhccZXsrR5ylTDMV+fG6SmfU9+LOc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SY3PR01MB2012
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Denys,

Gentle reminder as this patch has been in the mailing list (#12992) for som=
e time now but I haven't heard anything.

Regards
Ankur

-----Original Message-----
From: Ankur Tyagi=20
Sent: Friday, 12 June 2020 10:49 AM
To: meta-ti@lists.yoctoproject.org
Subject: [meta-ti][dunfell/master PATCH] ti33x.inc: Use weak assignment for=
 uboot board config

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

