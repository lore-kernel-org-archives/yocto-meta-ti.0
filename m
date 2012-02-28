Return-Path: <prvs=44190348a3=christian.schulenberg@bmw.de>
Received: from mxout38.expurgate.net (mxout38.expurgate.net [91.198.224.38])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 31419E00596
	for <meta-ti@yoctoproject.org>; Tue, 28 Feb 2012 00:15:41 -0800 (PST)
Received: from [127.0.0.1] (helo=localhost)
	by relay.expurgate.net with smtp (Exim 4.77)
	(envelope-from <prvs=44190348a3=christian.schulenberg@bmw.de>)
	id 1S2IDk-00049k-7v; Tue, 28 Feb 2012 09:15:40 +0100
Received: from [160.46.252.23] (helo=cmtamx05b-n.bmwgroup.com)
	by relay.expurgate.net with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.77) (envelope-from <Christian.Schulenberg@bmw.de>)
	id 1S2IDj-0003AS-PR; Tue, 28 Feb 2012 09:15:39 +0100
Received: from cmtabb6a.muc (cmtabb6a.muc [160.50.100.27])
	by cmtamx05a-n.bmwgroup.com (8.13.8/8.13.8) with ESMTP id
	q1S8FTNS020800
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Tue, 28 Feb 2012 09:15:30 +0100
Received: from smuch03a.europe.bmw.corp (smuch03a.muc [160.50.20.69])
	by cmtabb6a.muc (8.13.8/8.13.8) with ESMTP id q1S8FSgR031380;
	Tue, 28 Feb 2012 09:15:28 +0100
Received: from SMUCM08V.europe.bmw.corp ([160.50.20.51]) by
	smuch03a.europe.bmw.corp ([160.50.20.69]) with mapi; Tue, 28 Feb 2012
	09:15:28 +0100
From: <Christian.Schulenberg@bmw.de>
To: <koen@dominion.thruhere.net>, <meta-ti@yoctoproject.org>
Date: Tue, 28 Feb 2012 09:15:27 +0100
Thread-Topic: [meta-ti] Building Yocto for Pandaboard
Thread-Index: Acz17oqraX3fFu1lRaev0mZjSld7GAAAlowg
Message-ID: <EF446FF9DAC93B479C74AB9153DE173F0C154AC2@SMUCM08V.europe.bmw.corp>
References: <EF446FF9DAC93B479C74AB9153DE173F0C0D32FF@SMUCM08V.europe.bmw.corp>
	<3BC330F9-CE58-4C4F-A473-B0F40D0A2777@dominion.thruhere.net>
	<4F4BA9EE.8030908@balister.org>
	<3A03FCB1-56B0-42C4-9260-24B10EF4531E@dominion.thruhere.net>
	<4F4BB801.3090108@ti.com>
	<EF446FF9DAC93B479C74AB9153DE173F0C154A32@SMUCM08V.europe.bmw.corp>
	<329D2F11-A3FF-4029-8F3D-EC6A7587D138@dominion.thruhere.net>
In-Reply-To: <329D2F11-A3FF-4029-8F3D-EC6A7587D138@dominion.thruhere.net>
Accept-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: de-DE
MIME-Version: 1.0
X-Spam-Status: No, No
X-purgate-relay-fid: relay-9b77e0
X-purgate-sourceid: 1S2IDj-0003AS-PR
X-purgate-Ad: Checked for spam and viruses by eXpurgate(R),
	see www.eleven.de for details.
X-purgate-ID: 151534::1330416940-00001906-726F6971/0-0/0-0
X-purgate: clean
X-purgate-type: clean
X-purgate-relay-bid: relay-3cc1a3
Subject: Re: Building Yocto for Pandaboard
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Tue, 28 Feb 2012 08:15:41 -0000
Content-Language: de-DE
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

I'm not talking about angstrom, I'm talking about cross dependencies betwee=
n poky and angstrom when using the meta-ti layer.

-----Urspr=FCngliche Nachricht-----
Von: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-bounces@yoctoproject.=
org] Im Auftrag von Koen Kooi
Gesendet: Dienstag, 28. Februar 2012 08:56
An: meta-ti@yoctoproject.org
Betreff: Re: [meta-ti] Building Yocto for Pandaboard


Op 28 feb. 2012, om 08:52 heeft <Christian.Schulenberg@bmw.de> het volgende=
 geschreven:

> Thanks a lot for your replies. Angstrom is definitely not the way I want =
to go at the moment, because I prefer to have a clean architecture in my pr=
oject.

What's not clean about angstrom?

_______________________________________________
meta-ti mailing list
meta-ti@yoctoproject.org
https://lists.yoctoproject.org/listinfo/meta-ti

