Return-Path: <cristian.iorga@intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 57BE0E002A5;
	Wed,  1 Aug 2012 01:08:00 -0700 (PDT)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 01 Aug 2012 01:07:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="175624487"
Received: from irsmsx103.ger.corp.intel.com ([163.33.3.157])
	by azsmga001.ch.intel.com with ESMTP; 01 Aug 2012 01:07:58 -0700
Received: from irsmsx152.ger.corp.intel.com (163.33.192.66) by
	IRSMSX103.ger.corp.intel.com (163.33.3.157) with Microsoft SMTP Server
	(TLS) id 14.1.355.2; Wed, 1 Aug 2012 09:07:42 +0100
Received: from irsmsx102.ger.corp.intel.com ([169.254.2.176]) by
	IRSMSX152.ger.corp.intel.com ([169.254.6.134]) with mapi id
	14.01.0355.002; Wed, 1 Aug 2012 09:07:42 +0100
From: "Iorga, Cristian" <cristian.iorga@intel.com>
To: Tim Verstraete <Tim.Verstraete@medecbenelux.be>, Denys Dmytriyenko
	<denys@ti.com>
Thread-Topic: [meta-ti] [HOB] issue
Thread-Index: Ac1vFF0H3bLUIUMsSkuFiw7DqWQ7qwAM3H6AABm8qbAAA2QQsA==
Date: Wed, 1 Aug 2012 08:07:41 +0000
Message-ID: <969F26A8BAB325438E7EB80D3C3134FB161773A6@IRSMSX102.ger.corp.intel.com>
References: <4439C3C0562087488F139C696CD862A72C188D@SBS-MEDEC.medecbenelux.local>
	<20120731201047.GB21245@edge>
	<4439C3C0562087488F139C696CD862A72C194B@SBS-MEDEC.medecbenelux.local>
In-Reply-To: <4439C3C0562087488F139C696CD862A72C194B@SBS-MEDEC.medecbenelux.local>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.180]
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 08 Aug 2012 10:05:20 -0700
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>,
	"yocto@yoctoproject.org" <yocto@yoctoproject.org>
Subject: Re: [HOB] issue
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
X-List-Received-Date: Wed, 01 Aug 2012 08:08:00 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello Tim,

Please fill in a bug report at bugzilla.yoctoproject.org
It will be investigated later on.

Regards,
Cristian Iorga

-----Original Message-----
From: yocto-bounces@yoctoproject.org [mailto:yocto-bounces@yoctoproject.org=
] On Behalf Of Tim Verstraete
Sent: Wednesday, August 01, 2012 9:29 AM
To: Denys Dmytriyenko
Cc: meta-ti@yoctoproject.org; yocto@yoctoproject.org
Subject: Re: [yocto] [meta-ti] [HOB] issue

 Hi,
=20
 When i use the HOB functionality in yocto with the meta-ti, I get an  erro=
r message after about 5% with no error message in it. I can only press clos=
e.
=20
 I use the default layers but I do see that HOB re-arranges them into:
 Poky/meta
 Poky/meta-hob
 Poky/meta-ti
 Poky/meta-yocto
=20
 I see that I can build using the command line so it has to be  something w=
ith HOB and not necessary something in yocto.

Thanks in advance,

Kind regards,

Tim

-----Original Message-----
From: Denys Dmytriyenko [mailto:denys@ti.com]
Sent: dinsdag 31 juli 2012 22:11
To: Tim Verstraete
Cc: meta-ti@yoctoproject.org
Subject: Re: [meta-ti] [HOB] issue

On Tue, Jul 31, 2012 at 12:04:37PM +0000, Tim Verstraete wrote:
> Hi,
>=20
> When i use the HOB functionality in yocto with the meta-ti, I get an=20
> error message after about 5% with no error message in it. I can only pres=
s close.
>=20
> I use the default layers but I do see that HOB re-arranges them into:
> Poky/meta
> Poky/meta-hob
> Poky/meta-ti
> Poky/meta-yocto
>=20
> I see that I can build using the command line so it has to be=20
> something with HOB and not necessary something in yocto.

Well, HOB _is_ part of Yocto anyway. While meta-ti may be triggering the is=
sue in HOB, you better off reporting it to the main yocto mailing list - fe=
el free to copy meta-ti as well.

--
Denys
_______________________________________________
yocto mailing list
yocto@yoctoproject.org
https://lists.yoctoproject.org/listinfo/yocto

