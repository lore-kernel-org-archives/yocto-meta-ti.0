Return-Path: <will.frazer@eurotech.com>
Received: from am1outboundpool.messaging.microsoft.com
	(am1ehsobe004.messaging.microsoft.com [213.199.154.207])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 96DAEE014D0
	for <meta-ti@yoctoproject.org>; Mon, 25 Mar 2013 05:34:12 -0700 (PDT)
Received: from mail58-am1-R.bigfish.com (10.3.201.225) by
	AM1EHSOBE002.bigfish.com (10.3.204.22) with Microsoft SMTP Server id
	14.1.225.23; Mon, 25 Mar 2013 12:34:10 +0000
Received: from mail58-am1 (localhost [127.0.0.1])	by mail58-am1-R.bigfish.com
	(Postfix) with ESMTP id 10FAF60214	for <meta-ti@yoctoproject.org>;
	Mon, 25 Mar 2013 12:34:10 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:157.56.252.165; KIP:(null); UIP:(null);
	IPV:NLI; H:DBXPRD0510HT004.eurprd05.prod.outlook.com; RD:none;
	EFVD:NLI
X-SpamScore: -2
X-BigFish: PS-2(zz4015I14ffIzz1f42h1ee6h1de0h1202h1e76h1d1ah1d2ahzzz2dh2a8h668h839h944hd25hf0ah1220h1288h12a5h12a9h12bdh137ah13b6h1441h1504h1537h153bh15d0h162dh1631h1758h18e1h1946h19b5h19ceh1ad9h1b0ah1155h)
Received: from mail58-am1 (localhost.localdomain [127.0.0.1]) by mail58-am1
	(MessageSwitch) id 1364214847872294_23620;
	Mon, 25 Mar 2013 12:34:07 +0000 (UTC)
Received: from AM1EHSMHS014.bigfish.com (unknown [10.3.201.249])	by
	mail58-am1.bigfish.com (Postfix) with ESMTP id AE3602E008A	for
	<meta-ti@yoctoproject.org>; Mon, 25 Mar 2013 12:34:07 +0000 (UTC)
Received: from DBXPRD0510HT004.eurprd05.prod.outlook.com (157.56.252.165) by
	AM1EHSMHS014.bigfish.com (10.3.207.152) with Microsoft SMTP Server
	(TLS) id 14.1.225.23; Mon, 25 Mar 2013 12:33:57 +0000
Received: from DBXPRD0510MB358.eurprd05.prod.outlook.com ([169.254.6.84]) by
	DBXPRD0510HT004.eurprd05.prod.outlook.com ([10.255.67.167]) with mapi
	id 14.16.0275.006; Mon, 25 Mar 2013 12:33:54 +0000
From: "Frazer, Will" <will.frazer@eurotech.com>
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Thread-Topic: Recipes from arago
Thread-Index: Ac4pVM4qKKNstK32TNaG3YassV2+Nw==
Date: Mon, 25 Mar 2013 12:33:54 +0000
Message-ID: <53BEB60EC8F56A4B8CCD9F7C4F8CFC7A4905862C@DBXPRD0510MB358.eurprd05.prod.outlook.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [87.85.210.87]
MIME-Version: 1.0
X-OriginatorOrg: eurotech.com
Subject: Recipes from arago
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
X-List-Received-Date: Mon, 25 Mar 2013 12:34:13 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi All,

There are a couple of recipes in meta-arago that I want to pull into my bui=
ld (ti-wifi-utils, crda etc) that don't exist in meta-ti. I was wondering w=
hat the preferred way to use these with my poky build is. I haven't used th=
e arago layer previously & at a quick test, the recipe check stage moans ab=
out the linaro toolchain. It doesn't seem like I ought to be adding that la=
yer but I'm open to suggestions.

I *could* pick out & drop the recipes I want into my BSP however duplicatin=
g recipes isn't something that sounds like a great idea for obvious reasons=
.

Suggestions/advice appreciated.

Thanks,
Will


