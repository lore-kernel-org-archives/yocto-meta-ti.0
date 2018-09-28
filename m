Return-Path: <matt.tsai@thermofisher.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 171B1E00A0C; Fri, 28 Sep 2018 12:03:06 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [208.86.201.75 listed in list.dnswl.org]
Received: from mx0b-002a2102.pphosted.com (mx0b-002a2102.pphosted.com
	[208.86.201.75])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B0226E00A16
	for <meta-ti@yoctoproject.org>; Fri, 28 Sep 2018 12:01:42 -0700 (PDT)
Received: from pps.filterd (m0104973.ppops.net [127.0.0.1])
	by mx0a-002a2102.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
	w8SIs7UB057544; Fri, 28 Sep 2018 19:01:40 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com
	(mail-sn1nam02lp0015.outbound.protection.outlook.com [216.32.180.15])
	by mx0a-002a2102.pphosted.com with ESMTP id 2ms31hpt27-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
	Fri, 28 Sep 2018 19:01:40 +0000
Received: from BN7PR07MB4866.namprd07.prod.outlook.com (52.135.250.145) by
	BN7PR07MB4433.namprd07.prod.outlook.com (52.135.247.24) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1185.22; Fri, 28 Sep 2018 19:01:38 +0000
Received: from BN7PR07MB4866.namprd07.prod.outlook.com
	([fe80::2160:6395:141d:eeb6]) by
	BN7PR07MB4866.namprd07.prod.outlook.com
	([fe80::2160:6395:141d:eeb6%2]) with mapi id 15.20.1185.022;
	Fri, 28 Sep 2018 19:01:38 +0000
From: "Tsai, Matt" <matt.tsai@thermofisher.com>
To: Denys Dmytriyenko <denys@ti.com>
Thread-Topic: [meta-ti] Poky and meta-ti advice for Beaglebone Black
Thread-Index: AdRVJFAXAS9yv9+7QxusIVarhlGYuwAeHA2AAAeIbfAABUt+gABi098A
Date: Fri, 28 Sep 2018 19:01:38 +0000
Message-ID: <BN7PR07MB4866DD6C35FFA67FDEB29D2892EC0@BN7PR07MB4866.namprd07.prod.outlook.com>
References: <BN7PR07MB486664B157A30E27F0FAE23692160@BN7PR07MB4866.namprd07.prod.outlook.com>
	<CADrbpyyj=bONWiAS7sE0hFGM10p244oGsnWZP_WKSkxaqULM6Q@mail.gmail.com>
	<BN7PR07MB4866C5DD48412948FBD3E28E92150@BN7PR07MB4866.namprd07.prod.outlook.com>
	<20180926193521.GC5026@beryl>
