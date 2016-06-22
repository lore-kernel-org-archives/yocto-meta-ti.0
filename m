Return-Path: <karthik.ramanan@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 19228E009C9; Tue, 21 Jun 2016 20:50:57 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [198.47.19.12])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C3777E0084D
	for <meta-ti@yoctoproject.org>; Tue, 21 Jun 2016 20:50:52 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id u5M3op3N027119;
	Tue, 21 Jun 2016 22:50:51 -0500
Received: from dbdlxv05.itg.ti.com (dbdlxv05.itg.ti.com [172.24.171.60])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u5M3oohF006968;
	Tue, 21 Jun 2016 22:50:51 -0500
Received: from DBDE73.ent.ti.com (dbde73.ent.ti.com [172.24.171.98])
	by dbdlxv05.itg.ti.com (8.14.3/8.13.8) with ESMTP id u5M3olI2010509;
	Wed, 22 Jun 2016 09:20:49 +0530
Received: from DBDE04.ent.ti.com ([fe80::21ac:d9f:f810:c8e7]) by
	DBDE73.ent.ti.com ([fe80::bc19:dc43:44da:7415%27]) with mapi id
	14.03.0294.000; Wed, 22 Jun 2016 09:20:47 +0530
From: "R, Karthik" <karthik.ramanan@ti.com>
To: Volodymyr Riazantsev <volodymyr.riazantsev@globallogic.com>,
	"Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-ti]:[libdce]: Possible regression on dra7xx-evm platform
Thread-Index: AQHRzDg3eOB9NfFSHUaNEjR6QCwQmZ/02XAw
Date: Wed, 22 Jun 2016 03:50:47 +0000
Message-ID: <24B88602B5904F49971CAF899152529B3780C561@DBDE04.ent.ti.com>
References: <CAJSKtY38f=V50wBd1_6mUqu-vWV9UjcY9qFCtCfYEuY2tC5UCg@mail.gmail.com>
In-Reply-To: <CAJSKtY38f=V50wBd1_6mUqu-vWV9UjcY9qFCtCfYEuY2tC5UCg@mail.gmail.com>
Accept-Language: en-IN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.24.170.142]
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: :[libdce]: Possible regression on dra7xx-evm platform
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
X-List-Received-Date: Wed, 22 Jun 2016 03:50:57 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgVm9sb2R5bXlyLA0KDQpJIHdhcyBpbnZlc3RpZ2F0aW5nIHRoaXMgY3Jhc2ggeWVzdGVyZGF5
IGFuZCBJIGNhbiBjb25maXJtIHRoaXMgcmVncmVzc2lvbiBpcyBkdWUgdG8gdGhlIGxpYmRjZSBj
b21wb25lbnQuDQpXZSB3aWxsIHRhbGsgYWJvdXQgdGhpcyB0b2RheSdzIGNhbGwuDQoNClRoYW5r
cyBmb3IgcmVwb3J0aW5nIHRoaXMuDQoNCkRlbnlzLA0KDQpBbSB0YWtpbmcgdGhlIGZvbGxvd2lu
ZyBhY3Rpb25zOg0KKiBXaWxsIGNyZWF0ZSBhIEpJUkEgSUQgZm9yIHRoaXMgZGVmZWN0DQoqIExh
dGVyIHRvZGF5LCBJJ2xsIHBvc3QgYSBwYXRjaCB0byB0ZW1wb3JhcmlseSBmaXggdGhpcyBieSBy
ZXZlcnRpbmcgdG8gYSB3b3JraW5nIGNvbW1pdC4NCg0KUmVnYXJkcw0KS2FydGhpaw0KDQotLS0t
LU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogVm9sb2R5bXlyIFJpYXphbnRzZXYgW21haWx0
bzp2b2xvZHlteXIucmlhemFudHNldkBnbG9iYWxsb2dpYy5jb21dIA0KU2VudDogV2VkbmVzZGF5
LCAyMiBKdW5lLCAyMDE2IDk6MTMgQU0NClRvOiBEbXl0cml5ZW5rbywgRGVueXM7IG1ldGEtdGlA
eW9jdG9wcm9qZWN0Lm9yZw0KQ2M6IFIsIEthcnRoaWsNClN1YmplY3Q6IFttZXRhLXRpXTpbbGli
ZGNlXTogUG9zc2libGUgcmVncmVzc2lvbiBvbiBkcmE3eHgtZXZtIHBsYXRmb3JtDQoNCkhlbGxv
IERlbnlzLCBBbGwsDQoNCiAgICBKdXN0IHRvIGxldCB5b3Uga25vdyBJIGdvdCBhIHJlZ3Jlc3Np
b24gb24gVmF5dSBib2FyZCB3aXRoIHJlY2VudCBjaGFuZ2VzIGZvciBsaWJkY2U6IHZlcnNpb24g
dXBkYXRlIGFuZCBtb3ZpbmcgdG8gbWV0YS10aS4NCiAgICAgICBWZXJzaW9uIDMuMDAuMDguMDIg
d29ya2luZyB3ZWxsDQogICAgICAgVmVyc2lvbiAzLjAwLjEwLjAxIGNhdXNpbmcgc2VnbWVudGF0
aW9uIGZhdWx0IGluIGdzdHJlYW1lciBwaXBlbGluZS4NCg0KVGVzdGVkIHZlcnNpb25zOg0KICAg
ICAgICAgICAgICAgICAgICAgICAgICBtZXRhLXRpOg0KYzJkMmEzODQ1Zjg1YTFhMzhhZDg0YTc0
NDYzODYwZTZiZWE2MGM0MQ0KICAgICAgICAgICAgICAgICAgICBtZXRhLWFyYWdvOiA1YTNiMDc5
NjRjMDg5MzM0ZThkZTI0YTVmOGFkNWJlZTgzODg2Nzc4DQpnc3RyZWFtZXIxLjAtcGx1Z2lucy1i
YWQ6IDNhN2RjZTEwMTFkMmFkMDAyZjkzNDFjOGYwYmUyZTQwOWQ3M2VhN2INCg0KUGxlYXNlIHNl
ZSBsb2dzIGF0dGFjaGVkLg0KDQpUaGFuayB5b3UsDQoNClZvbG9keW15ciBSaWF6YW50c2V2IHwg
U29sdXRpb24gQXJjaGl0ZWN0LCBUZWNobm9sb2d5IEdsb2JhbExvZ2ljIFAgKzEuNzcwLjUxNS4x
MDA3ICBNICsxLjY3OC41NTcuNjM3MiAgUyByeWF6YW50c2V2LnYgd3d3Lmdsb2JhbGxvZ2ljLmNv
bSBodHRwOi8vd3d3Lmdsb2JhbGxvZ2ljLmNvbS9lbWFpbF9kaXNjbGFpbWVyLnR4dA0K

