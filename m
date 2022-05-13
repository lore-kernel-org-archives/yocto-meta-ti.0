Return-Path: <a-m1@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80991C433F5
	for <webhook@archiver.kernel.org>; Fri, 13 May 2022 08:57:59 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.5978.1652432273453566683
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 13 May 2022 01:57:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=klWEGdh3;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: a-m1@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 24D8vmZu048292;
	Fri, 13 May 2022 03:57:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1652432268;
	bh=kOlKCLsIHIwovqoo+yxSb1PxLznexSmGfmEC8sfKc6A=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=klWEGdh3BcfIu2LCE8rWkeXzjbTJ59ofMZbzQJHl2zSvLdeTzsWAje0tWWvb0rdqK
	 UrHOeByfVcN6BNZPuH1Z5JiaSz5r3ZnkoU3AXopq4JgfKLjthC6HfkuQPV7WwHSsEF
	 P7dFNVLegonxJbXKQT+u5BAVTCKiUwFQgYIXdg8U=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 24D8vm7P076222
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 13 May 2022 03:57:48 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 13
 May 2022 03:57:47 -0500
Received: from DFLE111.ent.ti.com ([fe80::6c89:b1ca:ee8f:1a6f]) by
 DFLE111.ent.ti.com ([fe80::6c89:b1ca:ee8f:1a6f%17]) with mapi id
 15.01.2308.014; Fri, 13 May 2022 03:57:47 -0500
From: "M, Aparna" <a-m1@ti.com>
To: "Menon, Nishanth" <nm@ti.com>, "Thakkar, Devarsh" <devarsht@ti.com>,
        "Eatmon, Ryan" <reatmon@ti.com>
CC: "M, Aparna" <a-m1@ti.com>,
        "meta-ti@lists.yoctoproject.org"
	<meta-ti@lists.yoctoproject.org>,
        "Bajjuri, Praneeth" <praneeth@ti.com>,
        "denis@denix.org" <denis@denix.org>,
        "Adivi, Sai Sree Kartheek"
	<s-adivi@ti.com>
Subject: Re: [meta-ti][dunfell][PATCH] ti-sci-fw: Add DM firmware to deploy
 directory for am62xx-evm
Thread-Topic: [meta-ti][dunfell][PATCH] ti-sci-fw: Add DM firmware to deploy
 directory for am62xx-evm
Thread-Index: AQHYZghE5mflymSaxUSX3n7mnq1ThK0bmn2AgAGYNAA=
Date: Fri, 13 May 2022 08:57:47 +0000
Message-ID: <04651dfaa29c443eb578b80260428e9e@ti.com>
References: <20220512134657.31238-1-a-m1@ti.com>
 <2e0d6c43-5d99-ea35-7e2f-9c8b4a68da08@ti.com>
 <20220512140543.oqcnxfja75la4wdf@verify>
In-Reply-To: <20220512140543.oqcnxfja75la4wdf@verify>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-imapappendstamp: DFLE111.ent.ti.com (15.01.2308.014)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [10.250.233.187]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"
Content-ID: <EACFA04AD2C3FC428E9BD8FF26EB3F93@owa.mail.ti.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 13 May 2022 08:57:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14734

