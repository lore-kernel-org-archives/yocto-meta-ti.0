Return-Path: <Noor_Ahsan@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 55B1DE0140D
	for <meta-ti@yoctoproject.org>; Mon, 16 Sep 2013 06:56:46 -0700 (PDT)
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1VLZID-0000D9-Bg from Noor_Ahsan@mentor.com ;
	Mon, 16 Sep 2013 06:56:45 -0700
Received: from SVR-IES-FEM-01.mgc.mentorg.com ([137.202.0.104]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Mon, 16 Sep 2013 06:56:45 -0700
Received: from EU-MBX-01.mgc.mentorg.com ([169.254.1.178]) by
	SVR-IES-FEM-01.mgc.mentorg.com ([137.202.0.104]) with mapi id
	14.02.0247.003; Mon, 16 Sep 2013 14:56:44 +0100
From: "Ahsan, Noor" <Noor_Ahsan@mentor.com>
To: Anders Darander <anders@chargestorm.se>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] build errors for beangleboard
Thread-Index: AQHOstIFCUAVXlbVU0CmbrwlsvYbx5nIY3Mw
Date: Mon, 16 Sep 2013 13:56:43 +0000
Message-ID: <365E1805BC95084CBE82381A0B869994DE509F9F@EU-MBX-01.mgc.mentorg.com>
References: <365E1805BC95084CBE82381A0B869994DE507B25@EU-MBX-01.mgc.mentorg.com>
	<20130916114328.GA11490@ad.chargestorm.se>
In-Reply-To: <20130916114328.GA11490@ad.chargestorm.se>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [137.202.0.76]
MIME-Version: 1.0
X-OriginalArrivalTime: 16 Sep 2013 13:56:45.0283 (UTC)
	FILETIME=[946DBB30:01CEB2E4]
Subject: Re: build errors for beangleboard
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
X-List-Received-Date: Mon, 16 Sep 2013 13:56:49 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello,

Thanks.

Noor

-----Original Message-----
From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-bounces@yoctoproject=
.org] On Behalf Of Anders Darander
Sent: Monday, September 16, 2013 4:43 PM
To: meta-ti@yoctoproject.org
Subject: Re: [meta-ti] build errors for beangleboard

* Ahsan, Noor <Noor_Ahsan@mentor.com> [130916 10:30]:

> I was using meta-ti master branch with master branch of Yocto. While=20
> building beagleboard I faced following issue


> ERROR: Nothing RPROVIDES 'u-boot-fw-utils' (but=20
> /home/noor/SB/master_external/=20
> meta-ti/recipes-bsp/u-boot/u-boot_2011.12.bb RDEPENDS on or otherwise=20
> requires it)

> Do we have its fix available on master?

There's no fix yet on Yocto master. I've submitted a fix to oe-core, though=
 it hasn't been merged yet.=20

Cheers,
Anders

--
Anders Darander
ChargeStorm AB / eStorm AB
_______________________________________________
meta-ti mailing list
meta-ti@yoctoproject.org
https://lists.yoctoproject.org/listinfo/meta-ti

