Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CF02C433F5
	for <webhook@archiver.kernel.org>; Fri, 25 Mar 2022 21:00:22 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web09.362.1648242021249351719
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 25 Mar 2022 14:00:21 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com
 header.s=ti-com-17q1 header.b=pUtQIZG5;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 22PL0Bcn063127;
	Fri, 25 Mar 2022 16:00:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1648242011;
	bh=yXD3EFhQGaD0meeIU8dHVXTrJGKpaWcUF0e5BCkDTvo=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=pUtQIZG5WGg7cPz5p9l+20LCejGatg4oy/wElhQWB3f113zuJOihyIsagoZ9C4bIv
	 KmyGb+bMB4+UqjBbGflf1hX318DO1q3SAOB3Or7q6ktdFv8SKxIQ0Hmhu4epPlA/nR
	 c6RrLleCC6FQX47TjY7Lw3baXheeuc5cP/kpuqAA=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 22PL0BG9041826
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 25 Mar 2022 16:00:11 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 25
 Mar 2022 16:00:11 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 25 Mar 2022 16:00:11 -0500
Received: from [10.249.39.108] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 22PL0Bpo124566;
	Fri, 25 Mar 2022 16:00:11 -0500
Message-ID: <1b68aa6e-1c75-62c6-4366-7734ed8e5ac7@ti.com>
Date: Fri, 25 Mar 2022 16:00:10 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [meta-ti][dunfell][PATCH v3] machine: Add am62xx evm
 configuration
Content-Language: en-US
To: Andrew Davis <afd@ti.com>, Yogesh Siraswar <yogeshs@ti.com>,
        Praneeth
 Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20220324222129.9313-1-reatmon@ti.com>
 <a0625acc-3a60-a54d-655f-e4438ba1e917@ti.com>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <a0625acc-3a60-a54d-655f-e4438ba1e917@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: base64
X-MIME-Autoconverted: from 8bit to base64 by lelv0143.ext.ti.com id
 22PL0Bcn063127
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 25 Mar 2022 21:00:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14556

DQoNCk9uIDMvMjQvMjAyMiAyMDo0NywgQW5kcmV3IERhdmlzIHdyb3RlOg0KPiBPbiAzLzI0
LzIyIDU6MjEgUE0sIFJ5YW4gRWF0bW9uIHZpYSBsaXN0cy55b2N0b3Byb2plY3Qub3JnIHdy
b3RlOg0KPj4gQEAgLTE2Nyw2ICsxODIsMTAgQEAgQUxURVJOQVRJVkVfJHtQTn1fYW02NHh4
ID0gIlwNCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBh
bTY0LW1haW4tcjVmMV8xLWZ3IFwNCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBhbTY0LW1jdS1tNGYwXzAtZncgXA0KPj4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICINCj4+ICtBTFRFUk5BVElWRV8ke1BOfV9h
bTYyeHggPSAiXA0KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IGFtNjItbWN1LW00ZjBfMC1mdyBcDQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgYW02Mi1tYWluLXI1ZjBfMC1mdyBcDQo+IA0KPiANCj4gXl4gTG9va3Mg
bGlrZSBzb21lIHRhYnMgZm91bmQgdGhlcmUgd2F5IGluIGhlcmUuLg0KDQpJJ2xsIHJlbW92
ZSB0aG9zZSBlcnJhbnQgdGFicyBpbiB2NC4NCg0KPiBXaHkgZG8gd2UgaGF2ZSB0aGVzZSBp
bmRlbnRlZCBzbyBmYXIgYW55d2F5LCB0aGlzIHdob2xlIGZpbGUgaGFzIHdhY2t5DQo+IGlu
ZGVudGluZywgbmVlZHMgbm9ybWFsaXplZC4NCg0KVGhlIGZvcm1hdHRpbmcgaGFzIGJlZW4g
aW4gdGhlcmUgZm9yIHF1aXRlIGEgd2hpbGUsIHNvIGEgbW9yZSBnZW5lcmFsIA0KZmlsZSBj
bGVhbiB1cCBtaWdodCBiZSBpbiBvcmRlci4gIEknbGwgc2F2ZSB0aGF0IGZvciBhbm90aGVy
IGNvbW1pdCANCmFmdGVyIHdlIGdldCBwYXN0IGFsbCBvZiB0aGUgYW02Mnh4IGNoYW5nZXMu
DQoNCg0KDQo+IEFuZHJldw0KPiANCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCAiDQo+PiDCoCBBTFRFUk5BVElWRV8ke1BOfV9qNyA9ICJcDQo+PiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgajctbWN1LXI1ZjBfMC1m
dyBcDQo+PiBAQCAtMjE2LDYgKzIzNSw5IEBAIFRBUkdFVF9NQUlOX1I1RlNTMV8wX2FtNjR4
eCA9ICJhbTY0LW1haW4tcjVmMV8wLWZ3Ig0KPj4gwqAgVEFSR0VUX01BSU5fUjVGU1MxXzFf
YW02NHh4ID0gImFtNjQtbWFpbi1yNWYxXzEtZnciDQo+PiDCoCBUQVJHRVRfTUNVX000RlNT
MF8wX2FtNjR4eCA9ICJhbTY0LW1jdS1tNGYwXzAtZnciDQo+PiArVEFSR0VUX01BSU5fUjVG
U1MwXzBfYW02Mnh4ID0gImFtNjItbWFpbi1yNWYwXzAtZnciDQo+PiArVEFSR0VUX01DVV9N
NEZTUzBfMF9hbTYyeHggPSAiYW02Mi1tY3UtbTRmMF8wLWZ3Ig0KPj4gKw0KPiANCg0KLS0g
DQpSeWFuIEVhdG1vbg0KcmVhdG1vbkB0aS5jb20NCg==