DQpPbiAxMi8wNS8yMiAxOTozNSwgTmlzaGFudGggTWVub24gd3JvdGU6DQo+IE9uIDE5OjI3LTIw
MjIwNTEyLCBEZXZhcnNoIFRoYWtrYXIgdmlhIGxpc3RzLnlvY3RvcHJvamVjdC5vcmcgd3JvdGU6
DQo+PiBPbiAxMi8wNS8yMiAxOToxNiwgQXBhcm5hIE0gd3JvdGU6DQo+Pj4gQWRkIERNIGZpcm13
YXJlIGlwY19lY2hvX3Rlc3RiX21jdTFfMF9yZWxlYXNlX3N0cmlwLnhlcjVmIHRvIGRlcGxveQ0K
Pj4+IGRpcmVjdG9yeSBmb3IgYW02Mnh4LWV2bS4gVGhpcyBpcyByZXF1aXJlZCBmb3IgYnVpbGRp
bmcgdGlzcGwuYmluLg0KPj4+DQo+Pj4gU2lnbmVkLW9mZi1ieTogQXBhcm5hIE0gPGEtbTFAdGku
Y29tPg0KPj4+IC0tLQ0KPj4+ICAgIHJlY2lwZXMtYnNwL3RpLXNjaS1mdy90aS1zY2ktZndfZ2l0
LmJiIHwgMSArDQo+Pj4gICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspDQo+Pj4NCj4+
PiBkaWZmIC0tZ2l0IGEvcmVjaXBlcy1ic3AvdGktc2NpLWZ3L3RpLXNjaS1md19naXQuYmIgYi9y
ZWNpcGVzLWJzcC90aS1zY2ktZncvdGktc2NpLWZ3X2dpdC5iYg0KPj4+IGluZGV4IDA5OTQ3M2I0
Li5iYjg4NjMzYSAxMDA2NDQNCj4+PiAtLS0gYS9yZWNpcGVzLWJzcC90aS1zY2ktZncvdGktc2Np
LWZ3X2dpdC5iYg0KPj4+ICsrKyBiL3JlY2lwZXMtYnNwL3RpLXNjaS1mdy90aS1zY2ktZndfZ2l0
LmJiDQo+Pj4gQEAgLTE4Niw2ICsxODYsNyBAQCBkb19kZXBsb3lfYW02Mnh4LWV2bS1rM3I1KCkg
ew0KPj4+ICAgIAlsbiAtc2YgJHtVQk9PVF9JTUFHRX0gJHtERVBMT1lESVJ9LyR7VUJPT1RfU1lN
TElOS30NCj4+PiAgICAJbG4gLXNmICR7VUJPT1RfSU1BR0V9ICR7REVQTE9ZRElSfS8ke1VCT09U
X0JJTkFSWX0NCj4+PiAgICAJaW5zdGFsbCAtbSA2NDQgJHtTWVNGV19USVNDSX0gJHtERVBMT1lE
SVJ9Lw0KPj4+ICsgICAgICAgIGluc3RhbGwgLW0gNjQ0ICR7U30vdGktZG0vYW02Mnh4L2lwY19l
Y2hvX3Rlc3RiX21jdTFfMF9yZWxlYXNlX3N0cmlwLnhlcjVmICR7REVQTE9ZRElSfS8NCj4+IFdo
YXQgaXMgU1lTRldfVElTQ0kgYmVpbmcgdXNlZCBmb3IgQU02MiA/IEFueSBleGlzdGluZyBtYWNy
b3MgY2FuJ3QgYmUgdXNlZA0KPj4gPw0KPj4NCj4+IEFsc28gaXMgaXQgY2hhbmdpbmcgaW5kZW50
YXRpb24gdy5yLnQgcHJldmlvdXMgbGluZSA/DQo+DQo+IFRoaXMgaXMgdGhlIERNIGZpcm13YXJl
LiB5ZXMsIGl0IGlzIGFscmVhZHkgcGFja2FnZWQgYXMgb2YgdGlzcGwgYnVpbGQsIHNvDQo+IHdo
YXQgaXMgbWlzc2luZyBoZXJlPw0KDQpUaGUgRE0gZmlybXdhcmUgaXMgcmVxdWlyZWQgaW4gdGhl
IFNESyBmb3IgdG9wbGV2ZWwgbWFrZWZpbGUgYnVpbGQgb2YgDQp1LWJvb3QgZm9yIGFtNjJ4eC4g
VGhlIGZsb3cgaXMgdG8gYWRkIGl0IHRvIGRlcGxveSBhbmQgdGhlbiB0byANCnByZWJ1aWx0LWlt
YWdlcyBmb2xkZXIgb2YgU0RLLg0KDQpTZW50IGEgbmV3IHBhdGNoIGZvciB0aGUgc2FtZSBhcyBw
ZXIgUnlhbidzIHN1Z2dlc3Rpb24gdG8gdXNlIA0KdGktcnRvcy1maXJtd2FyZSByZWNpcGUgZm9y
IHRoaXMgLQ0KaHR0cHM6Ly9saXN0cy55b2N0b3Byb2plY3Qub3JnL2cvbWV0YS10aS90b3BpYy9k
dW5mZWxsX3BhdGNoLzkxMDc2MTMzDQoNCi0tIA0KQXBhcm5hDQoNCg==

