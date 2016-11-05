Return-Path: <SharihinDS@energomera.ru>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A2F77E00ACE; Sat,  5 Nov 2016 02:32:17 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [194.0.145.26 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from owa.energomera.ru (mx.energomera.ru [194.0.145.26])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E94C7E008BA
	for <meta-ti@yoctoproject.org>; Sat,  5 Nov 2016 02:32:11 -0700 (PDT)
Received: from S04-EX01.energomera.ru (10.6.0.50) by S01-EX03.energomera.ru
	(10.2.0.46) with Microsoft SMTP Server (TLS) id 14.3.266.1;
	Sat, 5 Nov 2016 12:32:08 +0300
Received: from S04-EX01.energomera.ru ([::1]) by S04-EX01.energomera.ru
	([::1]) with mapi id 14.03.0266.001; Sat, 5 Nov 2016 12:32:02 +0300
From: =?utf-8?B?0KjQsNGA0LjRhdC40L0g0JTQvNC40YLRgNC40Lkg0KHQtdGA0LPQtdC10LI=?=
	=?utf-8?B?0LjRhw==?= <SharihinDS@energomera.ru>
To: "denys@ti.com" <denys@ti.com>
Thread-Topic: [meta-ti] Unable to build ti-ccsv6-native and other packages
Thread-Index: AQHSNn5WNmRmR4vUWEy7UBj0g890qqDJEoWAgADdH4A=
Date: Sat, 5 Nov 2016 09:32:01 +0000
Message-ID: <1478338321.1720.4.camel@energomera.ru>
References: <1478251939.5248.11.camel@energomera.ru>
	<20161104202035.GT12745@edge>
In-Reply-To: <20161104202035.GT12745@edge>
Accept-Language: ru-RU, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.2.0.46]
x-kse-attachmentfiltering-interceptor-info: protection disabled
x-kse-serverinfo: S04-EX01.energomera.ru, 9
x-kse-antivirus-interceptor-info: scan successful
x-kse-antivirus-info: Clean, bases: 05.11.2016 3:48:00
MIME-Version: 1.0
X-KSE-AntiSpam-Interceptor-Info: protection disabled
X-KSE-ServerInfo: S01-EX03.energomera.ru, 9
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 05.11.2016 7:31:00
X-KSE-Attachment-Filter-Scan-Result: Clean
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: Unable to build ti-ccsv6-native and other packages
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
X-List-Received-Date: Sat, 05 Nov 2016 09:32:17 -0000
Content-Language: ru-RU
Content-Type: text/plain; charset="utf-8"
Content-ID: <57202015FACE224F84220C4EEA329E33@energomera.ru>
Content-Transfer-Encoding: base64

T24g0J/RgiwgMjAxNi0xMS0wNCBhdCAxNjoyMCAtMDQwMCwgRGVueXMgRG15dHJpeWVua28gd3Jv
dGU6DQo+ID4gRG9lcyBhbnlib2R5IGVuY291bnRlcmVkIHNhbWUgcHJvYmxlbT8gSG93IGNhbiBJ
IGZpeCB0aGlzIGlzc3VlPw0KPiBDQ1MgcmVxdWlyZXMgbWFudWFsIGRvd25sb2FkIGR1ZSB0byBs
aWNlbnNpbmcgLQ0KPiBpbnN0YWxsLnNvdXJjZS5kaXIubG9jYWwgaXMgYcKgDQo+IGZha2UgYWRk
cmVzcyBhbmQgYSBwbGFjZWhvbGRlciB0byBmYWlsIGRvd25sb2FkIGF0dGVtcHRzIGlmIENDUw0K
PiB0YXJiYWxsIHdhc8KgDQo+IG5vdCBhbHJlYWR5IHByb3ZpZGVkLg0KDQpUaGFua3MsIGJ1dCBo
ZXJlJ3MgYW5vdGhlciBxdWVzdGlvbjogd2h5IGlwdW1tLWZ3IGRvIHJlcXVpcmUgQ0NTPyBJcw0K
YnVpbGQgcHJvY2VzcyBmb3IgZmlybXdhcmUgc28gY29tcGxleCwgc28gZm9yIHNvbWUgbWVnYWJ5
dGVzIG9mDQpmaXJtd2FyZSBJIHNob3VsZCBpbnN0YWxsIHRoZSB3aG9sZSBFY2xpcHNlPw==