In-Reply-To: <20180926193521.GC5026@beryl>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [208.184.154.60]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; BN7PR07MB4433;
	6:sIxzqG8zLDdATeZagdOcvOSGJZisp009qg+Hrf7HUMomeQXtOLrUgaluDWY+Wm4l793UByyP3n4QE7BlmY1z6YBrfOFd8THX9dZXQ1OD/dtKwETBDZI8oGOXE/1sS4TUNZltqP3+QKgXSYqeTVD9HsNCUD5KvWShlLrAAfCgXiu16YstYnk/hWE310i89T/vxghqSKLLFBfBTM1O5F8w+ipDM4o1ROvXdSoS26mMxIfAy3/upXaFrjWFSrN5RsfgJH3s33HOqtOmoY8ofMGU7zKQxsXCi+6/mGLHlU1KQYM+Qb4idZt91tbngJkD063SyoztskRqVomYAXqrd8OujhychjwAi1YcDf0PMYcG7adLli8qrW4XlVCMsONmy0DVzNgsoxV8pG4uJ1VrVLUvy9ku2Bjrk+u4PvplZYxdXUCav834r4mhnNgyXCfOKhzhoVKxGKJvpLhpYcymyfpdog==;
	5:tQjwv2Nih1EDAKX8oXHYOSMC6pl965megmUt/BJKpK+WoMiLBnMxZo+8aFFGQD4UxADxO4ziYxnDCkJz5fkSKykZb5OlfZR9CNQwHYBMxyhltCsd2koZQpQyt1U/qsAkqwML3M4DHTJ75zkVWNI2GG2dx2jTdPABI1v99nAf7uw=;
	7:pdYkKXjxN+gS3wMivgb71tpHKEzshvYkDSHl7wDZbxWiMzFB14SeMVnPgMvcIJdci5MEUGWitoa5qWWjfNveCyB4XDyG88BKQaknE2gGZGe2aWKhv+YmVdFonr3s5v71SmzRm10beU4tn+eU+theHh73H3mC715n1ZO0gbNtR2zcaq+KnYD73Godf5dn21gVpr9Ots10KD0i4TQfXWoeqgkkV5lScEvk4yWJUlr4gJeFNSclZHTBdQWWDv6FYutY
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: 6f5199d5-6ff5-4f5d-adbf-08d62574d1c7
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989299)(4534165)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:BN7PR07MB4433; 
x-ms-traffictypediagnostic: BN7PR07MB4433:
x-microsoft-antispam-prvs: <BN7PR07MB4433C413F8FD09E1CDC512B592EC0@BN7PR07MB4433.namprd07.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(31051911155226)(20558992708506)(85827821059158)(10436049006162)(142551309573705)(183277255680310);
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(10201501046)(3002001)(3231355)(944501410)(52105095)(93006095)(93001095)(6055026)(149066)(150057)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(20161123562045)(20161123564045)(20161123560045)(201708071742011)(7699051);
	SRVR:BN7PR07MB4433; BCL:0; PCL:0; RULEID:; SRVR:BN7PR07MB4433; 
x-forefront-prvs: 0809C12563
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(346002)(136003)(39860400002)(396003)(376002)(366004)(199004)(189003)(53754006)(57704003)(13464003)(54094003)(40764003)(76176011)(2906002)(93886005)(102836004)(4326008)(8936002)(7736002)(478600001)(81166006)(8676002)(81156014)(6116002)(966005)(3846002)(25786009)(34290500001)(486006)(5250100002)(11346002)(97736004)(446003)(6246003)(6506007)(256004)(186003)(26005)(53546011)(33656002)(39060400002)(575784001)(5024004)(476003)(316002)(86362001)(6306002)(9686003)(7696005)(53936002)(55016002)(229853002)(54906003)(6916009)(345774005)(5660300001)(74316002)(105586002)(106356001)(305945005)(6436002)(99286004)(14454004)(68736007)(2900100001)(66066001)(71200400001)(71190400001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BN7PR07MB4433;
	H:BN7PR07MB4866.namprd07.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: thermofisher.com does not
	designate permitted sender hosts)
