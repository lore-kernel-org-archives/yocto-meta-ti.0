Received: from AUS01-SY3-obe.outbound.protection.outlook.com (AUS01-SY3-obe.outbound.protection.outlook.com [40.107.137.138])
 by mx.groups.io with SMTP id smtpd.web12.7852.1591913637850134124
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 11 Jun 2020 15:14:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gallagher.com header.s=selector1 header.b=vjob7PQJ;
 spf=pass (domain: gallagher.com, ip: 40.107.137.138, mailfrom: ankur.tyagi@gallagher.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mqDUzYpisjssSSASfHME67CB46shKMEn+QM/33/n2UkG8XZzkWnS/1MznB6s9N8DqhzGSkqY7wmPvnhZ6dvz21W8Zt9yKej+u/jGK43EP03IBwUtXtxobU63qMSXbqnnPC5g6qTh6lJ1ZvIP9u0cX+kwKVav5Vux9UPW4N99wYDIZ1Hqx3Y5hNQSrrJAdgaEK8mfQJcEMl0ybWK9fGNAR5U56SzeZN6JWxb5ztZaq6B+sgKotXenUueKsRIrOxmiKJErl7ueFFSZcEFWyyHHOM1j3wBoSt9/4p1xz49lNN31UWCnxWgdTg6oBqjS2chEJMbyDPyGm99GQfP6pzjAww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g3kokbPQPK2xMdceqs5ftrPK56lZeNwo9XlUjb+Ztg0=;
 b=Yxr6jEVpDhhBcJGlIkfINb8nP3q5fNEEjeWWOHGfkZAbus4001DhjKyFlt6NNA+CIeWdKinyYlXKg8Em7wsyC1uBnlgFBqYn6JDWKRRxV/rSHHUWQ/vGytmFGbuHJRrM50m3950IJlAIpIoKVGw4/TVlQd8M/tlRe3+YjReF+PLtAbfOQZTD6e0hMB7LEoKmRiX/pMJ1xCRXNeUtN2jfnPjZpExWUcgX/PmOyWA43fM1xVinAmvX7tJ7dcy32c0vh5ciEWbTu24MqmOoE1NSs3m0C7njFurt0jy6cNlm8KnjKL2zBtR/G0Lgj6U1Jw9YMn+RqywiiiLhcP0epqAIeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=gallagher.com; dmarc=pass action=none
 header.from=gallagher.com; dkim=pass header.d=gallagher.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gallagher.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g3kokbPQPK2xMdceqs5ftrPK56lZeNwo9XlUjb+Ztg0=;
 b=vjob7PQJ/4pLhLix1IDqiFTWygXsLspJYMg9FqZoKJZkVSBMB6C5H3wW0+e1/JLspi9F2NQx57c97vUFwoNXV7GKhel856eyN4vhYR5bPhgO0QHtf/9g5t1MN0cZ3eJ63ifFlKNRAvcWIu2Ezdaz4Yvk0lHQJ3xtVM4r/VbMHp0=
Received: from SYXPR01MB1088.ausprd01.prod.outlook.com (2603:10c6:0:9::17) by
 SYXPR01MB0845.ausprd01.prod.outlook.com (2603:10c6:0:c::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3088.22; Thu, 11 Jun 2020 22:13:54 +0000
Received: from SYXPR01MB1088.ausprd01.prod.outlook.com
 ([fe80::d4bf:2e94:579a:f482]) by SYXPR01MB1088.ausprd01.prod.outlook.com
 ([fe80::d4bf:2e94:579a:f482%2]) with mapi id 15.20.3088.022; Thu, 11 Jun 2020
 22:13:54 +0000
From: "Ankur Tyagi" <ankur.tyagi@gallagher.com>
To: "meta-ti@lists.yoctoproject.org" <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][dunfell/master PATCH] ti33x.inc: Use weak assignment for uboot board config
Thread-Topic: [meta-ti][dunfell/master PATCH] ti33x.inc: Use weak assignment
 for uboot board config
Thread-Index: AQHWPhLCHJA2gezJUUqByU5YQIqOx6jT/vQA
Date: Thu, 11 Jun 2020 22:13:53 +0000
Message-ID: 
 <SYXPR01MB1088DE758604A092AF17E50CE5800@SYXPR01MB1088.ausprd01.prod.outlook.com>
References: <20200609040204.47343-1-ankur.tyagi@gallagher.com>
In-Reply-To: <20200609040204.47343-1-ankur.tyagi@gallagher.com>
Accept-Language: en-NZ, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=gallagher.com;
x-originating-ip: [139.180.92.147]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e50b984f-9425-483e-9ba9-08d80e54ba6e
x-ms-traffictypediagnostic: SYXPR01MB0845:
x-microsoft-antispam-prvs: 
 <SYXPR01MB08452F1639BC9C430BEF3256E5800@SYXPR01MB0845.ausprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4125;
x-forefront-prvs: 0431F981D8
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 p1u9bHojm2pEdkWtUknl8b0EnJH3Y9oWvlJl9S/7bAAQuaD0I1HNGVmKTR3N+c3Qu1Vlx5IpBpS6EZzhUedV3M+PY/XRaSqcajsHEen3g9q6Z8IOpZInrz2GNCV5wcV1evK0I/zXR3X1NNt2d2nru5OWH5AzaGeGjsjAQ1YDg+4MsKm6hYVgdoo9Y54WYI7s5L+S3UW9aUKl1pPYjLFsVvvu4+94c6nEKTsLEzYTo9/rytXRKwUYcGwASonZ+zBvw6czKWUxQjL8vNoO/fyyNcRRzcVtC6kOsLKMPXaV2TqkjEYYPHs5i/3+MtayoGPABmCRbCY/t7wk93nMx9xKmQ==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SYXPR01MB1088.ausprd01.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(136003)(376002)(396003)(39850400004)(346002)(366004)(316002)(71200400001)(478600001)(52536014)(8936002)(8676002)(66946007)(9686003)(66476007)(6916009)(66556008)(83380400001)(66446008)(6506007)(186003)(53546011)(26005)(64756008)(86362001)(76116006)(7696005)(2906002)(5660300002)(55016002)(33656002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: 
 yP17eW88ZrAOKaiOkw2411FuzIjjD5oReSB60jxjwtNzu8oMEeMkF3itCb8LefC4V1bpkhpAaJJ5uvLXGAOQqCRnY6brjZ10bcPEcO76z0EbK/uuR8EiY2+g2S8UFrkCBGiqhfZnOIVanIJU3aEIWPHmyDOXTljDKHS6fPAzfunCUiwOBDuwoOcfqgNJmA0j/tkExFIMXlJpqrWcL14VHK1hFwX05t/PNvD4dWiBBsXSyW83SrlUqFrR3+JI25ceBJ7+NCNhTnhMxLQXK+S86k974rBORZAUD9SC6gupU67Cy+71xUwFFauOsNPl/sKLo395qXkZ5WsOYGvQs7RuVHc1yA29P/b9Z17Hn8d7nURiBKAqVM6XUHTcliR/Q7rqwShEgz1+9ywbet9oo0wv1hmlLLzeFE6BLNRgjb73sjR1280ctSSL4iBBw/bAyyvPTTRS9tY/0/wuoFgyrfx6S2YHyDb+S3J15g1w8EDYDx1BoDX3b9jLHV3dS86sqgDB
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: gallagher.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e50b984f-9425-483e-9ba9-08d80e54ba6e
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2020 22:13:54.0178
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2156b869-431f-4815-b2ce-b4893b5c9aaa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +W/tBTN+N7R7UT0vgkgrfWMWPG3EMkrl6ASyrPLJgB49p9YpiPC+50dVbLpcZWlYDgPdCyvgEffJ7v9X3mR3iH5zRYbdwGwIOG9Wisb6Pmc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SYXPR01MB0845
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

ping

-----Original Message-----
From: Ankur Tyagi <ankur.tyagi@gallagher.com>=20
Sent: Tuesday, 9 June 2020 4:02 PM
To: meta-ti@lists.yoctoproject.org
Cc: Ankur Tyagi <Ankur.Tyagi@gallagher.com>
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

