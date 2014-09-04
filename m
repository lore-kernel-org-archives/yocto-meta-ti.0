Return-Path: <mikhail.zakharov@cognitivesystems.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 88A50E00769; Thu,  4 Sep 2014 07:50:32 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
X-Greylist: delayed 63 seconds by postgrey-1.32 at yocto-www;
	Thu, 04 Sep 2014 07:50:29 PDT
Received: from ironport.highqlp.com (ironport.highqlp.com [207.107.155.245])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id ABC78E006EF
	for <meta-ti@yoctoproject.org>; Thu,  4 Sep 2014 07:50:29 -0700 (PDT)
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AmgGAKt7CFSsAWkL/2dsb2JhbABZgmsjU1cEtmORP4dRgQUXAnWCEiczCAQJAQESAg1gAQQBOhwjBQ0BCDZCByAEDgUIFIgeCAEECLxNARMEgmGKVAiBXTOEUwWSP4MvnCCCG4FGbAGBR4EHAQEB
X-IPAS-Result: AmgGAKt7CFSsAWkL/2dsb2JhbABZgmsjU1cEtmORP4dRgQUXAnWCEiczCAQJAQESAg1gAQQBOhwjBQ0BCDZCByAEDgUIFIgeCAEECLxNARMEgmGKVAiBXTOEUwWSP4MvnCCCG4FGbAGBR4EHAQEB
X-IronPort-AV: E=McAfee;i="5600,1067,7550"; a="33296"
X-IronPort-AV: E=Sophos;i="5.04,466,1406606400"; 
   d="scan'208";a="33296"
Received: from 172-1-105-11.lightspeed.sntcca.sbcglobal.net (HELO
	cas.cognitivesystems.com) ([172.1.105.11])
	by ironport.cognitivesystems.com with ESMTP; 04 Sep 2014 10:49:12 -0400
Received: from mb.cognitivesystems.com (2002:ac01:680b::ac01:680b) by
	mb.cognitivesystems.com (2002:ac01:680b::ac01:680b) with Microsoft SMTP
	Server (TLS) id 15.0.847.32; Thu, 4 Sep 2014 10:50:04 -0400
Received: from mb.cognitivesystems.com ([fe80::8d75:bde8:1d24:bd44]) by
	mb.cognitivesystems.com ([fe80::8d75:bde8:1d24:bd44%12]) with mapi id
	15.00.0847.030; Thu, 4 Sep 2014 10:50:03 -0400
From: Mikhail Zakharov <mikhail.zakharov@cognitivesystems.com>
To: "pab@pabigot.com" <pab@pabigot.com>
Thread-Topic: [meta-ti] poor performance of OpenEmbedded on,	BeagleBoneBlack
	compared to Debian
Thread-Index: AQHPyE+CqhYlGy4zIUqL2LPEqCmQqQ==
Date: Thu, 4 Sep 2014 14:50:03 +0000
Message-ID: <a46afa0b8d064471ae32a8078631d962@mb.cognitivesystems.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.1.105.2]
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: poor performance of OpenEmbedded on, BeagleBoneBlack compared to Debian
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
X-List-Received-Date: Thu, 04 Sep 2014 14:50:32 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 3, 2014 at 8:59 PM, Peter A. Bigot <pab@pabigot.com> wrote:=0A=
=0A=
> One anomaly I've found is the CPU frequency range.  On debian we have:=0A=
>=0A=
>    debian@beaglebone:~$ cat =0A=
> /sys/devices/system/cpu/cpu0/cpufreq/scaling_available_frequencies=0A=
>    300000 600000 800000 1000000=0A=
>=0A=
> while on OE we have:=0A=
>=0A=
>    root@beaglebone:~# cat =0A=
> /sys/devices/system/cpu/cpu0/cpufreq/scaling_available_frequencies=0A=
>    300000 600000 720000 800000=0A=
=0A=
Stock yocto-bsp is missing a few things that can be found in Robert=0A=
Nelson's patchset for 3.14 linux kernel.=0A=
=0A=
You can find a fix in the following overlay:=0A=
https://github.com/mzakharo/meta-yocto-bone=0A=
=0A=
The patches you are looking for are here:=0A=
https://github.com/mzakharo/meta-yocto-bone/blob/master/recipes-kernel/linu=
x/files/dts/0002-arm-dts-am335x-boneblack-add-cpu0-opp-points.patch=0A=
https://github.com/mzakharo/meta-yocto-bone/blob/master/recipes-kernel/linu=
x/files/misc/cpufreq.cfg=0A=
=0A=
=0A=
There are lots of other functionality that is missing from yocto-bsp =0A=
kernel for Beaglebone. I suggest you take at the following repos and=0A=
scavenge for what you need :P=0A=
https://github.com/RobertBerger/meta-mainline/tree/daisy-training-v3.14.x/b=
eagle-bone-black-ml/recipes-kernel/linux/linux-yocto-custom/patches=0A=
https://github.com/RobertCNelson/linux-dev/tree/am33x-v3.14/patches=0A=
https://github.com/RobertCNelson/ti-linux-kernel-dev/tree/ti-linux-3.14.y/p=
atches=0A=
=0A=
=0A=
=0A=