x-microsoft-antispam-message-info: 6IRpx2Q3kcH8ag7wy6Eet83vJ7Awz7gqbB+/NiJGUDsj5xe58fBN1TO+0aHUfTsow1SwuCoeZ2f3ZMfoT1S3YrLx4UJpbyeN5/HIe5ux1fbGgjRDBOs2AcoMDK9MiY30sbMhtpUo1gR5zUMEfq5W0KsF7KJyQnMmuz7mRmSSVaXouQv890b+6a+ct4XEVn4trTVxYvQ22fxpj8oG66Vv0cMu/hkAoEiP+oxRIM61KJcgkXfnTTdM20fAto4pxMKHJxmN8gxKPPCAOCWSqtqnyytqXR/K64djnZRsyE51gTa80YO7mKZ+mK7EqPNiN35SF89+vS31WnI7SEGMXO1+NLsFz43lYL4L74o7+dNTm0Y=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: thermofisher.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f5199d5-6ff5-4f5d-adbf-08d62574d1c7
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Sep 2018 19:01:38.3899 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b67d722d-aa8a-4777-a169-ebeb7a6a3b67
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR07MB4433
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2018-09-28_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	priorityscore=1501
	malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
	clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
	mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
	scancount=1 engine=8.0.1-1807170000 definitions=main-1809280186
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: Poky and meta-ti advice for Beaglebone Black
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
X-List-Received-Date: Fri, 28 Sep 2018 19:03:06 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgRGVueXMsDQoNClRoYW5rIHlvdSBmb3IgdGhlIHN1Z2dlc3Rpb25zLiBJIHVzZWQgdGhlIHBv
a3kgdGFnICJyb2Nrby0xOC4wLjMiIGFuZCBtZXRhLXRpICJ0aTIwMTguMDMiIHRvIGJ1aWxkIGNv
cmUtaW1hZ2UtYmFzZS4gVHdvIG1hbnVhbCBzdGVwcyBuZWVkIHRvIGJlIGRvbmUgZm9yIGl0IHRv
IHdvcms6DQotIE1hbnVhbGx5IGRlcGxveSBtb2R1bGVzLWFtMzM1eC1ldm0udGd6IHRvIHRoZSB0
YXJnZXQgcm9vdGZzLg0KLSBNYW51YWxseSBydW4gImRlcG1vZCIgdG8gY3JlYXRlIHRoZSBtb2R1
bGUgZGVwZW5kZW5jeSBkYXRhYmFzZSBvbiB0aGUgdGFyZ2V0LiANCg0KUXVlc3Rpb25zOg0KMS4g
SSB3YXMgdW5kZXIgdGhlIGltcHJlc3N0aW9uIHRoYXQgY29yZS1pbWFnZS1iYXNlIHdpbGwgaW5z
dGFsbCBtb2R1bGVzIHRvIGludG8gcm9vdGZzIGF1dG9tYXRpY2FsbHksIGJ1dCBpdCBkaWQgbm90
IGRvIHRoYXQuIEhvdyBkbyB3ZSBpbnN0YWxsIHRoZW0gb24gdGhlIHJvb3RmcyBhdXRvbWF0aWNh
bGx5IGluIHRoZSBidWlsZCBzeXN0ZW0/DQoyLiBIb3cgZG8gd2UgY3JlYXRlIG1vZHVsZSBkZXBl
bmRlbmN5IGRhdGFiYXNlIGluIHRoZSByb290ZnMgYXV0b21hdGljYWxseSBpbiB0aGUgYnVpbGQg
c3lzdGVtLCBub3Qgb24gdGhlIHRhcmdldD8NCg0KDQpUaGFuayB5b3UgZm9yIHlvdXIgaGVscCEN
Cg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IERlbnlzIERteXRyaXllbmtvIFtt
YWlsdG86ZGVueXNAdGkuY29tXSANClNlbnQ6IFdlZG5lc2RheSwgU2VwdGVtYmVyIDI2LCAyMDE4
IDEyOjM1IFBNDQpUbzogVHNhaSwgTWF0dCA8bWF0dC50c2FpQHRoZXJtb2Zpc2hlci5jb20+DQpD
YzogTGVvIE1lemEgPGxlby5lLm1lemFAZ21haWwuY29tPjsgbWV0YS10aUB5b2N0b3Byb2plY3Qu
b3JnDQpTdWJqZWN0OiBSZTogW21ldGEtdGldIFBva3kgYW5kIG1ldGEtdGkgYWR2aWNlIGZvciBC
ZWFnbGVib25lIEJsYWNrDQoNCkNBVVRJT046IFRoaXMgZW1haWwgb3JpZ2luYXRlZCBmcm9tIG91
dHNpZGUgb2YgdGhlIG9yZ2FuaXphdGlvbi4gRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0
YWNobWVudHMgdW5sZXNzIHlvdSByZWNvZ25pemUgdGhlIHNlbmRlciBhbmQga25vdyB0aGUgY29u
dGVudCBpcyBzYWZlLg0KDQoNCk9uIFdlZCwgU2VwIDI2LCAyMDE4IGF0IDA2OjI3OjEwUE0gKzAw
MDAsIFRzYWksIE1hdHQgd3JvdGU6DQo+IExlbywNCj4NCj4gVGhhbmtzIGZvciBzaGFyaW5nIHRo
ZSBleHBlcmllbmNlLg0KPiBRdWVzdGlvbnM6DQo+DQo+ICAgMS4gIERvIHlvdSBzZXQgTUFDSElO
RSA/PSDigJxhbTMzMzV4LWV2beKAnSBpbiBsb2NhbC5jb25mIGFuZCBidWlsZA0KPiAgIGNvcmUt
aW1hZ2UtbWluaW1hbD8gT3Igb3RoZXIgaW1hZ2UgdGFyZ2V0IGlzIHVzZWQ/DQoNCkRvbid0IHVz
ZSBjb3JlLWltYWdlLW1pbmltYWwgLSBpdCB3b24ndCBpbnN0YWxsIG1vZHVsZXMgb3IgRFRCcyBp
bnRvIHJvb3RmcyBhdXRvbWF0aWNhbGx5LiBZb3UnZCBoYXZlIHRvIGluc3RhbGwgdGhvc2UgbWFu
dWFsbHkuIE9yIHVzZSBhdCBsZWFzdCBjb3JlLWltYWdlLWJhc2Ugb3Igc29tZSBjdXN0b20gaW1h
Z2UuDQoNCg0KPiAgIDIuICBEbyB5b3UgaGF2ZSB0byBtb2RpZnkgYW55dGhpbmcgdG8gbWFrZSBM
aW51eCBPUyAobm90IGJvb3Rsb2FkZXIpDQo+ICAgRXRoZXJuZXQgYW5kIFVTQiB0byB3b3JrPw0K
DQpTaG91bGRuJ3QgbmVlZCB0by4NCg0KDQo+IEkgdXNlZCBwb2t5IHRhZyDigJxzdW1vLTE5LjAu
MOKAnSBhbmQgbWV0YS10aSB0YWcg4oCcdGkyMDE4LjAy4oCdIGFuZCBzZXQgDQo+IE1BQ0hJTkUg
Pz0g4oCcYmVhZ2xlYm9uZeKAnSB0byBidWlsZCBjb3JlLWltYWdlLW1pbmltYWwuDQoNClBsZWFz
ZSB1c2UgbWF0Y2hpbmcgYnJhbmNoZXMgLSBpLmUuICJyb2NrbyIgZnJvbSBhbGwgYnJhbmNoZXMu
DQpUaGVyZSB3ZXJlIHJlY2VudCByZXBvcnRzIHRoYXQgImJlYWdsZWJvbmUiIG1hY2hpbmUgaGFk
IHNvbWUgYm9vdCBpc3N1ZXMuDQpVc2UgImFtMzM1eC1ldm0iIGluc3RlYWQgLSBpdCBkb2VzIHN1
cHBvcnQgQmVhZ2xlYm9uZS4NCg0KDQo+IFRoZSBVU0IgaG9zdCBkb2VzIG5vdCB3b3JrLiBJICB3
b25kZXIgaWYgSSBhbSB1c2luZyBhIGdvb2QgYmFzZSB0byANCj4gc3RhcnQgd2l0aC4NCg0KQ2hl
Y2sgaWYgeW91IGhhdmUgY29ycmVzcG9uZGluZyBtb2R1bGVzIGluc3RhbGxlZCBhbmQgbG9hZGVk
Lg0KDQoNCj4gQWxzbywgYSBxdWVzdGlvbiBhYm91dCB0aGUgTGludXgga2VybmVsIA0KPiBtZXRh
LXRpL3JlY2lwZXMta2VybmVsL2xpbnV4L2xpbnV4LXRpLXN0YWdpbmctNC4xNC9kZWZjb25maWcg
Y29udGVudDoNCj4gVGhlIG9yaWdpbmFsIGluIOKAnHRpMjAxOC4wMuKAnSB0YWcgaXMg4oCcdXNl
LXRpc2RrLWNvbmZpZz0gdGlfc2RrX29tYXAyX3JlbGVhc2XigJ0uDQo+IEJ1dCBJIGFsc28gc2Vl
IHBlb3BsZSBjaGFuZ2luZyBpdCB0byDigJx1c2UtdGlzZGstY29uZmlnPSANCj4gdGlfc2RrX2Ft
M3hfcmVsZWFzZeKAnS4gSSB0cmllZCBib3RoLCBidXQgVVNCIGhvc3Qgd29ya2luZy4gU28gSSB3
b25kZXIgDQo+IHdoYXQgaXMgdGhlIGNvcnJlY3Qgb25lIHRvIHVzZT8NCg0KVGhlIGRlZmNvbmZp
ZyBpcyBiZWluZyBzZWxlY3RlZCBiYXNlZCBvbiB0aGUgbWFjaGluZSB5b3UgYnVpbGQgZm9yLiBX
aGVuIGJ1aWxkaW5nICJhbTMzNXgtZXZtIiBvciAiYmVhZ2xlYm9uZSIsIHRoZSBkZWZjb25maWcg
d2l0aCB0aV9zZGtfYW0zeF9yZWxlYXNlIGlzIHVzZWQuDQoNCg0KPiBUaGFuayB5b3UgZm9yIHlv
dXIgaGVscCENCj4NCj4NCj4gRnJvbTogTGVvIE1lemEgW21haWx0bzpsZW8uZS5tZXphQGdtYWls
LmNvbV0NCj4gU2VudDogV2VkbmVzZGF5LCBTZXB0ZW1iZXIgMjYsIDIwMTggNjoyOCBBTQ0KPiBU
bzogVHNhaSwgTWF0dCA8bWF0dC50c2FpQHRoZXJtb2Zpc2hlci5jb20+DQo+IENjOiBtZXRhLXRp
QHlvY3RvcHJvamVjdC5vcmcNCj4gU3ViamVjdDogUmU6IFttZXRhLXRpXSBQb2t5IGFuZCBtZXRh
LXRpIGFkdmljZSBmb3IgQmVhZ2xlYm9uZSBCbGFjaw0KPg0KPiBDQVVUSU9OOiBUaGlzIGVtYWls
IG9yaWdpbmF0ZWQgZnJvbSBvdXRzaWRlIG9mIHRoZSBvcmdhbml6YXRpb24uIERvIG5vdCBjbGlj
ayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3UgcmVjb2duaXplIHRoZSBzZW5k
ZXIgYW5kIGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZS4NCj4NCj4gTWF0dCwNCj4NCj4gSSd2ZSBi
ZWVuIGhhdmluZyBzb21lIHN1Y2Nlc3Mgd2l0aCB0aGUgInJvY2tvIiBicmFuY2hlcyAobWV0YS10
aSwgZXRjKSwgYW5kIHVzaW5nIHRoZSAiYW0zMzV4LWV2bSIgbWFjaGluZSBmb3IgYmVhZ2xlYm9u
ZSBibGFjay4NCj4NCj4gSSBoYXZlbid0IGRvbmUgYW55IGkyYyB5ZXQsIGJ1dCBFdGhlcm5ldCBh
bmQgVVNCIGFyZSB3b3JraW5nIGZpbmUuIEknbSBzdGlsbCBvbiB0aGUgbGVmdCBvZiB0aGUgbGVh
cm5pbmcgY3VydmUgdGhvdWdoLCBtYXliZSBzb21lb25lIGVsc2Ugb24gdGhpcyB0aHJlYWQgaGFz
IGJldHRlciBhZHZpY2UuDQo+DQo+IC1MZW8NCj4NCj4gT24gVHVlLCBTZXAgMjUsIDIwMTgsIDQ6
MTkgUE0gVHNhaSwgTWF0dCA8bWF0dC50c2FpQHRoZXJtb2Zpc2hlci5jb208bWFpbHRvOm1hdHQu
dHNhaUB0aGVybW9maXNoZXIuY29tPj4gd3JvdGU6DQo+IEhpIGFsbCwNCj4NCj4gSSBhbSBuZXcg
dG8gWW9jdG8gYW5kIHdhcyB0cnlpbmcgdG8gdXNlIHBva3kgYW5kIG1ldGEtdGkgdG8gY3VzdG9t
aXplIExpbnV4IHRvIHJ1biBvbiBCZWFnbGVib25lIEJsYWNrLiBUaGVyZSBhcmUgYSBjb3VwbGUg
b2YgcXVlc3Rpb25zIEkgZW5jb3VudGVyZWQsIGhvcGVmdWxseSBJIGNhbiBnZXQgc29tZSBhZHZp
Y2UgaGVyZToNCj4NCj4gICAxLiAgV2hhdCBpcyB0aGUgcmVjb21tZW5kZWQgcG9reSBhbmQgbWV0
YS10aSBicmFuY2gvdGFnIHRvIHVzZT8NCj4gICAyLiAgSWYgd2UgbmVlZCB0byBlbmFibGUgc29t
ZSBjb21tb24gZGV2aWNlIHN1cHBvcnQgc3VjaCBhcyBFdGhlcm5ldCwgVVNCIGhvc3QgcG9ydCwg
STJDLCDigKZldGMuLCB3aGF0IGRvIHdlIG5lZWQgdG8gbW9kaWZ5IG9uIHRoZXNlIHJlY29tbWVu
ZGVkIHBva3kgYW5kIG1ldGEtdGkgc29mdHdhcmU/DQo+DQo+IFRoYW5rIHlvdSBmb3IgeW91ciBo
ZWxwIQ0KPg0KPiAtLQ0KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXw0KPiBtZXRhLXRpIG1haWxpbmcgbGlzdA0KPiBtZXRhLXRpQHlvY3RvcHJvamVjdC5v
cmc8bWFpbHRvOm1ldGEtdGlAeW9jdG9wcm9qZWN0Lm9yZz4NCj4gaHR0cHM6Ly91cmxkZWZlbnNl
LnByb29mcG9pbnQuY29tL3YyL3VybD91PWh0dHBzLTNBX19saXN0cy55b2N0b3Byb2plYw0KPiB0
Lm9yZ19saXN0aW5mb19tZXRhLTJEdGkmZD1Ed0lEYVEmYz1xNmsyRHNUY0VHQ2NDYl9XdFZTejZo
aElsOGh2WXNzeTdzDQo+IEg4WndmYmJLVSZyPUxmYkRnaE0tWFdfNVJULWg3N3BBb05CaXo0ekJy
LXNqZ1FJLVVIdVYxWFUmbT16dG9SendFcVVuWFQNCj4gX2RfaFZtNkNPdEFPMjlpUXhzUnppY0lI
R2xwWkdMSSZzPTRSbTlOSWdCRzYyVzBBRXZLcUt3Z2ZTS3BFQlRONXNrS2VoVg0KPiAtMjYtelpz
JmU9PGh0dHBzOi8vdXJsZGVmZW5zZS5wcm9vZnBvaW50LmNvbS92Mi91cmw/dT1odHRwcy0zQV9f
bGlzdHMuDQo+IHlvY3RvcHJvamVjdC5vcmdfbGlzdGluZm9fbWV0YS0yRHRpJmQ9RHdNRmFRJmM9
cTZrMkRzVGNFR0NjQ2JfV3RWU3o2aGgNCj4gSWw4aHZZc3N5N3NIOFp3ZmJiS1Umcj1MZmJEZ2hN
LVhXXzVSVC1oNzdwQW9OQml6NHpCci1zamdRSS1VSHVWMVhVJm09VQ0KPiB1Rl9Ucm5DM2Zpd19Q
SDNyQlJPS0hsclhuZmJmdVFzeUFoODZpVjltVTgmcz1DTlF4RWh1TkY2b3Q2TVhkLUNUYnotVTNa
DQo+IExGc2NfdnFnUnhfbG5XM0hrTSZlPT4NCg0KPiAtLQ0KPiBfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KPiBtZXRhLXRpIG1haWxpbmcgbGlzdA0KPiBt
ZXRhLXRpQHlvY3RvcHJvamVjdC5vcmcNCj4gaHR0cHM6Ly91cmxkZWZlbnNlLnByb29mcG9pbnQu
Y29tL3YyL3VybD91PWh0dHBzLTNBX19saXN0cy55b2N0b3Byb2plYw0KPiB0Lm9yZ19saXN0aW5m
b19tZXRhLTJEdGkmZD1Ed0lEYVEmYz1xNmsyRHNUY0VHQ2NDYl9XdFZTejZoaElsOGh2WXNzeTdz
DQo+IEg4WndmYmJLVSZyPUxmYkRnaE0tWFdfNVJULWg3N3BBb05CaXo0ekJyLXNqZ1FJLVVIdVYx
WFUmbT16dG9SendFcVVuWFQNCj4gX2RfaFZtNkNPdEFPMjlpUXhzUnppY0lIR2xwWkdMSSZzPTRS
bTlOSWdCRzYyVzBBRXZLcUt3Z2ZTS3BFQlRONXNrS2VoVg0KPiAtMjYtelpzJmU9DQoNCg==

